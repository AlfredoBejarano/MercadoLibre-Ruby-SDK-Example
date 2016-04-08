# This class prints the results of the query
class PrintItems
  def print(items)
    @items = items
    # Just for counting how many results we got
    querysize = 0
    @items.each do |item|
      # Let's create (another, *sigh*) hash for every result
      # Product location is another *sigh* HASH!!!!, so yeah,
      # SPOILER ALERT, we're creating another hash
      chash = Hash.try_convert(item)
      locationhash = Hash.try_convert(chash['address'])
      print_table_results(chash, locationhash)
      # Got ya!
      querysize += 1
    end
    # Finally, print how many items we found
    puts "Productos en la busqueda: #{querysize}"
  end

  def print_table_results(chash, locationhash)
    # Now print all the results
    puts "ID del producto #{chash['id']}"
    puts "Nombre del producto #{chash['title']}"
    puts "Precio: $#{chash['price']}.00 #{chash['currency_id']}"
    puts "Ubicacion: #{locationhash['state_name']}"
    puts "Condición: #{chash['condition']}"
    puts '==========='
  end
end
