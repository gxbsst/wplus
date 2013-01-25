require 'spec_helper'

module Refinery
  module ApiTastingFlights
    describe ApiTastingFlight do
      describe "validations" do
        subject do
          FactoryGirl.create(:api_tasting_flight,
          :sku => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:sku) { should == "Refinery CMS" }
      end
    end
  end
end
