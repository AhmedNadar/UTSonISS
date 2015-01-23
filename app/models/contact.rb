# This is the virtual model in rails which has no database table associated with it
require "google_drive_v0"

class Contact
  include ActiveModel::Model
  attr_accessor :name, :string
  attr_accessor :email, :string
  attr_accessor :content, :string

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :content
  validates_format_of   :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of   :content, maximum: 500

  def update_spreadsheet
    connection = GoogleDriveV0.login_with_oauth(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"])
    ss = connection.spreadsheet_by_title("UTS on ISS")
    if ss.nil? # check of spread sheet exisit if not, creat one below
      ss = connection.create_spreadsheet("UTS on ISS")
    end
    ws = ss.worksheets[0] # use only one spread sheet to save our data in it
    last_row = 1 + ws.num_rows
    ws[last_row, 1] = Time.new
    ws[last_row, 2] = self.name
    ws[last_row, 3] = self.email
    ws[last_row, 4] = self.content
    ws.save
  end
end