# IMDS, XXE and other abbreviations
<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=769 style='width:576.6pt;
  margin-xxxleftxxx:6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr style='height:13.25pt'>
  <td width=769 colspan=2 valign=top style='width:576.6pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:13.25pt'>
  <p class=MyNormalStyle><a name="_Hlk123465707"><img border=0 width=19
  height=20 id="Picture 418"
  src="../../images/blog_images/image140.png"></a><a
  name="_Hlk123465682">IMDS, XXE and other
  abbreviations </a>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img border=0 width=27
  height=25 id="Picture 480"
  src="../../images/blog_images/image039.png">Web
  Ring
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img border=0
  width=25 height=24 id="Picture 420"
  src="../../images/blog_images/image147.png"
  alt="A picture containing clipart&#10;&#10;Description automatically generated">Alabaster
  Snowball</p>
  </td>
 </tr>
 <tr style='height:65.95pt'>
  <td width=120 rowspan=2 valign=top style='width:89.7pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:65.95pt'>
  <p class=MyNormalStyle><img border=0 width=76 height=126 id="Picture 421"
  src="../../images/blog_images/image136.png"
  alt="A picture containing text&#10;&#10;Description automatically generated"></p>
  </td>
  <td width=649 valign=top style='width:486.9pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:65.95pt'>
  <p class=MyNormalStyle><u><img border=0 src="../../images/blog_images/image148.png"
  alt="Text&#10;&#10;Description automatically generated"></u></p>
  </td>
 </tr>
 <tr style='height:3.5pt'>
  <td width=649 valign=top style='width:486.9pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:3.5pt'>
  <p class=MyNormalStyle><u>Hint : <br>
  </u>AWS uses a specific IP address to access&nbsp;<a
  href="https://www.sans.org/blog/cloud-instance-metadata-services-imds-/">IMDS</a>,
  and that IP only appears twice in this PCAP.</p>
  </td>
 </tr>
</table>

<p class=MsoNormal>&nbsp;</p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=774
 style='width:580.5pt; margin-xxxleft:-58.75pt;border-collapse:collapse;border:
 none'>
 <tr>
  <td width=774 valign=top style='width:580.5pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Open victim.pcap in Wireshark and put a filter to get
  only HTTP requests and dest ip as AWS EC2 Metadata service IP 169.254.169.254</p>
  </td>
 </tr>
 <tr>
  <td width=774 valign=top style='width:580.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  http && ip.dst==169.254.169.254
  ```
  </td>
 </tr>
 <tr>
  <td width=774 valign=top style='width:580.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'>
  <img border=0 src="../../images/blog_images/image149.png"
  alt="Graphical user interface, application, table, Excel&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=774 valign=top style='width:580.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Right click on the last instance and select Follow &gt;
  HTTP Stream for the below URL<br>
  /latest/meta-data/identity-credentials/ec2/security-credentials/ec2-instance
  HTTP/1.0</p>
  </td>
 </tr>
 <tr>
  <td width=774 valign=top style='width:580.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><img id="Picture 425"
  src="../../images/blog_images/image150.png"
  alt="Text&#10;&#10;Description automatically generated with medium confidence"></p>
  </td>
 </tr>
 <tr>
  <td width=774 valign=top style='width:580.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Answer : <a
  href="http://169.254.169.254/latest/meta-data/identity-credentials/ec2/security-credentials/ec2-instance"><span
  style='color:blue'>http://169.254.169.254/latest/meta-data/identity-credentials/ec2/security-credentials/ec2-instance</span></a></p>
  </td>
 </tr>
 <tr>
  <td width=774 valign=top style='width:580.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Upon submitting the answer the objective is now
  completed and we get 10 coins as well<br>
  <br>
  </p>
  </td>
 </tr>
</table>