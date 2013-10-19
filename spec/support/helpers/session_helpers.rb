def login(user, options = {})
  initial_path = options.fetch(:initial_path, '/')
  visit initial_path

  fill_in 'Email', with: user.email
  fill_in 'Password', with: options[:password] || 'password1234'

  click_link_or_button 'Login'

  expect(page).to have_content 'Signed in successfully.'
end

def login_admin(user, options = {})
  login(user, initial_path: '/admin')
end

def log_out
  visit destroy_user_session_path
end
