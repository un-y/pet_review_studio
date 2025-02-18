Rails.application.routes.draw do
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    devise_for :admins, skip: [:registrations]
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    get '/admin/sign_up', to: 'admin/sessions#new'

    resources :users, only: [:index, :show, :edit, :update]
    resources :pet_genres, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    resources :item_posts, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    resources :item_genres, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    resources :facility_posts, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    resources :facility_genres, only: [:new, :index, :show, :create, :edit, :update, :destroy]

    resources :users do
      member do
        patch :deactivate
        patch :activate
      end
    end

    resources :item_posts do
      resources :item_reviews, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    end
    resources :facility_posts do
      resources :facility_reviews, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    end
  end

  scope module: :public do
    devise_for :users
    get 'users/mypage'
    root to: "homes#top"

    resources :users, only: [:mypage, :index, :show, :edit, :update]
    resources :item_posts, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    resources :facility_posts, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    
    resources :users do
      member do
        patch :deactivate
      end
    end

    resources :item_posts do
      resources :item_reviews, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    end
    resources :facility_posts do
      resources :facility_reviews, only: [:new, :index, :show, :create, :edit, :update, :destroy]
    end
  end
end
