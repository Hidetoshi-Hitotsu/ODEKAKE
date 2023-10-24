# == Schema Information
#
# Table name: favorites
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  place_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_favorites_on_place_id  (place_id)
#  index_favorites_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (place_id => places.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :favorite do
    association :place
    user { place.user }

    trait :with_user_id do
      after(:build) do |favorite|
        favorite.user_id << user.id
      end
    end
  end
end
