module API
  module SuccessFormatter
    def self.call object, env
      if object.instance_of?(Hash) && object[:custom].present? && object[:custom].eql?(true)
        return object[:format].to_json
      else
        return { :status => 'success', :data => object }.to_json
      end
    end
  end
end