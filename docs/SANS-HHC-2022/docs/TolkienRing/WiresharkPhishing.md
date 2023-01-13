# Wireshark Phishing
<table  class=MsoTableGrid width=100% border=1>
 <tr>
  <td>
  <img border=0 id="Picture 97" src="../../images/blog_images/image038.png">Wireshark Phishing 
  </td>
  <td>
  <img border=0 id="Picture 10" src="../../images/blog_images/image039.png">Tolkien Ring 
  </td>
  <td>
  <img border=0 id="Picture 96" src="../../images/blog_images/image040.png">Sparkle Redberry
  </td>
  </tr>
 </table>
<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=100% >
    <!--tr class=MyNormalStyle>
        <td colspan=2 >
                <p class="MyNormalStyle">
                <img border=0 id="Picture 97" src="../../images/blog_images/image038.png">Wireshark Phishing
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img border=0 id="Picture 10" src="../../images/blog_images/image039.png">Tolkien Ring
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img border=0 id="Picture 96" src="../../images/blog_images/image040.png">Sparkle Redberry
                </p>
        </td>
    </tr-->
  <tr>
  <td  colspan=2 >
  <p class=MyNormalStyle><b>Objective</b> : Use the Wireshark Phishing terminal in the
  Tolkien Ring to solve the mysteries around the suspicious PCAP. Get hints for
  this challenge by typing hint in the upper panel of the terminal.</p>
  </td>
 </tr>
 <tr >
  <td rowspan=2 >
  <p class=MyNormalStyle><img border=0 id="Picture 278"
  src="../../images/blog_images/image041.png"
  alt="A picture containing graphical user interface&#10;&#10;Description automatically generated"></p>
  </td>
  <td>
  <p class=MyNormalStyle><u><img border=0 id="Picture 279"
  src="../../images/blog_images/image042.png"
  alt="Graphical user interface, text&#10;&#10;Description automatically generated"></u></p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle><u>PCAP file : <br>
  </u><a
  href="https://storage.googleapis.com/hhc22_player_assets/suspicious.pcap">https://storage.googleapis.com/hhc22_player_assets/suspicious.pcap</a></p>
  </td>
 </tr>
</table>

<p class=MyNormalStyle>We type "yes" on the terminal and that prompts a series
of questions.</p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=100%>
 <tr>
  <td>
  <p class=MyNormalStyle><img border=0 
  src="../../images/blog_images/image043.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
  <td>
  <p class=MyNormalStyle><img border=0 
  src="../../images/blog_images/image044.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=100%>
 <tr>
  <td  colspan=2>
  <p class=MyNormalStyle><b>Question 1 : </b>There are objects in the PCAP file
  that can be exported by Wireshark and/or tshark. What kind of objects can be
  exported from this PCAP</p>
  </td>
 </tr>
 </tr>

 <tr>
  <td colspan=2 valign=top>
  <p class=MyNormalStyle><b>Answer</b> : <b>http</b></p>
  </td>
 </tr>
 
 <tr>
  <td colspan=2>
  <p class=MyNormalStyle>Open the <b>suspicious.pcap</b> in Wireshark and go to
  File &gt; Export Object. We choose every option there and see exportable
  items in the list only when we select HTTP</p>
  </td>
 </tr>
 <tr >
  <td >
  <p class=MyNormalStyle><img border=0 
  src="../../images/blog_images/image045.png"
  alt="Graphical user interface, application&#10;&#10;Description automatically generated"></p>
  </td>
  <td >
  <p class=MyNormalStyle><img border=0
  src="../../images/blog_images/image046.png"
  alt="Graphical user interface, text, application&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
</table>
<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=100%>
 <tr>
  <td >
  <p class=MyNormalStyle><b>Question 2 : </b>What is the file name of the
  largest file we can export?</p>
  </td>
 </tr>
 <tr>
  <td >
  <p class=MyNormalStyle><b>Answer : app.php</b></p>
  </td>
 </tr>
 <tr>
  <td >
  <p class=MyNormalStyle>Open the exportable objects by clicking on File &gt;
  Export Objects &gt; HTTP.</p>
  <p class=MyNormalStyle>Sort the objects by clicking the Size column in
  descending order. app.php is of largest file (808 KB)</p>
  </td>
 </tr>
 <tr>
  <td >
  <p class=MyNormalStyle><b><img border=0 width=566 height=113 id="Picture 287"
  src="../../images/blog_images/image047.png"
  alt="Graphical user interface, text, application&#10;&#10;Description automatically generated"></b></p>
  </td>
 </tr>
