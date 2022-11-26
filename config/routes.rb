Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update] do
    get :favorites, on: :collection
  end
  resources :posts do
    collection do
      post :confirm
    end
  end
  resources :posts, only: [:show] do
    resource :favorite, only: [:create, :destroy]
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
