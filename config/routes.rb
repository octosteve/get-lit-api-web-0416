Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ingredients, except: [:new, :edit]
      resources :cocktails, except: [:new, :edit]
    end
  end
end
