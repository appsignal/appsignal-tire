require 'tire'

module Appsignal
  module Tire
    module Instrumentation
      def perform_with_appsignal_instrumentation
        ActiveSupport::Notifications.instrument(
          'query.tire', :params => self.params, :json => self.to_hash)  do
            perform_without_appsignal_instrumentation
          end
      end
    end
  end
end

::Tire::Search::Search.class_eval do
  include Appsignal::Tire::Instrumentation

  alias_method :perform_without_appsignal_instrumentation, :perform
  alias_method :perform, :perform_with_appsignal_instrumentation
end
