# frozen_string_literal: true
# Dish.create(name: 'rice', price: 0.5e3, prepare_time: '00:10:00', state: 1, store_id: 1)

User.create(title: 'mr.', name: 'steve', password: '111111', phone: '0923111111', email: 'example@gmail.com', role: 'admin')
User.create(name: 'Admin', password: '999999', phone: '9999999999', email: 'admin@email.com', role: 'admin')
User.create(name: 'Store Owner', password: '999999', phone: '2222222222', email: 'store@email.com', role: 'owner')
