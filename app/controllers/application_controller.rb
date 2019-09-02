class ApplicationController < ActionController::API

  def initialize
    super
    @drive_service = Services::GoogleDriveService.new
  end
end
