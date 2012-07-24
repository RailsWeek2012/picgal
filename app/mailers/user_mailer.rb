class UserMailer < ActionMailer::Base
  default from: "noreply@this-is-where-picgal-is-hosted.com"

  def welcome_email(user)
    @user = user
    @url = "http://www.this-is-where-picgal-is-hosted.com/login"
    mail(:to => user.email, :subject => "Welcome to PicGal")
  end
end
