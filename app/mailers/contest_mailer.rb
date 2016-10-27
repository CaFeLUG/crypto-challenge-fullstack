class ContestMailer < ApplicationMailer
  default from: "postmaster@ccc-eko12.cafelug.org.ar"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sample Email')
  end
end
