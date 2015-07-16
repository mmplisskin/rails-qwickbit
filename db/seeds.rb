# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




Category.destroy_all
Business.destroy_all
Rate.destroy_all

categories = Category.create([
  {name: 'Automotive'},
  {name: 'Computers & Electronics'},
  {name: 'Entertainment'},
  {name: 'Food & Dining'},
  {name: 'Home & Garden'},
  {name: 'Legal & Financial'},
  {name: 'Manufacturing'},
  {name: 'Retail'},
  {name: 'Services'},
  {name: 'Real Estate'},
  {name: 'Travel'},
  {name: 'Transportation'}
  ])

businesses = Business.create([
  {name: 'Bay Cities', email: 'bay@cities.com', address: '1517 Lincoln Blvd', city: 'los angeles', state: 'California', zipcode: '90404', description: 'Bay Cities is a great local market for getting sandwhiches', category_id: '4', phone_number: '9547786633', password: '12345', password_confirmation: '12345'},
  {name: 'Blue Bottle Coffee', email: 'bbc@coffee.com', address: '123 abbot kinney street', city: 'los angeles', state: 'California', zipcode: '90403', description: 'Blue bottle is a great Californian coffe company originating in Berkeley', category_id: '4', phone_number: '9547786633', password: '12345', password_confirmation: '12345'},
  {name: 'Tech it Easy Computers', email: 'tech@computers.com', address: '171 Pier Ave.', city: 'los angeles', state: 'California', zipcode: '90405', description: 'We fix computers so you can tech it easy! Tech it easy!', category_id: '2', phone_number: '5555555555', password: '12345', password_confirmation: '12345'},
  {name: 'High Tech Auto Service', email: 'tech@auto.com', address: '2700 Lincoln Blvd', city: 'los angeles', state: 'California', zipcode: '90405', description: 'This is a bunch of meaningless text about a business that really exists but is not using our app', category_id: '1', phone_number: '9547786633', password: '12345', password_confirmation: '12345'},
  {name: 'Santa Monica Pier', email: 'santa@monica.com', address: '100 Santa Monica Pier', city: 'los angeles', state: 'California', zipcode: '90405', description: 'This is a bunch of meaningless text about a business that really exists but is not using our app', category_id: '3', phone_number: '9547786633', password: '12345', password_confirmation: '12345'},
  {name: 'Third Street Promenade', email: 'third@street.com', address: '1351 3rd Street Promenade', city: 'los angeles', state: 'California', zipcode: '90405', description: 'This is a bunch of meaningless text about a business that really exists but is not using our app', category_id: '8', phone_number: '9547786633', password: '12345', password_confirmation: '12345'},
  {name: 'CarbonFive', email: 'carbon@five.com', address: '4223 Glencoe Ave Ste A200', city: 'Marina Del Rey', state: 'California', zipcode: '90292', description: 'This is a bunch of meaningless text about a business that really exists but is not using our app', category_id: '2', phone_number: '9547786633', password: '12345', password_confirmation: '12345'},
  {name: 'Law Offices Of Mher Asatryan', email: 'mher@asatryan.com', address: '14545 Victory Blvd', city: 'Van Nuys', state: 'California', zipcode: '91411', description: 'This is a bunch of meaningless text about a business that really exists but is not using our app', category_id: '6', phone_number: '9547786633', password: '12345', password_confirmation: '12345'},
  {name: 'LA Valley Realty', email: 'la@valley.com', address: '6320 Van Nuys Blvd', city: 'Van Nuys', state: 'California', zipcode: '91401', description: 'This is a bunch of meaningless text about a business that really exists but is not using our app', category_id: '10', phone_number: '9547786633', password: '12345', password_confirmation: '12345'},
  {name: 'Sun Travel Agency', email: 'sun@travel.com', address: '6450 Sepulveda Blvd', city: 'Van Nuys', state: 'California', zipcode: '91401', description: 'This is a bunch of meaningless text about a business that really exists but is not using our app', category_id: '11', phone_number: '9547786633', password: '12345', password_confirmation: '12345'},
  {name: 'US Aviators', email: 'us@aviators.com', address: '16644 Vanowen St', city: 'Van Nuys', state: 'California', zipcode: '91406', description: 'This is a bunch of meaningless text about a business that really exists but is not using our app', category_id: '11', phone_number: '9547786633', password: '12345', password_confirmation: '12345'},
  {name: 'LAX FlyAway', email: 'lax@flyaway.com', address: '7610 Woodley Ave', city: 'Van Nuys', state: 'California', zipcode: '91406', description: 'This is a bunch of meaningless text about a business that really exists but is not using our app', category_id: '12', phone_number: '9547786633', password: '12345', password_confirmation: '12345'},
  {name: 'Star BBQ', email: 'kang@baekjeong.com', address: '601 S Ardmore Ave', city: 'Los Angeles', state: 'California', zipcode: '90005', description: 'This is a bunch of meaningless text about a business that really exists but is not using our app', category_id: '4', phone_number: '9547786633', password: '12345', password_confirmation: '12345'}
  ])

rate = Rate.create([
  {coinbase_rate:0,bitfinex_rate:0,okcoin_rate:0,average_rate:0}
  ])
