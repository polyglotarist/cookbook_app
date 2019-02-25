class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :prep_time, presence: true
  validates :prep_time, numericality: {only_integer: true, greater_than: 0}
  validates :ingredients, presence: true
  validates :directions, presence: true

  def ingredients_list
    ingredients.split(", ")
  end

  def directions_list
    directions.split(", ")
  end

  def friendly_created_at
    created_at.strftime("%b %d, %Y")
  end

  def friendly_prep_time
    hours = prep_time / 60
    minutes = prep_time % 60
    time_message = ""
    
    time_message += "#{hours} #{'Hour'.pluralize(hours)}" if hours > 0
    time_message += ", " if hours > 0 && minutes > 0
    time_message += "#{minutes} #{'Minute'.pluralize(minutes)}" if minutes > 0

    time_message
  end
end