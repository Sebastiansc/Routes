class ContactShare < ActiveRecord::Base
  validates :user_id, :contact_id, presence: true
  validate :no_repeated_contacts
  
  belongs_to :user
  belongs_to :contact

  def no_repeated_contacts
    if self.user.contact_shares.exists?(contact_id: self.contact_id)
      self.errors[:repeated] << "contacts are not accepted"
    end
  end
end
