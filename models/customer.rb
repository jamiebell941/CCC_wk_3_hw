require('pg')

class Customer

attr_reader :id
attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) values ($1, $2) RETURNING id"
    values = [@name, @funds]
    customers = SqlRunner.run(sql, values).first
    @id = customers['id'].to_i
  end

  def update()
    sql = "UPDATE cusomters SET (name, funds) = ($1, $2) where id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films
      sql = "SELECT films.* FROM films INNER JOIN tickets
            ON tickets.film_id = films.id WHERE customer_id = $1"
      values = [@id]
      films = SqlRunner.run(sql, values)
       result= films.map { |film| Film.new(film)  }
       return result
  end

  def ticket_prices
      sql = "SELECT films.price FROM films INNER JOIN tickets ON film_id = films.id WHERE customer_id = $1"
      values = [@id]
      ticket_prices = SqlRunner.run(sql, values)
      return ticket_prices.map { |price| price['price'].to_i }
  end

  def buy_tickets()
    prices = self.ticket_prices()
    combined_fees = prices.sum
    return @funds - combined_fees
  end

  def tickets_bought()
    sql = "SELECT films.id FROM films INNER JOIN tickets ON tickets.film_id = films.id WHERE customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)
    result = tickets.map{|ticket| Film.new(ticket)}
    return result.count
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
  return customers.map {|customer| Customer.new(customer.film_id)}.count
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end



end
