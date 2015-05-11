Faker::Config.locale = 'en-US'

def fake_user(join_date, up_date)
  { name: Faker::Name.name, email: Faker::Internet.email,
    created_at: join_date, updated_at: up_date }
end

def fake_product
  { title: Faker::Commerce.product_name, description: Faker::Lorem.sentence,
    price: Faker::Commerce.price, sku: Faker::Code.ean,
    category_id: ProductCategory.all.sample.id }
end

def fake_product_category
  { title: Faker::Commerce.department, description: Faker::Lorem.sentence }
end

def fake_address(profile_id: profile_id)
  { profile_id: profile_id, line_1: Faker::Address.street_address,
    line_2: Faker::Address.secondary_address, city: Faker::Address.city,
    state: Faker::Address.state_abbr, zip: Faker::Address.zip_code }
end

def fake_credit_card(user_profile_id: user_profile_id, name: name)
  { profile_id: user_profile_id, name_on_card: name,
    exp_date: Faker::Date.between(Date.today, 2.years.from_now),
    csc: Faker::Number.number(3), card_number: Faker::Business.credit_card_number }
end

def create_profile(user: user)
  new_profile = UserProfile.create

  new_profile.update(phone_number: Faker::PhoneNumber.phone_number)

  ad = Address.create fake_address(profile_id: new_profile.id)
  new_profile.update(shipping_address_id: ad.id)
  new_profile.update(billing_address_id: ad.id)

  cc = CreditCard.create fake_credit_card(user_profile_id: new_profile.id, name: user.name)
  new_profile.update(cc_id: cc.id)

  cart = Order.create(
    user_id: new_profile.id, in_cart: true,
  )
  new_profile.update(cart_id: cart.id)
end

def create_users(amount)
  amount.times do
    join_date = Faker::Time.between(1.years.ago, Time.now)
    # defined globally as $dinner_with_my_man_on_a_g5
    up_date = Faker::Time.between(join_date, Time.now)
    User.create fake_user(join_date, up_date)
  end
end

def create_profiles(amount)
  User.all.sample(amount).each do |user|
    create_profile(user: user)
    user.update(profile_id: UserProfile.last.id)
  end
end

def create_additional_addresses(amount)
  amount.times do
    profile = UserProfile.all.sample
    Address.create fake_address(profile_id: profile.id)
  end
end

def shuffle_addresses(amount)
  UserProfile.all.sample(amount).each do |user|
    user.update(billing_address_id: Address.all.sample.id)
  end
end

def create_categories(amount)
  amount.times do
    ProductCategory.create fake_product_category
  end
end

def create_products(amount)
  amount.times do
    Product.create fake_product
  end
end

def create_orders_over_time(amount)
  amount.times do
    profile = UserProfile.all.sample
    created = Faker::Time.between(1.years.ago, Time.now)
    updated = Faker::Time.between(created, Time.now)
    Order.create(
      user_id: profile.id,
      shipping_address_id: profile.shipping_address_id,
      billing_address_id: profile.billing_address_id,
      cc_id: profile.cc_id, in_cart: false,
      created_at: created, updated_at: updated
    )
    add_products(order_id: Order.last.id)
  end
end

def add_products(order_id: order_id)
  2.times do
    OrderProduct.create(
      order_id: order_id,
      product_id: Product.all.sample.id,
      product_amount: rand(5)
    )
  end
end

def populate_carts(amount)
  amount.times do
    profile = UserProfile.all.sample
    cart_id = profile.cart_id
    add_products(order_id: cart_id)
  end
end
