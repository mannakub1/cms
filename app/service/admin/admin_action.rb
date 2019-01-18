class Admin::AdminAction

    attr_reader :username, :password_digest

    def initialize(option = {})

    end

    def authenication(params)
        @username = params[:username]
        @password_digest = params[:password_digest]

        can_authenication, message = can_authenication?
        fail message unless can_authenication

        process_authenication
    end

end