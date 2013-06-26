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

  mount Surveyor::Engine => "/surveys", :as => "surveyor"
  match 'survey_results', :to => 'surveyor#index', :as => 'survey_results', :via => :get

  root :to => 'pages#welcome'
end

