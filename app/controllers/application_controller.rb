class ApplicationController < ActionController::Base
    before_action :set_api

    def set_api
        Challonge::API.username = 'shiva_duke28'
        Challonge::API.key = 'JhQCjmHjeJxMPr1dHCCoX1H6C0Sr56mRXUEoWgTc'
    end
end
