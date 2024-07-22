class User < ApplicationRecord
  include ImageUploader[:image]
  has_many :statuses, dependent: :destroy
end
