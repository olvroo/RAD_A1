# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Collection.create([
    {
        :name => "Men",
        :total_items => 1
    },
    {
        :name => "Women",
        :total_items => 1
    },
    {
        :name => "Kids",
        :total_items => 1
    },
    {
        :name => "New Arrivals",
        :total_items => 3
    }
])

Item.create({
  :name => "Black Knit Sweater",
  :category => "Men",
  :price => 29.99,
  :image => "https://images-na.ssl-images-amazon.com/images/I/71fLOEPjIdL._AC_SX679_.jpg", 
  :amount_saved => 5,
  :amount_bought => 12,
})

Item.create({
  :name => "White Flower Lace Dresses",
  :category => "Kids",
  :price => 34.99,
  :image => "https://images-na.ssl-images-amazon.com/images/I/71iaSGchQXL._AC_SX569_.jpg", 
  :amount_saved => 5,
  :amount_bought => 2,
})

Item.create({
  :name => "Pink Long Sleeve Dress",
  :category => "Women",
  :price => 31.99,
  :image => "https://images-na.ssl-images-amazon.com/images/I/818msStA7pL._AC_SY741_.jpg", 
  :amount_saved => 11,
  :amount_bought => 2,
})

Item.create({
  :name => "White Yeezy",
  :category => "Men",
  :price => 99.99,
  :image => "https://m.media-amazon.com/images/I/51z0lIeOLdL._AC_UL320_.jpg",
  :amount_saved => 5,
  :amount_bought => 5,
})


Item.create({
  :name => "Green V-Neck Sweater",
  :category => "Women",
  :price => 49.99,
  :image => "https://m.media-amazon.com/images/I/81HkzjLCWAL._AC_UL320_.jpg",
  :amount_saved => 1,
  :amount_bought => 2,
})

TwitterUser.create({
    :twitter_id  => "fiuwehfuhwi3234",
    :username  => "abc_123",
    :email  => "abc@123.com",
    :password => "UmFpbHMyMDIx"
})

EmailUser.create({
    :username  => "test1234",
    :email  => "test@1234.com",
    :password => "UmFpbHMyMDIx"
})

EmailUser.create({
    :username  => "RAD",
    :email  => "rad2021rmit@gmail.com",
    :password => "UmFpbHMyMDIx"
})

SavedItem.create({
    :item_id => 1,
    :user_id => 10000
})

SavedItem.create({
    :item_id => 2,
    :user_id => 10000
})

Newsletter.create({
    :email => "test@1234.com"
})
