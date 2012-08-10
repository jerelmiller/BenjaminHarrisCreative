class Notifier < ActionMailer::Base
  default from: 'notifier@benjaminharriscreative.com'

  def contact(name, subject, email, message)
    @message, @email, @name = message, email, name
    mail to: 'benjamin.harris123@gmail.com', subject: subject
  end
end