class Project < ActiveRecord::Base

	belongs_to :category
	has_many :students, dependent: :destroy
	accepts_nested_attributes_for :students, allow_destroy: true

	validates_presence_of :name, :description

	default_scope -> { order('created_at DESC') }
  
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def should_generate_new_friendly_id?
    name_changed?
  end

end
