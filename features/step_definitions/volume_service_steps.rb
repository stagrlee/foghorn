Given /^a (\d+)GB volume named "([^"]*)" is created$/ do |size, name|
  response = volume_service.create_volume(name, "FogHorn test volume", size)
  response.nil?.should_not == true
  response.status.should == 200
  @volume_id = response.body['volume']['id']
  @volume_id.nil?.should_not == true
end

Then /^the volume should become available$/ do
  eventually do
    volume = volume_service.volumes.find_by_id(@volume_id)
    status = volume.attributes[:status]
    status.should == 'available'
  end
end

When /^the list of volumes should contain the new volume$/ do
  volumes = volume_service.volumes
  list_id = nil
  volumes.each do |v|
    list_id = v.attributes[:id]
    if list_id == @volume_id
      break
    end
  end
  list_id.should == @volume_id
end

When /^the details for the volume are retrieved$/ do
  @volume = volume_service.volumes.find_by_id(@volume_id)
  @volume.nil?.should_not == true
end

Then /^the size of the retrieved volume should be a (\d+)GB$/ do |size|
  @volume.attributes[:size].should == size.to_i
end

After('@volume') do
  if !@volume_id.nil?
    volume_service.delete_volume(@volume_id)
  end
end
