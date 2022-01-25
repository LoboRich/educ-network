class ProfilesController < ApplicationController
    before_action :authenticate_user!
    # GET /groups or /groups.json
    def index
      @info = current_user
      @groups = current_user.groups
    end
  
  end
  