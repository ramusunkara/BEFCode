ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  user_name: Settings.mail.sendgrid.username,
  password: Settings.mail.sendgrid.password,
  domain: Settings.mail.domain,
  enable_starttls_auto: true
}