</table>
<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=100% >
 <tr>
  <td >
  <p class=MyNormalStyle><b>Question 3: What packet number starts that app.php
  file?</b></p>
  </td>
 </tr>
 <tr style='height:13.0pt'>
  <td>
  <p class=MyNormalStyle><b>Answer: 687</b></p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle>In the Wireshark exportable objects under HTTP,
  app.php shows to start from packet number 687 </p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle><img border=0 width=302 height=132 id="Picture 288"
  src="../../images/blog_images/image048.jpg"
  alt="Graphical user interface, text, application&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
</table>
<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=100%>
 <tr>
  <td >
  <p class=MyNormalStyle><b>Question 4</b>: What is the IP address of the
  Apache server?</p>
  </td>
 </tr>
 <tr>
  <td >
  <p class=MyNormalStyle><b>Answer: 192.185.57.242</b></p>
  </td>
 </tr>
 <tr>
  <td >
  <p class=MyNormalStyle><span style='font-family:"Calibri",sans-serif'>Added a
  new column named with &quot;http.server&quot; to show the server name and put
  the below filter <span style='background:yellow'>http &amp;&amp;
  http.server==&quot;Apache&quot;</span></span></p>
  </td>
 </tr>
 <tr>
  <td>  <p class=MyNormalStyle><img border=0 src="../../images/blog_images/image049.jpg"
  alt="Graphical user interface, text, application&#10;&#10;Description automatically generated"></p>
  <p class=MyNormalStyle><span style='font-family:"Calibri",sans-serif'>&nbsp;</span></p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle><span style='font-family:"Calibri",sans-serif'><img
  border=0 src="../../images/blog_images/image050.png"
  alt="Text&#10;&#10;Description automatically generated with low confidence"></span></p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=100%>
 <tr>
  <td colspan=2>
  <p class=MyNormalStyle><b>Question 5</b>: What file is saved to the infected
  host?</p>
  </td>
 </tr>
 <tr>
  <td colspan=2>
  <p class=MyNormalStyle>Answer : <b>Ref_Sept24-2020.zip</b></p>
  </td>
 </tr>
 <tr>
  <td colspan=2 >
  <p class=MyNormalStyle>Save the app.php from the exportable HTTP objects. <br>
  Examine the file in a text editor and around line number 68, <b>Ref_Sept24-2020.zip
  </b>is being<b> </b>saved to local host.</p>
  </td>
 </tr>
 <tr>
  <td >
  <p class=MyNormalStyle><img border=0 width=284 height=173 id="Picture 292"
  src="../../images/blog_images/image051.png"
  alt="Save the app.php from the exportable HTTP objects. "></p>
  </td>
  <td>
  <p class=MyNormalStyle><img border=0 width=490 height=168 id="Picture 293"
  src="../../images/blog_images/image052.png"
  alt="file in a text editor and around line number 68, Ref_Sept24-2020.zip is being saved to local host."></p>
  </td>
 </tr>
 <tr>
  <td colspan=2>
  <p class=MyNormalStyle>&nbsp;</p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=100%>
 <tr>
  <td>
  <p class=MyNormalStyle><b>Question 6:</b> Attackers used bad TLS certificates
  in this traffic. Which countries were they registered to? Submit the names of
  the countries in alphabetical order separated by a comma (Ex: Norway, South
  Korea).</p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle>Answer : <b>Israel, South Sudan</b></p>
  </td>
 </tr>
 <tr style='height:63.1pt'>
  <td>
  <p class=MyNormalStyle>The challenge provides a <a
  href="https://subscription.packtpub.com/book/networking-and-servers/9781785887819/4/ch04lvl1sec27/the-ssl-tls-handshake">URL</a>
  as a hint. This has the filters for TLS traffic in the Wireshark pcap file.</p>
  <p class=MyNormalStyle>Filtering with ssl.handshake.type == 11, below would
  get us the certificates sent.</p>
  <p class=MyNormalStyle>For the selected packet we can look the certificate
  section and get the country code of the issuer.</p>
  <p class=MyNormalStyle>Looking at all the available packets, we get the
  following country codes : IL,SS where the certificates are not valid<br>
  Get the names for the code and arranging them alphabetically: Israel, South Sudan</p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle><img border=0 width=791 height=92 id="Picture 295"
  src="../../images/blog_images/image053.png"></p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle><img border=0 width=791 height=92 id="Picture 295"
  src="../../images/blog_images/cert1.png">
  <img border=0 width=791 height=92 id="Picture 295"
  src="../../images/blog_images/cert2.png"></p>
  </td>
 </tr>
