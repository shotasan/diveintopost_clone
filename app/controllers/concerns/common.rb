module Common
  extend ActiveSupport::Concern

  def owner?(target_instance)
    current_user == target_instance.team.owner
  end

  def oneself?(target_instance)
    current_user == target_instance.user
  end

end