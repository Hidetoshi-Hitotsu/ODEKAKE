module LoginSupport
  def sign_in(user)
    visit root_path
    click_link "ログイン"
    fill_in "Eメール", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end
