require File.dirname(__FILE__) + '/spec_helper'

describe "Constants" do
  it { Object.const_defined?(:SettingsHandler).should be_true }
  it { Object.const_defined?(:Settings).should be_true }
  it { Object.const_defined?(:SimpleSettings).should be_true }
end

describe SimpleSettings do
  it "should store a value to a key" do
    Settings[:hello] = "hello" 
    Settings.hello.should == "hello"
    Settings[:hello].should == "hello"
  end

  it "should store another value to a key" do
    Settings.yellow = "yellow"
    Settings.yellow.should == "yellow"
    Settings[:yellow].should == "yellow"
  end

  it "should store nested hash values" do
    Settings[:yellow] = {:hello => true, :mellow => false, :purple => "purple"}
    Settings[:yellow][:hello].should == true
    Settings[:yellow][:mellow].should == false
    Settings[:yellow][:purple].should == "purple"
    Settings.yellow.hello.should == true
    Settings.yellow.mellow.should == false
    Settings.yellow.purple.should == "purple"
  end
end
