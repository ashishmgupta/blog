###<h2>What is Basic Authentication?</h2>
User supplied user name and password are joined separated by a colon and base64 encoded. <br>
The base64 encoded value is sent as an HTTP header named "Authorization".<br>
For example, if the user enters "admin" as user name and "P@ssw0rd" as password, the base64 encoded value would be "YWRtaW46UEBzc3cwcmQ"<br>
The HTTP header would be like the below :<br>
Authorization: Basic YWRtaW46UEBzc3cwcmQ<br>
<br>
It's possible to send the creds over basic auth over HTTP in which case It may be captured by an attacker and decoded back to original plain text credentials.


We create an authentication policy which has by default basic auth disabled for all protocols. <br>
And the set the default authentication policy for the whole organization the newly created authentication policy

```powershell
New-AuthenticationPolicy -Name "Block Legacy Auth for all protocols"
```
By defualt, the basic auth is disabled for all protocols. <br>
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


### Tests

#### The Python Script
In order to test the basic authentication, we will make use of the below script which tries to authenticate to Exchange Online with a given set of users using Exchange Web Services (EWS).<br>
EWS uses Autodiscover protocol which in turn could use basic authentication.

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


#### Enabling the basic auth for all protocols : <br>
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

#### Disabling the basic auth for all protocols : <br>
```powershell
Set-AuthenticationPolicy -Identity 'Block Legacy Auth for all protocols' -AllowBasicAuthAutodiscover:$false -AllowBasicAuthActiveSync:$false -AllowBasicAuthImap:$false -AllowBasicAuthMapi:$false -AllowBasicAuthOfflineAddressBook:$false -AllowBasicAuthOutlookService:$false -AllowBasicAuthPop:$false -AllowBasicAuthPowershell:$false -AllowBasicAuthReportingWebServices:$false -AllowBasicAuthRpc:$false -AllowBasicAuthSmtp:$false -AllowBasicAuthWebServices:$false 
```
Basic auth disabled for all protocols.<br>
<img src="../../../images/o365security/disable-basic-auth-6-all-protocols-disabled.png"></img> <br>

The test will fail with below error : <br>

