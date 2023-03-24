class Playlist < ApplicationRecord
  belongs_to :events

  def embed_url
    user_url = self.url
    regex = /\/(\w*)\?/
    match_data = regex.match(user_url)
    inner_url = match_data[1]
    return inner_url
  end
end
