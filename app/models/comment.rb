class Comment < ActiveRecord::Base
   belongs_to :post
   
   has_many :comment_commentators
   has_many :commentators, through: :comment_commentators

   validates :content, presence: true

end