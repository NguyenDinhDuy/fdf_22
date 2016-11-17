class ProductSuggest < ApplicationRecord
  belongs_to :user
  belongs_to :category

  scope :order_by_time, -> {order created_at: :desc}

  enum status: [:waiting, :accept, :deny]

  EXCEPTED_ATTRIBUTES = ["user_id", "created_at", "updated_at", "id", "image"]

  mount_uploader :image, ImageUploader

  validates :name, presence: true, length: {minimum: 6, maximum: 50}
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :description, presence: true, length: {maximum: 200}
  validates :image, presence: true, allow_nil: true
  validate :image_size

  private
  def image_size
    if image.size > Settings.size_image.megabytes
      errors.add :image, I18n.t("models.product.image_size.error")
    end
  end
end
