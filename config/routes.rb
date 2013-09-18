WinsPool::Application.routes.draw do
  resources :drafts

  resources :schedules

  resources :teams

  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  if @auth_user
    root :to => 'users#standings'
  else
    root :to => 'session#new'
  end


  match "/login" => "session#new", :via => :get
  match "/login" => "session#login", :via => :post
  match "/signup" => "users#new", :via => :get
  match "/logout" => "session#destroy", :via => "get"

  match "/test" => "teams#test", :via => "get"
  match "/testJS" => "teams#testJS", :via => :get

  match '/schedule/updateScore' => 'schedules#score', :via => :get


  match '/usermodal' => 'users#modal', :via => :get

  match '/standings' => 'users#standings', :via => :get

  match '/NFLStandings' => 'schedules#NFLStandings', :via => :get
  match '/NFLTeamSched' => 'schedules#NFLTeamSched', :via => :get


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
