class API::Users::Resources::Users < Grape::API

  include API::Config

  resource "user" do
    desc "Get user", {
        headers: {
            "Authorization" => {
                description: "User Token",
                required:    true
            }
        }
    }
    get "/" do
      error!("401 Unauthorized", 401) unless authenticated_user
      present me, with: API::Users::Entities::User
    end

  end
end
