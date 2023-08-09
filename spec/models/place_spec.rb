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
require 'rails_helper'

RSpec.describe Place, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
