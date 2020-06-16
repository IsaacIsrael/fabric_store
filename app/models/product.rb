class Product < ApplicationRecord
  has_many :images, inverse_of: :product, dependent: :destroy
  monetize :price_cents

  accepts_nested_attributes_for :images, allow_destroy: true

  def before_import_save(record)
    if record[:images_attributes]
      self.images_attributes = record[:images_attributes]
                                &.split(',')
                                &.map { |item| { url: item } }
    end
  end
end
