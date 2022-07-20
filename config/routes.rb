Rails.application.routes.draw do

  namespace :api, as: '', defaults: { format: 'json' } do
    namespace :v1, as: '' do
      resources :users
    end
  end

  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    token_validations:  'overrides/token_validations',
    sessions: 'overrides/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
