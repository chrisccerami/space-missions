class MilestonesController < ApplicationController
  def index
    @milestones = Milestone.future.order(date: :asc).includes(mission: :organizations)
  end

  def show
    @milestone = Milestone.find params[:id]
  end
end
