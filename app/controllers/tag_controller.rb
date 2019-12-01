class TagController < ApplicationController

  before_action :set_tag, only: [:update, :destroy]
  load_and_authorize_resource

  # ---- Admin Services ---- #
  def index
    render json:Tag.all.order(id: :desc), each_serializer: TagAdminSerializer, status: :ok
  end

  def create
    if translation_params
      @tag = Tag.new
      @tag.save
      render json:@tag, serializer: TagAdminSerializer, status: :created if @tag.create_translation translation_params[:fields]
    else
      render json:{message: 'wrong params'}, status: :bad_request
    end
  end

  def update
    if translation_params && !translation_params[:fields].empty?
      render json:@tag, serializer: TagAdminSerializer, status: :created if @tag.update_translation translation_params[:fields]
    else
      render json:{message: 'wrong params'}, status: :bad_request
    end
  end

  def destroy
    if @tag.destroy
      render json:{id: @tag.id}, status: :created
    else
      render json:{message: 'wrong params'}, status: :bad_request
    end
  end

  private
  def set_tag
    @tag = Tag.find(params[:id])
  end

  def translation_params
    params.require(:translation).permit(fields: [:lang, :name])
  end
end
