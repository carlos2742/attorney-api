class ApplicationController < ActionController::API

  def initialize
    super
    @drive_service = Services::GoogleDriveService.new if Rails.env.development?
  end
end
