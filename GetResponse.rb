require 'rubygems'
require 'json'
require 'meli'
require './PrintItems'
class GetResponse
  def GetItems(item)
    #Let's do a query
    @item = item
    #We need to create a Meli object, initialiazed with our application's ID and secret key
    #For this scope in particular, this data is useless as this GET call doesn't need permissions at all.
    #Look for scopes in developers.mercadolibre.com, in SDK Directory
    meli = Meli.new(1347329944464828,"NSlACWY5RtCDSJgi1AHcQBbU1054EQnt")
    #Now, the query, let's call the get method from meli
    response = meli.get("sites/MLM/search?q=#{@item}")
    #we got our response, so now let's parse it to JSON
    res = JSON.parse response.body
    #now let's make this JSON into a Ruby HASH
    reshash = Hash.try_convert(res)
    #reshash contains our response, but the actuall items founded are in another hash, stored in the key "results"
    items = reshash["results"]
    #We need to humanize the output of the result, so we are using the Printitem's Print method.
    printeditems = PrintItems.new
    printeditems.Print(items)
  end
end

item = GetResponse.new()