</table>
<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=100%>
 <tr>
  <td>
  <p class=MyNormalStyle><img border=0 src="../../images/blog_images/image054.png"
  alt="For the selected packet we can look the certificate section and get the country code of the issuer."></p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=100%>
 <tr>
  <td>
  <p class=MyNormalStyle><b>Question 7 : is the host infected (Yes/No)?</b></p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle>Answer : <b>Yes</b></p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle>
  We know the file Ref_Sept24-2020.zip is being saved via app.php.
  So first we take a look at the zip file.<br>
  We rename the app.php to app.html because its all javascript and simply open it in a browser and that downloads the Ref_Sept24-2020.zip.
  </p>
  </td>
 </tr>
  <tr>
  <td>
    <img border=0 src="../../images/blog_images/wireshark_0.png">
  </p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle>
  We unzip the file and see a file named "Ref_Sept24-2020.scr" in it.
  </p>
  </td>
 </tr>
<tr>
  <td>
    <img border=0 src="../../images/blog_images/wireshark_1.png">
  </p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle>
  Calculate the MD5 hash of the file..
  </p>
  </td>
 </tr>
  <tr>
  <td>
    <img border=0 src="../../images/blog_images/wireshark_2.png">
  </p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle>
  Submitting that MD5 hash to the Virustotal shows 45 security vendors and 4 sandboxes flagged this file as malicious.
  <br>Therefore, based on this, the host was indeed infected.
  </p>
  </td>
 </tr>
  <tr>
  <td>
    <img border=0 src="../../images/blog_images/wireshark_3.png">
  </p>
  </td>
 </tr>
</table>


<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=100%>
 <tr>
  <td>
  <p class=MyNormalStyle style='margin-xxxbottom:0in;line-height:normal'><span
  style='font-family:"Cambria",serif'>The objective is now completed, and we
  get 5 coins as well.<br>
  <img border=0 src="../../images/blog_images/image055.png">
  <img border=0 src="../../images/blog_images/image056.png"></span></p>
  </td>
 </tr>
</table>




<!--table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=804 >
    <tr class=MyNormalStyle>
        <td colspan=2 >
                <p class="MyNormalStyle">
                <img border=0 id="Picture 97" src="../../images/blog_images/image038.png">Wireshark Phishing
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img border=0 id="Picture 10" src="../../images/blog_images/image039.png">Tolkien Ring
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <img border=0 id="Picture 96" src="../../images/blog_images/image040.png">Sparkle Redberry
                </p>
        </td>
    </tr>
  <tr>
  <td  colspan=2 >
  <p class=MyNormalStyle><b>Objective</b> : Use the Wireshark Phishing terminal in the
  Tolkien Ring to solve the mysteries around the suspicious PCAP. Get hints for
  this challenge by typing hint in the upper panel of the terminal.</p>
  </td>
 </tr>
 <tr >
  <td rowspan=2 >
  <p class=MyNormalStyle><img border=0 id="Picture 278"
  src="../../images/blog_images/image041.png"
  alt="A picture containing graphical user interface&#10;&#10;Description automatically generated"></p>
  </td>
  <td>
  <p class=MyNormalStyle><u><img border=0 id="Picture 279"
  src="../../images/blog_images/image042.png"
  alt="Graphical user interface, text&#10;&#10;Description automatically generated"></u></p>
  </td>
 </tr>
 <tr>
  <td>
  <p class=MyNormalStyle><u>PCAP file : <br>
  </u><a
  href="https://storage.googleapis.com/hhc22_player_assets/suspicious.pcap">https://storage.googleapis.com/hhc22_player_assets/suspicious.pcap</a></p>
  </td>
 </tr>
</table>

