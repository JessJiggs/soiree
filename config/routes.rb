Rails.application.routes.draw do
  get 'sass/home'
  devise_for :users
  root to: "pages#home"
  # events # index show on dash
  # tasks # dont need a whole new page - do from event

  resources :events, only: %i[new create show update] do
    # define route to collaboration
    resources :collaborations, only: %i[create]
    resources :tasks, only: %i[create index]
    resources :expenses, only: %i[new create index]
    resources :guests, only: %i[new create update index]
  end
  resources :tasks, only: [:update]
end
