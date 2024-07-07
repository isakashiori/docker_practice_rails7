class NarutoWordNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    random_word = NarutoWord.all.sample(1)[0].word
    LineBotService.new(random_word).perform
  end
end
