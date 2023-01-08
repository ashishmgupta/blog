# Windows Event Logs
<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=804>
 <tr>
  <td width=804 colspan=2 valign=top style='width:603.0pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><img border=0 width=19 height=20 id="Picture 4"
  src="../../images/blog_images/image057.png">
  Windows Event Logs 
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img border=0
  width=27 height=25 id="Picture 27"
  src="../../images/blog_images/image039.png">Tolkien
  Ring
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img border=0 width=29 height=28 id="Picture 100"
  src="../../images/blog_images/image058.png"
  alt="A picture containing clipart&#10;&#10;Description automatically generated">Dusty
  Giftwrap</p>
  </td>
 </tr>
 <tr style='height:114.75pt'>
  <td width=176 rowspan=2 valign=top style='width:132.05pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:114.75pt'>
  <p class=MyNormalStyle><img border=0 width=160 height=169 id="Picture 301"
  src="../../images/blog_images/image059.png"
  alt="Graphical user interface&#10;&#10;Description automatically generated"></p>
  </td>
  <td width=628 valign=top style='width:470.95pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:114.75pt'>
  <p class=MyNormalStyle><img border=0 width=481 height=147 id="Picture 302"
  src="../../images/blog_images/image060.png"
  alt="A screenshot of a computer&#10;&#10;Description automatically generated with medium confidence"></p>
  </td>
 </tr>
 <tr style='height:31.15pt'>
  <td width=628 valign=top style='width:470.95pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:31.15pt'>
  <p class=MyNormalStyle>Windows Event log file (.EVTX)<br>
  <a href="https://storage.googleapis.com/hhc22_player_assets/powershell.evtx">https://storage.googleapis.com/hhc22_player_assets/powershell.evtx</a>
  </p>
  </td>
 </tr>
</table>

