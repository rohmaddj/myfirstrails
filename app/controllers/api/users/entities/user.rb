class API::Users::Entities::User < Grape::Entity
  expose :id
  expose :authentication_token
  expose :email
end