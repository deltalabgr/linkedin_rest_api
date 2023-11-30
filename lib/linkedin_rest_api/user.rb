# frozen_string_literal: true

require 'httparty'

module LinkedinRestApi
    class User
        include HTTParty
        base_uri 'https://api.linkedin.com'
    
        def initialize(access_token)
            @options = { 
                headers: {
                    "Authorization" => "Bearer #{access_token}",
                    "User-Agent" => "Httparty",
                    "X-RestLi-Method" => "GET",
                    "X-RestLi-Protocol-Version" => "2.0.0",
                    "LinkedIn-Version" => "202307"
                },
                query: { }
            }
        end
    
        def info 
            self.class.get("/v2/userinfo", @options)
        end
    end
end