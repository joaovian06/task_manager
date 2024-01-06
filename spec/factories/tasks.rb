FactoryBot.define do
  factory :task do
    name { "task_#{(0...1000).to_a.sample}" }
    description { Faker::Verb.base }
    status { [0, 1, 2, 3].sample }
  end
end
