class Admin::AdminAction
    include Admin::Private::AdminAction
    include Admin::Private::AdminGuard

    attr_reader :username, :password, :params, :current_member

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

    def current_member
        @current_member =  Member.find_by(username: @username) unless @current_member
        
        @current_member
    end
end