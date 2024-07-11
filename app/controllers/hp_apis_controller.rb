class HpApisController < ApplicationController
  def index
    response = Faraday.get('https://hp-api.onrender.com/api/spells')
    render json: { response: response.body }
  end
end
