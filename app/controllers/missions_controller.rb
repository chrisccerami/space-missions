class MissionsController < ApplicationController
  def index
    @missions = Mission.includes :organizations, :milestones
  end

  def show
    @mission = Mission.find params[:id]
  end
end
