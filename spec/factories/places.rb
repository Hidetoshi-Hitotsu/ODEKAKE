# == Schema Information
#
# Table name: places
#
#  id          :integer          not null, primary key
#  description :string
#  latitude    :float
#  longitude   :float
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :place do
    name { "MyString" }
    description { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
