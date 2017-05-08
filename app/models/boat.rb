class Boat < ApplicationRecord
  validates :name, uniqueness: true
  has_many :boat_jobs, :dependent => :destroy
  has_many :jobs, :through => :boat_jobs
end
