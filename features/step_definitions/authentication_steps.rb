
Given /^the client is authenticated with user "([^"]*)" and password "([^"]*)"$/ do |username, password|
  @options ||= connection_parameters.merge({:openstack_username => username, :openstack_api_key => password})
end
