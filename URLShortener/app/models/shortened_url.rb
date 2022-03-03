require 'securerandom'

class ShortenedUrl < ApplicationRecord
include SecureRandom
  validates :long_url, :user_id, presence: true
  validates :short_url, uniqueness: true


  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(:short_url => code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def shortener(user, long_url)
    code = ShortenedUrl.random_code
  end
end
