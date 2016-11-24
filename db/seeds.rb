Image.create!([
  {product_id: 6, url: "http://www.valyriansteel.com/shop/images/uploads/hammer.jpg"},
  {product_id: 1, url: "http://www.valyriansteel.com/shop/images/uploads/VS0003D%20retouched%20sword%20on%20plaque.jpg"},
  {product_id: 18, url: "http://www.valyriansteel.com/shop/images/uploads/arakh1.jpg"},
  {product_id: 17, url: "http://www.valyriansteel.com/shop/images/uploads/Longclaw%20on%20Display.jpg"},
  {product_id: 7, url: "http://www.valyriansteel.com/shop/images/uploads/VS5%20Photo%201.jpg"},
  {product_id: 10, url: "http://www.valyriansteel.com/shop/images/uploads/catspaw-main.jpg"},
  {product_id: 2, url: "http://www.valyriansteel.com/shop/images/uploads/VS0114%20Sword%20on%20plaque.jpg"},
  {product_id: 5, url: "http://www.valyriansteel.com/shop/images/uploads/good-obsidian-sm.jpg"},
  {product_id: 8, url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlLsVnGvtIaJeLGw0bdI0YUpJXr5MTnBlh2rfZ1tWQ7hupPxZ_fg"},
  {product_id: 1, url: "http://img02.deviantart.net/ddd4/i/2016/005/8/4/ice__ned_stark_s_sword_got__by_chibiidrawer-d9mxo6r.jpg"},
  {product_id: 1, url: "http://www.valyriansteel.com/shop/images/uploads/ice2.jpg"}
])
Product.create!([
  {name: "Ice", price: "300.0", description: "Stark Great Sword", instock: nil, item_class: "weapon", supplier_id: 1},
  {name: "Hammer", price: "270.0", description: "Roberts Hammer", instock: nil, item_class: "weapon", supplier_id: 1},
  {name: "Arakh", price: "250.0", description: "Khal Drogo's Arakh", instock: nil, item_class: "weapon", supplier_id: 1},
  {name: "Needle", price: "190.0", description: "Arya Starks' sword ", instock: nil, item_class: "weapon", supplier_id: 1},
  {name: "Catspaw Blade", price: "230.0", description: "Catspaw Blade", instock: nil, item_class: "weapon", supplier_id: 1},
  {name: "Longclaw", price: "250.0", description: "Jon Snow's Sword", instock: nil, item_class: "weapon", supplier_id: 1},
  {name: "Oathkeeper", price: "270.0", description: "Oathkeeper", instock: nil, item_class: "weapon", supplier_id: 1},
  {name: "Dragonglass", price: "220.0", description: "Dragon Glass daggers", instock: nil, item_class: "weapon", supplier_id: 1},
  {name: "Hand", price: "1000.0", description: "Jaime's Hand", instock: nil, item_class: "weapon", supplier_id: 1}
])
Supplier.create!([
  {name: "Valyrian Steel", email: "info@valyriansteel.com", phone: "18002222222"}
])
