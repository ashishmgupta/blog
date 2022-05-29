<a href="https://attack.mitre.org/matrices/enterprise/cloud/office365/">https://attack.mitre.org/matrices/enterprise/cloud/office365/</a>
<br><br>

Tactics:
    Initial Access
        Techniques
            Phishing (URL rewriting, Proofpoint/Mimecast)
            Valid Accounts
    Persistence
        Techniques
            Account Manipulation
                Grant additional email delegate permissions
                Add-MailboxPermission -User admin@contoso.com -AccessRights FullAccess -InheritanceType All
            Create Account
                Splunk detection of creating a user with onmicrosoft.com domain name.
            Office Application Startup
            Valid Accounts
    Privilege Escalation
        Techniques
            Valid Accounts
    Defense Evasion
        Techniques
            Hide Artifacts
            Impair Defenses
            Use Alternate Authentication material
            Valid Accounts
    Credential Access
        Techniques
            Brute Force
            Force Web Credentials
            Multi-factor Authentication request Generation
            Steal Application Access Token
            Steal Web Session Cookie
            Unsecured Credentials
    Discovery
        Techniques
            Internal Spearphishing
            Taint Shared Content
            Use Alternate Authentication Material
    Collection
        Techniques
            Data from Information repositories
            Email Collection
    Impact
        Techniques
            Account Access removal
            Endpoint Denial of Service
            Network Denial of Service

### Account created outside PIM
index=azure operationType="RoleElevatedOutsidePimAlert" result="success" 
| rename targetResources{}.displayName as key_5, targetResources{}.userPrincipalName as key_6
| eval a = mvzip(key_5,key_6)
| makemv a delim=","
| eval RoleNameUserAddedto  = mvindex(a,0)
| eval UserAdded = mvindex(a,3)
| rename initiatedBy.user.displayName as CreatedByName, initiatedBy.user.userPrincipalName as CreatedByUPN
| table _time UserAdded RoleNameUserAddedto CreatedByName CreatedByUPN activityDisplayName