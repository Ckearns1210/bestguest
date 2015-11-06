class User < ActiveRecord::Base
  has_and_belongs_to_many :parties
  has_many :items
  has_secure_password
  has_many :invitations, :class_name => "Invite", :foreign_key => 'recipient_id'
  has_many :sent_invites, :class_name => "Invite", :foreign_key => 'sender_id'
end
