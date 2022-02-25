module RailsRedisDashboard
  class ValuesController < RailsRedisDashboard::ApplicationController

    def show
      @key = params[:key]
      @type = RailsRedisDashboard::config.redis_current.type(@key)
      @value = case @type
               when 'string'
                 RailsRedisDashboard::config.redis_current.get(@key)
               else
                 nil
               end
      # TODO: serializer other than marshal
      begin
        @parsed_value = Marshal.load(@value)
      rescue
        @parsed_value = nil
      end
      @ttl = RailsRedisDashboard::config.redis_current.ttl(@key)
    end

    def expire
      key = params[:key]
      RailsRedisDashboard::config.redis_current.expire(key, 0)
      redirect_to value_path(key)
    end
  end
end
