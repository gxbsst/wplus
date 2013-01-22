require 'spec_helper'

module Refinery
  module ApiWines
    describe ApiWine do
      describe "validations" do
        subject do
          FactoryGirl.create(:api_wine,
          :type => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:type) { should == "Refinery CMS" }
      end
    end
  end
end
