class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories
  validates :name, presence: true

  before_save :generate_slug!



  def to_param
    self.slug
    
  end

  
  def generate_slug!
    the_slug = to_slug(self.name)
    post = Category.find_by slug: the_slug
    count = 2
    while post && post != self
      the_slug = append_suffix(the_slug, count)
      post = Category.find_by slug: the_slug
      count += 1
    end    
    self.slug = the_slug.downcase
  end

  def to_slug(name)
    str = name.strip
    str.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
    str.gsub! /-+/, '-'
    str.downcase

  end

  def append_suffix(str, count)
    if str.split('-').last.to_i != 0
      return str.split("-").slice(0...-1).join("-") + "-" + count.to_s
    else
      return str + "-" + count.to_s
    end
  end
end