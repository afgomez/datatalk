class Analysis < ActiveRecord::Base

  # Database relations:
  belongs_to :parent, :class_name => 'Analysis', :foreign_key => 'analysis_id'
  belongs_to :user
  has_many :replies, :class_name => 'Analysis'

  # Validations
  validates_presence_of :title, :body, :user

  def reply?
    !parent.nil?
  end

end
