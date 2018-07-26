class AuthController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # POST /api/auth/register
  # SUCCESS
  # {
  #     "status": 201,
  #     "message": "New user was successfully registered",
  #     "result": [
  #         {
  #             "id": 38,
  #             "login": "admi2",
  #             "email": "admi2@site.inf",
  #             "status": "New"
  #         }
  #     ],
  #     "error": null
  # }
  #
  # ERROR
  # {
  #     "status": 400,
  #     "message": null,
  #     "result": null,
  #     "error": {
  #         "code": -1,
  #         "message": "User with this credentials already exist"
  #     }
  # }
  def register
    begin
      login    = params[:login]
      password = params[:password]
      email    = params[:email]
      @user = User.create(login: login, password_hash: password, email: email)
    rescue => error
      puts error.message
    ensure
      p 'ensure'
    end

    # валидация
    # существует ли юзер
    # любая другая ошибка
    if params
      # puts params[:auth]

      # @user = User.create(login: login, password_hash: password, email: email)
      # @status = 201
      # @message = "New user was successfully registered"
      # @result = User.find()
      # @error
      # render json: app_response, status: @status
    else
      # send 400
    end
  end

  # POST /api/auth/login
  def login
  end

  # POST /api/auth/logout
  def logout
  end

  # POST /api/auth/refresh
  def refresh
  end

  private

  def app_response
    {
      status: @status,
      message: @message,
      result: [
        {
          id: 38,
          login: "admi2",
          email: "admi2@site.inf",
          status: "New"
        }
      ],
      error: null
    }
  end

  def password_hash
    salt = '|6U}S=Hw3!U!VfV7QZ77>w3%?m_];5XmOcvaSH^j&d4Pz+m]%kI*c`BG?l&]v!9-'
    key = ':9Kcv^y5Xbgl3#YZ-eAdrs(<~fE|Y^6~fG*^nA}RAq]JQPoK~mS@9D:vQCcstl7,'
    OpenSSL::HMAC.hexdigest('sha256', key, salt + @password)
  end
end
