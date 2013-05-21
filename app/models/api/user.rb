module Api
  class User < ActiveRecord::Base
    include Support

    set_table_name 'api_user'

    attr_accessible :name, :password

    class << self
      def init
        Refinery::Members::Member.all.each do |member|
          find_or_create_by_name(member.name, :password => member.password)
        end
      end
    end

  end
end