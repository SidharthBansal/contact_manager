module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Remember user in a persistent session.
  def remember(user)
    user.remember #=> Stores token into remember_digest
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the current logged-in user (if any).
  def current_user
    if (user_id = session[:user_id]) # If there is a session[:user_id] #=> true
      @current_user = @current_user || User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Forgets a persistent session.
  def forget(user)
    user.forget #=> Sets remember_digest to nil
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out a user.
  def log_out
    #forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
=begin
  ..........E

  Error:
  UsersLoginTest#test_login_with_valid_information_followed_by_logout:
  NoMethodError: undefined method `forget' for #<User:0x000000072d64f8>
      app/helpers/sessions_helper.rb:30:in `forget'
      app/helpers/sessions_helper.rb:42:in `log_out'
      app/controllers/sessions_controller.rb:18:in `destroy'
      test/integration/users_login_test.rb:44:in `block in <class:UsersLoginTest>'



=end
end
