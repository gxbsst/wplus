# encoding: utf-8
module Refinery
  module TableLists
    class TableList < Refinery::Core::BaseModel
      self.table_name = 'refinery_table_lists'

      attr_accessible :categoryid, :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true

      def table_lists
        {
          '长吧台' => 1,
          '短吧台' => 2,
          '圆桌' => 3,
          '餐桌' => 4,
          '卡座' => 5
        }
      end
    end
  end
end
