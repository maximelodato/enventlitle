class Event < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :duration, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  has_many :registrations, dependent: :destroy
  belongs_to :user

  def registrations_count
    registrations.count
  end
end
