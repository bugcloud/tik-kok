Factory.define :uma, :class => Tikkok do |t|
  t.title "uma"
  t.body "traffic is heavy"
  t.from "uma@test.com"
  t.encoding "utf-8"
  t.created_at Time.now
end

Factory.define :neco, :class => Tikkok do |t|
  t.title "neco"
  t.body "traffic is heavy"
  t.from "neco@test.com"
  t.encoding "utf-8"
  t.created_at Time.new(2011,02,04,9,00,00)
end

Factory.define :gori, :class => Tikkok do |t|
  t.title "gori"
  t.body "traffic is heavy"
  t.from "gori@test.com"
  t.encoding "ISO-2022-JP"
  t.created_at Time.new(2011,02,03,9,00,00)
end

Factory.define :gorira, :class => Tikkok do |t|
  t.title "gorira"
  t.body "\x67\x6F\x72\x69\x72\x61" #gorira
  t.from "gori@test.com"
  t.encoding ""
  t.created_at Time.new(2011,02,03,10,00,00)
end

Factory.define :usa, :class => Tikkok do |t|
  t.title "usa"
  t.body "\x75\x73\x61\x67\x69" #usagi
  t.from "usa@test.com"
  t.encoding "ISO-2022-JP"
  t.created_at Time.now
end
