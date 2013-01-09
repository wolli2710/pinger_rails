class Domain < ActiveRecord::Base

  has_many :subscribers
  belongs_to :user


  attr_accessible :name

  validates_uniqueness_of :name
end
