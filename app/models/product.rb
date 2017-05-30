class Product < ApplicationRecord
  has_many :photos
  accepts_nested_attributes_for :photos
  mount_uploader :image, ImageUploader
  has_many :reviews, dependent: :destroy  #商品和这个商品的留言之间的关系，dependent: :destroy表示级联删除

end
