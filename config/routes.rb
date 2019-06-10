Rails.application.routes.draw do
  post 'api/admin/login', controller: 'admin', action: 'login'
  post 'api/admin/register', controller: 'admin', action: 'register'
  post 'api/admin/is_logged_in', controller: 'admin', action: 'is_logged_in'
end
