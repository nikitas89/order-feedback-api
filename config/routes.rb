Rails.application.routes.draw do
resources :orders, only: [:index, :show, :new], defaults: { :format => 'json' }
# resources :feedbacks, only: [:index, :new]

resources :orders do
  resources :feedbacks, only: [:index, :create]
end

end
