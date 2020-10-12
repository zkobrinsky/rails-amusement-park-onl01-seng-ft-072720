class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides

    has_secure_password
    
    after_initialize :update_mood
    before_save :update_mood

    def update_mood
        if self.happiness && self.nausea
            self.happiness > self.nausea ? self.mood = "happy" : self.mood = "sad"
        end
    end
end
