Ter::Application.routes.draw do
  #ADMIN PANEL
  namespace :manage do
    controller :home do
      get :index
    end

    resources :questions, :students
    resources :teachers do
      get :report, :on => :member
    end

    root :to => 'home#index'
  end

  controller :pages do
    get :welcome, :contact, :privacy, :sitemap, :about
    get :admission, :campus, :division, :giving, :information, :research
  end

  match 'survey_list', :to => 'surveyor#index', :as => 'survey_list', :via => :get
  match 'thank_you', :to => 'surveyor#thank_you', :as => 'thank_you', :via => :get

  root :to => 'pages#welcome'
end

