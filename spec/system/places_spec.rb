require 'rails_helper'

RSpec.describe "Places", type: :system do
  scenario "user creates a new place" do
    user = create(:user)
    schoolgrade = create(:schoolgrade)
    schoolgrade
    sign_in user

    expect do
      click_link "place-new-link"
      fill_in "searchName", with: "TestName"
      fill_in "add", with: "TestAddres"
      fill_in "description", with: "TestDescription"
      check "1Grade"
      fill_in "lat", with: "35"
      fill_in "lng", with: "135"
      find('#hidden', visible: false).set(user.id)
      click_button "登録"

      expect(page).to have_content "場所の登録が完了しました。"
      expect(page).to have_content "TestName"
      expect(page).to have_content "#{user.name}"
    end.to change(user.places, :count).by(1)
  end

  scenario "user edits a place" do
    user = create(:user)
    schoolgrade = create(:schoolgrade)
    schoolgrade
    sign_in user
    create_new_place_as user

    expect do
      click_link "編集"
      fill_in "searchName", with: "EditName"
      find('#hidden', visible: false).set(user.id)
      click_button "登録"
      expect(page).to have_content "登録している場所の更新が完了しました。"
      expect(page).to have_content "EditName"
    end
  end

  scenario "user destroy a place" do
    user = create(:user)
    schoolgrade = create(:schoolgrade)
    schoolgrade
    sign_in user
    create_new_place_as user

    expect do
      click_link "削除"
      expect{
        expect(page.accept_confirm).to eq "本当によろしいですか？"
        }. to change(user.places, :count).by(-1)
    end
  end
end
