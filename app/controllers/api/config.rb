module API
  module Config

    extend ActiveSupport::Concern
    included do
      version "v1", using: :header, vendor: 'waveofweekend'
      default_format :json
      format :json
      error_formatter :json, API::ErrorFormatter
      formatter :json, API::SuccessFormatter

      helpers do
        def warden
          env['warden']
        end

        def logger
          Rails.logger
        end

        def authenticated_user
          headers['Authorization'] && @me = User.find_by(authentication_token: headers['Authorization'])
        end

        def me
          @me
        end
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        error_response(message: {error: e.message, code: 404}, status: 404)
      end

      rescue_from :all do |e|
        begin
          status = e.status
        rescue
          status = 404
        end
        if Rails.env.development? || Rails.env.test?
          error_response(message: {error: e.to_s, code: status}, status: status)
        else
          error_response(message: {error: e.message, code: status}, status: status)
        end
      end

    end

  end
end
