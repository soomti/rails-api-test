class Post < ActiveRecord::Base
    acts_as_votable
    has_many :comments
    belongs_to :user


    def self.search(search)
        where("title LIKE ?", "%#{search}%") 
        where("content LIKE ?", "%#{search}%")
    end

end
