json.extract! restaurant, :id, :created_at, :updated_at,\
:name, :address, :description, :zipcode, :latitude, :longitude,\
:max_people, :start_date, :end_date, :phone_number, :website_link,\
:table_number

json.url restaurant_url(restaurant, format: :json)
