class AdminController < ApplicationController

    before_action :find_token, :only => [:page]
    
    attr_reader :token

    def home
        @header = "Home"
        @contents = "Welcome setting Page"
        render layout: "layout_admin"
    end

    def page
        @header = "Page"
        render layout: "layout_admin"
    end

    def login

    end
 
    private

    def find_token
        @token = ApiKey.last.access_token

        if !Admin::AdminAction.new.check_token(@token) 
            redirect_to admin_home_path
        end
    end
end
