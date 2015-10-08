require './GetResponse'
class AskItemForQuery
  def Ask
    #The user needs to find something, let's ask him what it is
    puts "¿Que quieres buscar en MercadoLibre México?"
    word = gets.chomp
    #Now, we send the users request to the query object
    doquery = GetResponse.new
    doquery.GetItems(word)
  end
end
