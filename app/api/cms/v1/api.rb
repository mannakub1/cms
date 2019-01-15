module Cms::V1

    class API < Grape::API

        mount AdminAPI::Get
    end
end