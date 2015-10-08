class PrintItems
  def Print(items)
    @items = items
    #Just for counting how many results we got
    querysize = 0
    @items.each do |item|
      #Let's create (another, *sigh*) hash for every result
      #Product location is another *sigh* HASH!!!!, so yeah, SPOILER ALERT, we're creating another hash
      chash = Hash.try_convert(item)
      locationhash = Hash.try_convert(chash["address"])
      #Now print all the results
      puts "ID del producto #{chash["id"]}"
      puts "Nombre del producto #{chash["title"]}"
      puts "Precio: $#{chash["price"]}.00 #{chash["currency_id"]}"
      puts "Ubicacion: #{locationhash["state_name"]}"
      puts "Condición: #{chash["condition"]}"
      puts "==========="
      #Got ya!
      querysize += 1
      #Now empty everything because another item was found!
      chash = nil
      locationhash = nil
    end
    #Finally, print how many items we found
    puts "Productos en la busqueda: #{querysize}"
  end
end
