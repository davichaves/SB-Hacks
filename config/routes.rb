Rails.application.routes.draw do

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  get 'play' => 'game#play'
  get 'play/beginner' => 'game#beginner'
  post 'play/beginner' => 'game#check_answer'
  get 'play/tutorial' => 'game#tutorial'
  get 'play/leap' => 'game#leap'
  post 'play/leap' => 'game#check_answer_leap'
end