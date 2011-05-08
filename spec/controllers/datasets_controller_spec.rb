require 'spec_helper'

describe DatasetsController do

  it 'should list all datasets' do
    4.times {Dataset.make}
    get :index
    response.should render_template('index')
    assigns[:datasets].should have(4).datasets
  end

  it 'should show a controller' do
    dataset = Dataset.make
    3.times {Dataset.make}
    get :show, :id => dataset.id
    response.should render_template('show')
    assigns[:dataset].should == dataset
  end

end
