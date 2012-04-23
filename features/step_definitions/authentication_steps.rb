require 'fog'

FOG_CREDENTIALS = { :provider => 'OpenStack',  \
                    :openstack_auth_url => 'http://mc1.la-1-9.morphcloud.net:35357/v2.0/tokens', \
                    :openstack_tenant => 'admin', \
                    :openstack_management_url => 'http://mc1.la-1-9.morphcloud.net:8774/v1.1/', }

Given /^the username is "([^"]*)"$/ do |arg1|
  @user = arg1
end

And /^the password is "([^"]*)"$/ do |arg1|
  @password = arg1
end

When /^the client authenticates$/ do
  @connections = FogClient.connect(@user,@password)
end

Then /^compute service should be in the catalog$/ do
  @connections[:compute] != nil
end

And /^identity service should be in the catalog$/ do
  @connections[:identity] != nil
end

And /^image service should be in the catalog$/ do
  @connections[:image] !=nil
end

And /^volume service should be in the catalog$/ do
  @connections[:volume] != nil
end
