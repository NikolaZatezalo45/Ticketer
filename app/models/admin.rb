class Admin < User
    has_many :events, :foreign_key =>'creator_id'
end
