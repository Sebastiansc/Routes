require 'byebug'
class Contact < ActiveRecord::Base
  validates :name, :email, :user_id, presence: true
  validate :no_repeated_emails

  belongs_to :owner,
    foreign_key: :user_id,
    class_name: :User

  has_many :contact_shares

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  has_many :comments, as: :topic

  def no_repeated_emails
    if self.owner.contacts.exists?(email: self.email)
      self.errors[:repeated] << "emails are not accepted"
    end
  end
end
