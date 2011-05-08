require 'spec_helper'

describe Visualization do

  it 'should save if legend and body set' do
    dataset = Dataset.make
    visualization = Visualization.create!(:legend => 'Bar foo', :body => 'Foo bar', :dataset => dataset)
    visualization.reload
    visualization.legend.should == 'Bar foo'
    visualization.body.should == 'Foo bar'
    visualization.dataset.should == dataset
  end

  it 'should not save if legend nor body set' do
    Visualization.new(:body => 'Foo bar', :legend => 'Bar foo').save.should be_false
    Visualization.new(:legend => 'Bar foo', :dataset => Dataset.make).save.should be_false
    Visualization.new(:dataset => Dataset.make, :legend => 'Bar foo').save.should be_false
  end

end
