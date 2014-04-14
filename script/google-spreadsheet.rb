require "rubygems"
require "google_drive"
require 'oauth2'
require 'pry'

client_id = ""


client = OAuth2::Client.new(
	#Client ID and secret you can replace this with the company's ID any time
    '773454831340-p5p3fes04v33digp8cji43ug3qegdmfs.apps.googleusercontent.com', 'ebCluPdp7mJHLrCVzFQo99dk',
    :site => "https://accounts.google.com",
    :token_url => "/o/oauth2/token",
    :authorize_url => "/o/oauth2/auth")

binding.pry
puts client


auth_url = client.auth_code.authorize_url(
    # :redirect_uri => "http://localhost:8080/oauth/callback",
    :scope =>
        "https://docs.google.com/feeds/ " +
        "https://docs.googleusercontent.com/ " +
        "https://spreadsheets.google.com/feeds/")
# Redirect the user to auth_url and get authorization code from redirect URL.
auth_token = client.auth_code.get_token(
    'authorization_code')
session = GoogleDrive.login_with_oauth(auth_token)

puts session

# First worksheet of
# # https://docs.google.com/spreadsheet/ccc?key=pz7XtlQC-PYx-jrVMJErTcg
# ws = session.spreadsheet_by_key("0AqXnfkAnf49hdHRIbC1OejA0U3FZZV9JOXpqbVItSHc").worksheets[0]

# # Gets content of A2 cell.
# p ws[2, 1]  #==> "hoge"

# # Changes content of cells.
# # Changes are not sent to the server until you call ws.save().
# ws[2, 1] = "foo"
# ws[2, 2] = "bar"
# ws.save()

# # Dumps all cells.
# for row in 1..ws.num_rows
#   for col in 1..ws.num_cols
#     p ws[row, col]
#   end
# end

# # Yet another way to do so.
# p ws.rows  #==> [["fuga", ""], ["foo", "bar]]

# # Reloads the worksheet to get changes by other clients.
# ws.reload()