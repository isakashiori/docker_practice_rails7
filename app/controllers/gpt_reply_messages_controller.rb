class GptReplyMessagesController < ActionController::API
  def create
    # faradayでapiを叩くコードが長くなるため、servicesファイルに切り出す
    response = GptReplyService.new(params[:ask_msg]).perform
    render json: { response: response }
  end
end
