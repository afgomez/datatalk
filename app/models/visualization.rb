class Visualization < ActiveRecord::Base

  # Database relations
  belongs_to :dataset
  belongs_to :analysis
  
  # Validations
  validates_presence_of :legend, :body, :dataset

end
