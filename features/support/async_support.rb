module AsyncSupport
  def eventually
    timeout = 120
    polling_interval = 2
    time_limit = Time.now + timeout
    loop do
      begin
        yield
      rescue Exception => error
      end
      return if  error.nil?
      raise error if Time.now >= time_limit
      sleep polling_interval
    end
  end
end

World(AsyncSupport)
