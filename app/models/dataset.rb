class Dataset < ActiveRecord::Base

  # Database relations
  belongs_to :user
  has_many :visualizations
  
  # Validations
  validates_presence_of :name, :origin, :data_file, :user

  # File uploader
  mount_uploader :data_file, DataSetUploader
  
  def csv
    @csv ||= FasterCSV.read(self.data_file.file.file)
  end
  
  
end
