class Item < ApplicationRecord
  before_save :create_img_digest
  validates :price, length: { maximum: 6 }, presence: true
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 500 }
  def create_img_digest
    self.img_digest = Digest::MD5.hexdigest(self.name)
  end
end
