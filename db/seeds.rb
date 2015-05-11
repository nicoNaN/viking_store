require_relative 'seeder'

User.delete_all
UserProfile.delete_all
Product.delete_all
ProductCategory.delete_all
Order.delete_all
Address.delete_all
OrderProduct.delete_all
CreditCard.delete_all

multiplier = 2

create_users(100 * multiplier)
create_profiles(50 * multiplier)
create_categories(6 * multiplier)
create_products(20 * multiplier)
create_additional_addresses(25 * multiplier)
shuffle_addresses(25 * multiplier)
create_orders_over_time(75 * multiplier)
populate_carts(25 * multiplier)
