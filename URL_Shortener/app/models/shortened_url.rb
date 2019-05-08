class ShortenedUrl < ActiveRecord::Base
  validates :short_url,  presence: true, uniqueness: true
  validates :long_url, :user_id, presence: true

  belongs_to(
    :submitter,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :visits,
    class_name: 'Visit',
    foreign_key: :shortened_url_id,
    primary_key: :id
  )

  has_many(
    :visitors,
    through: :visits,
    source: :visitor
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

  def num_clicks
    num_clicks = 0
    self.visits.each do |visit|
      num_clicks += visit.num_visits
    end
    num_clicks
  end

  def num_uniques
    self.visitors.count
  end
end
