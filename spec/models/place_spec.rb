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
require 'rails_helper'

RSpec.describe Place, type: :model do
  let(:place) { build(:place, :place_with_schoolgrades) }
  let!(:places) { create_list(:place, 4, :place_with_schoolgrades) }

  it "has a valid factory" do
    expect(place).to be_valid
  end

  it { is_expected.to have_many(:schoolgrades).through(:targets) }
  it { is_expected.to have_many(:schoolgrades).dependent(:destroy) }
  it { is_expected.to have_many(:favorites).dependent(:destroy) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of :latitude }
  it { is_expected.to validate_presence_of :longitude }
  it { is_expected.to validate_presence_of :address }
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :description }
  it { is_expected.to validate_presence_of :schoolgrades }

  it "is able to handover to js" do
    places_to_js = Place.handover_to_js
    expect(places_to_js).to eq places.pluck(:id, :latitude, :longitude)
  end
end
