#@connections[:volume]   = Fog::Volume.new(options)

And /^the client is connected to the identity service$/  do
  @identity_service ||= Fog::Identity.new(@options)
end

When /^the list of users is retrieved from the identity service$/ do
  # @response = @connections[:image].list_public_images
  @list_user_response = @identity_service.list_users
end

Then /^the list of users should not be empty$/ do
  @list_user_response.body['users'].empty?.should_not == true
end