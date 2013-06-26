ESurvey::Application.routes.draw do
  #ADMIN PANEL
  namespace :manage do
    controller :home do
      get :index
    end

    resources :surveys, :questions
    resources :users

    root :to => 'home#index'
  end

  controller :pages do
    get :welcome
    get :about
    get :instruction
  end

  match 'survey_list', :to => 'surveyor#index', :as => 'survey_list', :via => :get
  match 'thank_you', :to => 'surveyor#thank_you', :as => 'thank_you', :via => :get

  mount Surveyor::Engine => "/surveys", :as => "surveyor"

  root :to => 'pages#welcome'
end

