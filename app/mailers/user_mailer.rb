class UserMailer < ActionMailer::Base
  #TODO [4]: Aus Railsguide übernommen (Link siehe README.rdoc)
  #TODO [5]: /app/views/user_mailer/welcome_email.html.erb stammt auch daher
  default from: "noreply@this-is-where-picgal-is-hosted.com"

  def welcome_email(user)
    @user = user
    @url = "http://www.this-is-where-picgal-is-hosted.com/login"
    mail(:to => user.email, :subject => "Welcome to PicGal")
  end
end
