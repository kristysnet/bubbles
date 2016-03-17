class LabelsController < ApplicationController
  respond_to :json

  def index
    @labels = current_user.labels
    respond_with @labels
  end

  def create
    label = Label.new(label_params)
    if label.save
      flash[:success] = 'Label was created'
    else
      flash[:error] = 'Label could not be created'
      flash[:errors] = label.errors.messages
    end
    respond_with label
  end


  private

  def label_params
    label_params = params.require(:label).permit(:name)
    label_params.merge user: current_user
  end


end
