FactoryGirl.define do
  factory :message do
    sequence(:sender_id, 3_000_000)       { |n| 'HPD-%9d' % n }
    sequence(:receiver_id, 3_000_000)     { |n| "item_code_#{n}" }
    sequence(:content)                    { |n| "model_#{n}" }
  end
end