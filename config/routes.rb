Rails.application.routes.draw do
resources :orders, only: [:index, :show], defaults: { :format => 'json' }
end
