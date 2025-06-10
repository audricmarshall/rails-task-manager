Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # création des actions crud from scratch sans resources
  resources :tasks # initialise directement les 7 actions du CRUD sans devoir tout écrire
  # Magie de rails
  root to: 'tasks#index' # root direct vers l'index pour afficher l'appp
  # et éviter la page rails par défaut
end
