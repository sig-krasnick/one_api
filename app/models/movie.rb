class Movie < ApiAccess
  self.model_name = 'movie'

  def self.find_by_id(id, add_quotes=false)
    code, result = super(id)
    if add_quotes
      quotes = get_quotes(id)
      result['docs'].first['quotes'] = quotes
    end
    [code, result]
  end

  private 

  def self.get_quotes(id)
    resource = "#{self.model_name}/#{id}/quote"
    code, @quotes = get_response(resource)
    quote_arr = []
    @quotes['docs'].each{|q| quote_arr <<  {id: q['id'], dialog: q['dialog'], character: q['character']}}
    quote_arr
  end

  def self.set_model_name
    self.model_name = 'movie'
  end
end
