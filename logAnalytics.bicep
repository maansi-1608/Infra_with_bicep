
param location string 
param logAnalyticsName string  = 'Sbux-Logs'
param projectName string = 'Sbux Sign Language Store'

resource logAnalyticsWorkspace 'Microsoft.OperationalInsights/workspaces@2020-08-01' = {
  name: logAnalyticsName
  location: location
  tags: {
    displayName: 'Log Analytics'
    ProjectName: projectName
  }
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 120
    features: {
      searchVersion: 1
      legacy: 0
      enableLogAccessUsingOnlyResourcePermissions: true
    }
    workspaceCapping: {
      dailyQuotaGb: -1
  }
  publicNetworkAccessForIngestion: 'Enabled'
  publicNetworkAccessForQuery : 'Enabled'
  }
}

resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: logAnalyticsName
  location: location
  kind: 'string'
  tags: {
    displayName: 'AppInsight'
    ProjectName: projectName
  }
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}
