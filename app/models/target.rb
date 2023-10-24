# == Schema Information
#
# Table name: targets
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  place_id       :bigint           not null
#  schoolgrade_id :bigint           not null
#
# Indexes
#
#  index_targets_on_place_id        (place_id)
#  index_targets_on_schoolgrade_id  (schoolgrade_id)
#
# Foreign Keys
#
#  fk_rails_...  (place_id => places.id)
#  fk_rails_...  (schoolgrade_id => schoolgrades.id)
#
class Target < ApplicationRecord
  belongs_to :place
  belongs_to :schoolgrade
end
