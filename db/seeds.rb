Cookie.destroy_all
Review.destroy_all
User.destroy_all



michelle = User.create(first_name:"Michelle", last_name:"Budzyna")
monkey = User.create(first_name:"Monkey", last_name:"Banana")
robin = User.create(first_name:"Robin", last_name:"Ayres")
dane = User.create(first_name:"Dane", last_name:"Ayres")


choco_chip = Cookie.create(name:"Chocolate Chip", description:"Chunks of Chocolate with nuts")
macadamia_nut = Cookie.create(name:"Macadamia Nut", description:"Macadamia nuts with caramel swirl and sea salt")
oreo = Cookie.create(name:"Oreo", description:"two chocolate wafers with a sweet creme filling in between")
snicker_doodle = Cookie.create(name:"Snickerdoodle", description: "a soft cinnamon flavored sugar cookie with carmel and sea salt" )



Review.create(user_id: michelle.id, cookie_id: choco_chip.id, review:"This was AMAZZZZING!", rating:10)
Review.create(user_id: monkey.id, cookie_id: oreo.id, review:"Ooo Ooo Ooo AHH AHH AHH!", rating:4)
Review.create(user_id: robin.id, cookie_id: macadamia_nut.id, review:"Eh I've had better...", rating:3)
Review.create(user_id: robin.id, cookie_id: oreo.id, review:"Love me some Oreo's!", rating:10)
Review.create(user_id: dane.id, cookie_id: snicker_doodle.id, review:"A bit salty for my taste, but good!", rating:7)
