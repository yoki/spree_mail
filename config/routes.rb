Spree::Core::Engine.routes.prepend do
  
  get "/email/:subscriber/:email", :to => "emails#show", :as => :read_email
  get "/subscribers" => redirect("/subscribers/new")
  
  get "/subscribe" => "subscribers#subscribe"
  
  resources :subscribers, :except => [:index,:edit,:update] do
    member do
      put :unsubscribe
      get :resubscribe
    end
  end
  
  namespace(:admin) do
    resources :subscribers do 
      get :unsubscribed, :on => :collection
      get :resubscribe,  :on => :member
      get :unsubscribe,  :on => :member
    end
    resources :emails do
      get :deliver, :on => :member, :path => 'send'
    end
  end

end