require 'spec_helper'

describe Analysis do

  it 'should save if user, visualization, title and body given' do
    user = User.make
    visualization = Visualization.make
    analysis = Analysis.create!(:title => 'Foo Bar', :body => 'Foo bar foo bar foo bar', :user => user, :visualizations => [visualization])
    analysis.reload
    analysis.title.should == 'Foo Bar'
    analysis.body.should == 'Foo bar foo bar foo bar'
    analysis.user.should == user
    analysis.visualizations.first.should == visualization
  end

  it 'should not save if user, visualization, title nor body set' do
    Analysis.new(:title => 'Foo bar', :body => 'Bar foo', :user => User.make).save.should be_false
    Analysis.new(:body => 'Bar foo', :user => User.make, :visualizations => [Visualization.make]).save.should be_false
    Analysis.new(:title => 'Foo bar', :user => User.make, :visualizations =>[Visualization.make]).save.should be_false
    Analysis.new(:body => 'Bar foo', :title => 'Foo bar', :visualizations => [Visualization.make]).save.should be_false
  end

  it "should tell if it's a reply or not" do
    analysis = Analysis.make
    analysis.reply?.should be_false
    reply = Analysis.make
    analysis.replies << reply
    analysis.save
    analysis.reload
    reply.reload
    analysis.replies.first.should == reply
    analysis.reply?.should be_false
    reply.reply?.should be_true
  end

  it 'should save a reply without visualization' do
    reply = Analysis.new(:title => 'Foo bar', :body => 'Bar foo', :user => User.make)
    reply.parent = Analysis.make
    reply.save.should be_true
  end

end
