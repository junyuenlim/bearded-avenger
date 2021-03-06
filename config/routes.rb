ActiveadminTest::Application.routes.draw do

  resources :neighbourhoods
  resources :municipals do
    resources :neighbourhoods
  end
  resources :activities
  resources :projects do
    member do
      get "follow", to: "projects#follow"
      get "unfollow", to: "projects#unfollow"
    end
    resources :statuses
    resources :needs
  end
  resources :relationships, only: [:create, :destroy]
  resources :discussions do
    resources :inspirations
    resources :comments
  end
  resources :inspirations do
    member do
      get "like", to: "inspirations#upvote"
      get "unlike", to: "inspirations#downvote"
    end
  end
  resources :comments do
    member do
      get "like", to: "comments#upvote"
      get "unlike", to: "comments#downvote"
    end
  end
  
  authenticated :user do
    root :to => "pages#index"
  end
  root :to => 'pages#welcome'

  get 'about' => "pages#about"
  get 'stakeholders/corporations/1' => "pages#stakeholder"
  get 'category/:tag', to: 'projects#index', as: :tag

  ActiveAdmin.routes(self)
  
  #devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "registrations" }
  match 'users/:id' => 'users#show', as: :user

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
