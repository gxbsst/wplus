# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "ApiWines" do
    describe "Admin" do
      describe "api_wines" do
        login_refinery_user

        describe "api_wines list" do
          before do
            FactoryGirl.create(:api_wine, :type => "UniqueTitleOne")
            FactoryGirl.create(:api_wine, :type => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.api_wines_admin_api_wines_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.api_wines_admin_api_wines_path

            click_link "Add New Api Wine"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Type", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::ApiWines::ApiWine.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Type can't be blank")
              Refinery::ApiWines::ApiWine.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:api_wine, :type => "UniqueTitle") }

            it "should fail" do
              visit refinery.api_wines_admin_api_wines_path

              click_link "Add New Api Wine"

              fill_in "Type", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::ApiWines::ApiWine.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:api_wine, :type => "A type") }

          it "should succeed" do
            visit refinery.api_wines_admin_api_wines_path

            within ".actions" do
              click_link "Edit this api wine"
            end

            fill_in "Type", :with => "A different type"
            click_button "Save"

            page.should have_content("'A different type' was successfully updated.")
            page.should have_no_content("A type")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:api_wine, :type => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.api_wines_admin_api_wines_path

            click_link "Remove this api wine forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::ApiWines::ApiWine.count.should == 0
          end
        end

      end
    end
  end
end
