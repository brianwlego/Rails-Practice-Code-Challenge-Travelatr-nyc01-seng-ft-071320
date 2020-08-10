Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bloggers, only: [:show, :new, :create, :destroy]
  resources :destinations, only: [:index, :show]
  resources :posts, except: [:index]
  put "/posts/:id/like", to: "posts#like", as: "post_like"
end
