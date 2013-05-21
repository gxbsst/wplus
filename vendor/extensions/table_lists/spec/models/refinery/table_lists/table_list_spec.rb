require 'spec_helper'

module Refinery
  module TableLists
    describe TableList do
      describe "validations" do
        subject do
          FactoryGirl.create(:table_list,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end
    end
  end
end
