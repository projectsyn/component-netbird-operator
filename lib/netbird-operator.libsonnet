/**
 * Library with public helper methods provided by component netbird-operator.
 */

local netbirdApiGroup = 'netbird.io';

local ClusterProxy(name='') = {
  apiVersion: '%s/v1alpha1' % netbirdApiGroup,
  kind: 'ClusterProxy',
  metadata: {
    name: name,
  },
};

local Group(name='') = {
  apiVersion: '%s/v1alpha1' % netbirdApiGroup,
  kind: 'Group',
  metadata: {
    name: name,
  },
};

local NetworkResource(name='') = {
  apiVersion: '%s/v1alpha1' % netbirdApiGroup,
  kind: 'NetworkResource',
  metadata: {
    name: name,
  },
};

local NetworkRouter(name='') = {
  apiVersion: '%s/v1alpha1' % netbirdApiGroup,
  kind: 'NetworkRouter',
  metadata: {
    name: name,
  },
};

local SetupKey(name='') = {
  apiVersion: '%s/v1alpha1' % netbirdApiGroup,
  kind: 'SetupKey',
  metadata: {
    name: name,
  },
};

local SidecarProfile(name='') = {
  apiVersion: '%s/v1alpha1' % netbirdApiGroup,
  kind: 'SidecarProfile',
  metadata: {
    name: name,
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
