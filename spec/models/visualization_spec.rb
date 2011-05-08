require 'spec_helper'

describe Visualization do

  it 'should save if legend and body set' do
    visualization = Visualization.create!(:legend => 'Bar foo', :body => 'Foo bar')
    visualization.reload
    visualization.legend.should == 'Bar foo'
    visualization.body.should == 'Foo bar'
  end

  it 'should not save if legend nor body set' do
    Visualization.new(:body => 'Foo bar').save.should be_false
    Visualization.new(:legend => 'Bar foo').save.should be_false
  end

  it 'should create a new record in database if trying to update a
      visualization used for more than one analysis' do
    pending
  end

end
