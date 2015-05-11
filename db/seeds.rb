require_relative 'seeder'

# clearing previous seed data
User.delete_all
UserProfile.delete_all
Product.delete_all
ProductCategory.delete_all
Order.delete_all
Address.delete_all
OrderProduct.delete_all
CreditCard.delete_all

multiplier = 1 # increase for larger seeds

# calling all data creation methods inside seeder
create_users(150 * multiplier)
create_profiles(100 * multiplier)
create_categories(6 * multiplier)
create_products(20 * multiplier)
create_additional_addresses(25 * multiplier)
shuffle_billing_address(25 * multiplier)
create_orders_over_time(100 * multiplier)
populate_carts(25 * multiplier)
