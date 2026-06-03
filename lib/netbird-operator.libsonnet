/**
 * Library with public helper methods provided by component netbird-operator.
 */

local netbirdApiGroup = 'netbird.io';

local ClusterProxy(name='') = {
  apiVersion: '%s/v1alpha1' % netbirdApiGroup,
  kind: 'ClusterProxy',
  metadata: {
    name: name,
    annotations: {
      'argocd.argoproj.io/sync-options': 'SkipDryRunOnMissingResource=true',
    },
  },
};

local Group(name='') = {
  apiVersion: '%s/v1alpha1' % netbirdApiGroup,
  kind: 'Group',
  metadata: {
    name: name,
    annotations: {
      'argocd.argoproj.io/sync-options': 'SkipDryRunOnMissingResource=true',
    },
  },
};

local NetworkResource(name='') = {
  apiVersion: '%s/v1alpha1' % netbirdApiGroup,
  kind: 'NetworkResource',
  metadata: {
    name: name,
    annotations: {
      'argocd.argoproj.io/sync-options': 'SkipDryRunOnMissingResource=true',
    },
  },
};

local NetworkRouter(name='') = {
  apiVersion: '%s/v1alpha1' % netbirdApiGroup,
  kind: 'NetworkRouter',
  metadata: {
    name: name,
    annotations: {
      'argocd.argoproj.io/sync-options': 'SkipDryRunOnMissingResource=true',
    },
  },
};

local SetupKey(name='') = {
  apiVersion: '%s/v1alpha1' % netbirdApiGroup,
  kind: 'SetupKey',
  metadata: {
    name: name,
    annotations: {
      'argocd.argoproj.io/sync-options': 'SkipDryRunOnMissingResource=true',
    },
  },
};

local SidecarProfile(name='') = {
  apiVersion: '%s/v1alpha1' % netbirdApiGroup,
  kind: 'SidecarProfile',
  metadata: {
    name: name,
    annotations: {
      'argocd.argoproj.io/sync-options': 'SkipDryRunOnMissingResource=true',
    },
  },
};

{
  ClusterProxy: ClusterProxy,
  Group: Group,
  NetworkResource: NetworkResource,
  NetworkRouter: NetworkRouter,
  SetupKey: SetupKey,
  SidecarProfile: SidecarProfile,

  netbirdApiGroup: netbirdApiGroup,
}
