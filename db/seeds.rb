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