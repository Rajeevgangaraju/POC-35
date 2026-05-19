param location string = resourceGroup().location
param baseName string

var storageName = 'st${uniqueString(resourceGroup().id, baseName)}'
var planName = 'asp-${baseName}'
var webAppName = 'app-${baseName}'

module storage './modules/storage.bicep' = {
  name: 'storageDeployment'
  params: {
    location: location
    storageAccountName: storageName
  }
}

module webapp './modules/webapp.bicep' = {
  name: 'webAppDeployment'
  params: {
    location: location
    appServicePlanName: planName
    webAppName: webAppName
  }
}
