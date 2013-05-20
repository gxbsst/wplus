module Refinery
  module Members
    class Member < Refinery::Core::BaseModel
      self.table_name = 'refinery_members'

      attr_accessible :name, :password, :position

      acts_as_indexed :fields => [:name, :password]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
