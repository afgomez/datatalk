class Dataset < ActiveRecord::Base

  # Database relations
  belongs_to :user
  has_many :visualizations
  has_many :analyses, :through => :visualizations
 
  # Validations
  validates_presence_of :name, :origin, :data_file, :user
  validates_each :data_file do |record, attr, value|
    begin
      FasterCSV.read(value.file.file)
    rescue => e
      record.errors.add attr, "Ha ocurrido un error al procesar el fichero CSV: #{e.message}."
    end
  end

  # File uploader
  mount_uploader :data_file, DataSetUploader

  def csv
    @csv ||= FasterCSV.read(self.data_file.file.file)
  end

end
