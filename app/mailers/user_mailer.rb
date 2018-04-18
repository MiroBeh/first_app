class UserMailer < ApplicationMailer
  default from: "test@example.com"

  def contact_form(email, name, message)
    @message = message
    mail(from: email,
          to: 'kss79828@tqoai.com',
          subject: "A new contact from #{name}")
  end
end
