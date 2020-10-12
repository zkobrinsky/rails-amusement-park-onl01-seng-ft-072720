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


# create_table "attractions", force: :cascade do |t|
#     t.string "name"
#     t.integer "nausea_rating"
#     t.integer "happiness_rating"
#     t.integer "tickets"
#     t.integer "min_height"
#   end

#   create_table "rides", force: :cascade do |t|
#     t.integer "user_id"
#     t.integer "attraction_id"
#   end

#   create_table "users", force: :cascade do |t|
#     t.string "name"
#     t.string "password_digest"
#     t.integer "nausea"
#     t.integer "happiness"
#     t.integer "tickets"
#     t.integer "height"
#     t.boolean "admin", default: false
#     t.string "mood", default: "happy"
#   end