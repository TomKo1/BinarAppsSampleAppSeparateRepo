class Post < ActiveRecord::Base
   #has_many :author_posts
   #has_many :authors, through: :author_posts
    belongs_to :author
    has_many :comments, dependent: :destroy

   validates :title, :content, presence: true 
   validates :title, uniqueness: true 
   validates :title, length: {maximum: 80}
   validates :content, length: { in: 10..500 }
   
   scope :old, -> { where('created_at < ?', 40.minutes.ago) }

   # call backs -> before i after
#   before_create :annotate_author 

#    def annotate_author
#         self.author = "#{author} from BinarApps"
#    end
end