require "grape-swagger"
module API
  class Init < Grape::API
    Rails.application.routes.default_url_options[:host] = ENV['DOMAIN']
    logger.formatter = GrapeLogging::Formatters::Default.new
    use GrapeLogging::Middleware::RequestLogger, { logger: logger }


    mount API::Users::Routes

    add_swagger_documentation(
        api_version:             "v1",
        hide_documentation_path: true,
        mount_path:              "/swagger_doc",
        hide_format:             true
    )
  end
end



