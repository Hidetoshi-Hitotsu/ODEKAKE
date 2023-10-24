# == Schema Information
#
# Table name: schoolgrades
#
#  id         :bigint           not null, primary key
#  grade      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Schoolgrade, type: :model do
  it { is_expected.to have_many(:places).through(:targets) }
end
