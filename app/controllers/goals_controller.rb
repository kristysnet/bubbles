class GoalsController < ApplicationController

  def index
    @goals = current_user.goals
  end

  def create
    goal = Goal.new(goal_params)
    if goal.save
      flash[:success] = 'Goal was created'
    else
      flash[:error] = 'Goal could not be created'
      flash[:errors] = goal.errors.messages
    end
    redirect_to goals_path
  end


  private

  def goal_params
    goal_params = params.require(:goal).permit(:name, :amount, :label_id)
    goal_params.merge user: current_user
  end


end
