  # This is the virtual model in rails which has no database table associated with it
class Contact < ActiveRecord::Base
  # It uses has_no_table plugin to create virtual model
  # This can also be done using following lines of code
  #
  # def self.columns() @columns ||= []; end
  # def self.column(name, sql_type = nil, default = nil, null = true)
  #  columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
  # end

  has_no_table
  #insert the names of the form fields here
  column :name, :string
  column :email, :string
  column :content, :string

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :content
  validates_format_of   :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of   :content, maximum: 500

  def update_spreadsheet
    # create a connection with google drive
    # The follwing line donsn't work. Writing explicit credentials will do the trick.
    # Not safe but it works,
    # connection = GoogleDrive.login_with_oauth(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"])

    #
    client = Google::APIClient.new
    auth = client.authorization

    auth.client_id = ENV["CLIENT_ID"]
    auth.client_secret = ENV["CLIENT_SECRET"]
    # access_token = ENV["ACCESS_TOKEN"]

    auth.scope =
        "https://docs.google.com/feeds/" +
        "https://www.googleapis.com/auth/drive " +
        "https://spreadsheets.google.com/feeds/"

    auth.redirect_uri = "http://localhost:9000/"
    auth.refresh_token = ENV["ACCESS_TOKEN"]
    # print("1. Open this page:\n%s\n\n" % auth.authorization_uri)
    # print("2. Enter the authorization code shown in the page: ")
    # auth.code = $stdin.gets.chomp
    # auth.fetch_access_token!
    # access_token = auth.access_token

    # system'clear'
    # print "Save your access token\n\n"
    # print access_token
    # print "\nSave your refresh token\n\n"
    # print auth.refresh_token
    # print "DONE!!!"

auth.refresh!
auth.access_token

    #
    connection = GoogleDrive.login_with_oauth(access_token)
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