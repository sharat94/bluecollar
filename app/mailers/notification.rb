class Notification < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.completed.subject

  #
  def completed (ticket,user)
    @ticket = ticket
    @user = user

    mail to: "#{ticket.user.email}" ,subject: "#{ticket.title} has been completed !"

  
end
end