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
    <img src="../../images/hhc2021/difficulty_2.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
    Frost Tower Lobby
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="../../images/hhc2021/image027.png" alt="drawing" width="30px"/> Hubris Selfington <br>
    </td>
</tr>
</table>

<table>
<tr>
    <td>
    <img src="../../images/hhc2021/image039.png" alt="drawing" width="100px"/>
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
    <img src="../../images/hhc2021/image040.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="../../images/hhc2021/image041.png" alt="drawing" width="600px"/>
    </td>
<tr>
</table>

We open Burp Suite and capture traffic for only slots.jackfrosttower.com. <br>
Click "Spin" in the bottom right corner. <br>
<img src="../../images/hhc2021/image042.png" alt="drawing" width="400px"/>

Burp intercepts the requests and shows a POST request to the /api/v1/<guid>/spin with three parameters: <br> 
<ol>
    <li>betamount</li>
    <li>numline</li>
    <li>cpl</li>
</ol>
<img src="../../images/hhc2021/image043.png" alt="drawing" width="600px"/>

We investigate with repeater, sending 1001 to the betamount parameter and It does not work. <br>
<img src="../../images/hhc2021/image044_1.png" alt="drawing" width="1000px"/>

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
    <img src="../../images/hhc2021/image045.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="../../images/hhc2021/image046.png" alt="drawing" width="400px"/>
    </td>
<tr>
<tr>
    <td>
    Increase cpl to 0.2
    </td>
    <td>
    <img src="../../images/hhc2021/image047.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="../../images/hhc2021/image048.png" alt="drawing" width="400px"/>
    </td>
<tr>
<tr>
    <td>
    Decrease numline to 10
    </td>
    <td>
    <img src="../../images/hhc2021/image049.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="../../images/hhc2021/image048.png" alt="drawing" width="400px"/>
    </td>
<tr>
<tr>
    <td>
    Increase numline to 30
    </td>
    <td>
    <img src="../../images/hhc2021/image050.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="../../images/hhc2021/image048.png" alt="drawing" width="400px"/>
    </td>
<tr>
<tr>
    <td>
    Make numline a negative number
    </td>
    <td>
    <img src="../../images/hhc2021/image051.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="../../images/hhc2021/image052.png" alt="drawing" width="1000px"/>
    </td>
<tr>
</table>

Full request and response showing sending a negative value in the numline parameter would show a message in a new field named "response". <br>
<img src="../../images/hhc2021/image053.png" alt="drawing" width="2000px"/>

The successful response shown below : <br>
<img src="../../images/hhc2021/image054.png" alt="drawing" width="1000px"/>

data.response :  
<b>I'm going to have some bouncer trolls bounce you right out of this casino!</b> <br>

We submit the highlighted as the answer for the Slot Machine Investigation objective and its accepted!<br>
<img src="../../images/hhc2021/image055.png" alt="drawing" width="400px"/>