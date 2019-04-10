class AgendasController < ApplicationController
  include Common

  before_action :set_agenda, only: %i[destroy]
  before_action :require_owner, only: %i[destroy]

  def index
    @agendas = Agenda.all
  end

  def new
    @team = Team.friendly.find(params[:team_id])
    @agenda = Agenda.new
  end

  def create
    @agenda = current_user.agendas.build(title: params[:title])
    @agenda.team = Team.friendly.find(params[:team_id])
    current_user.keep_team_id = @agenda.team.id
    if current_user.save && @agenda.save
      redirect_to dashboard_url, notice: 'アジェンダ作成に成功しました！'
    else
      redirect_to team_path(@agenda.team_id), flash: { notice: @agenda.errors.full_messages.first }
    end
  end

  def destroy
    @agenda.destroy
    AgendaMailer.with(email: @agenda.team.members.pluck(:email), title: @agenda.title).agenda_deleted_mail.deliver_later
    redirect_to dashboard_path, notice: 'アジェンダ削除に成功しました！'
  end

  private

  def set_agenda
    @agenda = Agenda.find(params[:id])
  end

  def agenda_params
    params.fetch(:agenda, {}).permit %i[title description]
  end

  def require_owner
    raise ActionController::RoutingError, 'Not Found' unless oneself?(@agenda) || owner?(@agenda)
  end
end
