require 'spec_helper'

describe Dataset do

  before(:all) do
    @file = File.new('tmp/uploaded_files/foobar.txt','w')
    @file.write('deleteme')
    @file.close
  end

  it 'should save if user, name, origin and data_file set' do
    dataset = Dataset.create!(:name => 'Foo Bar', :origin => 'Bar Foo', :data_file => @file, :user => User.make)
    dataset.reload
    dataset.name.should == 'Foo Bar'
    dataset.origin.should == 'Bar Foo'
    File.basename(dataset.data_file.path).should == File.basename(@file.path)
  end

  it 'should not save if user, name, origin or data_file not set' do
    Dataset.new(:user => User.make, :name => 'Foo bar', :origin => 'Bar Foo').save.should be_false
    Dataset.new(:name => 'Foo bar', :origin => 'Bar Foo', :data_file => @file).save.should be_false
    Dataset.new(:user => User.make, :origin => 'Bar Foo', :data_file => @file).save.should be_false
    Dataset.new(:user => User.make, :name => 'Foo bar', :data_file => @file).save.should be_false
  end

end
