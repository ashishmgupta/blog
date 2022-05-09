<b>
Disable Basic Authentication
</b>
<br>
We create an authentication policy which has by default basic auth disabled for all protocols. <br>
And the set the default authentication policy for the whole organization the newly created authentication policy

```powershell
New-AuthenticationPolicy "Disable all BasicAuth"
Set-OrganizationConfig -DefaultAuthenticationPolicy "Disable all BasicAuth"
```

Check the newly created authentication policy : <br>
<img src="docs/images/disable-basic-auth-1.png"></img>

The default authentication policy is set to the newly created authentication policy. <br>

```powershell
Get-OrganizationConfig | select DefaultAuthenticationPolicy
```

<img src="docs/images/disable-basic-auth-1.png"></img>

We can also check the Microsoft Admin Center.<br>
Go to <a href="https://admin.microsoft.com/">Microsoft 365 Admin Center</a> <br>
Settings > Org Settings > Modern Authentication <br>
All the settings except the "Turn on modern authentication for Outlook 2013 for Windows and later (recommended)" should be unchecked. <br>
<img src="docs/images/disable-basic-auth-1.png"></img>