param name string 
param location string 
param IotHubs_sbuxiothub_connectionString string
targetScope = 'subscription'
param IotHubs_sbuxiothub_containerName string
param IotHubs_sbuxiothub_name string = 'sbuxiothub'
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' ={
  name : name
  location:location
}

module iotHub 'iothub.bicep' = {
  name : name
  scope: rg
  params:{
    location:location
    IotHubs_sbuxiothub_connectionString: IotHubs_sbuxiothub_connectionString
    IotHubs_sbuxiothub_containerName: IotHubs_sbuxiothub_containerName
    IotHubs_sbuxiothub_name: IotHubs_sbuxiothub_name
  }
}

module cognitiveService 'cognitiveServices.bicep' = {
  scope: rg
  name: name
  params: {
    loaction:location
  }
}

module tts 'tts.bicep' = {
  scope:rg
  name: name
  params:{
    location:location
  }
}

module containerRegistry 'containerRegistry.bicep' = {
  scope: rg
  name: name 
  params: {
    loaction: location
  }
}
