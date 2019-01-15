module Cms
    class API < Grape::API
        format :json
        prefix :api
        
        rescue_from :all do |e|
            error!(e.message, 422)
        end

        mount V1::API
    
    end
end