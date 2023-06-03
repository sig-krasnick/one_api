class Quote < ApiAccess
  self.model_name = 'quote'

  def self.find_by_id(id, add_character=false)
    code, result = super(id)
    if add_character
      character_id = result['docs'].first['character']
      movie_id = result['docs'].first['movie']
      characters = get_characters(character_id)
      result['docs'].first['character'] = characters
      result['docs'].first['movie'] = get_movie(movie_id)
    end
    [code, result]
  end

  private 
  
  def self.get_characters(id)
    _code, response = Character.find_by_id(id)
    character_arr = []
    response['docs'].each{|q| character_arr <<  {id: q['_id'], name: q['name']}}
    character_arr
  end

  def self.get_movie(id)
    _code, movie = Movie.find_by_id(id)
    movie = movie['docs'].first
    movie_arr = [{id: movie['_id'], name: movie['name']}]
    movie_arr 
  end

  def self.set_model_name
    self.model_name = 'quote'
  end
end
