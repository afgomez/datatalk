class Analysis < ActiveRecord::Base

  # Database relations:
  belongs_to :analysis
  belongs_to :user
  has_many :replies, :class_name => 'Analysis'

  # Validations
  validates_presence_of :title, :body
  
end
