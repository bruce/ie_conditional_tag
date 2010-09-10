module IEConditionalTag
  
  if defined?(Rails::Railtie)
    require 'rails'
    class Railtie < Rails::Railtie
      initializer 'ie_conditional_tag.insert_into_active_record' do
        ActiveSupport.on_load :action_pack do
          IEConditionalTag::Railtie.insert
        end
      end
    end
  end

  class Railtie
    def self.insert
      ActionController::Base.helper(IEConditionalTag::Helper)
    end
  end
end
