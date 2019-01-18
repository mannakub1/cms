module Admin::Private::AdminGuard

    private
    
    def can_authentication?
        return [false, 'Empty userame, Please enter username.'] unless username_have?
        return [false, 'Username can\'t exist, Please register before.'] unless username_exist?
        return [false, 'Empty password, Please enter password.'] unless password_have?
      
        [true, '']
    end

    def username_have?
        !username.nil?
    end

    def username_exist?
        current_member
    end

    def password_have?
       !password.nil?
    end
end