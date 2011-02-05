Factory.define :uma, :class => Tikkok do |t|
  t.title "uma"
  t.body "traffic is heavy"
  t.from "uma@test.com"
  t.created_at Time.now
end

Factory.define :neco, :class => Tikkok do |t|
  t.title "neco"
  t.body "traffic is heavy"
  t.from "neco@test.com"
  t.created_at Time.new(2011,02,04,9,00,00)
end

Factory.define :gori, :class => Tikkok do |t|
  t.title "gori"
  t.body "traffic is heavy"
  t.from "gori@test.com"
  t.created_at Time.new(2011,02,03,9,00,00)
end
