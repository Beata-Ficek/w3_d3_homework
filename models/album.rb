require('pg')

class Album

 attr_accessor :title, :genre, :artist_ID

 def initialize (options)
   @title = options ['title']
   @genre = options ['genre']
   @artist_id = options ['artist_id'].to_i if options ['artist_id']
 end

 def save()
   sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) returning ID"
   values = [@title, @genre, @artist_id]
   result = SqlRunner.run(sql, values)
   @id = result[0]["id"].to_i
 end


def self.all()
  sql = "SELECT * FROM albums"
  albums = SqlRunner.run(sql)
  return albums.map {|album_hash| Album.new(album_hash)}
end







end



















# def save()
#   sql = "INSERT INTO pizza_orders
#   (
#     customer_id,
#     topping,
#     quantity
#   ) VALUES
#   (
#     $1, $2, $3
#   )
#   RETURNING id"
#   values = [@customer_id, @topping, @quantity]
#   result = SqlRunner.run(sql, values)
#   @id = result[0]["id"].to_i
# end



























 # def initialize(options)
 #   @artist_id = options['customer_id'].to_i
 #   @topping = options['topping']
 #   @quantity = options['quantity'].to_i
 #   @id = options['id'].to_i if options['id']
 # end

#  def customer
# # return a customer for this pizza order
#   sql = "SELECT * FROM customers WHERE id = $1"
#   values = [ @customer_id ]
#   customers = SqlRunner.run(sql, values)
#   customer_hash = customer.first
#   customer = Customer.new(customer_hash)
#   return customer
# end


 #
 # def update()
 #   sql = "
 #   UPDATE pizza_orders SET (
 #     customer_id,
 #     topping,
 #     quantity
 #   ) =
 #   (
 #     $1,$2, $3
 #   )
 #   WHERE id = $4"
 #   values = [@customer_id, @topping, @quantity, @id]
 #   SqlRunner.run(sql, values)
 # end
 #
 # def delete()
 #   sql = "DELETE FROM pizza_orders where id = $1"
 #   values = [@id]
 #   SqlRunner.run(sql, values)
 # end
 #
 # def self.find(id)
 #   sql = "SELECT * FROM pizza_orders WHERE id = $1"
 #   values = [id]
 #   results = SqlRunner.run(sql, values)
 #   order_hash = results.first
 #   order = PizzaOrder.new(order_hash)
 #   return order
 # end
 #
 # def self.delete_all()
 #   sql = "DELETE FROM pizza_orders"
 #   SqlRunner.run(sql)
 # end
 #
 # def self.all()
 #   sql = "SELECT * FROM pizza_orders"
 #   orders = SqlRunner.run(sql)
 #   return orders.map { |order| PizzaOrder.new(order) }
 # end

# end
