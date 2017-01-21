class Group < ApplicationRecord
  has_many :users, through: :members
  has_many :members
  has_many :chats

  accepts_nested_attributes_for :members, allow_destroy: true

  validates_presence_of :name
end
