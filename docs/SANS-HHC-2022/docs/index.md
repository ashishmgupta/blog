<img src="/images/banner.png" alt="drawing" width="1000px"/><br>
# Overview
<p class=MyNormalStyle>Hi and welcome to my <a href="https://holidayhackchallenge.com/2020/" target=_blank>2022 SANS Holiday Hack Challenge</a> write-up.</p>
<p class=MyNormalStyle>Its my privilege to attend the Kringlecon for the third time. Since 202Every year I look forward to december and make every attempt to complete </p>
<p class=MyNormalStyle>It has answers of all the objectives and how the 5 golden
rings were obtained, high-level approach as well as details on how those answers
were derived.</p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=798
 style='width:598.45pt;border:none'>
 <tr style='height:11.45pt'>
  <td width=452 valign=top style='width:339.0pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:11.45pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><b>Objectives
  completed</b></p>
  </td>
  <td width=346 valign=top style='width:259.45pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt;height:11.45pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><b>The Story</b></p>
  </td>
 </tr>
 <tr style='height:244.2pt'>
  <td width=452 valign=top style='width:339.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:244.2pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><img
  width=428 height=204 id="Picture 164"
  src="../images/blog_images/image001.png"
  alt="Graphical user interface, text, application&#10;&#10;Description automatically generated"></p>
  </td>
  <td width=346 valign=top style='width:259.45pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:244.2pt'>
  <p class=MyNormalStyle>Five Rings for the Christmas king immersed in cold</p>
  <p class=MyNormalStyle>Each Ring now missing from its zone</p>
  <p class=MyNormalStyle>The first with bread kindly given, not sold</p>
  <p class=MyNormalStyle>Another to find 'ere pipelines get owned</p>
  <p class=MyNormalStyle>One beneath a fountain where water flowed</p>
  <p class=MyNormalStyle>Into clouds Grinchum had the fourth thrown</p>
  <p class=MyNormalStyle>The fifth on blockchains where shadows be bold</p>
  <p class=MyNormalStyle>One hunt to seek them all, five quests to find them</p>
  <p class=MyNormalStyle>One player to bring them all, and Santa Claus to bind
  them</p>
  </td>
 </tr>
</table>

<p class=MyHeadingStyle>&nbsp;</p>

