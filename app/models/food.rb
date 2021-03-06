class Food < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  attr_accessor :password

  enum answer: [:yes, :no, :depends]

  scope :alphabetical, -> { order('foods.title ASC') }

  before_save :should_generate_new_friendly_id?, if: :title_changed?
  
  private

    def should_generate_new_friendly_id?
      title_changed?
    end
    
end
