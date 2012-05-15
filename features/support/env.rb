require 'fog'


CONNECTION_PARAMS ||= { :provider => 'OpenStack',  \
                        :openstack_auth_url => "http://#{ENV['FOGHORN_OS_AUTH_HOST']}:#{ENV['FOGHORN_OS_AUTH_PORT'] || 35357}/v2.0/tokens", \
                        :openstack_tenant => ENV['FOGHORN_OS_TENANT'], \
                        :openstack_username => ENV['FOGHORN_OS_USER'], \
                        :openstack_api_key => ENV['FOGHORN_OS_PASSWORD']
                      }

module KnowsConnectionParameters
  def connection_parameters
    CONNECTION_PARAMS
  end
end

World(KnowsConnectionParameters)
