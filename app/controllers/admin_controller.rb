class AdminController < ApplicationController

    def home
        @contents = "Hello World !!"
        render layout: "layout_admin"
    end
end
