require 'securerandom'

class ShortenedUrl < ApplicationRecord
include SecureRandom
  validates :long_url, :user_id, presence: true
  validates :short_url, uniqueness: true

  belongs_to :submitter,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  def self.random_code
    code = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(:short_url => code)
      code = SecureRandom.urlsafe_base64
    end
    code
  end

  def self.shortener(user, long_url)
    code = ShortenedUrl.random_code
    ShortenedUrl.create!(
      long_url: long_url,
      short_url: code,
      user_id: user.id
    )
  end
end
