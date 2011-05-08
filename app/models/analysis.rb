class Analysis < ActiveRecord::Base

  # Database relations:
  belongs_to :parent, :class_name => 'Analysis', :foreign_key => 'analysis_id'
  belongs_to :user
  has_many :replies, :class_name => 'Analysis'
  has_many :visualizations

  has_friendly_id :title, :use_slug => true

  # Validations
  validates_presence_of :title, :body, :user
  validates_presence_of :visualizations, :unless => :reply?


  def reply?
    !parent.nil?
  end

end
