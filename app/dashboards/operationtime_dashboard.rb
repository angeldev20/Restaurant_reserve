require "administrate/base_dashboard"

class OperationtimeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    restaurant_id: Field::Number,
    day: Field::String,
    open_time: Field::DateTime,
    close_time: Field::DateTime,
    is_closed: Field::Boolean,
    is_holiday: Field::Boolean,
    special_message: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :restaurant_id,
    :day,
    :open_time,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :restaurant_id,
    :day,
    :open_time,
    :close_time,
    :is_closed,
    :is_holiday,
    :special_message,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :restaurant_id,
    :day,
    :open_time,
    :close_time,
    :is_closed,
    :is_holiday,
    :special_message,
  ].freeze

  # Overwrite this method to customize how operationtimes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(operationtime)
  #   "Operationtime ##{operationtime.id}"
  # end
end
