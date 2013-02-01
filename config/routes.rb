Ter::Application.routes.draw do

  controller :pages do
    get :welcome, :contact, :privacy, :sitemap, :about
    get :admission, :campus, :division, :giving, :information, :research
  end

  match 'thank_you', :to => 'surveyor#thank_you', :as => 'thank_you', :via => :get

  #ADMIN PANEL
  namespace :manage do
    controller :home do
      get :index
    end

    resources :questions, :students, :teachers

    root :to => 'home#index'
  end

  root :to => 'pages#welcome'

end
