# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_resource, except: [:new, :create]

  private
  
  def after_update_path_for(resource)
    profile_path(resource)
  end
end
