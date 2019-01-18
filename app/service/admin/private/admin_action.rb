module Admin::Private::AdminAction

    private
    
    def process_authentication
        return [false, 'Username or password wrong.'] unless current_member.authenticate(password)  
        
        true
    end
end