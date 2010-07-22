module Skitzo
  class Middleware
    def initialize(app)  
      @app = app  
    end  
      
    def call(env)  
      status, headers, response = @app.call(env)
      if env['warden'].authenticated?(:admin) and status == 200
        users = User.all.map{|u| "<option value=#{u.id}>#{u}</option>"}.unshift("<option>Login As:</option>").join
        user_bar = <<-EOF
        <div style='background-color: #efefef'>
          <form action='/user_switcher' method='post'>
          <select name='user_id' onchange='this.form.submit()'>#{users}</select>
          <a href='/sign_out_admin'>Sign out</a>
          </form>
        </div>
        EOF
        response.body = insert_after_body(response.body, user_bar)
      end
      [status, headers, response]
    end  

    def insert_after_body(content, text)
      content.gsub(/<body(.*)>/, "<body#{$1}>#{text}")
    end
  end
end
