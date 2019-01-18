module Admin::Private::AdminAction

    private
    
    def process_authenication
        return [false, 'Username or password wrong.'] unless current_member.password_digest.authen(password)  
        
        true
    end
end