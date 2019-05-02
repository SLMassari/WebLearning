class ShortenedUrl < ActiveRecord::Base
  validates :short_url,  presence: true, uniqueness: true
  validates :long_url, :user_id, presence: true

  belongs_to(
    :submitter,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  def self.for(user, long_url)
    new_sUrl = self.create!(short_url: ShortenedUrl.random_code, long_url: long_url, user_id: user.id)
  end

  def self.random_code
    unique_random_code = SecureRandom.urlsafe_base64
    until !ShortenedUrl.exists?(short_url: unique_random_code)
      unique_random_code = SecureRandom.urlsafe_base64
    end
    unique_random_code
  end
end
