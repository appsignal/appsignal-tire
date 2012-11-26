require 'spec_helper'

describe Appsignal::Tire::Instrumentation do
  let(:event) { @events.pop }
  subject { event.payload }
  before(:all) do
    @events     = []
    ActiveSupport::Notifications.subscribe('query.tire') do |*args|
      @events << ActiveSupport::Notifications::Event.new(*args)
    end
  end
  before do
    Tire::Search::Search.any_instance.
      stub(:perform_without_appsignal_instrumentation => nil)
    Tire::Search::Search.new.perform
  end

  it { should == {:params => '', :json => {}} }
end
