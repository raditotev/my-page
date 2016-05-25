class Project < ActiveRecord::Base

  has_attached_file :screenshot, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment :screenshot,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  validates :description, presence: true
  validates :screenshot, attachment_presence: true
end
