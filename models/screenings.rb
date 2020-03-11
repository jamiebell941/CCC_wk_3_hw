class Screening

attr_reader :id, :film_id
attr_accessor :seats, :show_time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @seats = options['seats']
    @show_time = options['show_time']
  end

  def update()
    sql = "UPDATE screenings SET (film_id, seats, show_time) = ($1, $2, $3) where id = $4"
    values = [@film_id, @seats, @show_time, @id]
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO screenings (film_id, seats, show_time) values ($1, $2, $3) RETURNING id"
    values = [@film_id, @seats, @show_time]
    showings = SqlRunner.run(sql, values).first
    @id = showings['id'].to_i
  end

  def sell_ticket()
   @seats -= 1
   update()
 end

  def self.all()
      sql = "SELECT * FROM screenings"
      screenings = SqlRunner.run(sql)
      return screenings.map {|screening| Screening.new(screening)}
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end




end
