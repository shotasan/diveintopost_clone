class TeamMailer < ApplicationMailer
  default from: 'from@example.com'

  def owner_change_mail
    @team = params[:team]
    @email = params[:email]
    mail to: @email, subject: 'チームーリーダの変更'
  end
end
