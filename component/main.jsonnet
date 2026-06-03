// main template for netbird-operator
local com = import 'lib/commodore.libjsonnet';
local kap = import 'lib/kapitan.libjsonnet';
local kube = import 'lib/kube.libjsonnet';
local lib = import 'lib/netbird-operator.libsonnet';
local inv = kap.inventory();
// The hiera parameters for the component
local params = inv.parameters.netbird_operator;

local apiSecret = kube.Secret(params.api.secret_name) {
  metadata+: {
    namespace: params.namespace,
  },
  data:: {},
  stringData: {
    [params.api.secret_key]: params.api.token,
  },
};

local aggregatedClusterRole = {
  apiVersion: 'rbac.authorization.k8s.io/v1',
  kind: 'ClusterRole',
  metadata: {
    labels: {
      'rbac.authorization.k8s.io/aggregate-to-cluster-reader': 'true',
    },
    name: 'netbird-operator-crds-cluster-reader',
  },
  rules: [
    {
      apiGroups: [ lib.netbirdApiGroup ],
      resources: [ '*' ],
      verbs: [ 'get', 'list', 'watch' ],
    },
  ],
};

local clusterProxies = com.generateResources(params.cluster_proxies, lib.ClusterProxy);
local groups = com.generateResources(params.groups, lib.Group);
local networkResources = com.generateResources(params.network_resources, lib.NetworkResource);
local networkRouters = com.generateResources(params.network_routers, lib.NetworkRouter);
local setupKeys = com.generateResources(params.setup_keys, lib.SetupKey);
local sidecarProfiles = com.generateResources(params.sidecar_profiles, lib.SidecarProfile);

// Define outputs below
{
  '00_namespace': kube.Namespace(params.namespace) {
    metadata+: {
      annotations+: params.namespace_annotations,
      labels+: params.namespace_labels,
    },
  },
  '01_api_secret': apiSecret,
  [if params.rbac.aggregated_cluster_reader then '10_cluster_role']:
    aggregatedClusterRole,
} + {
  ['10_cluster_proxy_%s' % res.metadata.name]: res
  for res in clusterProxies
} + {
  ['10_group_%s' % res.metadata.name]: res
  for res in groups
} + {
  ['10_network_resource_%s' % res.metadata.name]: res
  for res in networkResources
} + {
  ['10_network_router_%s' % res.metadata.name]: res
  for res in networkRouters
} + {
  ['10_setup_key_%s' % res.metadata.name]: res
  for res in setupKeys
} + {
  ['10_sidecar_profile_%s' % res.metadata.name]: res
  for res in sidecarProfiles
}
