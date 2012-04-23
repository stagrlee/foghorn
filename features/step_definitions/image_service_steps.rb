When /^a list of images is requested$/ do
 @response = @connections[:image].list_public_images
end

Then /^the response should have a list of images$/ do
  @response.body['images'] != nil
end