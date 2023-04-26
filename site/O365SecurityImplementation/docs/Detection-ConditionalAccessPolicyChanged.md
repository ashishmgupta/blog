
'''
index="main"  sourcetype="azure:aad:audit" result="success" activityDisplayName="Update conditional access policy"
| rename initiatedBy.user.userPrincipalName as policyChangedBy
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
| table _time policyName policyChangedby oldGrantControls newGrantControls oldUsers newUsers usersChanged oldPlatforms newPlatforms platformsChanged oldLocations newLocations locationsChanged oldApplications newApplications applicationsChanged oldUserRiskLevels newUserRiskLevels userRiskLevelsChanged oldSignInRiskLevels newSignInRiskLevels signInRiskLevelsChanged oldClientAppTypes newClientAppTypes clientAppTypesChanged oldDevices newDevices devicesChanged oldServicePrincipalRiskLevels newServicePrincipalRiskLevels servicePrincipalRiskLevelsChanged oldGrantControls newGrantControls grantControlsChanged
'''