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
    <img src="../../images/hhc2021/difficulty_2.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
    Frost Tower Entrance
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="../../images/hhc2021/image027.png" alt="drawing" width="30px"/> Grimy McTrollkins <br>
    </td>
</tr>
</table>
<table>
<tr>
    <td>
    <img src="../../images/hhc2021/image028.png" alt="drawing" width="100px"/>
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
    <img src="../../images/hhc2021/image029.png" alt="drawing" width="400px"/>
    </td>
    <td>
    <img src="../../images/hhc2021/image030.png" alt="drawing" width="600px"/>
    </td>
<tr>
</table>


Scan for any available the ESSIDs  <br>
```bash
iwlist wlan0 scanning 
```

<img src="../../images/hhc2021/image031.png" alt="drawing" width="600px"/>

We find an ESSID named “FROST-Nidus-Setup”. <br>
Now we connect to “FROST-Nidus-Setup” ESSID.
```bash
iwconfig wlan0 essid FROST-Nidus-Setup
```
<img src="../../images/hhc2021/image032.png" alt="drawing" width="1000px"/>

Connection succecssful to the ESSID. <br>
Issue a curl command to http://nidus-setup:8080. <br>

```bash
curl http://nidus-setup:8080
```
<img src="../../images/hhc2021/image033.png" alt="drawing" width="1000px"/>

Looks like few APIs are hosted there. <br>
Access the API docs <br>
Note the /api/cooler does not need registration <br>
```bash
curl http://nidus-setup:8080/apidoc
```
<img src="../../images/hhc2021/image034.png" alt="drawing" width="800px"/>

Following the documentation, we make use of /cooler endpoint passing a temperature which may melt ice e.g., 110 degrees <br>

```bash
curl -XPOST -H 'Content-Type: application/json' \
  --data-binary '{"temperature": 110}' \
  http://nidus-setup:8080/api/cooler
```
<img src="../../images/hhc2021/image036.png" alt="drawing" width="800px"/>

The jack frost tower entrance is now open and the objective is now completed. <br>

<table>
<tr>
    <td>
    <img src="../../images/hhc2021/image037.png" alt="drawing" width="800px"/>
    </td>
    
    
    </td>
<tr>
</table>
<img src="../../images/hhc2021/image038.png" alt="drawing" width="500px"/>
