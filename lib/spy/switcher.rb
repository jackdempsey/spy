module Spy
  class Switcher
    def initialize(app)  
      @app = app  
    end  
      
    def call(env)  
      status, headers, response = @app.call(env)
      return [status, headers, response] unless response.respond_to?(:body)

      if env['warden'].authenticated?(Spy.admin_scope) and status == 200
        users = User.all.map do |u|
          selected = env['warden'].user == u ? 'selected' : ''
          "<option value=#{u.id} #{selected}>#{u}</option>"
        end.unshift("<option>[choose]</option>").join

        if env['warden'].user
          logout_text = "| <a href='/users/sign_out'>logout user</a>"
        end

        user_bar = <<-EOF
        <div style='color: #039; font-size: 16px; background-color:#DDF; border:3px solid #CCE; font-size:16px; margin-bottom:10px; padding:5px; '>
          <form action='/user_switcher' method='post'>
            Admin: #{env['warden'].user(:admin)} |
            <a href='/sign_out_admin'>logout admin</a>
            ||
            User
            <select name='user_id' onchange='this.form.submit()'>#{users}</select>
            #{logout_text}
          </form>
          <div style='clear: both'></div>
        </div>
        EOF
      end
      [status, headers, response]
    end  

    def insert_after_body(content, text)
      content.gsub(/<body(.*)>/, "<body#{$1}>#{text}")
    end
  end
end
