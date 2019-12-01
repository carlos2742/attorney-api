class PracticeAreaController < ApplicationController

  load_and_authorize_resource

  # ---- Admin Services ---- #
  def index
    render json:PracticeArea.all, each_serializer: PracticeAreaAdminSerializer, status: :ok
  end

end
