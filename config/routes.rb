Rails.application.routes.draw do
  get 'sass/home'
  devise_for :users
  root to: "pages#home"
  patch '/events/:event_id/mark_as_done/:id', to: 'tasks#mark_as_done', as: 'mark_as_done'
  patch '/events/:event_id/mark_as_paid/:id', to: 'expenses#mark_as_paid', as: 'mark_as_paid'
  resources :notes, only: %i[create]
  resources :events, only: %i[new create show update] do
    resources :messages, only: %i[create index ]
    resources :collaborations, only: %i[create]
    resources :tasks, only: %i[create index update destroy] do
      resources :assignments, only: %i[create]
    end
    resources :expenses, only: %i[create index update destroy]
    resources :guests, only: %i[create index update destroy]
  end
end
