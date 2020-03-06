class Film

attr_reader :id
attr_accessor :title, :price

  def  initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price) values ($1, $2) RETURNING id"
    values = [@title, @price]
    films = SqlRunner.run(sql, values).first
    @id = films['id'].to_i
  end

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) where id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return films.map {|film| Film.new(film)}
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end
