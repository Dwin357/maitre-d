class Guest < ActiveRecord::Base


  belongs_to :event
  belongs_to :table
  has_many :pairings
  has_many :pairs, through: :pairings

  validates_presence_of :event
  validates_presence_of :first_name, message: "-- We require at least a first name for each guest."

  mount_uploader :image, ImageUploader

  def happy?(guest_ids)
    self.pair_ids.all? { |pair_id| guest_ids.include?(pair_id) }
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
