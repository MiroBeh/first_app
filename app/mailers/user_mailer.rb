class UserMailer < ApplicationMailer
  default from: "test@example.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
          to: ENV['SENDGRID_EMAIL'],
          subject: "A new contact from #{name}")
  end

  def welcome(user)
    @appname = "DaShop"
    mail(to: user.email, supject "Welcome to #{appname}!")
  end
end
