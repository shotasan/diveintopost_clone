module AgendasHelper
  def choose_new_or_edit
    if action_name == 'new'
      team_agendas_path
    elsif action_name == 'edit'
      agenda_path
    end
  end

  def agenda_owner?(agenda)
    agenda.user_id == current_user.id
  end

  def team_owner?(agenda)
    agenda.team.owner_id == current_user.id
  end
end
