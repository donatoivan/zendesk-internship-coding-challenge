Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tickets, only: [:index, :show]

  get '/tickets/pages/:id', to: 'tickets#paginate', as: 'paginate'
  root 'tickets#paginate', {id: 1}
end
