class User < ActiveRecord::Base
    has_many :rides
    has_many :attractions, through: :rides
    
    has_secure_password
    validates :password, presence: true
    
    after_initialize :update_mood
    before_save :update_mood

    def update_mood
        if self.happiness && self.nausea
            if self.happiness > self.nausea
                self.mood = "happy"
            else
                self.mood = "sad"
            end
        else
            self.mood = "happy"
        end
    end
end
