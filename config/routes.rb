RailsRedisDashboard::Engine.routes.draw do
  root to: "dashboards#index", as: 'rrd_root'

  get 'values/:key', to: 'values#show', as: 'value'
  get 'values/:key/expire', to: 'values#expire', as: 'expire_value'
end
