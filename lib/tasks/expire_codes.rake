task :expire_codes => :environment do
  confirmations = Confirmation.all
  confirmations.each do |c|
    if c.expiration_date && c.expiration_date < Date.today
      c.is_expired = true
      c.save
    else
    end
  end
end