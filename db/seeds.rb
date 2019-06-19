# frozen_string_literal: true
# Dish.create(name: 'rice', price: 0.5e3, prepare_time: '00:10:00', state: 1, store_id: 1)

User.create(title: 'mr.', name: 'steve', password: '111111', phone: '0923111111', email: 'example@gmail.com', role: 'admin')
User.create(name: 'Admin', password: '999999', phone: '9999999999', email: 'admin@email.com', role: 'admin')
User.create(name: 'Store Owner', password: '999999', phone: '2222222222', email: 'store@email.com', role: 'owner')

Store.create(name: 'C Shop', description: 'CCC', tel: '022222222', user_id: 2, location: '台北市')
Store.create(name: 'D Shop', description: 'DDD', tel: '022222222', user_id: 1, location: '台北市')
Store.create(name: 'Super store', description: '有肉有菜', tel: '022222222', user_id: 3, location: '台北市')

4.times { |n| Dish.create(name: "#{ n + 1 } 號大牛肉", price: "#{ n + 1 }99", store_id: 1) }
4.times { |n| Dish.create(name: "#{ n + 1 } 號大牛肉", price: "#{ n + 1 }99", store_id: 2) }
4.times { |n| Dish.create(name: "#{ n + 1 } 號大牛肉", price: "#{ n + 1 }99", store_id: 3) }

3.times { 4.times { |n| Transaction.create(total_price: "#{ (n + 1) * 100 }", description: "test traction#{ n + 1 }", pick_up_time: '', user_id: (n + 1), store_id: (n + 1)) } }
