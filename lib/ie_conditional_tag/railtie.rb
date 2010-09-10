module IEConditionalTag
  
  if defined?(Rails::Railtie)
    require 'rails'
    class Railtie < Rails::Railtie
      initializer 'ie_conditional_tag.insert_into_active_record' do
        IEConditionalTag::Railtie.insert
      end
    end
  end

  class Railtie
    def self.insert
      ActionController::Base.helper(IEConditionalTag::Helper)
    end
  end
end
