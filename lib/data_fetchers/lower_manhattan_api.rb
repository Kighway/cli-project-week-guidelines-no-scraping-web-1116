class LowerManhattanAPI

  def get_data
     hash = JSON.parse(RestClient.get("https://data.cityofnewyork.us/api/views/cw88-qpsr/rows.json?accessType=DOWNLOAD"))
     hash["data"]
  end

end
