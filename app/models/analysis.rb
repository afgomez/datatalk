class Analysis < ActiveRecord::Base

  paginates_per 10
  
  # Database relations:
  belongs_to :parent, :class_name => 'Analysis', :foreign_key => 'analysis_id'
  belongs_to :user
  has_many :replies, :class_name => 'Analysis'
  has_many :visualizations
  has_many :datasets, :through => :visualizations
  has_friendly_id :title, :use_slug => true

  # Scopes
  named_scope :with_visualizations, :joins => "INNER JOIN visualizations ON (analyses.id = visualizations.analysis_id)"
  named_scope :without_visualizations, :contions => "id NOT IN (SELECT analysis_id FROM visualizations)"

  # Validations
  validates_presence_of :title, :body, :user
  validates_presence_of :visualizations, :unless => :reply?


  def reply?
    !parent.nil?
  end

  def visualization
    visualizations.first
  end

  def visualization= v
    visualizations.clear
    visualizations << v
  end

end
