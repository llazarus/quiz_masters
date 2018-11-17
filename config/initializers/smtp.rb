ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: "587",
  enable_starttls_auto: true,
  authentication: :plain,
  # NEVER COMMIT PERSONAL INFORMATION!!! To keep our user_name and password concealed, we can store and access them as environmental variables 
  user_name: ENV["EMAIL_USERNAME"],
  password: ENV["EMAIL_PASSWORD"]
}