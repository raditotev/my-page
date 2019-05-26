class Post < ApplicationRecord
  before_destroy :delete_tags

  extend FriendlyId
  friendly_id :title, use: :slugged

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :comments, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true

  default_scope -> { order(created_at: :desc) }

  def all_tags=(names)
      self.tags = names.split(",").map do |name|
        Tag.where(name: name.strip.upcase).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

  private

  # Deletes all stand alone tags
  def delete_tags
    tags = self.tags
    tags.each do |tag|
      tag.destroy if tag.posts.count == 1
    end
  end
end
