class Listing < ApplicationRecord
  #listings belong to users and categories. Listings can have one user and one category. 
  belongs_to :user
  belongs_to :category
  has_many :listings_features, dependent: :destroy
  has_many :features, through: :listings_features
 
 
  #number mapping to match features to a value

  # conditions A Bit worn, Worn a few times, Like New , Brand New 
  # {"a bit worn" => 1, "worn a few times" => 2, "like new" => 3, "Brand New" => 4}
  enum condition: {a_bit_worn: 1, worn_a_few_times: 2, like_new: 3, brand_new: 4}
# enabled image upload in create listing image upload attribute
  has_one_attached :picture

  #unless the following conditions are met listings are not valid
  validates :title, :description, :price, :condition, presence: true
  validates :title, length: {minimum: 4}

  # Sanitise data with lifecycle hooks
  before_save :remove_whitespace
  before_save :remove_stain
  before_validation :convert_price_to_cents, if: :price_changed?

  #removes white space and sanitizes code
  private
  def remove_whitespace
    self.title = self.title.strip
    self.description = self.description.strip 
  end 
#removes the word stain and replaces it with mark
  def remove_stain
    self.title = self.title.gsub(/stain/i, "mark")
    self.description = self.title.gsub(/stain/i, "mark")

  end
  #convert the price to cents in database. 
def convert_price_to_cents
    self.price = (self.attributes_before_type_cast["price"].to_f * 100)
end
end
