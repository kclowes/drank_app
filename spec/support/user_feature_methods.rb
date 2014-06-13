def register_user
  visit '/'
  within ('header') { click_on 'Register' }
  fill_in 'user[email]', :with => 'keri@gmail.com'
  fill_in 'user[password]', :with => 'password'
  click_on 'register'
  within('header') do
    expect(page).to have_content('keri@gmail.com')
  end
end

def login_user
  visit '/'
  within('header') { click_on 'Login' }
  fill_in 'email', :with => 'keri@gmail.com'
  fill_in 'password', :with => 'password'
  click_on 'login'
  within('header') do
    expect(page).to have_content('keri@gmail.com')
  end
end


