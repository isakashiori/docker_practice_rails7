class GetReplyService
  def perform(ask_msg)
    # 一旦エンドポイントは以下しか使わない予定で書いている
    # より汎用的に書くのであればFaraday.newでコネクションのインスタンスを作成した方がいい
    response = Faraday.post("https://api.openai.com/v1/chat/completions") do |req|
      req.headers["Content-Type"] = "application/json"
      req.headers["Authorization"] = "Bearer #{ENV['OPENAI_API_KEY']}"
      req.body = {
                    model: "gpt-3.5-turbo",
                    messages: [{role: "user", content: ask_msg}],
                    temperature: 0.7
                  }.to_json
    end
  end
end
