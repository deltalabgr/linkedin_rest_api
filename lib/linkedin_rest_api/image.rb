# frozen_string_literal: true

require 'httparty'

module LinkedinRestApi
    class Image
        include HTTParty
        base_uri 'https://api.linkedin.com'
    
        def initialize(access_token, user_info)
            @options = { 
                headers: {
                    "Authorization" => "Bearer #{access_token}",
                    "Content-Type" => "application/json",
                    "User-Agent" => "Httparty",
                    "X-RestLi-Method" => "ACTION",
                    "X-RestLi-Protocol-Version" => "2.0.0",
                    "LinkedIn-Version" => "202307"
                },
                query: { action: "initializeUpload" },
                body: {
                    "initializeUploadRequest" => {
                        "owner" => "urn:li:person:#{user_info['sub']}"
                    }
                }#,
                #debug_output: STDOUT
            }
        end
    
        def register
            self.class.post("/rest/images", {
                headers: @options[:headers],
                query: @options[:query],
                body: @options[:body].to_json
            })
        end
    end
end