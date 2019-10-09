class Normal < User
    has_many :tickets, :foreign_key =>'purchaser_id'
end
