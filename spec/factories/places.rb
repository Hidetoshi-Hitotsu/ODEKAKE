# == Schema Information
#
# Table name: places
#
#  id             :bigint           not null, primary key
#  address        :string
#  description    :string
#  image          :string
#  latitude       :float
#  longitude      :float
#  name           :string
#  toilet         :string
#  vendingmachine :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
FactoryBot.define do
  factory :place do
    association :user
    sequence(:name) { |n| "Myplace#{n}" }
    sequence(:address) { |n| "MyAddress#{n}" }
    sequence(:description) { |n| "MyString#{n}" }
    latitude { 1.5 }
    longitude { 1.5 }
    toilet { "あり" }
    vendingmachine { "あり" }

    trait :place_with_schoolgrades do
      after(:build) do |place|
        place.schoolgrades << build(:schoolgrade)
      end
    end
  end
end
