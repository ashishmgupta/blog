# Trufflehog Search

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=783
 style='width:587.45pt; margin-xxxleft:-54.25pt;border-collapse:collapse;
 border:none'>
 <tr>
  <td width=783 valign=top style='width:587.45pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Type aws help to see the CLI help messages</p>
  </td>
 </tr>
 <tr>
  <td width=783 valign=top style='width:587.45pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><img
  border=0 width=605 height=107 id="Picture 37"
  src="../../images/blog_images/image192.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=783 valign=top style='width:587.45pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyCodeStyle><span class=TableRowBoldChar>Configure aws credentials</span><br>
  aws configure</p>
  </td>
 </tr>
 <tr>
  <td width=783 valign=top style='width:587.45pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><img
  border=0 width=477 height=148 id="Picture 38"
  src="../../images/blog_images/image193.jpg"
  alt="A screenshot of a computer&#10;&#10;Description automatically generated with medium confidence"></p>
  </td>
 </tr>
 <tr>
  <td width=783 valign=top style='width:587.45pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Get caller Identity</p>
  <p class=MyCodeStyle>aws sts get-caller-identity</p>
  </td>
 </tr>
 <tr>
  <td width=783 valign=top style='width:587.45pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><img
  border=0 width=413 height=248 id="Picture 39"
  src="../../images/blog_images/image194.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=783 valign=top style='width:587.45pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Upon getting the callers identity, the objective is
  completed and we get 5 coins as well.</p>
  <p class=MyNormalStyle><img border=0 width=310 height=54 id="Picture 40"
  src="../../images/blog_images/image195.png"><img
  border=0 width=304 height=54 id="Picture 41"
  src="../../images/blog_images/image196.png"></p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=781 style='width:585.85pt;
  margin-xxxleftxxx:6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr style='height:13.25pt'>
  <td width=781 colspan=2 valign=top style='width:585.85pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:13.25pt'>
  <p class=MyNormalStyle><a name="_Hlk123467241"><img border=0 width=19
  height=20 id="Picture 17"
  src="../../images/blog_images/image188.png"></a><a
  name="_Hlk123467250">Trufflehog Search
  </a><img border=0 width=27 height=25 id="Picture 485"
  src="../../images/blog_images/image039.png">Cloud
  Ring <img border=0
  width=25 height=24 id="Picture 45"
  src="../../images/blog_images/image197.png"
  alt="A picture containing clipart&#10;&#10;Description automatically generated">Sulfrod</p>
  </td>
 </tr>
 <tr style='height:65.95pt'>
  <td width=104 rowspan=2 valign=top style='width:77.8pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:65.95pt'>
  <p class=MyNormalStyle><img border=0 width=73 height=144 id="Picture 46"
  src="../../images/blog_images/image198.png"
  alt="A person in a garment&#10;&#10;Description automatically generated with low confidence"></p>
  </td>
  <td width=677 valign=top style='width:508.05pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:65.95pt'>
  <p class=MyNormalStyle><u><img border=0 width=278 height=97 id="Picture 47"
  src="../../images/blog_images/image199.png"
  alt="Graphical user interface, text&#10;&#10;Description automatically generated"></u></p>
  </td>
 </tr>
 <tr style='height:3.5pt'>
  <td width=677 valign=top style='width:508.05pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:3.5pt'>
  <p class=MyNormalStyle>Hints :<br>
  - Git lab repo <a href="https://haugfactory.com/orcadmin/aws_scripts">https://haugfactory.com/orcadmin/aws_scripts</a></p>
  <p class=MyNormalStyle>- You can search for secrets in a Git repo with
  trufflehog git https://some.repo/here.git.</p>
  <p class=MyNormalStyle>&nbsp;</p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=782 style='width:8.15in; margin-xxxleft:
 6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr>
  <td width=782 valign=top style='width:8.15in;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Installed trufflehog in local machine and scanned the Github
  repo with it.</p>
  </td>
 </tr>
 <tr>
  <td width=782 valign=top style='width:8.15in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyCodeStyle>trufflehog <a
  href="https://haugfactory.com/asnowball/aws_scripts.git"><span
  style='font-size:11.0pt;font-family:"Calibri",sans-serif'>https://haugfactory.com/asnowball/aws_scripts.git</span></a></p>
  </td>
 </tr>
 <tr>
  <td width=782 valign=top style='width:8.15in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><img
  border=0 width=686 height=318 id="Picture 53"
  src="../../images/blog_images/image200.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=782 valign=top style='width:8.15in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>File put_policy.py contains the AWS credentials</p>
  </td>
 </tr>
 <tr>
  <td width=782 valign=top style='width:8.15in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Answer : put_policy.py</p>
  </td>
 </tr>
 <tr>
  <td width=782 valign=top style='width:8.15in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>We submit the answer, and the objective is now
  completed and we get 10 coins as well</p>
  </td>
 </tr>
 <tr>
  <td width=782 valign=top style='width:8.15in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><b><img
  border=0 width=340 height=56 id="Picture 54"
  src="../../images/blog_images/image201.png"><img
  border=0 width=307 height=56 id="Picture 55"
  src="../../images/blog_images/image202.png"></b></p>
  </td>
 </tr>
</table>
