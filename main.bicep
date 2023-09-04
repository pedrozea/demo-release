// Parameters
param location string = 'eastus'
param namePrefix string = 'pz1'

// Scope
targetScope = 'resourceGroup'

//Modules to deploy
module aspDeploy 'modules/servicePlan.bicep' = {
  name: 'aspDeploy'
  params: {
    namePrefix: '${namePrefix}ASP'
    location: location
  }
}

module appSvcDeploy 'modules/webApp.bicep' = {
  name: 'appSvcDeploy'
  params: {
    aspId: aspDeploy.outputs.aspID
    namePrefix: '${namePrefix}webapp'
    location: location
  }
}

output siteURL string = appSvcDeploy.outputs.siteUrl
