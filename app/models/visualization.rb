class Visualization < ActiveRecord::Base

  # Validations
  validates_presence_of :legend, :body
  
end
