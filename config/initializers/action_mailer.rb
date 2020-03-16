Rails.application.configure do
 config.action_mailer.smtp_settings = {
   address: ENV['SMTP_HOST'],
   port: 587,
   domain: 'tetsugaku-jii.org',
   authentication: 'plain',
   enable_starttls_auto: true,
   user_name: ENV['SMTP_USERNAME'],
   password: ENV['SMTP_PASSWORD']
 }

 config.action_mailer.default_options = {from: 'info@tetsugaku-jii.org'}
end
