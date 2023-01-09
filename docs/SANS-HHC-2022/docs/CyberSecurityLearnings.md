# Cyber Security Learnings

<p class=NormalText>These are my notes on the challenges from blue team
perspective on what detection/prevention measures could be taken to prevent
exploitation/compromise involved in the challenges.</p>

<p class=NormalText>&nbsp;</p>

<p class=TableRowBold>Wireshark Practice</p>

<p class=TableRowBold><span style='font-weight:normal'>The host got infected
because the user clicked on a link an email to download a zip file. <br>
Below measures could help in preventing this :</span></p>

<p class=TableRowBold style=' margin-xxxleft:.5in;'><span
style='font-weight:normal'>1)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='font-weight:normal'>Email Monitoring to detect and potentially
quarantine emails from suspicious senders.</span></p>

<p class=TableRowBold style=' margin-xxxleft:.5in;'><span
style='font-weight:normal'>2)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='font-weight:normal'>Network monitoring and
prevention on which external domains/IP user can go to.</span></p>

<p class=TableRowBold style=' margin-xxxleft:.5in;'><span
style='font-weight:normal'>3)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='font-weight:normal'>EDR on workstations to block
executions on suspicious files.</span></p>

<p class=TableRowBold style=' margin-xxxleft:.5in;'><span
style='font-weight:normal'>4)<span style='font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style='font-weight:normal'>Phishing simulations on uses with
the intent to educate them to not click on arbitrary links.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>&nbsp;</span></p>

<p class=TableRowBold>Windows Events Logs </p>

<p class=TableRowBold style='text-indent:.5in'><span style='font-weight:normal'>-
Enable PowerShell Auditing </span></p>

<p class=TableRowBold style='text-indent:.5in'><span style='font-weight:normal'>-
EDR on hosts to block execution of suspicious executables based on behavior
(keylogging)</span></p>

<p class=TableRowBold><span style='font-weight:normal'>&nbsp;</span></p>

<p class=TableRowBold>Prison Escape</p>

<p class=TableRowBold><span style='font-weight:normal'>The user in the
container was a privileged user and that allowed them to mount the host drives
and then access them.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>- Dont assign root
privileges to the users in a container.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>&nbsp;</span></p>

<p class=TableRowBold>Jolly CI/CD</p>

<p class=TableRowBold><span style='font-weight:normal'>The developer checked in
their SSH private key in the GitLab repo.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>- The GitLab repos
should be monitored for hard coded SSH keys or any sensitive information
relevant to the organization</span></p>

<p class=TableRowBold><span style='font-weight:normal'>- Upon detection of
sensitive keys [e.g., SSH private key] in the repo, the keys should be rotated
immediately.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>&nbsp;</span></p>

<p class=TableRowBold>Naughty IP &amp; Credential Mining</p>

<p class=TableRowBold><span style='font-weight:normal'>That one IP address
18.222.86.32 sent </span>&gt;900 POST requests<span style='font-weight:normal'>
to /login.html within the same minute 10/05/2022 16:46  a clear case of brute
force attempt.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>- Implement strong
passwords and for the compromised logins, reset passwords.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>- Implement rate
limiting so we dont see so many attempts in a short time</span></p>

<p class=TableRowBold><span style='font-weight:normal'>- Implement MFA to stop
the attacker if the password is compromised.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>- Implement BOT
protection/Captcha to prevent automated attempts.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>&nbsp;</span></p>

<p class=TableRowBold>IMDS, XXE and other abbreviations</p>

<p class=MsoNormal><span style='font-family:"Cambria",serif'>In this case AWS
EC2 Instance Metadata Service <u>version 1</u> was used which allows
programmatic access to metadata about the EC2 instance, its network and Its
storage and that would include security credentials too.<br>
- Use </span><a
href="https://aws.amazon.com/blogs/security/defense-in-depth-open-firewalls-reverse-proxies-ssrf-vulnerabilities-ec2-instance-metadata-service/"><span
style='font-family:"Cambria",serif'>IMDSv2</span></a><span style='font-family:
"Cambria",serif'> instead which makes it harder for an attacker to exploit than
IMDSv1.</span></p>

<p class=NormalText>&nbsp;</p>

<p class=TableRowBold>Open Boria Mine Door</p>

<p class=TableRowBold><span style='font-weight:normal'>We can send the inline
Javascript as input because of the insecure content security policy unsafe-inline'</span></p>

<p class=TableRowBold><span style='font-weight:normal'>- Implement strict </span><a
href="https://owasp.org/www-community/controls/Content_Security_Policy"><span
style='font-weight:normal'>content security policy</span></a><span
style='font-weight:normal'> depending upon the architecture of the app.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>- Implement output
encoding of HTML and Javascript on the server side using corresponding standard
framework libraries.</span></p>

<p class=TableRowBold><a href="https://xss.js.org/#/"><span style='font-weight:
normal'>This</span></a><span style='font-weight:normal'> illustrates usage of
a Node.js library to encode Javascript.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>&nbsp;</span></p>

<p class=TableRowBold>Glamtariels fountain</p>

<p class=TableRowBold><span style='font-weight:normal'>This leveraged XXE (XML
External Entity) injection to retrieve arbitrary files from the host system.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>XXE injection leverages
DTD (Document Type Definition) processing which we should disable altogether
when loading the input XML on the backend. </span><a
href="https://learn.microsoft.com/en-us/dotnet/api/system.xml.xmlreadersettings.dtdprocessing?view=net-7.0"><span
style='font-weight:normal'>Here</span></a><span style='font-weight:normal'> is
an example .NET framework property which can be used to totally prohibit DTD
processing which will prevent XXE injection.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>&nbsp;</span></p>

<p class=TableRowBold>Exploit a smart contract</p>

<p class=TableRowBold><span style='font-weight:normal'>I think if the root hex
value was not hardcoded in the request payload and visible for every request,
we would not have been able to inject our own Merkle tree. If It was not
hardcoded and our wallet/proof values were checked with the root hex of the
Merkle tree on the server side, It would have been difficult to exploit this.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>- Never hardcode any
input.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>- Any artifact which is
needed to make a logical/business decision, have a server side check on them to
prevent any security issue with the business logic.</span></p>

<p class=TableRowBold><span style='font-weight:normal'>- Include manual code review of the application in the SDLC.</span></p>
<p class=TableRowBold><span style='font-weight:normal'>- Implement Automated static code analysis in the CI/CD pipeline. 
This may few false positives but may show some glaring hard-coded values</span></p>

</div>
