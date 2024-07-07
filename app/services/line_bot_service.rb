require 'line/bot'

class LineBotService
  def initialize(random_word)
    @random_word = random_word
  end

  def perform
    user_id = ENV["LINE_USER_ID"]
    message= {
      type: 'text',
      text: @random_word
    }
    client.push_message(user_id, message)
  end

  private

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end
end
