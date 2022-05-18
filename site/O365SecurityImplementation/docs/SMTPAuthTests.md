```powershell
# Sender Credentials
# Sender and Recipient Info
$MailFrom = "ashish.gupta@lplfinancial.com"
$MailTo = "ashishmgupta@hotmail.com"

$Username = "infosec.test@lplfinancial.com"
$Password = "bN1A&Fwf018s8huq%Aff"

# Server Info
$SmtpServer = "smtp.office365.com"
$SmtpPort = "587"

# Message stuff
$MessageSubject = "Microsoft .NET documentation" 
$Message = New-Object System.Net.Mail.MailMessage $MailFrom,$MailTo
$Message.IsBodyHTML = $true
$Message.Subject = $MessageSubject
$Message.Body = @'
<!DOCTYPE html>
<html>
<head>
</head>
<body>
https://docs.microsoft.com
</body>
</html>
'@

# Construct the SMTP client object, credentials, and send
$Smtp = New-Object Net.Mail.SmtpClient($SmtpServer,$SmtpPort)
$Smtp.EnableSsl = $true
$Smtp.Credentials = New-Object System.Net.NetworkCredential($Username,$Password)
$Smtp.Send($Message)
```