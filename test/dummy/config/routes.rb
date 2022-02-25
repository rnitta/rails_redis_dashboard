Rails.application.routes.draw do
  mount RailsRedisDashboard::Engine => "/rails_redis_dashboard"
end
