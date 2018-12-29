require "administrate/base_dashboard"

class CouponDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    restaurant: Field::BelongsTo,
    id: Field::Number,
    start_date: Field::DateTime,
    end_date: Field::DateTime,
    start_time: Field::DateTime,
    end_time: Field::DateTime,
    value: Field::Number,
    coupon_detail: Field::String,
    two_week_coupon: Field::Boolean,
    month_coupon: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :restaurant,
    :id,
    :start_date,
    :end_date,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :restaurant,
    :id,
    :start_date,
    :end_date,
    :start_time,
    :end_time,
    :value,
    :coupon_detail,
    :two_week_coupon,
    :month_coupon,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :restaurant,
    :start_date,
    :end_date,
    :start_time,
    :end_time,
    :value,
    :coupon_detail,
    :two_week_coupon,
    :month_coupon,
  ].freeze

  # Overwrite this method to customize how coupons are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(coupon)
  #   "Coupon ##{coupon.id}"
  # end
end
