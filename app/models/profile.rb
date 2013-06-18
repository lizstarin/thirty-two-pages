class Profile < ActiveRecord::Base
  attr_accessible :bio, :city, :state, :country, :user_id

  belongs_to :user

  def full_location
    result = []
    result << self.city unless self.city.blank?
    result << self.state unless self.state.blank?
    result << self.country unless self.country.blank?
    result.join(", ")
  end
end