class Image < ApplicationRecord
  belongs_to :product, inverse_of: :images
end
