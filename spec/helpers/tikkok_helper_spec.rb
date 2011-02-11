require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the TikkokHelper. For example:
#
# describe TikkokHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe TikkokHelper do
  it "#mailencToUtf8 case encoding is empty" do
    helper.mailencToUtf8("\x67\x6F\x72\x69\x72\x61", "").should == "gorira"
  end

  it "#mailencToUtf8 case encoding is iso-2022-jp" do
    helper.mailencToUtf8("\x75\x73\x61\x67\x69", "ISO-2022-JP").should == "usagi"
  end

  it "#mailencToUtf8 case encoding is utf-8" do
    helper.mailencToUtf8("neco", "UTF-8").should == "neco"
  end
end
