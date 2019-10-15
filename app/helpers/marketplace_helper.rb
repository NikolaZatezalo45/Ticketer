module MarketplaceHelper
  def ticketsPresentOnMarketplace?
    @events.each do |event|
      if !event.marketplace_tickets.empty?
        return true
      end
    end
    return false
  end
end
