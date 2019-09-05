class CommonController < ApplicationController
  def change_language
    I18n.locale = common_params[:lang]
    render json: {lang: I18n.locale}, status: :ok
  end

  def common_params
    params.require(:common).permit(:lang)
  end

end
