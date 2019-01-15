module Cms::V1::AdminAPI

    class Get < Grape::API

        resource '/admin/get' do

            get '/test_api' do 
                {"content": "hello world!!"}
            end

            get '/test_api_2' do 
                {"content": "test api"}
            end

            get '/test_api_3' do 
                {"content": "test api 3"}
            end

            get '/test_api_4' do 
                {"content": "test api 3"}
            end
        end
    end
end