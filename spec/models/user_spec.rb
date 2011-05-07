require 'spec_helper'

describe User do

  it 'should save if name, email, and surname1 present' do
    User.create!(:email => 'foo@bar.com', :password => 'foo_bar', :name => 'Foo', :surname_1 => 'Bar')
    user = User.last
    user.email.should == 'foo@bar.com'
    user.name.should == 'Foo'
    user.surname_1.should == 'Bar'
  end

  it 'should not save without email nor name nor surname1 nor password' do
    User.new().save().should be_false
    User.new(:email => 'foo@bar.com',:name => 'Foo',:surname_1 => 'Bar').save.should be_false
    User.new(:password => 'foo_bar',:name => 'Foo',:surname_1 => 'Bar').save.should be_false
    User.new(:email => 'foo@bar.com', :password => 'foo_bar', :surname_1 => 'Bar').save.should be_false
    User.new(:email => 'foo@bar.com',:name => 'Foo', :password => 'foo_bar').save.should be_false
  end

end
