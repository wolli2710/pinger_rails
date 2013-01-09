class Subscriber < ActiveRecord::Base

  belongs_to :domain, :dependent => :destroy
  belongs_to :user
end
