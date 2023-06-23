# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    layout 'admin'

    before_action :authorize_admin_access

    private

    def authorize_admin_access
      authorize %i[admin dashboard], :index?
    end
  end
end
