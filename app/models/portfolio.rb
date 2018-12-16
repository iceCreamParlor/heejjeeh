class Portfolio < ApplicationRecord
  has_and_belongs_to_many :hashtags
  accepts_nested_attributes_for :hashtags

  before_destroy :check_hashtag_valid

  def check_hashtag_valid
    puts "before destroy!"
    hashtags = self.hashtags
    
    hashtags.each do |hashtag|
      puts hashtag.title
      if hashtag.portfolios.count == 1
        hashtag.delete
      end
    end
  end
end
