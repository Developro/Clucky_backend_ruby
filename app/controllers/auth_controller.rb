class AuthController < ApplicationController
  def login
    if params
      login    = params[:login]
      password = params[:password]
      email    = params[:email]

    else
      # send 400
    end
  end

  def logout
  end

  def refresh
  end

  def register
  end
end
