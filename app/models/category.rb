# encoding: UTF-8

class Category < ActiveRecord::Base
  validates_presence_of :title

  has_many :blogs

  permalink :title

  after_save :recount_category
  after_destroy :recount_category

  def recount_category
    $cache.write :all_categories, Category.all.to_a
  end

  def self.get_cache_categories
    # categories = $cache.read(:all_categories)
    return Category.all
  end

end
