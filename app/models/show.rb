class Show < ActiveRecord::Base

    
    
    def self.highest_rating
        self.all.maximum(:rating)
    end 

    def self.most_popular_show
        highest_rating = self.highest_rating
        self.where(rating: highest_rating)
    end

    def self.lowest_rating
        self.minimum(:rating)
    end

    def self.least_popular_show
        self.where(rating: self.lowest_rating)
    end

    def self.ratings_sum
        self.sum(:rating)
    end

    def self.popular_shows
        self.where("rating > ?", 5)
    end 

    def self.shows_by_alphabetical_order
        self.all.order(:name)
    end

end

