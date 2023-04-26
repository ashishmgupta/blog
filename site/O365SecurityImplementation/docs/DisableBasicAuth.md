# Disable Basic Authentication

###<h2>What is Basic Authentication?</h2>
User-supplied username and password are joined and separated by a colon and base64 encoded. <br>
The base64 encoded value is sent as an HTTP header named "Authorization".<br>
For example, if the user enters "admin" as the user name and "P@ssw0rd" as the password, the base64 encoded value would be "YWRtaW46UEBzc3cwcmQ"<br>
The HTTP header would be like the below :<br>
Authorization: Basic YWRtaW46UEBzc3cwcmQ<br>
<br>

### Basic/Legacy/Protocols/Authentication???? :-$
Sometimes, It gets very confusing when terms like "basic" and "legacy" are used for both protocols and auth. <br>
Therefore, It is very important to understand the difference between the messaging protocols vs the authentication mechanism. <br>
The authentication mechanism is a part of messaging protocol which also deals with how the messages would be exchanged between the client and the server after authentication. <br>

Let's look at the IMAP4 protocol. <br>
<a href="https://datatracker.ietf.org/doc/html/rfc3501">https://datatracker.ietf.org/doc/html/rfc3501</a><br>
<img src="../../../images/o365security/disable-basic-auth-10.png"></img><br>

You see the "Authenticated" step which means how clients would authenticate to the server and also the "Selected" step has the SELECT command selects a mailbox so that messages in the mailbox can be accessed. <br>

That "Authenticated" step may make use of Basic authentication (like we described above).<br>
However, that option of using basic auth should be disabled so clients (potential attackers) cant make use of the same.<br>


### Why basic auth is discouraged?
Since the authentication is possible by simply sending the base64 encoded user name and password, It is more prone to brute force and password spraying attacks.<br>
It's possible to send the creds over basic auth over HTTP in which case It may be captured by an attacker and decoded back to original plain text credentials.<br>


We create an authentication policy that has by default basic auth disabled for all protocols. <br>
And then set the default authentication policy for the whole organization the newly created authentication policy

```powershell
New-AuthenticationPolicy -Name "Block Legacy Auth for all protocols"
```
By default, the basic auth is disabled for all protocols. <br>
<img src="../../../images/o365security/disable-basic-auth-5-all-protocols.png"></img>

Setting the newly created policy with basic auth disabled as the default policy for the organization/tenant. <br>
```powershell
Set-OrganizationConfig -DefaultAuthenticationPolicy "Block Legacy Auth for all protocols"
```

Check the newly created authentication policy : <br>
<img src="../../../images/o365security/disable-basic-auth-1.png"></img>

The default authentication policy is set to the newly created authentication policy. <br>

```powershell
Get-OrganizationConfig | select DefaultAuthenticationPolicy
```

<img src="../../../images/o365security/disable-basic-auth-2.png"></img>

We can also check the Microsoft Admin Center.<br>
Go to <a href="https://admin.microsoft.com/">Microsoft 365 Admin Center</a> <br>
Settings > Org Settings > Modern Authentication <br>
All the settings except the "Turn on modern authentication for Outlook 2013 for Windows and later (recommended)" should be unchecked. <br>
<img src="../../../images/o365security/disable-basic-auth-3.png"></img>

### Enable Modern Authentication

```powershell
Set-OrganizationConfig -OAuth2ClientProfileEnabled $true
```
<br>
### Tests

#### The Python Script
To test the basic authentication, we will make use of the below script which tries to authenticate to Exchange Online with a given set of users using Exchange Web Services (EWS).<br>
EWS uses Autodiscover protocol which in turn could use basic authentication.

The script can be found here as well: <br>
https://github.com/ashishmgupta/pyAbuseLegacyAuthInEXO <br>

