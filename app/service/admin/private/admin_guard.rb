module Admin::Private::AdminGuard

    private
    
    def can_authenication
        return [false, 'Empty userame, Please enter username.'] unless username_have?
        return [false, 'Username can\'t exist.'] unless username_exist?
        return [false, 'Empty password, Please enter password.'] unless password_have?
      
        [true, '']
    end

    def username_have?
        !username
    end

    def username_exist?
        !current_member
    end

    def password_have?
        !password
    end

    def current_member
        Member.find_by(username: username)
    end
end