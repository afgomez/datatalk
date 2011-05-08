class Visualization < ActiveRecord::Base

  # Database relations
  belongs_to :dataset
  belongs_to :analysis
  
  # Validations
  validates_presence_of :legend, :dataset
  
  # Delegations
  delegate :csv, :to => :dataset, :allow_nil => true
  
  before_create :update_chart
  
  # Chart code
  # FIXME: Esto no deberia de ir cacheado en el modelo. Lo suyo usar fragment caching de rails y un helper en las
  # vistas para generar el HTML/Javascript necesario
  def chart(reload_cache = false)
    return body.html_safe if body? && !reload_cache
    
    chart_code = nil
    
    
    
    opts = {
      :title    => legend,
      :renderTo => "chart-#{id}"
    }
    
    hc = Highchart.new(opts, csv)
    hc.transpose = transpose
    
    chart_code = "<div id=\"#{opts[:renderTo]}\" style=\"height:#{height}px;width:#{width}px;\"></div>"
    chart_code << hc.render

    if new_record?
      self.body = chart_code
    else
      update_attributes(:body => chart_code)
    end
    return body.html_safe
  end
  
  
  def update_chart
    !!chart(true)
  end
  
end
