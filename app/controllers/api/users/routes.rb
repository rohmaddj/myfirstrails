module API
  module Users
    class Routes < Grape::API
      # before do
      #   Rails.logger.info "[api] Requested: --start--"
      # end
      #
      # after do
      #   Rails.logger.info "[api] Response: --end--"
      # end

      mount API::Users::Resources::Users
    end
  end
end
