def create_wine(new_attributes = {})
  click_on 'Loved it'
  click_on '+'
  select 'Pinot Grigio', :from => 'wine[wine_type]'
  fill_in 'wine[wine_name]', :with => 'Fat bastard'
  fill_in 'wine[wine_fruit_taste]', :with => 'peach'
  fill_in 'wine[wine_sweetness]', :with => '5'
  fill_in 'wine[wine_body]', :with => 'full'
  fill_in 'wine[wine_vintage]', :with => '2004'
  fill_in 'wine[wine_abv]', :with => '13%'
  fill_in 'wine[wine_overall_rating]', :with => '6'
  click_on 'Submit'
end