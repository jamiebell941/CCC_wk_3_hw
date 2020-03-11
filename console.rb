require('pry')
require('pg')
require_relative('models/film')
require_relative('models/customer')
require_relative('models/ticket')
require_relative('db/sql_runner.rb')
require_relative('models/screenings')

Ticket.delete_all
Customer.delete_all
Film.delete_all

film1 = Film.new ({ 'title' => 'In Bruges', 'price' => 790})
film1.save
film2= Film.new({ 'title' => 'Three Billboards', 'price' => 790})
film2.save
film3= Film.new({ 'title' => 'Seven Psychopaths', 'price' => 790})
film3.save

customer1 = Customer.new({'name' => 'Colin', 'funds' => 1000})
customer1.save
customer2 = Customer.new({'name' => 'Sam', 'funds' => 1600})
customer2.save
customer3 = Customer.new({'name' => 'Christopher', 'funds' => 3000})
customer3.save

ticket1 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id})
ticket1.save
ticket2 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id})
ticket2.save
ticket3 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer3.id})
ticket3.save
ticket4= Ticket.new({'film_id' => film1.id, 'customer_id' => customer3.id})
ticket4.save
ticket5= Ticket.new({'film_id' => film2.id, 'customer_id' => customer3.id})
ticket5.save

screening1= Screening.new({'film_id' => film2.id, 'seats' => 10, 'show_time' => 2100})
screening1.save
screening2= Screening.new({'film_id' => film1.id, 'seats' => 10, 'show_time' => 1900})
screening2.save
screening3= Screening.new({'film_id' => film3.id, 'seats' => 10, 'show_time' => 2300})
screening3.save



binding.pry
nil
