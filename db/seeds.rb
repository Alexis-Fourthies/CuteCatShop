# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Réinitilisation de toutes les tables, l'ordre importe sinon => foreign_key violation par la méthode destroy_all
ItemOrder.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('item_orders')
CartItem.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('cart_items')
Item.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('items')
Order.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('orders')
Cart.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('carts')
User.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('users')

# Création des instances pour chaque modèle
i=1
5.times do
  User.create(email: "user#{i}@yopmail.com", password:"123456")
  i+=1
end


# i=1
#   5.times do
#   Cart.create(user:User.find(i))
#   i+=1
# end
image_url = [ "https://i.ibb.co/VtrvjsK/gripsou.jpg",
  "https://i.ibb.co/5cxjcv9/gabriel.jpg",
  "https://i.ibb.co/87vqnzs/muskitty.jpg",
  "https://i.ibb.co/3fSPXmY/voldemort.jpg",]

description = [
   "Le chat ténébreux indépendant qui préfère faire comme si ses maîtres n'exister pas!! (produit photo)",
   "fêtard de la bande n'en rate pas une pour faire tourner ses maîtres en bourrique (produit photo)",
   "Le petit flemmard de la bande qui prend toute la place dans les lits (produit photo)",
   "Grand matou intimidant !! Poursuis une cible sans relache! (produit photo)",
   "Adorable rouquine qui tourne autour de nos assiettes (produit photo)",
   "Grand Cat entrepreneur travail plus que ses maîtres (produit photo)",]

title = ["Ginger",
   "Grey",
   "Muskitty",
    "Shadow",
    "Potato",
    "Alexis",
    "Nicolas",
    "Julien",
    "Karine",]        


i=1
  8.times do
  Item.create(title: title.sample, description: description.sample, price:10, image_url: image_url.sample )
  i+=1
end



20.times do
  CartItem.create(cart:Cart.find(rand(Cart.first.id..Cart.last.id)), item:Item.find(rand(Item.first.id..Item.last.id)))
end
# PAS DE CREATION DE cartitem par un seed car ces instances sont crées au moment où le user ajout un item dans son cart

# 20.times do
#   Order.create(user:User.find(rand(User.first.id..User.last.id)), total_amount:100)
# end
# PAS DE CREATION DE order par un seed car ces instances sont créées au moment où le user valide sa commande

# 20.times do
#   ItemOrder.create(item:Item.find(rand(Item.first.id..Item.last.id)), order:Order.find(rand(Order.first.id..Order.last.id)))
# end
# PAS DE CREATION DE itemorder par un seed car ces instances sont créées au moment où le user valide sa commande