Rails.application.routes.draw do
  get 'otameshi/index'
  get 'tournaments/:id' => 'tournaments#index'
  get 'tournaments/:id/new' => 'tournaments#new'
  post 'tournaments/:id/create' => 'tournaments#create'
  post 'tournaments/:id/start' => 'tournaments#start'
  post 'tournaments/:id/finalize' => 'tournaments#finalize'
  get 'tournaments/:id/match/:match_id' => 'tournaments#match'
  post 'tournaments/:id/match/:match_id/update' => 'tournaments#update'


  get 'test/index'
  get 'test/new'
  post 'test/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
