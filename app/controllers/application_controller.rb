require 'line/bot'
require_relative '../../lib/line_request/line_accessor.rb'
require_relative '../../lib/line_request/request_info.rb'

class ApplicationController < ActionController::API
  def execute_request
    body = request.body.read

    @messenger = LineAccessor.new
    @client = @messenger.client

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless @client.validate_signature(body, signature)
      head :bad_request
    end

    event = (@client.parse_events_from(body))[0]
    event_type = nil

    case event
    when Line::Bot::Event::Message
      case event.type
       when Line::Bot::Event::MessageType::Text
          event_type = Constants::Request::TYPE_TEXT
      end
    when Line::Bot::Event::Follow
      event_type = Constants::Request::TYPE_FOLLOW
    when Line::Bot::Event::Unfollow
      event_type = Constants::Request::TYPE_UNFOLLOW
    end

    RequestInfo.new(event_type, event)
  end
end
