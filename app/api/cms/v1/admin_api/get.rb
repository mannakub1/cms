module Cms::V1::AdminAPI

    class Get < Grape::API

        resource '/admin/get' do

            get '/test_api' do 
                {"content": "hello world!!"}
            end
        end
    end
end