class My::FamilliesController < ApplicationController

  def index
    @famillies = policy_scope(Familly).where(user_id: current_user)
    # @coaching_sort_by_date = @coachings.sort_by {|coaching| coaching.coaching_date }
  end

end
