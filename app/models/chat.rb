class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates_presence_of :text

  mount_uploader :image, ImageUploader

  def chat_json
    { user_name: user.name, created_at: created_at.to_s(:datetime), text: text, image: image }
  end

end
