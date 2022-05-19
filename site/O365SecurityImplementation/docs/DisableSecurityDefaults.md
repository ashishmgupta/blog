Security Defaults is a set of basic identity security mechanisms recommended by Microsoft.<br>
When enabled, these recommendations will be automatically enforced in your organization.<br>
Source: <br>
<a href="https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/concept-fundamentals-security-defaults">https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/concept-fundamentals-security-defaults</a>

That said, to be more flexible and wider security controls, you would use conditional access policies which require the security defaults to be disabled.<br>

Login to Azure portal > Azure Active Directory > Properties > Manage Security Defaults > Enable Security Defaults > set to "No" <br>
<img src="../../../images/o365security/disable-security-defaults-01.png"></img><br>
