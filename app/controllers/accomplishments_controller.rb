class AccomplishmentsController < ApplicationController
  #
  # def index
  #   @goals = current_user.goals
  # end
  #
  def create
    accomplishment = current_goal.accomplishments.build(accomplishment_params)
    if accomplishment.save
      flash[:success] = 'Bubbled up!'
    else
      flash[:error] = 'Bubble up failed'
      flash[:errors] = accomplishment.errors.messages
    end
    redirect_to goals_path
  end

  helper_method def current_goal
    @current_goal = current_user.goals.find(params[:goal_id])
  end


  private

  def accomplishment_params
    # TODO determine time frame by week in year
    { time_frame: '2016.11', user_id: @current_user.id }
  end

end