<p class=MyNormalStyle>&nbsp;</p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804>
 <tr> 
    <td>
        <p class=MyNormalStyle>In the terminal, we are asked a series of questions from the .EVTX file.</p>
    </td>
 </tr>
 <tr>
  <td>
  <img border=0   src="../../images/blog_images/image061.png"
  alt="Text&#10;&#10;Description automatically generated">
  </td>

 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>As the 1<sup>st</sup> step, we convert the
  powershell.evtx to CSV</p>
  <p class=MyCodeStyle style=' margin-xxxbottom:0in;line-height:normal'>
  ``` powershell
  Get-WinEvent -Path powershell.evtx `
  | Export-Csv powershell_logs.csv -NoTypeInformation</p>
  ```
  </td>
 </tr>
</table>

<p class=MsoNormal><span style='font-family:"Cambria",serif'>&nbsp;</span></p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804>
 <tr>
  <td width=786 valign=top style='width:589.5pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Q1. What month/day/year did the attack take place?</b></p>
  </td>
 </tr>
 <tr>
  <td width=786 valign=top style='width:589.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Answer : 12/24/2022</b></p>
  </td>
 </tr>
 <tr style='height:85.0pt'>
  <td width=786 valign=top style='width:589.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:85.0pt'>
    <p class=MyNormalStyle>#
  check for all dates for the events which mentioned the word 'recipe'</p>
  <p class=MyCodeStyle>
  ``` powershell
  Import-Csv powershell_logs.csv | Where-Object
  {$_.'message' -like '*recipe*'} | select TimeCreated
  ```
  </p>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Cambria",serif'>&nbsp;#There
  were 56 events where &quot;recipe&quot; was mentioned</span></p>
  <p class=MyCodeStyle>
  ``` powershell
  (Import-Csv powershell_logs.csv | Where-Object {$_.'message'
  -like '*recipe*'} | select TimeCreated).count
  ```
  </p>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Cambria",serif'>&nbsp;
  Out of 56, there were only 3 events on 12/18/2022 which mentioned recipe and
  they look innocuous. </span><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'>So
  the attack took place on 12/24/2024</span></p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804>
 <tr>
  <td width=786 valign=top style='width:589.5pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Q2. An attacker got a secret from a file. What was
  the original file's name?</b></p>
  </td>
 </tr>
 <tr>
  <td width=786 valign=top style='width:589.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle><b>Answer: Recipe</b></p>
  </td>
 </tr>
 <tr>
  <td width=786 valign=top style='width:589.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Cambria",serif'>The
  attacker got a secret from a file which means they may have used Get-Content.</span></p>
  <p class=MyCodeStyle><span style='font-size:11.0pt;font-family:"Cambria",serif'>So,
  we look for that in the events on 12/24/2022</span><br>
  ``` powershell
  Import-Csv powershell_logs.csv | Where-Object {$_.'message' -like '*$foo*'
  -and $_.'message' -like '*Get-Content*' -and $_.TimeCreated -like
  '*12/24/2022*'} | select message | Format-Table -Wrap -Autosize
  ```
  </p>

  <img border=0 src="../../images/blog_images/image062.png"><br>
  <img border=0 src="../../images/blog_images/image062_1.png">
  <p class=MyNormalStyle>And here it is. They are trying to get the content from a file named Recipe,
  replacing 'honey' with 'fish oil' and putting the changed content in the
  variable named $foo</p>
  </td>
 </tr>
</table>

<span style='font-size:11.0pt;line-height:107%;font-family:"Cambria",serif'><br
clear=all style='page-break-before:always'>
</span>

<p class=MsoNormal><span style='font-family:"Cambria",serif'>&nbsp;</span></p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804>
 <tr>
  <td width=789 valign=top style='width:592.05pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b><span
  style='font-family:"Cambria",serif'>Q3. The contents of the previous file
  were retrieved, changed, and stored to a variable by the attacker. This was
  done multiple times. Submit the last full PowerShell line that performed only
  these actions.</span></b></p>
  </td>
 </tr>
 <tr>
  <td width=789 valign=top style='width:592.05pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>Answer :</p>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>$foo =
  Get-Content .\Recipe| % {$_ -replace 'honey', 'fish oil'}</b></p>
  </td>
 </tr>
 <tr>
  <td width=789 valign=top style='width:592.05pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>The attacker
  retrieved contents of the file, changed, and stored to a variable. So, they
  may have used &quot;Get-Content&quot; </p>
  ``` powershell
  Import-Csv powershell_logs.csv | Where-Object
  {$_.'message' -like '*$foo*' -and $_.'message' -like '*Get-Content*' -and
  $_.TimeCreated -like '*12/24/2022*'} | select message | Format-Table -Wrap
  -Autosize
  ```
  
  <img border=0 src="../../images/blog_images/image063.png">
  </td>
 </tr>
</table>

<p class=MsoNormal><span style='font-family:"Cambria",serif'>&nbsp;</span></p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804>
 <tr>
  <td width=792 valign=top style='width:8.25in;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Q4.</b> <b>After
  storing the altered file contents into the variable, the attacker used the
  variable to run a separate command that wrote the modified data to a file.
  This was done multiple times. Submit the last full PowerShell line that
  performed only this action.</b></p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:8.25in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>Answer :<b>$foo
  | Add-Content -Path 'Recipe'</b></p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:8.25in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>To write
  altered file contents from a variable to a file, attacker may have used
  Add-Content.</p>
  <p class=MyCodeStyle>
  ``` powershell
  Import-Csv powershell_logs.csv | Where-Object
  {$_.'message' -like '*$foo*' -and $_.'message' -like '*Add-Content*' -and
  $_.TimeCreated -like '*12/24/2022*'} | select message | Format-Table -Wrap
  -Autosize
  ```
  </p>
  <img src="../../images/blog_images/image064.png">
  </td>
 </tr>
</table>

<p class=MsoNormal><span style='font-family:"Cambria",serif'>&nbsp;</span></p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804>
 <tr>
  <td width=792 valign=top style='width:8.25in;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class='MyNormalStyle'><b>Q5.
  The attacker ran the previous command against one file multiple times. What
  is the name of this file?</b></p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:8.25in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle>Answer : <b>Recipe.txt</b></p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:8.25in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyCodeStyle>
  ``` powershell
  Import-Csv powershell_logs.csv | Where-Object
  {$_.'message' -like '*$foo*' -and $_.'message' -like '*Add-Content*' -and
  $_.TimeCreated -like '*12/24/2022*'} | select message | Format-Table -Wrap
  -Autosize
  ```
  </p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:8.25in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <img  src="../../images/blog_images/image065.png"
  alt="Text&#10;&#10;Description automatically generated">
  </td>
 </tr>
</table>

<p class=MsoNormal><span style='font-family:"Cambria",serif'>&nbsp;</span></p>

<p class=MsoNormal><span style='font-family:"Cambria",serif'>&nbsp;</span></p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804>
 <tr style='height:10.2pt'>
  <td width=792 valign=top style='width:8.25in;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:10.2pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Q7. Was
  the original file (from question 2) deleted? (Yes/No)</b></p>
  </td>
 </tr>
 <tr style='height:10.2pt'>
  <td width=792 valign=top style='width:8.25in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:10.2pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>Answer: <b>No</b></p>
  </td>
 </tr>
 <tr style='height:190.0pt'>
  <td width=792 valign=top style='width:8.25in;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:190.0pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>From question
  2, the original file name was &quot;recipe&quot;.</p>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>The files
  deleted were recipe.txt and recipe_updated.txt.</p>
  <p class=MyCodeStyle>
  ```powershell
  Import-Csv powershell_logs.csv | Where-Object {$_.'message'
  -like '*del*' -and $_.TimeCreated -like '*12/24/2022*'} | select message |
  Format-Table -Wrap -Autosize
  ```
  </p>
  <p class=MyCodeStyle>&nbsp;</p>
  <p class=MyCodeStyle><img border=0 src="../../images/blog_images/image066.png"></p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Q6. Were
  any files deleted?</b></p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>Answer : <b>Yes</b></p>
  </td>
 </tr>
 <tr>
  <td width=792 valign=top style='width:593.75pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>Looking for
  usage of 'del' command in PowerShell events. Looks like 2 files were deleted.</p>
  <p class=MyCodeStyle>
  ```powershell
  Import-Csv powershell_logs.csv | Where-Object
  {$_.'message' -like '*del*' -and $_.TimeCreated -like '*12/24/2022*'} |
  select message | Format-Table -Wrap -Autosize
  ```
  </p>
  <img border=0 src="../../images/blog_images/image067.png">
  </td>
 </tr>
</table>

<p class=MsoNormal><span style='font-family:"Cambria",serif'>&nbsp;</span></p>

<p class=MsoNormal><span style='font-family:"Cambria",serif'>&nbsp;</span></p>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 width=804>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Q8. What
  is the Event ID of the logs that show the actual command lines the attacker
  typed and ran?</b></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>Answer : <b>4104</b></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>Looking for
  the event id of the event showing file deletion and It looks like 4104</p>
  <p class=MyCodeStyle>
  ```powershell
  Import-Csv powershell_logs.csv | Where-Object
  {$_.'message' -like '*del*' -and $_.TimeCreated -like '*12/24/2022*'} |
  select Id,Message | Format-Table -Wrap -Autosize
  ```
  </p>
  <img border=0 src="../../images/blog_images/image068.png">
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804 
  margin-xxxleftxxx:6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr style='height:12.15pt'>
  <td width=798 valign=top style='width:598.25pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt;height:12.15pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Q9. Is the
  secret ingredient compromised (Yes/No)?</b></p>
  </td>
 </tr>
 <tr style='height:11.5pt'>
  <td width=798 valign=top style='width:598.25pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:11.5pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>Answer: <b>Yes</b></p>
  </td>
 </tr>
 <tr style='height:64.25pt'>
  <td width=798 valign=top style='width:598.25pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt;height:64.25pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>This is
  because :</p>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'># The
  attacker got the content from original recipe file and replaced the honey
  with fish oil and put that updated value in the variable $foo</p>
  <p class=MyCodeStyle>
  ```powershell
  $foo = Get-Content .\Recipe| % {$_ -replace 'honey',
  'fish oil'}
  ```
  </p>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>And then
  wrote the changed variable back to the original file named Recipe</p>
  <p class=MyCodeStyle>
  ```powershell
  $foo | Add-Content -Path 'Recipe'
  ```
  </p>
  </td>
 </tr>
</table>

<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0 align=left
 width=804 
  margin-xxxleftxxx:6.75pt;  margin-xxxleftyyy:6.75pt'>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><b>Q10. What
  is the secret ingredient?</b></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'>Answer: <b>Honey</b></p>
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'>From
  the answer to the question 9) the ingredient which got replaced in the
  original recipe file was honey.</span></p>
  <p style='margin:0in'><span style='font-size:11.0pt;font-family:"Calibri",sans-serif'>So
  the secret ingredient is honey</span></p>
  <img border=0 src="../../images/blog_images/image069.png">
  </td>
 </tr>
 <tr>
  <td width=798 valign=top style='width:598.5pt;border:solid windowtext 1.0pt;
  border-top:none;padding:0in 5.4pt 0in 5.4pt'>
  <p class=MyNormalStyle style=' margin-xxxbottom:0in;line-height:normal'><span
  style='font-family:"Cambria",serif'>The objective is now completed and we get
  10 coins as well<br>
  <img border=0 width=352 height=57 id="Picture 5"
  src="../../images/blog_images/image070.png"
  alt="Text&#10;&#10;Description automatically generated with low confidence"><img
  border=0 width=311 height=56 id="Picture 19"
  src="../../images/blog_images/image071.png"
  alt="Graphical user interface, text&#10;&#10;Description automatically generated"></span></p>
  </td>
 </tr>
</table>