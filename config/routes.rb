Rails.application.routes.draw do
  get 'guests/first_name:'
  get 'guests/last_name:'
  get 'guests/email_address:'
  get 'guests/phone_number:'
  get 'guests/invite_status:boolean'
  get 'guests/rsvp_status:boolean'
  devise_for :users
  root to: "pages#home"
  # events # index show on dash
  # tasks # dont need a whole new page - do from event

  resources :events, only: %i[new create show] do
    resources :tasks, only: %i[create index]
    resources :expenses, only: %i[new create index]
    resources :guests, only: %i[new create update index]
  end

  resources :tasks, only: [:update]
end
