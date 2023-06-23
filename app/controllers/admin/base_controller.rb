# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authorize_admin_access

    def authorize_admin_access
      head :forbidden unless current_user&.admin?
    end
  end
end
