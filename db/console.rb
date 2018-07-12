require_relative("../models/artist")
require_relative("../models/album")

artist1 = Artist.new({'name' => 'Moloko'})
artist2 = Artist.new({'name' => 'RHCP'})

artist1.save()
artist2.save()

album1 = Album.new({'title' => 'Things to make and do',
                    'genre' => 'Jazzy Trip Hop',
                    'artist_id' => artist1.id})
album2 = Album.new({'title' => 'By the Way',
                    'genre' => 'Funk Rock',
                    'Artist_ID' => artist2.id})

album1.save()
album2.save()

# p Artist.all()
# p Album.all()

p artist1.albums_by_artist()





























# require_relative("../models/album")
# require_relative("../models/artist")
#test delete_all
# Customer.delete_all()
#
# artist1 = Artist.new({'name' => 'Moloko'})
# artist2 = Artist.new({'name' => 'Red Hot Chilli Peppers'})
# # customer2 = Customer.new({'name' => 'Tony'})
# artist1.save()
# artist2.save()
# # test update
# customer1.name = "Mellinda"
# customer1.update()
# #test delete
# customer2.delete()
# #test all
# p Customer.all()
#
# pizza_order1 = PizzaOrder.new({'customer_id' => customer1.id,'topping' => 'Tropicana','quantity' => '3'})
# pizza_order2 = PizzaOrder.new({'customer_id' => customer1.id,'topping' => 'Tropicana','quantity' => '3'})
#
# pizza_order1.save()
# pizza_order2.save()
# # test update
# pizza_order1.topping = "Diabolla"
# pizza_order1.update()
# #test delete
# # pizza_order2.delete()
# #test all
# p PizzaOrder.all()
#
# p pizza_order1.customer()
# customer1.orders()
# p customer1.pizza_orders()
# # because it's an array yu can add .first.customer.pizza_orders().first.customer
# # print to check
