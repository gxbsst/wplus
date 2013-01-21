require 'spec_helper'

module Refinery
  module Foods
    describe Food do
      describe "validations" do
        subject do
          FactoryGirl.create(:food,
          :name_en => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name_en) { should == "Refinery CMS" }
      end
    end
  end
end
