class Category < ActiveRecord::Base
	has_many :projects, dependent: :destroy

	validates_presence_of :name

	default_scope -> { order('created_at DESC') }
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  validates_presence_of :name, :slug

  def should_generate_new_friendly_id?
    name_changed?
  end
end
