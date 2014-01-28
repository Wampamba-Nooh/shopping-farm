ShoppingFarm::Application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :path => "auth", :controllers => { :sessions => "auth/sessions",
    :registrations => "auth/registrations", :confirmations => "auth/confirmations" }
  
  namespace :front do
    devise_scope :user do
      post :auth, to: "auth/registrations#create"
      post '/auth/sign_in', to: "auth/sessions#create"
    end
  end

  namespace :admin do
    resources :brands, only: [:show, :index, :create, :update, :destroy]
    resources :products, only: [:show, :index, :create, :update, :destroy] do 
      member do
        get :pictures
      end
    end
    resources :categories
    resources :pages, only: [:index, :show, :update, :destroy]
  end

  resources :uploads, :path => 'uploads/:resource_model'

  get :admin, to: 'admin/home#index'

  root 'front/home#index'

  get "pages/news"
  get "pages/distributors"
  get "pages/products"

  ##################################################
  get "pages/:name", to: "pages#page_by_name", as: :page_by_name
  post :mail_js_error, to: "errors#mail_js_error"
end
