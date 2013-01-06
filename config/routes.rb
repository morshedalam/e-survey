Ter::Application.routes.draw do
  controller :pages do
    get :welcome, :contact, :privacy, :sitemap, :about
    get :admission, :campus, :division, :giving, :information, :research
  end

  #ADMIN PANEL
  namespace :manage, :as => 'admin' do
    controller :home do
      get :index
    end
    root :to => 'home#index'
  end

  root :to => 'pages#welcome'
end
