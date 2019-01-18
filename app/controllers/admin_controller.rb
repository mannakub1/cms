class AdminController < ApplicationController

    def home
        @contents = "Hello World !!"
        layout 'layout_admin'
    end
end
