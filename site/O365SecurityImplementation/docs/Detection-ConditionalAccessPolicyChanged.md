# Change conditional access policy
## About
Adversaries may modify authentication mechanisms and processes to access user credentials or enable otherwise unwarranted access to accounts. <br>
<b>Tactic</b>    : Credential Access, Defense Evasion, Persistence <br>
<b>Technique</b> : Modify Authentication Process<br>
More details here in <a href="https://attack.mitre.org/techniques/T1556/" target="_blank"> MITRE ATT&CK </a>. <br>

## Attack Simulation
Lets take this example of this existing conditional access policy which requires admins to go through MFA.
Currently there are two users excluded from this policy.<br>
<img src="../../../images/o365security/update-conditional-access-policy-001.png"></img><br>
Now, we add another user to this exclusion list to exempt them from MFA.<br>
<img src="../../../images/o365security/update-conditional-access-policy-002.png"></img><br>

## Splunk Detection

There are several attributes of a conditional access policy which could be changed.
* Users
* Applications
* Platforms
* Locations
* User Rick Levels
* SignIn Risk Levels
* Client App Types
* Devices
* Service Principal Risk Levels
* Grant Controls

The detection compares the old and new values for each attribute and put in another field if the attribute was changed.<br>
In the below example, users attribute was changed (a user with object id "3618bbdd-8f60-4f85-bc85-8324b191a7fc" was excluded) but not the platform attribute.<br>
<img src="../../../images/o365security/update-conditional-access-policy-003.png"></img><br>

We can always look up the excluded user name by their id in the Azure portal. <br>
<img src="../../../images/o365security/update-conditional-access-policy-004.png"></img><br>

## Splunk Search
``` bash
index="main"  sourcetype="azure:aad:audit" result="success" activityDisplayName="Update conditional access policy"
| rename targetResources{}.displayName as policyName
| spath targetResources{}.modifiedProperties{}.newValue output=newvalue
| spath targetResources{}.modifiedProperties{}.oldValue output=oldvalue
| spath input=newvalue conditions output=newConditions
| mvexpand newConditions
| spath input=oldvalue conditions output=oldConditions
| mvexpand oldConditions
| spath input=newConditions users output=newUsers
| spath input=oldConditions users output=oldUsers
| eval usersChanged=if(tostring(oldUsers)==tostring(newUsers), "Not changed", "Changed")
| spath input=newConditions platforms output=newPlatforms
| spath input=oldConditions platforms output=oldPlatforms
| eval platformsChanged=if(tostring(oldPlatforms)==tostring(newPlatforms), "Not changed", "Changed")
| spath input=newConditions locations output=newLocations
| spath input=oldConditions locations output=oldLocations
| eval locationsChanged=if(tostring(oldLocations)==tostring(newLocations), "Not changed", "Changed")
| spath input=newConditions applications output=newApplications
| spath input=oldConditions applications output=oldApplications
| eval applicationsChanged=if(tostring(oldApplications)==tostring(newApplications), "Not changed", "Changed")
| spath input=newConditions userRiskLevels output=newUserRiskLevels
| spath input=oldConditions userRiskLevels output=oldUserRiskLevels
| eval userRiskLevelsChanged=if(tostring(oldUserRiskLevels)==tostring(newUserRiskLevels), "Not changed", "Changed")
| spath input=newConditions signInRiskLevels output=newSignInRiskLevels
| spath input=oldConditions signInRiskLevels output=oldSignInRiskLevels
| eval signInRiskLevelsChanged=if(tostring(oldSignInRiskLevels)==tostring(newSignInRiskLevels), "Not changed", "Changed")
| spath input=newConditions clientAppTypes output=newClientAppTypes
| spath input=oldConditions clientAppTypes output=oldClientAppTypes
| eval clientAppTypesChanged=if(tostring(oldClientAppTypes)==tostring(newClientAppTypes), "Not changed", "Changed")
| spath input=newConditions devices output=newDevices
| spath input=oldConditions devices output=oldDevices
| eval devicesChanged=if(tostring(oldDevices)==tostring(newDevices), "Not changed", "Changed")
| spath input=newConditions servicePrincipalRiskLevels output=newServicePrincipalRiskLevels
| spath input=oldConditions servicePrincipalRiskLevels output=oldServicePrincipalRiskLevels
| eval servicePrincipalRiskLevelsChanged=if(tostring(oldServicePrincipalRiskLevels)==tostring(newServicePrincipalRiskLevels), "Not changed", "Changed")
| spath input=newvalue grantControls output=newGrantControls
| spath input=oldvalue grantControls output=oldGrantControls
| eval grantControlsChanged=if(tostring(oldGrantControls)==tostring(newGrantControls), "Not changed", "Changed")
| table _time policyName "initiatedBy.user.userPrincipalName" oldGrantControls newGrantControls oldUsers newUsers usersChanged oldPlatforms newPlatforms platformsChanged oldLocations newLocations locationsChanged oldApplications newApplications applicationsChanged oldUserRiskLevels newUserRiskLevels userRiskLevelsChanged oldSignInRiskLevels newSignInRiskLevels signInRiskLevelsChanged oldClientAppTypes newClientAppTypes clientAppTypesChanged oldDevices newDevices devicesChanged oldServicePrincipalRiskLevels newServicePrincipalRiskLevels servicePrincipalRiskLevelsChanged oldGrantControls newGrantControls grantControlsChanged
```