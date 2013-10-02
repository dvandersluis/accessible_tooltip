require 'accessible_tooltip/version'
require 'accessible_tooltip/helpers'

module AccessibleTooltip
  class Engine < Rails::Engine
    initializer 'accessible_tooltip.hook_into_action_view' do
      ActiveSupport.on_load :action_view do
        include AccessibleTooltip::Helpers
      end
    end
  end
end
