# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




categories = Category.create([{name: 'Automotive'},{name: 'Computers & Electronics'},{name: 'Entertainment'},{name: 'Food & Dining'},{name: 'Home & Garden'},{name: 'Legal & Financial'},
  {name: 'Manufacturing'},{name: 'retail'},{name: 'Services'},{name: 'Real Estate'},{name: 'Travel'},{name: 'Transportation'}])


businesses = Business.create([{name: 'Bay Cities', email: 'bay@cities.com', address: '125 6th street', city: 'los angeles', state: 'California', zipcode: '90404', description: 'Bay Cities is a great local market for getting sandwhiches', category_id: '4', phone_number: '9547786633', password: '12345', password_confirmation: '12345'}])

businesses = Business.create([{name: 'Blue Bottle Coffe', email: 'bbc@coffee.com', address: '123 abbot kinney street', city: 'los angeles', state: 'California', zipcode: '90403', description: 'Blue bottle is a great Californian coffe company originating in Berkeley', category_id: '4', phone_number: '9547786633', password: '12345', password_confirmation: '12345'}])



rate = Rate.create([
  {coinbase_rate:0,bitfinex_rate:0,okcoin_rate:0,average_rate:0}
  ])
