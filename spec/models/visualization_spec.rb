require 'spec_helper'

describe Visualization do

  it 'should save if legend and body set' do
    dataset = Dataset.make
    visualization = Visualization.create!(:legend => 'Bar foo', :body => 'Foo bar', :dataset => dataset)
    visualization.reload
    visualization.legend.should == 'Bar foo'
    visualization.body.should_not be_nil
    visualization.dataset.should == dataset
  end

  it 'should not save if dataset nor legend set' do
    Visualization.new(:legend => 'Bar foo').save.should be_false
    Visualization.new(:dataset => Dataset.make).save.should be_false
  end

end
