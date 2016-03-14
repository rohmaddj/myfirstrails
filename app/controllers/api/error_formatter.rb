module API
  module ErrorFormatter
    def self.call message, backtrace, options, env
      begin
        if message.is_a? String
          {status: :error, message: message }.to_json
        else
          {status: :error , message: message[:error] || message[:message] }.to_json
        end
      rescue
        {status: :error, message: message }.to_json
      end

    end
  end
end