class Commentator < ActiveRecord::Base
    has_many :comment_commentators
    has_many :comments, through: :comment_commentators 

 end