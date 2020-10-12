# shoreline

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![AppVersion: 1.0](https://img.shields.io/badge/AppVersion-1.0-informational?style=flat-square)

A Helm chart for Kubernetes

**Homepage:** <https://github.com/tidepool-org/development/charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| configmap.data.ClinicDemoUserId | string | `""` |  |
| configmap.enabled | bool | `false` |  |
| deployment.image | string | `"tidepool/shoreline:master-latest"` | Docker image |
| deployment.replicas | int | `1` |  |
| hpa.enabled | bool | `false` | whether to create a horizontal pod autoscalers for all pods of given deployment |
| hpa.maxReplicas | string | `nil` | maximum number of replicas that HPA will maintain |
| hpa.minReplicas | int | `1` | minimum number of replicas that HPA will maintain |
| mongo.secretName | string | `"mongo"` |  |
| nodeSelector | object | `{}` |  |
| pdb.enabled | bool | `false` |  |
| pdb.minAvailable | string | `"50%"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| resources | object | `{}` |  |
| secret.data_.ClinicDemoUserId | string | `""` |  |
| secret.data_.ServiceAuth | string | `""` | service authorization secret |
| secret.data_.UserLongTermKey | string | `nil` |  |
| secret.data_.UserMailVerification | string | `""` |  |
| secret.enabled | bool | `false` |  |
| securityContext | object | `{}` |  |
| serviceMonitor.enabled | bool | `false` |  |
| tolerations | list | `[]` |  |