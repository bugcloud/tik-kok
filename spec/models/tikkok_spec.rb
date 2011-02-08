# coding: utf-8
require 'spec_helper'

describe Tikkok do
  before(:each) do
    @uma = Factory.build(:uma)
    @neco = Factory.build(:neco)
    @gori = Factory.build(:gori)
    @uma.save!
    @neco.save!
    @gori.save
  end

  after(:each) do
    @uma.delete
    @neco.delete
    @gori.delete
    @uma = nil
    @neco = nil
    @gori = nil
  end

  it "モデルのメンバにアクセスできる" do
    @neco.title.should == "neco"
    @neco.body.should == "traffic is heavy"
    @neco.from.should == "neco@test.com"
    @neco.created_at.should == Time.new(2011,02,04,9,00,00)
  end

  it "scope findForDayが実行できる" do
    tikkoks = Tikkok.findForDay(Time.new(2011,02,04))
    tikkoks.size.should == 1
    tikkoks[0].title.should == "neco"
  end
end
