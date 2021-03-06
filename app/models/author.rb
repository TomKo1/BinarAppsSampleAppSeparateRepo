class Author < ActiveRecord::Base
  
  before_validation :default_age

  has_many :posts, dependent: :destroy
  
  validates :name, presence: true, length: { in: 3..20}
  validates :surname, presence: true, length: { maximum: 30 }
  validates :age, :inclusion => 1..150

  # for testing
  scope :old, -> { where('age > 30') }
  scope :young, -> { where('age < 20') }


  

  def fullname
    "#{name} #{surname}"
  end

  def default_age 
    self.age = 25 unless age
  end

end