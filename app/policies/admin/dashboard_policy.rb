# frozen_string_literal: true

module Admin
  class DashboardPolicy < ApplicationPolicy
    def index?
      user.admin?
    end
  end
end
