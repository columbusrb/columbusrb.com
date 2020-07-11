class AdminController < ApplicationController
  before_action :authenticate_admin_user!
  before_action :set_header

  layout 'admin'

  def index
    @next_meeting = Meeting.find_or_create_next_date
  end

  private

  def set_header
    @header = 'Generic Admin Dashboard'
    @current_section = :dashboard
  end
end
