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
require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:user) { create(:user) }
  let(:place) { create(:place, :place_with_schoolgrades) }
  let!(:favorite) { create(:favorite, place_id: place.id, user_id: user.id) }

  it { is_expected.to belong_to :place }
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_uniqueness_of(:place_id).scoped_to(:user_id) }
end
