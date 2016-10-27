ActionMailer::Base.smtp_settings = {
  :port           => 587,
  :address        => 'smtp.mailgun.org',
  :user_name      => 'postmaster@ccc-eko12.cafelug.org.ar',
  :password       => 'fbec2f0e8f7bb7b34e82fd0c99f64829 ',
  :domain         => 'ccc-eko12.cafelug.org.ar',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp
