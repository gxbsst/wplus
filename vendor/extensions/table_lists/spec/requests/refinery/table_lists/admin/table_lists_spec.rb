# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "TableLists" do
    describe "Admin" do
      describe "table_lists" do
        login_refinery_user

        describe "table_lists list" do
          before do
            FactoryGirl.create(:table_list, :name => "UniqueTitleOne")
            FactoryGirl.create(:table_list, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.table_lists_admin_table_lists_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.table_lists_admin_table_lists_path

            click_link "Add New Table List"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::TableLists::TableList.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::TableLists::TableList.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:table_list, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.table_lists_admin_table_lists_path

              click_link "Add New Table List"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::TableLists::TableList.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:table_list, :name => "A name") }

          it "should succeed" do
            visit refinery.table_lists_admin_table_lists_path

            within ".actions" do
              click_link "Edit this table list"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:table_list, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.table_lists_admin_table_lists_path

            click_link "Remove this table list forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::TableLists::TableList.count.should == 0
          end
        end

      end
    end
  end
end
