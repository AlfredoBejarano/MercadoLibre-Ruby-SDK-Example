require './get_response'

# Class who asks the user what to search using MeLi SDK gem
class AskItemForQuery
  def ask
    # The user needs to find something, let's ask him what it is
    puts "¿Que quieres buscar en MercadoLibre México?"
    word = gets.chomp
    # Now, we send the users request to the query object
    doquery = GetResponse.new
    doquery.get_items(word)
  end
end
