# coding: utf-8
require 'spec_helper'

describe Tikkok do
  before(:each) do
    @uma = Factory.build(:uma)
    @neco = Factory.build(:neco)
    @gori = Factory.build(:gori)
    @gorira = Factory.build(:gorira)
    @uma.save!
    @neco.save!
    @gori.save!
    @gorira.save!
  end

  after(:each) do
    @uma.delete
    @neco.delete
    @gori.delete
    @gorira.delete
    @uma = nil
    @neco = nil
    @gori = nil
    @gorira = nil
  end

  it "モデルのメンバにアクセスできる" do
    @neco.title.should == "neco"
    @neco.body.should == "traffic is heavy"
    @neco.from.should == "neco@test.com"
    @neco.encoding.should == "utf-8"
    @neco.created_at.should == Time.new(2011,02,04,9,00,00)
  end

  it "scope findForDayが実行できる" do
    tikkoks = Tikkok.findForDay(Time.new(2011,02,04))
    tikkoks.size.should == 1
    tikkoks[0].title.should == "neco"
  end

  it "scope findForDayの並び順は新しい順" do
    tikkoks = Tikkok.findForDay(Time.new(2011,02,03))
    tikkoks.size.should == 2
    tikkoks[0].title.should == "gorira"
  end
end