<p class=MyHeadingStyle>Answer to objectives and High-level approach</p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=780
 style='width:585.0pt;border:none'>
 <tr style='height:16.6pt'>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:16.6pt'>
  <p class=MyNormalStyle><b>Objectives</b></p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt;height:16.6pt'>
  <p class=MyNormalStyle><b>Answer</b></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border:solid windowtext 1.0pt;
  border-left:none;padding:0in 5.4pt 0in 5.4pt;height:16.6pt'>
  <p class=MyNormalStyle><b>High level approach to solve the objective</b></p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>1.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Kringlecon
  Orientation</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>answer</b></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Write "answer" in the top pane of the terminal
  presented by the elf Jingle Ringford.</p>
  </td>
 </tr>
 <tr style='height:45.75pt'>
  <td width=217 rowspan=6 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:45.75pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>2.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Wireshark
  Practice</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:45.75pt'>
  <p class=MyNormalStyle>Q1: What type of objects can be exported from the
  PCAP?<br>
  Answer: <b>http</b></p>
  </td>
  <td width=219 rowspan=6 valign=top style='width:164.5pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:45.75pt'>
  <p class=MyNormalStyle>Open the pcap file using Wireshark.<br>
  Find the exportable files and then look the traffic details for those files.</p>
  <p class=MyNormalStyle>&nbsp;</p>
  <p class=MyNormalStyle>&nbsp;</p>
  <p class=MyNormalStyle>&nbsp;</p>
  </td>
 </tr>
 <tr style='height:.25in'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:.25in'>
  <p class=MyNormalStyle>Q2: What is the file name of the largest file we can
  export?</p>
  <p class=MyNormalStyle>Answer: <b>app.php</b></p>
  </td>
 </tr>
 <tr style='height:25.15pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:25.15pt'>
  <p class=MyNormalStyle>Q3: What packet number starts that app.php file?<br>
  Answer: <b>687</b></p>
  </td>
 </tr>
 <tr style='height:28.75pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:28.75pt'>
  <p class=MyNormalStyle>Q4: What is the IP of the Apache server?</p>
  <p class=MyNormalStyle>Answer: <b>192.185.57.242</b></p>
  </td>
 </tr>
 <tr style='height:90.75pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:90.75pt'>
  <p class=MyNormalStyle>Q5: Attackers used bad TLS certificates in this
  traffic. Which countries were they registered to? Submit the names of the countries
  in alphabetical order separated by comma (ex, Norway, South Korea)</p>
  <p class=MyNormalStyle>Answer: <b>Ireland, Israel, South Sudan, United States</b></p>
  </td>
 </tr>
 <tr style='height:12.0pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:12.0pt'>
  <p class=MyNormalStyle>Q6: Is the host infected?</p>
  <p class=MyNormalStyle>Answer: <b>Yes</b></p>
  </td>
 </tr>
 <tr style='height:20.25pt'>
  <td width=217 rowspan=10 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:20.25pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>3.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Windows
  Events Logs</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:20.25pt'>
  <p class=MyNormalStyle>Q1: What month/day/year did the attack take place? For
  example, 09/05/2021</p>
  <p class=MyNormalStyle>Answer: <b>12/24/2022</b></p>
  </td>
  <td width=219 rowspan=10 valign=top style='width:164.5pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:20.25pt'>
  <p class=MyNormalStyle>Convert the .evtx file to csv and then use PowerShell
  on CSV to answer questions.</p>
  </td>
 </tr>
 <tr style='height:30.0pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:30.0pt'>
  <p class=MyNormalStyle>Q2: An attacker got a secret from a file. What was the
  original file's name?</p>
  <p class=MyNormalStyle>Answer: <b>recipe</b></p>
  </td>
 </tr>
 <tr style='height:7.95pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:7.95pt'>
  <p class=MyNormalStyle>Q3: The contents of the previous file were retrieved,
  changed, and stored to a variable by the attacker. This was done multiple
  times. Submit the last full PowerShell line that performed only these
  actions.<br>
  Answer: <b>$foo = Get-Content .\Recipe| % {$_ -replace 'honey', 'fish oil'}</b></p>
  </td>
 </tr>
 <tr style='height:8.7pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:8.7pt'>
  <p class=MyNormalStyle>Q4: After storing the altered file contents into the
  variable, the attacker used the variable to run a separate command that wrote
  the modified data to a file. This was done multiple times. Submit the last full
  PowerShell line that performed only this action.<br>
  Answer: <b>$foo | Add-Content -Path 'Recipe'</b></p>
  </td>
 </tr>
 <tr style='height:8.7pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:8.7pt'>
  <p class=MyNormalStyle>Q5: The attacker ran the previous command against one
  file multiple times. What is the name of this file?<br>
  Answer: <b>Recipe.txt</b></p>
  </td>
 </tr>
 <tr style='height:8.7pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:8.7pt'>
  <p class=MyNormalStyle>Q6: Were any files deleted? (Yes/No)<br>
  Answer: <b>Yes</b></p>
  </td>
 </tr>
 <tr style='height:9.45pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:9.45pt'>
  <p class=MyNormalStyle>Q7: Was the original file (from question 2) deleted?
  (Yes/No)<br>
  Answer: <b>No</b></p>
  </td>
 </tr>
 <tr style='height:8.7pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:8.7pt'>
  <p class=MyNormalStyle>Q8: What is the Event ID of the logs that show the
  actual command lines the attacker typed and ran?<br>
  Answer: <b>4104</b></p>
  </td>
 </tr>
 <tr style='height:8.7pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:8.7pt'>
  <p class=MyNormalStyle>Q9: Is the secret ingredient compromised (Yes/No)?<br>
  Answer: <b>Yes</b></p>
  </td>
 </tr>
 <tr style='height:14.25pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:14.25pt'>
  <p class=MyNormalStyle>Q10: What is the secret ingredient?<br>
  Answer: <b>Honey</b></p>
  </td>
 </tr>
 <tr style='height:22.5pt'>
  <td width=217 rowspan=4 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:22.5pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>4.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Suricata
  regatta</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:22.5pt'>
  <p class=MyNormalStyle>Q1: Create a Suricata rule to catch DNS lookups for
  adv.epostoday.uk.</p>
  <p class=MyNormalStyle>Whenever there's a match, the alert message (msg)
  should read Known bad DNS lookup, possible Dridex infection</p>
  <p class=MyNormalStyle>Answer: <b>alert dns any any -&gt; any any
  (msg:&quot;Known bad DNS lookup, possible Dridex infection&quot;; dns_query;
  content:&quot;adv.epostoday.uk&quot;; depth:20; fast_pattern; endswith;
  nocase; classtype:pup-activity; sid:200; rev:2;)</b></p>
  </td>
  <td width=219 rowspan=4 valign=top style='width:164.5pt;border-top:none;
  border-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:22.5pt'>
  <p class=MyNormalStyle>Follow the syntax noted in the <a
  href="https://suricata.readthedocs.io/en/suricata-6.0.0/rules/intro.html">hint
  link</a> to create our own rules needed for the challenge.</p>
  </td>
 </tr>
 <tr style='height:15.75pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:15.75pt'>
  <p class=MyNormalStyle>Q2: Develop a Suricata rule that alerts whenever the
  infected IP address 192.185.57.242 communicates with internal systems over
  HTTP.</p>
  <p class=MyNormalStyle>When there's a match, the message (msg) should read
  Investigate suspicious connections, possible Dridex infection</p>
  <p class=MyNormalStyle>Answer: <b>alert http any any -&gt; any any
  (msg:&quot;Investigate suspicious connections, possible Dridex infect&quot;;
  sid:300; rev:2;)</b></p>
  </td>
 </tr>
 <tr style='height:40.0pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:40.0pt'>
  <p class=MyNormalStyle>Q3: We heard that some naughty actors are using TLS
  certificates with a specific CN.</p>
  <p class=MyNormalStyle>Develop a Suricata rule to match and alert on an SSL
  certificate for heardbellith.Icanwepeh.nagoya.</p>
  <p class=MyNormalStyle>When your rule matches, the message (msg) should read
  Investigate bad certificates, possible Dridex infection</p>
  <p class=MyNormalStyle>Answer: <b>alert tls any any -&gt; any any
  (msg:&quot;Investigate bad certificates, possible Dridex infection&quot;; tls.subject:&quot;CN=heardbellith.Icanwepeh.nagoya&quot;;
  sid:400; rev:2;)</b></p>
  </td>
 </tr>
 <tr style='height:143.5pt'>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:143.5pt'>
  <p class=MyNormalStyle>Q4: Watch for one line from the Javascript: Let
  byteCharacters = atob</p>
  <p class=MyNormalStyle>Oh, and that string might be Gzip compressed - I hope
  that"s OK!</p>
  <p class=MyNormalStyle>Just in case they try this again, please alert on that
  HTTP data with message Suspicious Javascript function, possible Dridex
  infection</p>
  <p class=MyNormalStyle>Answer<b>: alert http any any -&gt; any any
  (msg:&quot;Suspicious JavaScript function, possible Dridex infection&quot;;
  file_data; content:&quot;let byteCharacters = atob&quot;; sid:500; rev:2;)</b></p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>5.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Clone
  with a difference</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>maintainers</b></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Create an empty git repo, add the remote repo to it,
  then fetch and checkout the master branch.</p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>6.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Prison
  Escape</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>082bb339ec19de4935867</b></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><span
  style='font-family:"Cambria",serif'>User is privileged in docker. Mount the
  host drive and access the file in the host /home folder.</span></p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>7.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Jolly
  CI/CD</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>oI40zIuCcN8c3MhKgQjOMN8lfYtVqcKT</b></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Get the private key from user"s previous commit, clone
  with SSH key, commit a webshell and use the webshell to get the flag.</p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>8.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Naughty
  IP</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>18.222.86.32</b></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Wireshark <br>
  Statistics &gt; Conversations </p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>9.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>Credential
  mining</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>alice</b></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Use Wireshark filters</p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>10.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>404 FTW</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>/proc</b></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Use Wireshark filters and display filters.</p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>11.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>IMDS, XXE, and Other
  Abbreviations</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>http://169.254.169.254/latest/meta-data/identity-credentials/ec2/security-credentials/ec2-instance
  </b></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Look for 169.254.169.254 as dest ip in Wireshark.</p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>12.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>Open boria mine door</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Solved in the game</p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Used SVG in HTML and JS.</p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>13.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>Glamtariels Fountain</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b><span style='font-size:10.0pt'>goldring-morethansupertopsecret76394734.png</span></b></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><span
  style='font-family:"Cambria",serif'>Used XXE injection.</span></p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>14.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>AWS CLI Intro</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><i>Solved in the console</i></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><span
  style='font-family:"Cambria",serif'>Follow the instructions</span></p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>15.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>Trufflehog Search</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>put_policy.py</b></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><span
  style='font-family:"Cambria",serif'>Install Trufflehog on local machine and
  used on given repo.</span></p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>16.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>Exploitation via AWS
  CLI</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><i>Solved in the game</i></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><span
  style='font-family:"Cambria",serif'>Configure the creds found via Trufflehog
  and then use AWS CLI on it to get lambda URLs.</span></p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>17.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>Buy A Hat</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><i>Solved in the game</i></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><span
  style='font-family:"Cambria",serif'>Followed the instructions.</span></p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>18.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>Blockchain
  Divination</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b><span style='font-family:"Calibri",sans-serif'>0xc27A2D3DE339Ce353c0eFBa32e948a88F1C86554</span></b></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><span
  style='font-family:"Cambria",serif'>The "To address" in the transaction has
  the answer.</span></p>
  </td>
 </tr>
 <tr>
  <td width=217 valign=top style='width:162.9pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-left:.5in;text-indent:-.25in'>19.<span
  style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp; </span>Exploit a smart
  contract</p>
  </td>
  <td width=343 valign=top style='width:257.6pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><i>Solved in the game</i></p>
  </td>
  <td width=219 valign=top style='width:164.5pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style='margin-bottom:0in;line-height:normal'><span
  style='font-family:"Cambria",serif'>Build our own Merkle tree with our wallet
  address and pass it on the website replacing the hardcoded "root" value with
  the root value of our own Merkle tree with our wallet/proof.</span></p>
  </td>
 </tr>
</table>