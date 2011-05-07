require 'spec_helper'

describe Analysis do

  it 'should save if user, dataset, title and body given' do
    user = User.make
    dataset = Dataset.make
    analysis = Analysis.create!(:title => 'Foo Bar', :body => 'Foo bar foo bar foo bar', :user => user, :datasets => [dataset])
    analysis.reload
    analysis.title.should == 'Foo Bar'
    analysis.body.should == 'Foo bar foo bar foo bar'
    analysis.user.should == user
    analysis.datasets.should have(1).dataset
  end

  it 'should not save if user, dataset, title nor body set' do
    Analysis.new(:body => 'Bar foo', :datasets => [Dataset.make], :user => User.make).save.should be_false
    Analysis.new(:title => 'Foo bar', :datasets => [Dataset.make], :user => User.make).save.should be_false
    Analysis.new(:body => 'Bar foo', :title => 'Foo bar', :datasets => [Dataset.make]).save.should be_false
    Analysis.new(:body => 'Bar foo', :title => 'Foo bar', :user => User.make).save.should be_false
  end

end
