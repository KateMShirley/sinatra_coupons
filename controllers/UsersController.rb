class UsersController < ApplicationController

  #in gemfile add...
  #gem 'bcrypt'

#enable :sessions

def does_user_exist?(username)

  user = UsersModel.find_by(:user_name => username.to_s)

  if user
    return true
  else
    return false
    end
end



  get '/register' do
    erb :user_register
  end

  post '/register' do
    @new_user = UsersModel.new
    puts params
    @new_user.user_name = params[:user_name]
    @new_user.user_email = params[:email]

    password_salt = BCrypt::Engine.generate_salt #somthing you know
    password_hash = BCrypt::Engine.hash_secret(params[:password], password_salt)

    @new_user.password_salt = password_salt
    @new_user.password_hash = password_hash
    @new_user.save


    erb :user_registration_success
  end

    get '/login' do
      erb :user_login
    end

    post '/login' do
      user_name = params[:user_name]
      if self.does_user_exist?(user_name) == true
        user = UsersModel.where(:user_name => user_name).first!

        if user.password_hash == BCrypt::Engine.hash_secret(params[:password], uswer.password_salt)
          session[:user] => user
            erb :user_login_success
        end

      end
    erb :users_login_error

    end

    get '/logout' do
      session[:user] = nil
      erb :users_logged_out
    end

end
