def create_wine(new_attributes = {})
  default_attributes = {:wine_type => 'Pinot Grigio',
                        :wine_name => 'Fat bastard',
                        :wine_fruit_taste => 'peach',
                        :wine_sweetness => '5',
                        :wine_body => 'full',
                        :wine_vintage => '2004',
                        :wine_abv => '13%',
                        :wine_overall_rating => '6'}
  attributes = default_attributes.merge(new_attributes)
  Wine.create!(attributes)
end

def create_collection(new_attributes = {})
  default_attributes = {:collection_name => 'Loved it'}
  attributes = default_attributes.merge(new_attributes)
  Collection.create!(attributes)
end

def create_user(new_attributes = {})
  default_attributes = {:email => 'keri@gmail.com',
                        :password => 'password',
                        :password_confirmation => 'password'}
  attributes = default_attributes.merge(new_attributes)
  User.create(attributes)
end