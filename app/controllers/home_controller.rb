require 'line/bot'

class HomeController < ApplicationController
  include LineRequest

  # GET /
  def index
    render json: {"text": "hello"}
  end

  # POST /
  def callback
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
    end

    event = (client.parse_events_from(body))[0]
    event_type = request_type(event)

    request_info = LineRequest::RequestInfo.new(event_type, event)

    command = CommandFactory.get_command(request_info)
    command.call

    if command.success?
      res = client.reply_message(request_info.user_info.reply_token, command.message)
      if res.code != '200'
        logger.error(res.body)
        head :bad_request
      end
      head :ok
    else
      logger.error('処理失敗')
      head :bad_request
    end
  end
end
