Todos::Application.routes.draw do
  root to: 'pages#show', id: 'homepage'
  resource :sessions, only: [:create, :destroy]
  resources :todos, only: [:index, :new, :create] do
    resource :completions, only: [:create]
  end
end
