module CreateNewPlace
  def create_new_place_as(user)
    click_link "place-new-link"
    fill_in "searchName", with: "TestName"
    fill_in "add", with: "TestAddres"
    fill_in "description", with: "TestDescription"
    check "place[schoolgrade_ids][]"
    fill_in "lat", with: "35"
    fill_in "lng", with: "135"
    find('#hidden', visible: false).set(user.id)
    click_button "登録"
  end
end

RSpec.configure do |config|
  config.include CreateNewPlace
end
