require 'fog'

module FogClient
  class << self
    attr_reader :connections

    def configure(credentials)
      @connections ||= Hash.new
      @connections[:compute]  = Fog::Compute.new(FOG_CREDENTIALS.merge(credentials[:compute]))
      @connections[:identity] = Fog::Identity.new(FOG_CREDENTIALS.merge(credentials[:identity]))
      @connections[:image]    = Fog::Image.new(FOG_CREDENTIALS.merge(credentials[:image]))
      @connections[:volume]   = Fog::Volume.new(FOG_CREDENTIALS.merge(credentials[:volume]))
    end

# @param [Object] username
# @param [Object] password
    def connect(username, password)
      options      ||= FOG_CREDENTIALS.merge({:openstack_username => username, :openstack_api_key => password})
      @connections ||= Hash.new
      @connections[:compute]  = Fog::Compute.new(options)
      @connections[:identity] = Fog::Identity.new(options)
      @connections[:image]    = Fog::Image.new(options)
      @connections[:volume]   = Fog::Volume.new(options)
      @connections
    end

    def [](service)
      @connections[service]
    end
  end
end
