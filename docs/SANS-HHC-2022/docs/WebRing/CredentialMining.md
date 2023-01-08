# Credential Mining

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=781 style='width:585.85pt;
  margin-xxxleftxxx:6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr style='height:13.25pt'>
  <td width=781 colspan=2 valign=top style='width:585.85pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:13.25pt'>
  <p class=MyNormalStyle><img border=0 width=19 height=20 id="Picture 401"
  src="../../images/blog_images/image133.png">Credential
  Mining 
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img
  border=0 width=17 height=21 id="Picture 402"
  src="../../images/blog_images/image134.png">Web Ring 
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img border=0
  width=25 height=24 id="Picture 403"
  src="../../images/blog_images/image135.png"
  alt="A picture containing clipart&#10;&#10;Description automatically generated">Alabaster
  Snowball</p>
  </td>
 </tr>
 <tr style='height:65.95pt'>
  <td width=132 rowspan=2 valign=top style='width:98.95pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:65.95pt'>
  <p class=MyNormalStyle><img src="../../images/blog_images/image136.png"
  alt="A picture containing text&#10;&#10;Description automatically generated"></p>
  </td>
  <td width=649 valign=top style='width:486.9pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:65.95pt'>
  <p class=MyNormalStyle><u><img src="../../images/blog_images/image137.png"
  alt="Graphical user interface&#10;&#10;Description automatically generated"></u></p>
  </td>
 </tr>
 <tr style='height:26.35pt'>
  <td width=649 valign=top style='width:486.9pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:26.35pt'>
  <p class=MyNormalStyle><u>Hint <br>
  https://owasp.org/www-community/attacks/Brute_force_attack</u></p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=780 style='width:585.25pt;
  margin-xxxleftxxx:6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr>
  <td width=780 valign=top style='width:585.25pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Open victim.pcap and then look at the first instance of
  POST /login.html because thats when the 1st POST was done on login.html to
  send the user name and password.</p>
  </td>
 </tr>
 <tr>
  <td width=780 valign=top style='width:585.25pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  http && http.request.method=="POST" && http.request.uri=="/login.html"
  ```
  </td>
 </tr>
 <tr>
  <td width=780 valign=top style='width:585.25pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyCodeStyle><img src="../../images/blog_images/image138.png"
  alt="Wireshark with below filter on the PCAP file :&#10;http &amp;&amp; http.request.method==&quot;POST&quot; &amp;&amp; http.request.uri==&quot;/login.html&quot;"></p>
  </td>
 </tr>
 <tr>
  <td width=780 valign=top style='width:585.25pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Answer: alice</p>
  </td>
 </tr>
 <tr>
  <td width=780 valign=top style='width:585.25pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Upon
  submitting the answer, the objective is now completed, and we get 5 coins as
  well</p>
  </td>
 </tr>
 <tr>
  <td width=780 valign=top style='width:585.25pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'><img
  border=0 width=317 height=84 id="Picture 25"
  src="../../images/blog_images/image139.png"></span></p>
  </td>
 </tr>
</table>