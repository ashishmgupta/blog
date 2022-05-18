




### Tests
Below code tries to use Basic Auth over SMTP Auth protocol and fails becuase SMTP Auth is disabled<br>

$creds = get-credential

Send-MailMessage –From donaldblake@redteamsimulation.com –To ashishxxx@xxx.com –Subject "Test Email" –Body "Test SMTP Service from Powershell" -SmtpServer smtp.office365.com -Credential $creds -UseSsl -Port 587

Error Message :
Send-MailMessage : The SMTP server requires a secure connection or the client was not authenticated. The server
response was: 5.7.57 Client not authenticated to send mail. Error: 535 5.7.139 Authentication unsuccessful,
SmtpClientAuthentication is disabled for the Tenant. Visit https://aka.ms/smtp_auth_disabled for more information.
[BN0PR10CA0026.namprd10.prod.outlook.com]
At line:1 char:1
+ Send-MailMessage –From donaldblake@redteamsimulation.com –To ashishmg ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : InvalidOperation: (System.Net.Mail.SmtpClient:SmtpClient) [Send-MailMessage], SmtpExcept
   ion
    + FullyQualifiedErrorId : SmtpException,Microsoft.PowerShell.Commands.SendMailMessage

<br>
<img src="../../../images/o365security/disable-basic-auth-4.png"></img>


