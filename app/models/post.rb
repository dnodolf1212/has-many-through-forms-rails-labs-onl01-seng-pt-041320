class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(categories_attributes)
    categories_attributes.each do |i, category_att|
      if category_att[:name].present?
        category = Category.find_or_create_by(name: category_att[:name])
        if !self.categories.include?(category)
          self.post_categories.build(category: category)
        end
      end
    end
  end

end
