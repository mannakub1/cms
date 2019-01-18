class AdminController < ApplicationController

    def home
        @header = "Home"
        @contents = "Welcome setting Page"
        render layout: "layout_admin"
    end

    def page
        @header = "Page"
        render layout: "layout_admin"
    end
end
