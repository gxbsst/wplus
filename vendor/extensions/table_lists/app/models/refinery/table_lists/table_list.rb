module Refinery
  module TableLists
    class TableList < Refinery::Core::BaseModel
      self.table_name = 'refinery_table_lists'

      attr_accessible :categoryid, :name, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
