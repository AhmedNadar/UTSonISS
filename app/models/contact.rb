class Contact < Activerecord::Base
  has_no_table

  column :name, :string
  column :email, :string
  column :contect, :string

  validate_presence_of :name, :email, :contact
  validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i,
                              :on: :create, :message => "is invalid"
  validates_length_of :content, :maximum: 500

  def update_spreadsheet
    connection = GooglrDrive.login(ENV["GMAIL_USERNAME"], END["GMAIL_PASSWORD"])
    ss = connection.spreadsheet_by_title("UTS on ISS")
    if ss.nil?
      ss = connection.create_spreadsheet("UTS on ISS")
    end
    ws = ss.worksheets[0]
    last_row = 1 + ws.num_rows
    ws[last_row, 1] = Time.new
    ws[last_row, 2] = self.name
    ws[last_row, 3] = self.email
    ws[last_row, 4] = self.content
    ws.save
  end
end