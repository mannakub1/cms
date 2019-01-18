class Admin::AdminAction
    include Admin::Private::AdminAction
    include Admin::Private::AdminGuard

    attr_reader :username, :password, :params, :current_member, :token

    def initialize(option = {})

    end

    def authentication(params)
        @username = params[:username]
        @password = params[:password]

        can_authentication, message = can_authentication?
        fail message unless can_authentication

        process_authentication
    end

    def register(params)
        @params = params
        @username = params[:username]
        @password = params[:password]

        can_register, message = can_register?
        fail message unless can_register

        process_register
    end

    def check_token(params_token)
        @token = ApiKey.find_by(access_token: params_token)
        
        if @token && !@token.expired?
          set_time_expiration
        else
          false
        end
    end

    def logout(params_token)
        @token = ApiKey.find_by(access_token: params_token)
    
        if @token
          set_expiration_out
          true
        else
          false
        end
    
    end
    
    def set_expiration_out
        @token.update_attributes(expires_at: DateTime.now.utc)
    end
    
    def set_time_expiration
        @token.update_attributes(expires_at: DateTime.now.utc + 30.minutes)
    end

    def current_member
        @current_member =  Member.find_by(username: @username) unless @current_member
        
        @current_member
    end
end