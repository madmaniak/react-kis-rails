Rails.application.routes.draw do
  match 'api/*path' => 'serializations#router', via: :get
  match 'api/*path' => 'actions#router', via: :post

  match '/*path' => 'application#index', via: :get
  root 'application#index'
end
