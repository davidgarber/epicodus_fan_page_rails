Rails.application.routes.draw do
  resources :students do
    resources :projects
  end
end
