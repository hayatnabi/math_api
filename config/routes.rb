Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'add', to: 'math#add'
      get 'subtract', to: 'math#subtract'
      get 'multiply', to: 'math#multiply'
      get 'divide', to: 'math#divide'
      get 'sqrt', to: 'math#sqrt'
      get 'power',   to: 'math#power'
      get 'mod',     to: 'math#mod'
      get 'log10',   to: 'math#log10'
      get 'ln',      to: 'math#ln'
      get 'sin',     to: 'math#sin'
      get 'cos',     to: 'math#cos'
      get 'tan',     to: 'math#tan'
      get 'help', to: 'math#help'
    end
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: redirect('/api-docs')
end
