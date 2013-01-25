require 'spec_helper'

module Refinery
  module ApiWaters
    describe ApiWater do
      describe "validations" do
        subject do
          FactoryGirl.create(:api_water)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
