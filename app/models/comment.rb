class Comment < ActiveRecord::Base
  attr_accessible :post_id, :body
  belongs_to :post
end
