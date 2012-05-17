Given /^the reference to the "([^"]*)" flavor is known$/ do |flavor_name|
  flavors = compute_service.flavors
  flavors.each do |f|
    if flavor_name == f.attributes[:name]
      @flavor_id = f.attributes[:id]
      break
    end
  end
  @flavor_id.nil?.should_not == true
end


Given /^the reference to the "(.*?)" image is known$/ do |image_name|
  images = compute_service.images
  images.each do |img|
    if img.attributes[:name] == image_name
      @image_id = img.attributes[:id]
      break
    end
  end
  @image_id.nil?.should_not == true
end

And /^the reference to the "([^"]*)" project is known$/ do |project_name|
  tenants = compute_service.tenants
  tenants.each do |t|
    if t.attributes[:name] == project_name
      @project_id = t.attributes[:id]
      break
    end
  end
  @project_id.nil?.should_not == true
end

When /^the compute service is invoked to start a new server$/ do
  @instance = compute_service.create_server(
      "FogHorn Server",
      @image_id,
      @flavor_id,
      {
          "tenant_id" => @tenant_id,
      })
end

Then /^a new server should be started$/ do
  @instance.nil?.should_not == true
  server_id = @instance.body['server']['id']
  eventually do
    server_details = compute_service.get_server_details(server_id)
    server_details.body['server']['status'].should == 'ACTIVE'
  end
  compute_service.delete_server(server_id)
end
