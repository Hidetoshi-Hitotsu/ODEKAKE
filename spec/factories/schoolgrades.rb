# == Schema Information
#
# Table name: schoolgrades
#
#  id         :bigint           not null, primary key
#  grade      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :schoolgrade do
    sequence(:grade) { |n| "#{n}Grade" }
  end
end
