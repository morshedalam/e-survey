Ter::Application.routes.draw do
  controller :pages do
    get :welcome, :contact, :privacy, :sitemap, :about
    get :admission, :campus, :division, :giving, :information, :research
  end

  root :to => 'pages#welcome'
end
