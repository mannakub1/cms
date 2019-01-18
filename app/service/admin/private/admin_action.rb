module Admin::Private::AdminAction

    private
    
    def process_authentication
        return [false, 'Username or password wrong.'] unless current_member.authenticate(password)  
       
        process_create_token
    end

    def process_create_token
        key = ApiKey.create(member_id: current_member.id)
        { token: key.access_token }
    end

    def process_register
        Member.create(params)
    end
end