<u>
exchangelib.errors.AutoDiscoverFailed: All steps in the autodiscover protocol failed for email 'email'. If you think this is an error, consider doing an official test at https://testconnectivity.microsoft.com
</u>
<br>
<img src="../../../images/o365security/disable-basic-auth-test-7.png"></img> <br>
<br>
<br>
Below is the complete output : <br><br>
<quote>
MalformedResponseError: Unknown failure in response. Code: 456 headers: {'Server': 'Microsoft-IIS/10.0', 'request-id': 'a0b4fc1a-bb88-f79b-c6c4-3cc943faee4d', 'Alt-Svc': 'h3=":443",h3-29=":443"', 'X-CalculatedBETarget': 'DM6PR03MB4922.namprd03.PROD.OUTLOOK.COM', 'X-BackEndHttpStatus': '456', 'X-RUM-Validated': '1', 'X-AutoDiscovery-Error': 'LiveIdBasicAuth:AppPasswordRequired:<UNH:<PII.Email:b9Rjt8lxR2vyOYmKJLf+KhYvvk1IckE5k8vkcu1ptTg=@redteamsimulation.com>><RequestId=6df82665-ed76-4591-96bf-27769e62baba,ST=11:21:43><UIPH:<PII.IP:JdMzZuPOa97vH1EqtsCDzJZHYgcksEvcR0jM/lwF4oo=>><HitHrd<V2CACHEFAIL:AppPasswordRequired><Tarpit><UserType:ManagedBusiness><LogonFailed-AppPasswordRequired><AS:AppPasswordRequired><Tid=c2b84b0b-952b-4784-b195-9b56c3deb663><oAuth:,<V2;', 'X-DiagInfo': 'DM6PR03MB4922', 'X-BEServer': 'DM6PR03MB4922', 'X-Proxy-RoutingCorrectness': '1', 'X-Proxy-BackendServerStatus': '456', 'X-FirstHopCafeEFZ': 'LYH', 'X-FEProxyInfo': 'BN7PR06CA0046.NAMPRD06.PROD.OUTLOOK.COM', 'X-FEEFZInfo': 'LYH', 'X-Powered-By': 'ASP.NET', 'X-FEServer': 'BN7PR06CA0046', 'Date': 'Mon, 16 May 2022 04:05:02 GMT', 'Content-Length': '0'} content:
Retry: 0
Waited: 10
Timeout: 10
Session: 24641
Thread: 24360
Auth type: <requests.auth.HTTPBasicAuth object at 0x000001AEFBFC7F10>
URL: https://autodiscover-s.outlook.com/Autodiscover/Autodiscover.xml
HTTP adapter: <requests.adapters.HTTPAdapter object at 0x000001AEFBFC7400>
Allow redirects: False
Streaming: False
Response time: 0.32800000000861473
Status code: 456
Request headers: {'User-Agent': 'exchangelib/4.5.2 (python-requests/2.26.0)', 'Accept-Encoding': 'gzip, deflate', 'Accept': '*/*', 'Connection': 'keep-alive', 'Content-Type': 'text/xml; charset=utf-8', 'Content-Length': '367', 'Authorization': 'Basic ZG9uYWxkYmxha2VAcmVkdGVhbXNpbXVsYXRpb24uY29tOjhxa1FWSmFwVG8ldXdRdio5Xkw4eUxMI1Y5T3hKYQ=='}
Response headers: {'Server': 'Microsoft-IIS/10.0', 'request-id': 'a0b4fc1a-bb88-f79b-c6c4-3cc943faee4d', 'Alt-Svc': 'h3=":443",h3-29=":443"', 'X-CalculatedBETarget': 'DM6PR03MB4922.namprd03.PROD.OUTLOOK.COM', 'X-BackEndHttpStatus': '456', 'X-RUM-Validated': '1', 'X-AutoDiscovery-Error': 'LiveIdBasicAuth:AppPasswordRequired:<UNH:<PII.Email:b9Rjt8lxR2vyOYmKJLf+KhYvvk1IckE5k8vkcu1ptTg=@redteamsimulation.com>><RequestId=6df82665-ed76-4591-96bf-27769e62baba,ST=11:21:43><UIPH:<PII.IP:JdMzZuPOa97vH1EqtsCDzJZHYgcksEvcR0jM/lwF4oo=>><HitHrd<V2CACHEFAIL:AppPasswordRequired><Tarpit><UserType:ManagedBusiness><LogonFailed-AppPasswordRequired><AS:AppPasswordRequired><Tid=c2b84b0b-952b-4784-b195-9b56c3deb663><oAuth:,<V2;', 'X-DiagInfo': 'DM6PR03MB4922', 'X-BEServer': 'DM6PR03MB4922', 'X-Proxy-RoutingCorrectness': '1', 'X-Proxy-BackendServerStatus': '456', 'X-FirstHopCafeEFZ': 'LYH', 'X-FEProxyInfo': 'BN7PR06CA0046.NAMPRD06.PROD.OUTLOOK.COM', 'X-FEEFZInfo': 'LYH', 'X-Powered-By': 'ASP.NET', 'X-FEServer': 'BN7PR06CA0046', 'Date': 'Mon, 16 May 2022 04:05:02 GMT', 'Content-Length': '0'}
Request XML: b'<?xml version=\'1.0\' encoding=\'utf-8\'?>\n<Autodiscover xmlns="http://schemas.microsoft.com/exchange/autodiscover/outlook/requestschema/2006"><Request><EMailAddress>donaldblake@redteamsimulation.com</EMailAddress><AcceptableResponseSchema>http://schemas.microsoft.com/exchange/autodiscover/outlook/responseschema/2006a</AcceptableResponseSchema></Request></Autodiscover>'
Response XML: b''
Traceback (most recent call last):
  File "C:\ashish\code\repos\pyAbuseEWS\pyAbuseEWS.py", line 43, in <module>
    account = Account(username, credentials=credentials, autodiscover=True)
  File "C:\Python310\lib\site-packages\exchangelib\account.py", line 118, in __init__
    self.ad_response, self.protocol = discover(
  File "C:\Python310\lib\site-packages\exchangelib\autodiscover\discovery.py", line 27, in discover
    ).discover()
  File "C:\Python310\lib\site-packages\exchangelib\autodiscover\discovery.py", line 122, in discover
    ad_response = self._step_1(hostname=domain)
  File "C:\Python310\lib\site-packages\exchangelib\autodiscover\discovery.py", line 427, in _step_1
    return self._step_2(hostname=hostname)
  File "C:\Python310\lib\site-packages\exchangelib\autodiscover\discovery.py", line 443, in _step_2
    return self._step_3(hostname=hostname)
  File "C:\Python310\lib\site-packages\exchangelib\autodiscover\discovery.py", line 473, in _step_3
    return self._step_4(hostname=hostname)
  File "C:\Python310\lib\site-packages\exchangelib\autodiscover\discovery.py", line 502, in _step_4
    return self._step_6()
  File "C:\Python310\lib\site-packages\exchangelib\autodiscover\discovery.py", line 553, in _step_6
    raise AutoDiscoverFailed(
exchangelib.errors.AutoDiscoverFailed: All steps in the autodiscover protocol failed for email 'donaldblake@redteamsimulation.com'. If you think this is an error, consider doing an official test at https://testconnectivity.microsoft.com
 ashish@jarvis
</quote>