require 'spec_helper'

module Refinery
  module ApiFoods
    describe ApiFood do
      describe "validations" do
        subject do
          FactoryGirl.create(:api_food)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
      end
    end
  end
end
