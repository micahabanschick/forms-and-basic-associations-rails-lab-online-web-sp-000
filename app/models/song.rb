class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def notes_1_content
    self.notes_1 ? self.notes_1.content : nil
  end

  def notes_1_content=(content)
    self.notes_1 = Note.find_or_create_by(content: content)
  end

  # def genre_name
  #   self.genre ? self.genre.name : nil
  # end
  #
  # def genre_name=(name)
  #   self.genre = Genre.find_or_create_by(name: name)
  # end

  def genre_ids=(ids)
     ids.each do |id|
       genre = Genre.find(id)
       self.genres << genre
     end
  end

end
