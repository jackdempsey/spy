Rails.application.routes.draw do |map|
  match 'user_switcher' => 'skitzo/users#user_switcher'

  match 'sign_in_admin' => 'skitzo/users#sign_in_admin'

  match 'sign_out_admin' => 'skitzo/users#sign_out_admin'
end
