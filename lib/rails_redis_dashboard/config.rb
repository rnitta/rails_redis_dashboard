module RailsRedisDashboard
  class << self
    def configure
      yield config
    end

    def config
      @_config ||= Config.new
    end
  end

  class Config
    attr_reader :redis_current

    def initialize
    end

    def redis_current=(instance)
      class_name = instance.class.name
      if class_name == 'Redis'
        @redis_current = instance
      elsif class_name == 'ConnectionPool'
        instance.with do |conn|
          @redis_current = conn
        end
      else
        fail 'set RailsRedisDashboard::Config.redis_current'
      end
    end

    # If param_name was given as a callable object, call it when returning
    def param_name
      @param_name.respond_to?(:call) ? @param_name.call : @param_name
    end
  end
end
