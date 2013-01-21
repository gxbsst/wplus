require 'spec_helper'

module Refinery
  module Drinks
    describe Drink do
      describe "validations" do
        subject do
          FactoryGirl.create(:drink,
          :name_en => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name_en) { should == "Refinery CMS" }
      end
    end
  end
end
