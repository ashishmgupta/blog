# Suricata Regatta

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804 style='width:603.0pt;
  margin-xxxleftxxx:6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr>
  <td width=804 colspan=2 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><img border=0 width=19 height=20 id="Picture 314"
  src="../../images/blog_images/image072.png">Suricata
  Regatta 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img border=0
  width=27 height=25 id="Picture 34"
  src="../../images/blog_images/image039.png">Tolkien
  Ring 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img border=0  src="../../images/blog_images/image073.png"
  alt="A picture containing clipart&#10;&#10;Description automatically generated">Fitzy
  Shortstack</p>
  </td>
 </tr>
 <tr >
  <td width=804 colspan=2 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:13.0pt'>
  <p class=MyNormalStyle>Help detect this kind of malicious activity in the
  future by writing some Suricata rules. Work with Dusty Giftwrap in the
  Tolkien Ring to get some hints.</p>
  </td>
 </tr>
 <tr >
  <td rowspan=2 >
  <p class=MyNormalStyle><img border=0 
  src="../../images/blog_images/image074.png"
  alt="Graphical user interface&#10;&#10;Description automatically generated"></p>
  </td>
  <td>
  <p class=MyNormalStyle><u><img border=0 src="../../images/blog_images/image075.png"
  alt="Text&#10;&#10;Description automatically generated"></u></p>
  </td>
 </tr>
 <tr style='height:29.25pt'>
  <td width=612 valign=top style='width:458.7pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:29.25pt'>
  <p class=MyNormalStyle><u>Hint from Dusty Giftwrap<br>
  </u><a
  href="https://suricata.readthedocs.io/en/suricata-6.0.0/rules/intro.html"><span
  style='font-family:"Calibri",sans-serif'>https://suricata.readthedocs.io/en/suricata-6.0.0/rules/intro.html</span></a></p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=804
 style='width:603.0pt; margin-xxxleft:-67.75pt;border-collapse:collapse;border:
 none'>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Q1.</b> <b>First,
  please create a Suricata rule to catch DNS lookups for adv.epostoday.uk.</b></p>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Whenever
  there's a match, the alert message (msg) should read Known bad DNS lookup,
  possible Dridex infection</b></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Answer</p>
  ```python
    alert dns any any -> any any (msg:"Known bad DNS lookup, possible Dridex infection";\
    dns_query; content:"adv.epostoday.uk"; depth:20; fast_pattern; endswith; nocase; classtype:pup-activity; sid:200; rev:2;)
  ```

  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><img
  border=0 src="../../images/blog_images/image076.png"></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Q2.</b> <b>Develop
  a Suricata rule that alerts whenever the infected IP address 192.185.57.242
  communicates with internal systems over HTTP. When there's a match, the
  message (msg) should read Investigate suspicious connections, possible Dridex
  infection</b></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Answer</p>
  ```python
  alert tls any any -> any any (msg:"Investigate bad certificates, possible Dridex infection";\
  tls.subject:"CN=heardbellith.Icanwepeh.nagoya"; sid:400; rev:2;
  ```
 </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><img
  border=0 width=624 height=22 id="Picture 324"
  src="../../images/blog_images/image077.png"></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Q3.</b> <b>We
  heard that some naughty actors are using TLS certificates with a specific CN.</b></p>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Develop a
  Suricata rule to match and alert on an SSL certificate for heardbellith.Icanwepeh.nagoya.</b></p>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>When your
  rule matches, the message (msg) should read Investigate bad certificates,
  possible Dridex infection</b></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Answer:</p>
  ```python
    alert tls any any -> any any (msg:"Investigate bad certificates, possible Dridex infection";\ 
    tls.subject:"CN=heardbellith.Icanwepeh.nagoya"; sid:400; rev:2;)
  ```
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><img
  border=0 width=624 height=20 id="Picture 326"
  src="../../images/blog_images/image078.png"></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Q4. Let's
  watch for one line from the JavaScript: let byteCharacters = atob</b></p>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Oh, and
  that string might be GZip compressed - I hope that's OK!</b></p>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Just in
  case they try this again, please alert on that HTTP data with message
  Suspicious JavaScript function, possible Dridex infection</b></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>Answer: 
  ```python
    alert http any any -> any any (msg:"Suspicious JavaScript function, possible Dridex infection";\ 
    file_data; content:"let byteCharacters = atob"; sid:500; rev:2;)
  ```
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>The objective
  is now completed, and we get 25 coins as well<br>
  <img border=0   src="../../images/blog_images/image079.png"
  alt="Text&#10;&#10;Description automatically generated with low confidence"><img
  border=0 src="../../images/blog_images/image080.png"></p>
  </td>
 </tr>
 <tr>
  <td valign=top style='border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>At this point we have recovered the Tolkien ring.</p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle align=center style=' margin-xxxbottom:0in;text-align:center;
  line-height:normal'><img border=0  src="../../images/blog_images/image081.png"></p>
  </td>
 </tr>
</table>