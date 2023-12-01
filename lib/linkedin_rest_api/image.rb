# frozen_string_literal: true

require 'httparty'

module LinkedinRestApi
    class Image
        include HTTParty
        base_uri 'https://api.linkedin.com'
    
        def initialize(access_token, user_info, original_image_url, comment, media_title)
            @access_token = access_token
            @user_info = user_info
            @original_image_url = original_image_url
            @comment = comment
            @media_title = media_title

            @registration_response
            @upload_response

            @headers = {
                "Authorization" => "Bearer #{@access_token}",
                "User-Agent" => "Httparty",
                "X-RestLi-Protocol-Version" => "2.0.0",
                "LinkedIn-Version" => "202307"
            }#,
            #debug_output: STDOUT
        end
    
        def register
            headers = {
                "Content-Type" => "application/json",
                "X-RestLi-Method" => "ACTION"
            }.merge(@headers)
            query = { action: "initializeUpload" }
            body = {
                "initializeUploadRequest" => {
                    "owner" => "urn:li:person:#{@user_info['sub']}"
                }
            }
            @registration_response = self.class.post("/rest/images", {
                headers: headers,
                query: query,
                body: body.to_json
            })
        end

        def upload
            base_uri = ''
            image_base64 = self.get_file_from_internet(@original_image_url)            
         
            @upload_response = self.class.put(@registration_response["value"]["uploadUrl"], {
                headers: { 
                    "Authorization" => "Bearer #{@access_token}",
                    "User-Agent" => "Httparty",
                    "Content-Type" => "binary"
                },
                # debug_output: STDOUT,
                body: image_base64
            })

            return @upload_response
        end

        def create_post
            headers = {
                "Content-Type" => "application/json",
                "X-RestLi-Method" => "CREATE"
            }.merge(@headers)
            body = {
                "author": "urn:li:person:#{@user_info['sub']}",
                "commentary": "#{@comment}",
                "visibility": "PUBLIC",
                "distribution": {
                    "feedDistribution": "MAIN_FEED",
                    "targetEntities": [],
                    "thirdPartyDistributionChannels": []
                },
                "content": {
                    "media": {
                        "title": "#{@media_title}",
                        "id": "#{@registration_response["value"]["image"]}"
                    }
                },
                "lifecycleState": "PUBLISHED",
                "isReshareDisabledByAuthor": false
            }
            @create_post_response = self.class.post("/rest/posts", {
                headers: headers,
                body: body.to_json
            })
        end


        private

        ##
        # Get raw file data given a URL
        def get_file_from_internet(url)
            response = self.class.get(
                url,
                { headers: {"User-Agent" => "Httparty"} }
            )
            # p response.code
            # p response.body
            return response.body
        end
    end
end