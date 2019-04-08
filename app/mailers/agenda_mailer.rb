class AgendaMailer < ApplicationMailer
  default from: 'from@example.com'

  def agenda_deleted_mail
    @email = params[:email]
    @title = params[:title]
    mail to: @email, subject: "アジェンダの削除"
  end
end
