class MissionsController < ApplicationController
  def index
    @missions = Mission.includes :organizations, :milestones
  end
end
