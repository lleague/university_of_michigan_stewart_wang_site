Rails.application.routes.draw do

# Makes the homepage root
  root :to => 'public#index'
  get 'show/:permalink', :to => 'public#show', :as => 'public_show'

# When the user is within the access area, this makes all /publications links go to managing the publications rather than viewing the public page.
  scope :access do
      resources :publications
  end

# ICAM Routes
  match "/icam", :to => "public#icam", :via => :all
  match "/pedestrian_consortium", :to => "public#pedestrian_consortium", :via => :all
  match "/research", :to => "public#research", :via => :all
  match "/education", :to => "public#education", :via => :all
  match "/policy_making", :to => "public#policy_making", :via => :all
  match "/contact", :to => "public#contact", :via => :all
  match "/advisory_council", :to => "public#advisory_council", :via => :all


  match "/publications", :to => "public#publications", :via => :all
  match "/news", :to => "public#news", :via => :all
  match "/mag", :to => "public#mag", :via => :all
  match "/about_morphomics", :to => "public#about_morphomics", :via => :all
  match "/morphomics", :to => "public#morphomics", :via => :all
  match "/mshop", :to => "public#mshop", :via => :all
  match "/data_dictionary", :to => "public#data_dictionary", :via => :all
  match "/stus_story", :to => "public#stus_story", :via => :all
  match "/blank", :to => "public#blank", :via => :all

  match "/ramp", :to => "public#ramp", :via => :all
  match "/ramp/:id", :to => "public#show", :via => :all

  match "/login", :to => "access#menu", :via => :all

  get 'access/menu'
  get 'access/login'

  get 'admin', :to => 'access#menu'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all
  post 'access/attempt_login'
  get'access/logout'





  resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end

  resources :ramp_pages do
    member do
      get :delete
    end
  end

  resources :publications do
    member do
      get :delete
    end
  end
  resources :authors do
    member do
      get :delete
    end
  end

  resources :journals do
    member do
      get :delete
    end
  end

  resources :team_members do
    member do
      get :delete
    end
  end

  resources :next_case_reviews do
    member do
      get :delete
    end
  end

  resources :news_articles do
    member do
      get :delete
    end
  end
  match "/team", :to => "public#team", :via => :all
  match "/seeking_common_ground", :to => "public#seeking_common_ground", :via => :all
  match "/one_mans_mission_to_make_cars_safer", :to => "public#/one_mans_mission_to_make_cars_safer", :via => :all

  get 'main/index'
  get "/ramp" => "ramp_pages#index"

  # default route
  # may go away in future versions of Rails
  #get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
