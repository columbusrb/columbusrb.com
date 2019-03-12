class AdminController < ApplicationController
  http_basic_authenticate_with name: ENV["ADMIN_USER"], password: ENV["ADMIN_PASSWORD"]
  before_action :set_header

  layout 'admin'

  def index
    @next_meeting = Meeting.find_or_create_next_date
  end

  private

  def set_header
    @header = 'Admin Dashboard'
  end
end
