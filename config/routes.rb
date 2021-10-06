Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'home#index'
  get '/write' => 'home#write'
  post '/create' => 'home#create'
  
  get '/modify/:post_id' => 'home#modify'
  post '/update/:post_id' => 'home#update'

  get '/delete/:post_id' => 'home#delete'


  post '/reply_create/:post_id' => 'home#reply_create'
  get '/reply_delete/:reply_id' => 'home#reply_delete'

  get '/reply_modify_form/:reply_id' => 'home#reply_modify_form'
  post '/reply_update/:reply_id' => 'home#reply_update'

  get '/privacy_update/:post_id' => 'home#privacy_update'
end
