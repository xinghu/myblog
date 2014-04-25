# encoding: UTF-8

class Blog < ActiveRecord::Base
  validates_presence_of :title,:content

  belongs_to :category, :counter_cache => true

  has_many :comments, :conditions => {:ancestry => nil}

  permalink :title

  # after_save :recount_blog
  after_destroy :recount_blog

  def recent_blogs
    order("id desc")
  end

  def recount_blog
    $cache.write :all_blogs, Blog.recent_blogs.to_a
  end


  def previous(offset = 0)
    self.class.first(:conditions => ['id < ?', self.id], :limit => 1, :offset => offset, :order => "id DESC")
  end

  def next(offset = 0)
    self.class.first(:conditions => ['id > ?', self.id], :limit => 1, :offset => offset, :order => "id ASC")
  end

  def self.tags
		tags =	Blog.all.map {|x| x.tags }
		bs = tags.compact.each {|x| x.gsub!(" ", ",");x.gsub!("，", ",");}
		s = ""
    bs.each {|x| s+=x; s+=",";}
    s.split(",").compact.uniq
  end

  # require 'rubygems'
  # require 'hpricot'
  # require 'open-uri'

  # def self.get_myblogs
  #   url = "http://xinghu.javaeye.com"


  #   blog_urls = []

  #   doc = Hpricot.parse(open(url).read)

  #   doc.search("//div[@class='blog_main']//h3/a").each do |x|
  #     blog_urls << x.attributes["href"]
  #   end

  #   blog_urls.each do |u|
  #     blog_doc = Hpricot.parse(open(url + u).read)

  #     b = Blog.new
  #     b.title = blog_doc.at("//div[@class='blog_title']//h3/a").inner_html
  #     b.content = blog_doc.at("//div[@class='blog_content']").inner_html
  #     b.save!
  #   end
  # end

  def self.get_cache_blogs
    blogs = $cache.read(:all_blogs)
    return blogs.present? ? blogs : Blog.recent_blogs
  end

end
