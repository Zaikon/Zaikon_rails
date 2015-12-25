class Good < ActiveRecord::Base
  belongs_to :category

  validates :name ,:stock_num ,:notification_num ,:image ,:amazon_url ,:category_id ,:counting_type, presence: true
end
