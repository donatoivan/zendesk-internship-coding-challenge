Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tickets, only: :show

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
  
  get '/tickets/pages/:id', to: 'tickets#paginate', as: 'paginate'
  root 'home#index'
end
