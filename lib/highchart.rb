class Highchart
  
  attr_accessor :transpose
  
  DEFAULTS = {
    :title => nil,
    :renderTo => nil,
    :defaultSeriesType => 'column'
  }
  
  def initialize(opts, data)
    @opts = Highchart::DEFAULTS.merge(opts)
    @data = data
  end
  
  # xAxis categories
  def categories
    categories = (@transpose ? @data.transpose : @data).clone.first
    categories.shift
    categories.map { |c| "'#{c}'" }.join(', ')
  end
  
  
  # Data. Just remove first row
  def data
    data = (@transpose ? @data.transpose : @data).clone
    data.shift
    data
  end
  
  def render
    
    js = <<-JS
    <script type="text/javascript">
    new Highcharts.Chart({
      credits: {
        enabled: false
      },
      chart: {
        renderTo: '#{@opts[:renderTo]}',
        defaultSeriesType: '#{@opts[:defaultSeriesType]}'
      },
      title: {
        text: '#{@opts[:title]}'
      },
      xAxis: {
        categories: [#{categories}]
      },
      yAxis: {
        title: {
          text: null
        }
      },
      series:[
    JS
    
    js += (data.map { |row| r = row.clone; "{ name: '#{r.shift}', data: [#{r.join(',')}] }" }.join(','))

    js += <<-JS
      ]
    });
    </script>
    JS
    
    js
    
  end
end