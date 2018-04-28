# https://gist.github.com/blaze182/3a59a6af8c6a7aaff7bf5f8078a5f2b6

module Requests
  module AuthHelpers
    module Includables
      def login
        post '/auth/sign_in', params:  { email: @current_user.email, password: "Ilovefruits6"}.to_json, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
      end

      def get_auth_params_from_login_response_headers(response)
        client = response.headers['client']
        token = response.headers['access-token']
        expiry = response.headers['expiry']
        token_type = response.headers['token-type']
        uid =   response.headers['uid']

        auth_params = {
            'access-token' => token,
            'client' => client,
            'uid' => uid,
            'expiry' => expiry,
            'token_type' => token_type
        }
        auth_params
      end
    end
  end
end