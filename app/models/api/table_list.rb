module Api
  class TableList < ActiveRecord::Base
    include Support

    set_table_name 'api_tablelist'

    attr_accessible :categoryid, :name

    class << self
      def init
        delete_all
        data = {b: Array(1..9), l: Array(1..3), r: Array(1..9), d: Array(1..2), v: [1]}
        categoryid = {b:1, l:2, r:3, d:4, v:5}
        data.each do |key, value|
          value.each do |n|
            find_or_create_by_name_and_categoryid("#{key.to_s.upcase}#{n}", categoryid[key])
          end
        end
      end
    end

  end
end
