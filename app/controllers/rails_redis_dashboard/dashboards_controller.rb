module RailsRedisDashboard
  class DashboardsController < RailsRedisDashboard::ApplicationController

    def index
      @filter_key = if params[:key].presence
                      if params[:key].include?('*')
                        params[:key]
                      else
                        "*#{params[:key]}*"
                      end
                    else
                      '*'
                    end
      @keys = RailsRedisDashboard::config.redis_current.keys(@filter_key).sort
    end
  end
end
