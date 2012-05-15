Given /^the client is connected to the image service$/  do
  @image_service ||= Fog::Image.new(connection_parameters)
end

When /^the list of public images is retrieved from the image service$/ do
 @list_public_image_response = @image_service.list_public_images
end

Then /^the list of public images should not be empty$/ do
  @list_public_image_response.body['images'].empty?.should_not == true
end