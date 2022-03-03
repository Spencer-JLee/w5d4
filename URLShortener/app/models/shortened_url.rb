require 'securerandom'

class ShortenedUrl < ApplicationRecord
include SecureRandom
  validates :long_url, :user_id, presence: true
  validates :short_url, uniqueness: true


  def self.random_code
    code = SecureRandom.urlsafe_base64
  end
end
