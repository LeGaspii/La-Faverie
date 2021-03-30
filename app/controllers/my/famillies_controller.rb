class My::FamilliesController < ApplicationController

  def index
    @famillies = policy_scope(Familly).where(user_id: current_user)
  end

end
