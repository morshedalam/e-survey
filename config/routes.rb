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
    get :survey_results
    get :db_populate
  end

  mount Surveyor::Engine => "/surveys", :as => "surveyor"

  root :to => 'pages#welcome'
end

