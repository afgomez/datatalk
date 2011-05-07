class Analysis < ActiveRecord::Base

  # Database relations:
  belongs_to :analysis
  belongs_to :user
  has_many :replies, :class_name => 'Analysis'
  has_and_belongs_to_many :datasets
  
  # Validations
  validates_presence_of :title, :body, :user, :datasets
  
end
