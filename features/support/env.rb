require 'fog'

CONNECTION_PARAMS ||= { :provider => 'OpenStack',  \
                        :openstack_auth_url => 'http://172.16.1.100:35357/v2.0/tokens', \
                         :openstack_tenant => 'admin', }

module KnowsConnectionParameters
  def connection_parameters
    CONNECTION_PARAMS
  end
end

World(KnowsConnectionParameters)