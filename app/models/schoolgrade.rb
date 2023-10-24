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
end
