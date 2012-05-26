Todos::Application.routes.draw do
  root to: 'pages#show', id: 'homepage'
  resource :sessions, only: [:create, :destroy]
  resources :todos, only: [:index, :create] do
    resource :completions, only: [:create, :destroy]
  end
end
