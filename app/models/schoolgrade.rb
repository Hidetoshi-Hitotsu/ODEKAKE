# == Schema Information
#
# Table name: schoolgrades
#
#  id         :bigint           not null, primary key
#  grade      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Schoolgrade < ApplicationRecord
  has_many :targets
  has_many :places, through: :targets

  def self.ransackable_associations(auth_object = nil)
    ["places", "targets"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["grade"]
  end
end
