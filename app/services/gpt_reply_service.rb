class GptReplyService
  def initialize(ask_msg)
    @ask_msg = ask_msg
    @response = Faraday.new("https://api.openai.com") do |req|
      req.headers["Content-Type"] = "application/json"
      req.headers["Authorization"] = "Bearer #{ENV['OPENAI_API_KEY']}"
      req.adapter Faraday.default_adapter
    end
  end

  def perform
    response = @response.post("/v1/chat/completions") do |conn|
      conn.body = {
        model: "gpt-3.5-turbo",
        messages: [{role: "user", content: @ask_msg}],
        temperature: 0.7
      }.to_json
    end
  end
end