<p class=MyNormalStyle>We type "yes" on the terminal and that prompts a series
of questions.</p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=804 
style='width:603.0pt; margin-xxxleft:-67.75pt;border-collapse:collapse;border:None>
 <tr style='height:34.65pt'>
  <td width=420 valign=top style='width:314.75pt;border:none windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:34.65pt'>
  <p class=MyNormalStyle><img border=0 
  src="../../images/blog_images/image043.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
  <td width=384 valign=top >
  <p class=MyNormalStyle><img border=0 
  src="../../images/blog_images/image044.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=804
 style='width:603.0pt;margin-xxxleft:-67.75pt;border-collapse:collapse;border:none'>
 <tr>
  <td width=804 colspan=2 valign=top style='width:603.0pt;border:none windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Question 1 : </b>There are objects in the PCAP file
  that can be exported by Wireshark and/or tshark. What kind of objects can be
  exported from this PCAP</p>
  </td>
 </tr>
 </tr>

 <tr>
  <td width=804 colspan=2 valign=top style='width:603.0pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Answer</b> : <b>http</b></p>
  </td>
 </tr>
 
 <tr>
  <td width=804 colspan=2 valign=top style='width:603.0pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Open the <b>suspicious.pcap</b> in Wireshark and go to
  File &gt; Export Object. We choose every option there and see exportable
  items in the list only when we select HTTP</p>
  </td>
 </tr>
 <tr >
  <td >
  <p class=MyNormalStyle><img border=0 
  src="../../images/blog_images/image045.png"
  alt="Graphical user interface, application&#10;&#10;Description automatically generated"></p>
  </td>
  <td >
  <p class=MyNormalStyle><img border=0
  src="../../images/blog_images/image046.png"
  alt="Graphical user interface, text, application&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
</table>

<br>

<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0 align=left
 width=804 style='width:603.0pt;
 margin-xxxleftxxx:6.75pt; margin-xxxleftyyy:6.75pt'>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:none windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Question 2 : </b>What is the file name of the
  largest file we can export?</p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Answer : app.php</b></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Open the exportable objects by clicking on File &gt;
  Export Objects &gt; HTTP.</p>
  <p class=MyNormalStyle>Sort the objects by clicking the Size column in
  descending order. app.php is of largest file (808 KB)</p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b><img border=0 width=566 height=113 id="Picture 287"
  src="../../images/blog_images/image047.png"
  alt="Graphical user interface, text, application&#10;&#10;Description automatically generated"></b></p>
  </td>
 </tr>
</table>

<br>

<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0 align=left
 width=804 style='width:603.0pt;
 margin-xxxleftxxx:6.75pt; margin-xxxleftyyy:6.75pt'>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:none windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Question 3: What packet number starts that app.php
  file?</b></p>
  </td>
 </tr>
 <tr style='height:13.0pt'>
  <td width=804 valign=top style='width:603.0pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:13.0pt'>
  <p class=MyNormalStyle><b>Answer: 687</b></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>In the Wireshark exportable objects under HTTP,
  app.php shows to start from packet number 687 </p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><img border=0 width=302 height=132 id="Picture 288"
  src="../../images/blog_images/image048.jpg"
  alt="Graphical user interface, text, application&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
