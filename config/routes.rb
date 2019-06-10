Rails.application.routes.draw do
  post 'api/admin/login', controller: 'admin', action: 'login'
  post 'api/admin/register', controller: 'admin', action: 'register'
  post 'api/admin/is_logged_in', controller: 'admin', action: 'is_logged_in'
  post 'api/items/generate_digest', controller: 'items', action: 'generate_digest'
  post 'api/items/create', controller: 'items', action: 'create'
end
