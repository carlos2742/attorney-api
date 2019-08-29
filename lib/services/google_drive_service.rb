require "google/apis/drive_v3"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"

module ENTITY_TYPE
  ARTICLE = 'article'
  USER = 'user'
end

module DRIVE_FOLDER
  ARTICLE_PROD = '1EMzFE0d9WAHr43Er6ZGkQ6dW6ohRxGjg'
  USER_PROD = '12AGJnt6Px8r99uT4Ys2pM5AkIer4MBGv'
  ARTICLE_DEV = '1ILJpH4cpHe6ZdNfb7iOou2v9rgJixxOe'
  USER_DEV = '113qmJbMz-Fg9VQvP7scT_LRyla2beIZz'
end

module Services

  class GoogleDriveService

    OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
    APPLICATION_NAME = "Attorney Drive".freeze
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

    def storage_file(image, entity_type)
      create_file_local(image)
      upload_file(image, entity_type)
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

    def create_file_local(image)
      image_data = Base64.decode64(image[:content]["data:#{image[:type]};base64,".length .. -1])
      new_file = File.new("public/#{image[:name]}", 'wb')
      new_file.write(image_data)
    end

    def upload_file(image, type)

      file_name = File.basename(image[:name],File.extname(image[:name]))
      file_path = "public/#{image[:name]}"
      file_type = image[:type]

      parent = Rails.env.production? ? DRIVE_FOLDER::ARTICLE_PROD : DRIVE_FOLDER::ARTICLE_DEV

      if type === ENTITY_TYPE::USER
        parent = Rails.env.production? ? DRIVE_FOLDER::USER_PROD : DRIVE_FOLDER::USER_DEV
      end

      metadata = Google::Apis::DriveV3::File.new(name: file_name, parents: [parent])
      permission = Google::Apis::DriveV3::Permission.new(type: "anyone", role: "reader")

      file = @drive_service.create_file(metadata, upload_source: file_path, content_type: file_type) do
        remove_local_file(file_path)
      end
      @drive_service.create_permission(file.id, permission)
      file.id
    end

    def remove_local_file(image_path)
      File.delete(image_path) if File.exist?(image_path)
      GC.start
    end

  end
end