</table>
<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0 width=808
 style='width:605.8pt;margin-xxxleft:-67.75pt;border-collapse:collapse;border:
 none'>
 <tr>
  <td width=808 valign=top style='width:605.8pt;border:none windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Question 4</b>: What is the IP address of the
  Apache server?</p>
  </td>
 </tr>
 <tr>
  <td width=808 valign=top style='width:605.8pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Answer: 192.185.57.242</b></p>
  </td>
 </tr>
 <tr>
  <td width=808 valign=top style='width:605.8pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><span style='font-family:"Calibri",sans-serif'>Added a
  new column named with &quot;http.server&quot; to show the server name and put
  the below filter <span style='background:yellow'>http &amp;&amp;
  http.server==&quot;Apache&quot;</span></span></p>
  </td>
 </tr>
 <tr>
  <td width=808 valign=top style='width:605.8pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><img border=0 width=528 height=207 id="Picture 289"
  src="../../images/blog_images/image049.jpg"
  alt="Graphical user interface, text, application&#10;&#10;Description automatically generated"></p>
  <p class=MyNormalStyle><span style='font-family:"Calibri",sans-serif'>&nbsp;</span></p>
  </td>
 </tr>
 <tr>
  <td width=808 valign=top style='width:605.8pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><span style='font-family:"Calibri",sans-serif'><img
  border=0 width=461 height=97 id="Picture 291"
  src="../../images/blog_images/image050.png"
  alt="Text&#10;&#10;Description automatically generated with low confidence"></span></p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0 align=left
 width=804 style='width:602.75pt;
 margin-xxxleftxxx:6.75pt; margin-xxxleftyyy:6.75pt'>
 <tr>
  <td width=804 colspan=2 valign=top style='width:602.75pt;border:none windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Question 5</b>: What file is saved to the infected
  host?</p>
  </td>
 </tr>
 <tr>
  <td width=804 colspan=2 valign=top style='width:602.75pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Answer : <b>Ref_Sept24-2020.zip</b></p>
  </td>
 </tr>
 <tr>
  <td width=804 colspan=2 valign=top style='width:602.75pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Save the app.php from the exportable HTTP objects. <br>
  Examine the file in a text editor and around line number 68, <b>Ref_Sept24-2020.zip
  </b>is being<b> </b>saved to local host.</p>
  </td>
 </tr>
 <tr>
  <td width=300 valign=top style='width:224.75pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><img border=0 width=284 height=173 id="Picture 292"
  src="../../images/blog_images/image051.png"
  alt="Save the app.php from the exportable HTTP objects. "></p>
  </td>
  <td width=504 valign=top style='width:5.25in;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><img border=0 width=490 height=168 id="Picture 293"
  src="../../images/blog_images/image052.png"
  alt="file in a text editor and around line number 68, Ref_Sept24-2020.zip is being saved to local host."></p>
  </td>
 </tr>
 <tr>
  <td width=804 colspan=2 valign=top style='width:602.75pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>&nbsp;</p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0 align=left
 width=798 style='width:598.25pt;
 margin-xxxleftxxx:6.75pt; margin-xxxleftyyy:6.75pt'>
 <tr>
  <td width=798 valign=top style='width:598.25pt;border:none windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Question 6:</b> Attackers used bad TLS certificates
  in this traffic. Which countries were they registered to? Submit the names of
  the countries in alphabetical order separated by a comma (Ex: Norway, South
  Korea).</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.25pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Answer : <b>Ireland, Israel, South Sudan, United
  States</b></p>
  </td>
 </tr>
 <tr style='height:63.1pt'>
  <td width=798 valign=top style='width:598.25pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:63.1pt'>
  <p class=MyNormalStyle>The challenge provides a <a
  href="https://subscription.packtpub.com/book/networking-and-servers/9781785887819/4/ch04lvl1sec27/the-ssl-tls-handshake">URL</a>
  as a hint. This has the filters for TLS traffic in the Wireshark pcap file.</p>
  <p class=MyNormalStyle>Filtering with ssl.handshake.type == 11, below would
  get us the certificates sent.</p>
  <p class=MyNormalStyle>For the selected packet we can look the certificate
  section and get the country code of the issuer.</p>
  <p class=MyNormalStyle>Looking at all the available packets, we get the
  following country codes : IE, IL, US , SS<br>
  Get the names for the code and arranging them alphabetically: Ireland,
  Israel, South Sudan, United States</p>
  <p class=MyNormalStyle>&nbsp;</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.25pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><img border=0 width=791 height=92 id="Picture 295"
  src="../../images/blog_images/image053.png"></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.25pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><img border=0 width=791 height=92 id="Picture 295"
  src="../../images/blog_images/cert1.png">
  <img border=0 width=791 height=92 id="Picture 295"
  src="../../images/blog_images/cert2.png"></p>
  </td>
 </tr>
</table>
<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0 width=798
 style='width:598.5pt;margin-xxxleft:-63.25pt;border-collapse:collapse;border:
 none'>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:none windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><img border=0 width=608 height=139 id="Picture 296"
  src="../../images/blog_images/image054.png"
  alt="For the selected packet we can look the certificate section and get the country code of the issuer."></p>
  <p class=MyNormalStyle>&nbsp;</p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0 width=798
 style='width:598.5pt;margin-xxxleft:-63.25pt;border-collapse:collapse;border:
 none'>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:none windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Question 7 : is the host infected (Yes/No)?</b></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Answer : <b>Yes</b></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:none windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>The app.php access was successful (200 OK) and that
  file downloads the Ref_Sept24-2020.zip. So, yes, the host is infected.</p>
  </td>
 </tr>
</table>


<table class=MsoTableGrid border=0 cellspacing=0 cellpadding=0 width=798
 style='width:598.5pt;margin-xxxleft:-63.25pt;border-collapse:collapse;border:
 none'>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:none windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style='margin-xxxbottom:0in;line-height:normal'><span
  style='font-family:"Cambria",serif'>The objective is now completed, and we
  get 5 coins as well.<br>
  <img border=0 width=317 height=54 id="Picture 3"
  src="../../images/blog_images/image055.png"><img
  border=0 width=294 height=55 id="Picture 21"
  src="../../images/blog_images/image056.png"></span></p>
  </td>
 </tr>
</table-->
