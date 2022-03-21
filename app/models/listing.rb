class Listing < ApplicationRecord
  #listings belong to users and categories. Listings can have one user and one category. 
  belongs_to :user
  belongs_to :category
  #number mapping to match features to a value

  # conditions A Bit worn, Worn a few times, Like New , Brand New 
  # {"a bit worn" => 1, "worn a few times" => 2, "like new" => 3, "Brand New" => 4}
  enum condition: {a_bit_worn: 1, worn_a_few_times: 2, like_new: 3, brand_new: 4}
# enabled image upload in create listing image upload attribute
  has_one_attached :picture

end
