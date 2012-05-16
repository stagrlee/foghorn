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

module KnowsIdentityService
  def identity_service
    Fog::Identity.new(connection_parameters)
  end
end

World(KnowsIdentityService)

module KnowsImageService
  def image_service
    Fog::Image.new(connection_parameters)
  end
end

World(KnowsImageService)


module KnowsComputeService
  def compute_service
    Fog::Compute.new(connection_parameters)
  end
end

World(KnowsComputeService)

module KnowsVolumeService
  def volume_service
    Fog::Volume.new(connection_parameters)
  end
end

World(KnowsVolumeService)
