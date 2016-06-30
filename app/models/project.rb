class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_attached_file :screenshot, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png", dependent: :destroy
  validates_attachment :screenshot,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :screenshot, attachment_presence: true
end
