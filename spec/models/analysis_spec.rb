require 'spec_helper'

describe Analysis do

  it 'should save if title and body given' do
    dataset = Analysis.create!(:title => 'Foo Bar', :body => 'Foo bar foo bar foo bar')
    dataset.reload
    dataset.title.should == 'Foo Bar'
    dataset.body.should == 'Foo bar foo bar foo bar'
  end

  it 'should not save if title nor body set' do
    Analysis.new(:body => 'Bar foo').save.should be_false
    Analysis.new(:title => 'Foo bar').save.should be_false
  end

end
