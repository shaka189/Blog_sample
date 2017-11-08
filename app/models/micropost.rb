class Micropost < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :upvotes
  default_scope -> { order(created_at: :desc) }
  # mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  # validate  :picture_size

  def score
    upvotes.count
  end
   private

    # Validates the size of an uploaded picture.
    # def picture_size
    #   if picture.size > 5.megabytes
    #     errors.add(:picture, "should be less than 5MB")
    #   end
    # end
end