Rails.application.routes.draw do
  post 'api/admin/login', controller: 'admin', action: 'login'
  post 'api/admin/register', controller: 'admin', action: 'register'
  post 'api/admin/is_logged_in', controller: 'admin', action: 'is_logged_in'
  post 'api/items/generate_digest', controller: 'items', action: 'generate_digest'
  post 'api/items/create', controller: 'items', action: 'create'
  get 'api/items/get', controller: 'items', action: 'get'
  post 'api/items/get_specific_items', controller: 'items', action: 'specific'
end
