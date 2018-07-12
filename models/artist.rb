require_relative('../db/sql_runner')

class Artist

  attr_reader :id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO artists
    (
      name
    ) VALUES
    (
      $1
    )
    RETURNING id"
    values = [ @name ]
    artists = SqlRunner.run(sql, values)
    @id = artists[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map {|artist_hash| Artist.new(artist_hash)}
  end

  def albums_by_artist()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    albums_by_artist = SqlRunner.run(sql, values)
    return albums_by_artist.map { |albums_hash| Album.new(albums_hash)  }
  end

end


# def pizza_orders
#   # return array of all PizzaOrder's (objects) for that customer
#   sql = "SELEFT * FROM pizza_orders WHERE customer_id = $1"
#   values = [@id]
#   SqlRunner.run(sql, values)
#   pizza_orders = SqlRunner.run(sql, values)
#   return pizza_orders.map{|pizza_order_hash| PizzaOrder.new(pizza_order_hash)}
#
# end

#   def update()
#     sql = "UPDATE customers SET
#       name
#     =
#       $1
#     WHERE id = $2"
#     values = [@name, @id]
#     SqlRunner.run(sql, values)
#   end
#
#   def delete()
#     sql = "DELETE FROM customers where id = $1"
#     values = [@id]
#     SqlRunner.run(sql, values)
#   end
#
#   def self.delete_all()
#     sql = "DELETE FROM customers"
#     SqlRunner.run(sql)
#   end
#
#   def self.all()
#     sql = "SELECT * FROM customers"
#     customers = SqlRunner.run(sql)
#     return customers.map { |customer_hash| Customer.new(customer_hash) }
#   end
# end
