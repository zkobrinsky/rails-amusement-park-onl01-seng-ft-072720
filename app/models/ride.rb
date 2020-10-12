class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    

    def take_ride
        errors = []
        errors << ticket_check
        errors << height_check

        if !ticket_check && !height_check
            update_tickets
            update_nausea
            update_happiness
            self.save
        else
            "Sorry. " + errors.compact.join(" ")
        end
    end

    def ticket_check
        if self.user.tickets < self.attraction.tickets
            "You do not have enough tickets to ride the #{self.attraction.name}."
        end
    end

    def height_check
        if self.user.height < self.attraction.min_height
            "You are not tall enough to ride the Roller Coaster."
        end
    end

    def update_tickets
        updated_tickets = self.user.tickets - self.attraction.tickets
        self.user.update(tickets: updated_tickets)
    end

    def update_nausea
        updated_nausea = self.user.nausea + self.attraction.nausea_rating
        self.user.update(nausea: updated_nausea)
    end

    def update_happiness
        updated_happiness = self.user.happiness + self.attraction.happiness_rating
        self.user.update(happiness: updated_happiness)
    end

end
