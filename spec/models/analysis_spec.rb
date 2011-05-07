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

  it "should tell if it's a reply or nor" do
    analysis = Analysis.make
    analysis.reply?.should be_false
    reply = Analysis.make
    analysis.replies << reply
    analysis.save
    analysis.reload
    reply.reload
    analysis.replies.first.should == reply
    debugger
    analysis.reply?.should be_false
    reply.reply?.should be_true
  end

end
