class Visit < ActiveRecord::Base
  validates :user_id, :shortened_url_id, presence: true
 
  belongs_to(
    :visitor,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :visited_url,
    class_name: 'ShortenedUrl',
    foreign_key: :shortened_url_id,
    primary_key: :id
  )

  def self.record_visit! ( user, shortened_url )
    current_visit = nil
    if !self.exists?(user_id: user.id, shortened_url_id: shortened_url.id)
      current_visit = self.create!(user_id: user.id , shortened_url_id: shortened_url.id, num_visits: 1 )
    else
      current_visit = self.increment_visits(self.find_by! user_id: user.id, shortened_url_id: shortened_url.id)
    end
  end

  def self.increment_visits(current_visit)
    current_visit.increment!(:num_visits, 1)
    current_visit
  end
end

