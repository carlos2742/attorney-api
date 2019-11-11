class ApplicationController < ActionController::API
        include DeviseTokenAuth::Concerns::SetUserByToken

  def initialize
    super
    @drive_service = Services::GoogleDriveService.new if Rails.env.development?
  end
end
