# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Drinks" do
    describe "Admin" do
      describe "drinks" do
        login_refinery_user

        describe "drinks list" do
          before do
            FactoryGirl.create(:drink, :name_en => "UniqueTitleOne")
            FactoryGirl.create(:drink, :name_en => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.drinks_admin_drinks_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.drinks_admin_drinks_path

            click_link "Add New Drink"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name En", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Drinks::Drink.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name En can't be blank")
              Refinery::Drinks::Drink.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:drink, :name_en => "UniqueTitle") }

            it "should fail" do
              visit refinery.drinks_admin_drinks_path

              click_link "Add New Drink"

              fill_in "Name En", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Drinks::Drink.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:drink, :name_en => "A name_en") }

          it "should succeed" do
            visit refinery.drinks_admin_drinks_path

            within ".actions" do
              click_link "Edit this drink"
            end

            fill_in "Name En", :with => "A different name_en"
            click_button "Save"

            page.should have_content("'A different name_en' was successfully updated.")
            page.should have_no_content("A name_en")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:drink, :name_en => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.drinks_admin_drinks_path

            click_link "Remove this drink forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Drinks::Drink.count.should == 0
          end
        end

      end
    end
  end
end