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
<img src="../../images/disable-basic-auth-1.png"></img>