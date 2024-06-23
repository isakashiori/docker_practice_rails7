class User < ApplicationRecord
  include ImageUploader[:image]
end
