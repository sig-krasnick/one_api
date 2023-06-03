Rails.application.routes.draw do
  resources :quotes, only: %i[index show],  defaults: { format: 'json' }
 
  resources :movies, only: %i[index show], defaults: { format: 'json' } do
    member do
      get :quote
    end
  end
end
