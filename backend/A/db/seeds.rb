items = [
  [ 1, "apple", 98],
  [ 2, "potato", 150],
  [ 3, "coke", 350]
]

items.each do |id, name, price| 
  Item.create(id:id, price:price, name:name)
end