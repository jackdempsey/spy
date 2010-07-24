Rails.application.routes.draw do |map|
  match 'user_switcher' => 'spy/users#user_switcher'

  match 'sign_in_admin' => 'spy/users#sign_in_admin'

  match 'sign_out_admin' => 'spy/users#sign_out_admin'
end
