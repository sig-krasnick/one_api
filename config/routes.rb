Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :books, only: %i[index, show]
      resources :quotes, only: %i[index show]
 
      resources :movies, only: %i[index show] do
        member do
          get :quote
        end
      end
    end
  end
end
