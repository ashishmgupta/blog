# Clone with a difference

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804 
  margin-xxxleftxxx:6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr>
  <td width=808 colspan=2 valign=top style='width:605.85pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><img border=0 width=19 height=20 id="Picture 329"
  src="../../images/blog_images/image072.png">Clone
  with a difference 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img
  border=0 width=27 height=25 id="Picture 42"
  src="../../images/blog_images/image039.png">Elfen
  Ring 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img border=0
  width=25 height=24 id="Picture 331"
  src="../../images/blog_images/image082.png"
  alt="A picture containing clipart&#10;&#10;Description automatically generated">Bow
  Ninecandle</p>
  </td>
 </tr>
 <tr style='height:100.6pt'>
  <td width=173 rowspan=2 valign=top style='width:130.05pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:100.6pt'>
  <p class=MyNormalStyle><img border=0 width=159 height=202 id="Picture 335"
  src="../../images/blog_images/image083.png"
  alt="Graphical user interface&#10;&#10;Description automatically generated"></p>
  </td>
  <td width=634 valign=top style='width:475.8pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:100.6pt'>
  <p class=MyNormalStyle><u><img border=0 width=619 height=106 id="Picture 336"
  src="../../images/blog_images/image084_0.png"
  alt="A screenshot of a computer&#10;&#10;Description automatically generated with medium confidence"></u></p>
  </td>
 </tr>
 <tr style='height:39.85pt'>
  <td width=634 valign=top style='width:475.8pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:39.85pt'>
  <p class=MyNormalStyle><u>Hint from Bow Ninecandle<br>
  </u>There's a consistent format for Github repositories cloned <a
  href="https://github.com/git-guides/git-clone">via HTTPS</a>. Try converting!</p>
  </td>
 </tr>
</table>
<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=804
 style='width:603.0pt; margin-xxxleft:-67.75pt;border-collapse:collapse;border:
 none'>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Clicking on the terminal icon shows the below challenge</p>
  </td>
 </tr>
 <tr>
 <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
    <img border=0 src="../../images/blog_images/image084.png"
  alt="A screenshot of a computer&#10;&#10;Description automatically generated with medium confidence"></p>
 </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Create an empty git repository</p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```git
  git init
  ```
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><img
  border=0 width=422 height=35 id="Picture 337"
  src="../../images/blog_images/image085.png"></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'>&nbsp;</p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Add the remote repository
  https://haugfactory.com/asnowball/aws_scripts.git</p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```git
  git remote add origin https://haugfactory.com/asnowball/aws_scripts.git
  ```
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'>&nbsp;</p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Enumerate objects in the remote git repo</p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
```git
  git fetch
```
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyCodeStyle><img border=0 width=539 height=99 id="Picture 339"
  src="../../images/blog_images/image086.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyCodeStyle>&nbsp;</p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Check the origin</p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
    ```git
    git remote show origin
    ```
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyCodeStyle><img border=0 width=542 height=112 id="Picture 340"
  src="../../images/blog_images/image087.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyCodeStyle>&nbsp;</p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Checkout</p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
    ```git
    git checkout -b master origin/main
    ```
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyCodeStyle><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'><img
  border=0 width=545 height=46 id="Picture 341"
  src="../../images/blog_images/image088.png"></span></p>
  </td>
 </tr>
 <tr>
  <td width=804 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>The files are downloaded and we can see the README.md</p>
  </td>
 </tr>
</table>


<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=803 style='width:602.6pt;
  margin-xxxleftxxx:6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr style='height:24.65pt'>
  <td width=803 valign=top style='width:602.6pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:24.65pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><img
  border=0 width=414 height=205 id="Picture 343"
  src="../../images/blog_images/image089.png"
  alt="A screenshot of a computer&#10;&#10;Description automatically generated with medium confidence"></p>
  </td>
 </tr>
 <tr style='height:4.9pt'>
  <td width=803 valign=top style='width:602.6pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:4.9pt'>
  <p class=TableRowBold>The last word in the README.md is maintainers</p>
  </td>
 </tr>
 <tr style='height:24.65pt'>
  <td width=803 valign=top style='width:602.6pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:24.65pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><img
  border=0 width=739 height=107 id="Picture 344"
  src="../../images/blog_images/image090.png"
  alt="Graphical user interface, text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr style='height:24.65pt'>
  <td width=803 valign=top style='width:602.6pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:24.65pt'>
  <p class=TableRowBold>Answer : maintainers</p>
  </td>
 </tr>
 <tr style='height:24.65pt'>
  <td width=803 valign=top style='width:602.6pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:24.65pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><b><img
  border=0 width=557 height=133 id="Picture 389"
  src="../../images/blog_images/image091.png"
  alt="Text&#10;&#10;Description automatically generated"></b></p>
  </td>
 </tr>
 <tr style='height:24.65pt'>
  <td width=803 valign=top style='width:602.6pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:24.65pt'>
  <p class=TableRowBold>The objective is now completed and we get 5 coins as
  well<br>
  <img border=0 width=372 height=62 id="Picture 6"
  src="../../images/blog_images/image092.png"><img
  border=0 width=341 height=61 id="Picture 15"
  src="../../images/blog_images/image093.png"></p>
  </td>
 </tr>
</table>