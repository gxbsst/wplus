# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "ApiTastingFlights" do
    describe "Admin" do
      describe "api_tasting_flights" do
        login_refinery_user

        describe "api_tasting_flights list" do
          before do
            FactoryGirl.create(:api_tasting_flight, :sku => "UniqueTitleOne")
            FactoryGirl.create(:api_tasting_flight, :sku => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.api_tasting_flights_admin_api_tasting_flights_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.api_tasting_flights_admin_api_tasting_flights_path

            click_link "Add New Api Tasting Flight"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Sku", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::ApiTastingFlights::ApiTastingFlight.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Sku can't be blank")
              Refinery::ApiTastingFlights::ApiTastingFlight.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:api_tasting_flight, :sku => "UniqueTitle") }

            it "should fail" do
              visit refinery.api_tasting_flights_admin_api_tasting_flights_path

              click_link "Add New Api Tasting Flight"

              fill_in "Sku", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::ApiTastingFlights::ApiTastingFlight.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:api_tasting_flight, :sku => "A sku") }

          it "should succeed" do
            visit refinery.api_tasting_flights_admin_api_tasting_flights_path

            within ".actions" do
              click_link "Edit this api tasting flight"
            end

            fill_in "Sku", :with => "A different sku"
            click_button "Save"

            page.should have_content("'A different sku' was successfully updated.")
            page.should have_no_content("A sku")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:api_tasting_flight, :sku => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.api_tasting_flights_admin_api_tasting_flights_path

            click_link "Remove this api tasting flight forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::ApiTastingFlights::ApiTastingFlight.count.should == 0
          end
        end

      end
    end
  end
end
