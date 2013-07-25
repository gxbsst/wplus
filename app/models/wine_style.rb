class WineStyle < ActiveRecord::Base

  attr_accessible :name_en, :name_zh
  has_many :wines

  def name
  	"#{name_en}"
  end
end
