require 'fog'

module KnowsConnectionParameters
  def connection_parameters
    @connection_parms ||= { :provider => 'OpenStack',  \
                            :openstack_auth_url => 'http://172.16.1.100:35357/v2.0/tokens', \
                            :openstack_tenant => 'admin', }
  end
end

World(KnowsConnectionParameters)

Given /^the client is authenticated with user "([^"]*)" and password "([^"]*)"$/ do |username, password|
  @options ||= connection_parameters.merge({:openstack_username => username, :openstack_api_key => password})
end
