Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # création des actions crud from scratch sans resources
  get 'tasks', to: 'tasks#index' # listes les taches
  get 'tasks/new', to: 'tasks#new', as: 'new_task' # form création tâche
  post 'tasks', to: 'tasks#create' # cree la tache dans la db
  get 'tasks/:id', to: 'tasks#show', as: 'task' # details tâche
  get 'tasks/:id/edit', to: 'tasks#edit', as: 'edit_task' # form edit
  patch 'tasks/:id', to: 'tasks#update' # update tache
  delete 'tasks/:id', to: 'tasks#destroy' # supprime tache
  root to: 'tasks#index' # root direct vers l'index pour afficher l'appp
  # et éviter la page rails par défaut
end
