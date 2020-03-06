require_relative('film')
require_relative('customer')
require_relative('../db/sql_runner')
require('pg')

class Ticket

attr_reader :id
attr_accessor :film_id, :customer_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @customer_id = options['customer_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (film_id, customer_id) values ($1, $2) RETURNING id"
    values = [@film_id, @customer_id]
    tickets = SqlRunner.run(sql, values).first
    @id = tickets['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (film_id, customer_id) = ($1, $2) where id = $3"
    values = [@film_id, @customer_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    return tickets.map {|ticket| Ticket.new(ticket)}
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
