Faker::Config.locale = 'en-US'

def fake_user
  { name: Faker::Name.name, email: Faker::Internet.email }
end

def fake_product
  { title: Faker::Commerce.product_name, description: Faker::Lorem.sentence,
    price: Faker::Commerce.price, sku: Faker::Code.ean,
    category_id: ProductCategory.all.sample.id }
end

def fake_product_categories
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


