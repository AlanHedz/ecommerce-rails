ActionMailer::Base.smtp_settings = {
  addres:"smtp.gmail.com",
  port: 587,
  domain: "gmail.com",
  user_name: "apluzhelp@gmail.com",
  password: "2282039alan",
  authentication: :login, 
  enable_starttls_auto: true 
}