```python
from exchangelib import Credentials, Account
import requests
import os
from pathlib import Path
import re

external_ip = requests.get('https://ident.me').text
print(external_ip)
current_dir = os.getcwd()
creds_file = os.path.join(current_dir, "creds.txt")
if not os.path.isfile(creds_file):
    fp = open('creds_file', 'x')
    fp.close()
    print("Credentials file did not exist. We created a new one. Please populate with username and password separated by || in each line")
    quit()
    
with open(creds_file) as f:
    lines = f.readlines()

for line in lines:
	line = line.rstrip()
	cred = line.split("||")
	username = cred[0]
	password = cred[1]
	print(username)
	print(password)
	credentials = Credentials(username, password)
	account = Account(username, credentials=credentials, autodiscover=True)

	user_folder= current_dir+"/"+username
	Path(user_folder).mkdir(parents=True, exist_ok=True)

	for msg in account.inbox.all().order_by('-datetime_received')[:10]:
		email_content=""
		clean_subject = re.sub('[^A-Za-z0-9]+','', msg.subject )
		msg_folder_to_save =  user_folder +"/"+clean_subject
		msg_contents_file =  msg_folder_to_save +"/msg.txt"
		Path(msg_folder_to_save).mkdir(parents=True, exist_ok=True)
		#print(msg.subject, msg.sender, msg.datetime_received)
		
		email_content += "sender            ={}".format(msg.sender) + "\n"
		email_content += "datetime_sent     ={}".format(msg.datetime_sent)+ "\n"
		email_content += "subject           ={}".format(msg.subject)+ "\n"
		email_content += "text_body         ={}".format(msg.text_body.encode('UTF-8'))+ "\n"
		with open(msg_contents_file, "w+") as f:
			f.write(email_content)
		
		print(email_content)
		print("#" * 80)
		for attachment in msg.attachments:
			fpath = os.path.join(msg_folder_to_save, attachment.name)
			with open(fpath, 'wb') as f:
				f.write(attachment.content)
```


#### Enabling the basic auth for all protocols <br>
```Powershell 
Set-AuthenticationPolicy -Identity 'Block Legacy Auth for all protocols' -AllowBasicAuthAutodiscover -AllowBasicAuthActiveSync -AllowBasicAuthImap -AllowBasicAuthMapi -AllowBasicAuthOfflineAddressBook -AllowBasicAuthOutlookService -AllowBasicAuthPop -AllowBasicAuthPowershell -AllowBasicAuthReportingWebServices -AllowBasicAuthRpc -AllowBasicAuthSmtp -AllowBasicAuthWebServices
```
<br>
Basic auth enabled for all protocols.<br>
<img src="../../../images/o365security/disable-basic-auth-6-all-protocols-enabled.png"></img>

<br>
Executing the Python script. 
Could retrieve all the messages from the mailbox.
<img src="../../../images/o365security/disable-basic-auth-test-7.png"></img>

#### Disabling the basic auth for all protocols <br>
```powershell
Set-AuthenticationPolicy -Identity 'Block Legacy Auth for all protocols' -AllowBasicAuthAutodiscover:$false -AllowBasicAuthActiveSync:$false -AllowBasicAuthImap:$false -AllowBasicAuthMapi:$false -AllowBasicAuthOfflineAddressBook:$false -AllowBasicAuthOutlookService:$false -AllowBasicAuthPop:$false -AllowBasicAuthPowershell:$false -AllowBasicAuthReportingWebServices:$false -AllowBasicAuthRpc:$false -AllowBasicAuthSmtp:$false -AllowBasicAuthWebServices:$false 
```
<br>
Basic auth disabled for all protocols.<br>
<img src="../../../images/o365security/disable-basic-auth-6-all-protocols-disabled.png"></img> <br>

The test will fail with below error : <br>

<u>
exchangelib.errors.AutoDiscoverFailed: All steps in the autodiscover protocol failed for email 'email'. If you think this is an error, consider doing an official test at https://testconnectivity.microsoft.com
</u>
<br>
<img src="../../../images/o365security/disable-basic-auth-test-8.png"></img> <br>
<br>
