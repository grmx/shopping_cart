Book.destroy_all

Book.create!([{
  title: "The Hobbit: The Enchanting Prelude to the Lord of the Rings",
  price: 8.39
},
{
  title: "The Martian",
  price: 6.50
},
{
  title: "Learn Ruby on Rails for Web Development",
  price: 7.77
}])

ShoppingCart::Delivery.create!([
  {
    name: 'UPS Ground',
    price: 5.00
  },
  {
    name: 'UPS Two Day',
    price: 10.00
  },
  {
    name: 'UPS One Day',
    price: 15.00
}])

puts "Created #{Book.count} books."
