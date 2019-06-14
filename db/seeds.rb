<<<<<<< HEAD
5.times{
    s = ('a'..'z').to_a()
    n = [*1..52].sample()
    Store.new( name: s, description: s, location: n, latitude: n,user: n)
    puts Store.all
}

5.times{
    s = ('a'..'z').to_a()
    n = [*1..52].sample()
    User.new( title: s,name: s,password: n, phone: n,email: n,role: s,favorite_store: s)
    puts Store.all
}
=======
# frozen_string_literal: true
# Dish.create(name: 'rice', price: 0.5e3, prepare_time: '00:10:00', state: 1, store_id: 1)

User.create(title: 'mr.', name: 'steve', password: '111111', phone: '0923111111', email: 'example@gmail.com', role: 'admin')
User.create(name: 'Admin', password: '999999', phone: '9999999999', email: 'admin@email.com', role: 'admin')
User.create(name: 'Store Owner', password: '999999', phone: '2222222222', email: 'store@email.com', role: 'owner')
>>>>>>> b31f851d2fa190bb1d0c7cd70a4ac10ba7437d4a
