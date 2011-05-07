class Dataset < ActiveRecord::Base

  # Database relations
  belongs_to :user

  # Validations
  validates_presence_of :name, :origin, :data_file, :user

  # File uploader
  mount_uploader :data_file, DataSetUploader
  
end
