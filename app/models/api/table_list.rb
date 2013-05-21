module Api
  class TableList < ActiveRecord::Base
    include Support

    set_table_name 'api_tablelist'

    attr_accessible :categoryid, :name

    class << self
      def init
        Refinery::TableLists::TableList.all.each do |table|
          find_or_create_by_name_and_categoryid(table.name, table.categoryid)
        end
      end
    end

  end
end