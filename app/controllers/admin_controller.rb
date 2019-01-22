class AdminController < ApplicationController

    before_action :find_token, :only => [:home, :page]
    skip_before_action :verify_authenticity_token

    attr_reader :token, :header

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

    def authen
        respon = admin_authentication(params)
        @token = respon[:token]

        redirect_checker
    end
 
    private

    def redirect_checker
        redirect_to admin_home_path if @header == "Home" || @header == nil
        redirect_to admin_page_path if @header == "Page"
    end

    def admin_authentication(params)
        Admin::AdminAction.new.authentication(params)
    end

    def find_token
        if @token == nil 
            @token = ApiKey.last.access_token
        end

        if !Admin::AdminAction.new.check_token(@token) 
            redirect_to admin_login_path
        end
    end
end
