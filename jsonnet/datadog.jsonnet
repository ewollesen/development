local helpers = import 'helpers.jsonnet';

local Helmrelease(config, group) =
  helpers.helmrelease(config, group) {
    spec+: {
      chart: {
        repository: 'https://kubernetes-charts.storage.googleapis.com/',
        name: 'datadog',
        version: '1.32.2',
      },
      values+: {
        kubeStateMetrics: {
          enabled: config.groups.kubeStateMetrics.helmrelease.create,
        },
        datadog: {
          apiKeyExistingSecret: group.secret.name,
          appKeyExistingSecret: group.secret.name,
          tokenExistingSecret: group.secret.name,
          clusterName: config.cluster.name,
          logLevel: config.cluster.logLevel,
        },
        clusterAgent: {
          enabled: true,
          metricsProvider: {
            enabled: true,
          },
        },
      },
    },
  };

function(config) (
  local group = config.groups.datadog { name: 'datadog' };
  if group.enabled then {
    Helmrelease: if group.helmrelease.create then Helmrelease(config, group),
    Secret: if group.secret.create then helpers.secret(config, group),
    Namespace: if group.namespace.create then helpers.namespace(config, group),
  }
)
