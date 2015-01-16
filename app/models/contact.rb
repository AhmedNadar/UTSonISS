class Contact < Activerecord::Base
  has_no_table

  column :name, :string
  column :email, :string
  column :contect, :string

  validate_presence_of :name, :email, :contact
  validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i,
                              :on: :create, :message => "is invalid"
  validates_length_of :content, :maximum: 500
end