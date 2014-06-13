def login_user
  visit '/'
  within ('header') { click_on 'Register' }
  fill_in 'user[email]', :with => 'keri@gmail.com'
  fill_in 'user[password]', :with => 'password'
  click_on 'register'
  expect(page).to have_content('Welcome keri@gmail.com')
end