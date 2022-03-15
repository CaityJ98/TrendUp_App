class PagesController < ApplicationController
    #checks if user is logged in before they can access restricted page. 
    before_action :authenticate_user!, only: [:restricted]

    def home
    end 

    def restricted
    end 
end
