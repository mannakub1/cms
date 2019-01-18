class Admin::AdminAction
    include Admin::Private::AdminAction
    include Admin::Private::AdminGuard

    attr_reader :username, :password, :current_member

    def initialize(option = {})

    end

    def authenication(params)
        @username = params[:username]
        @password = params[:password]

        can_authenication, message = can_authenication?
        fail message unless can_authenication

        process_authenication
    end


    def current_member
        @current_member =  Member.find_by(username: @username) unless @current_member
        
        @current_member
    end
end