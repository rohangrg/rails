Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root to: 'posts#index'

  resources :posts do
    collection do
      get :my_posts
    end
  end

  get "/uploads/:id/:basename.:extension", to: 'posts#download'

end
