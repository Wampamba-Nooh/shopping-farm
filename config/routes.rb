ShoppingFarm::Application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :path => "auth", :controllers => { :sessions => "auth/sessions",
    :registrations => "auth/registrations", :confirmations => "auth/confirmations" }
  
  namespace :front do
    resources :dealer_profiles, only: [:index, :show]
    devise_scope :user do
      post :auth, to: "auth/registrations#create"
      post '/auth/sign_in', to: "auth/sessions#create"
    end
    resources :categories, only: [:show]
  end
  
  get "category/:id", to: "front/categories#show", as: :category

  namespace :admin do
    resources :manufacturers do 
      member do
        get :pictures
      end
    end
    resources :brands, only: [:show, :index, :create, :update, :destroy] do 
      member do
        get :pictures
      end
    end
    resources :products, only: [:show, :index, :create, :update, :destroy] do 
      member do
        get :pictures
      end
    end
    resources :dealer_profiles, only: [:show, :update, :index, :create, :destroy]
    resources :categories do 
      member do
        get :pictures
      end
    end
    resources :pages, only: [:index, :show, :create, :update, :destroy]
  end

  resources :uploads, :path => 'uploads/:resource_model'

  get :admin, to: 'admin/home#index'

  root 'front/home#index'

  get "pages/news"
  get "pages/distributors"
  get "pages/products"
  get "pages/products2"
  get "pages/show"
  get "pages/test"
  get "pages/about"
  get "pages/contacts"

  ##################################################
  get "pages/:name", to: "pages#page_by_name", as: :page_by_name
  post :mail_js_error, to: "errors#mail_js_error"
end
