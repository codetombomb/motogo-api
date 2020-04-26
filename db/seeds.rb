User.all.destroy_all
Owner.all.destroy_all
Renter.all.destroy_all
Bike.all.destroy_all



# Generate users
10.times{
    password = Faker::Internet.password(min_length: 10, max_length: 20, mix_case: true, special_characters: true)
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    # byebug
    User.create(
    first_name: first_name, 
    last_name: last_name, 
    email: "#{first_name}.#{last_name}@gmail.com",
    password: password,
    password_confirmation: password,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip,
    phone_number: Faker::PhoneNumber.cell_phone
 )
}
# byebug
# Generate Owners and Renters based on if user has an ID. User may be null due to db reset on reseed.
User.all.each {|user|
    if user.id 
     Owner.create(user_id: user.id)
     Renter.create(user_id: user.id)
    end
}

# List of motorcycle brands for Bike seeds 
BIKES_LIST = ['AJS', 'Aprilia', 'Arctic Cat', 'Ariel', 'Benelli', 'Beta', 'Bimota', 'BMW', 'Cagiva', 'CCM', 'Daelim', 'Derbi', 'DKW', 'Ducati', 'Enfield', 'GAS GAS', 'Gilera', 'Harley-Davidson', 'Hercules', 'Honda', 'Husaberg', 'Husqvarna', 'Hyosung', 'Indian', 'Kawasaki', 'Keeway', 'Kreidler', 'KTM', 'Kymco', 'Lambretta', 'Laverda', 'Maico', 'Malaguti', 'Moto Guzzi', 'Moto Morini', 'MuZ', 'MV Agusta', 'MZ', 'Norton', 'NSU', 'Peugeot', 'PGO', 'Piaggio', 'Rieju', 'Sherco', 'Suzuki', 'Sym', 'TGB', 'TM Racing', 'Triumph', 'UM', 'Ural', 'Veli', 'Vespa', 'Victory', 'Yamaha', 'Zündapp']
# List if motorcycle categories for Bike seeds
CATEGORIES = ['Scooter', 'Sport', 'Sport Touring', 'Cruiser', 'Dual-Purpose', 'Off-Road', 'Chopper', 'Custom', 'Supermoto', 'Track', 'Mini-Moto', 'Trike']

#For every Owner.id, generate a Bike and a Post instance and associate each instance with the current Owner.id
Owner.all.each do |owner|
    if owner.id
        current_owner = owner.id
        Bike.create(
            owner_id: current_owner,
            year: rand(1960..2020),
            make: BIKES_LIST.sample,
            model: Faker::Games::Zelda.character,
            rating: rand(1..10),
            bike_name: Faker::Games::Zelda.item,
            category: CATEGORIES.sample
        )

        #Grab ID of last bike created and assign it to a var
        last_bike = Bike.last.id
        Post.create(
            owner_id: current_owner,
            bike_id: last_bike,
            description: Faker::Lorem.sentence(
                word_count: 3, 
                supplemental: false, random_words_to_add: 4
            ),
            price_per_day: rand(25..250)
        )


    end
end