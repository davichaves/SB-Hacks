namespace :populate do

  FIRST_LETTER = 'a'
  END_LETTER = 'd'

  desc "Populate signs table"
  task signs: :environment do

  	(FIRST_LETTER .. END_LETTER).each do |i|
  		Sign.create(symbol: i, image: "letter-#{i}.jpg")
  	end


  	puts "Database was populated with  signs"


  end

end
