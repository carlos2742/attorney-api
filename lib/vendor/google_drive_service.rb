require "google/apis/drive_v3"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"

module FileType
  ARTICLE = 'article'
  BLOG_SUBSCRIBER = 'blog_subscriber'
  USER = 'user'
end

class GoogleDriveService

  OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
  APPLICATION_NAME = "Drive API Ruby Quickstart".freeze
  CREDENTIALS_PATH = "credentials.json".freeze
# The file token.yaml stores the user's access and refresh tokens, and is
# created automatically when the authorization flow completes for the first
# time.
  TOKEN_PATH = "token.yaml".freeze
  SCOPE = Google::Apis::DriveV3::AUTH_DRIVE

  def initialize()
    @drive_service = Google::Apis::DriveV3::DriveService.new
    @drive_service.client_options.application_name = APPLICATION_NAME
    @drive_service.authorization = authorize
  end

  def storage_file(data, type )
    parent = '1peYFOfMUmSdiMBZgOVzwVpyy3xcfVs4u'

    case type
    when FileType::BLOG_SUBSCRIBER
      parent = ''
    when FileType::USER
      parent = ''
    end

    metadata = Google::Apis::DriveV3::File.new(name: 'subheader', parents: [parent])
    permission=Google::Apis::DriveV3::Permission.new(type: "anyone", role: "reader")

    @drive_service.create_file(metadata, upload_source: 'public/subheader-image-responsive.jpg', content_type: 'image/jpeg') do |file|
      @drive_service.create_permission(file.id, permission) do |params|
        puts "success"
        yield(file.id)
      end
    end
  end

  private
  def authorize
    client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
    token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
    authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
    user_id = "default"
    credentials = authorizer.get_credentials user_id
    if credentials.nil?
      url = authorizer.get_authorization_url base_url: OOB_URI
      puts "Open the following URL in the browser and enter the " \
         "resulting code after authorization:\n" + url
      code = gets
      credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id, code: code, base_url: OOB_URI
      )
    end
    credentials
  end


end