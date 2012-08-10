class Notifier < ActionMailer::Base
  default from: 'notifier@benjaminharriscreative.com'

  def contact(name, subject, email, message)
    @message, @email, @name = message, email, name
    mail to: 'jerelmiller@gmail.com', subject: subject
  end
end