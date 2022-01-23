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
## 3. Thaw Frost Tower Entrance
## 4. Slot Machine Investigation
## 5. Strange USB device
## 6. Shell Code Primer
## 7. Printer Exploitation
## 8. Kerberoasting on an Open Fire
## 9. Splunk
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
