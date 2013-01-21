require 'spec_helper'

module Refinery
  module Wines
    describe Wine do
      describe "validations" do
        subject do
          FactoryGirl.create(:wine,
          :vintage => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:vintage) { should == "Refinery CMS" }
      end
    end
  end
end
