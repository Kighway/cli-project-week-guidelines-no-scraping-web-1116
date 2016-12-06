class LowerManhattanCLI

  def call
    welcome

    while true
      input = get_input
      break if input == "exit"
      store_array = LowerManhattanAPI.new.get_data
      stores_in_zipcode = store_by_zip(input, store_array)
      while stores_in_zipcode == []
        puts "Zipcode invalid, please try again."
        input = get_input
        stores_in_zipcode = store_by_zip(input, store_array)
      end
      display_stores(stores_in_zipcode)
      while true
        store_number = get_store_number
        break if store_number == "exit"
        store_number = store_number.to_i
        while store_number <= 0 || store_number > stores_in_zipcode.length
          puts "Invalid store number, please try again."
          store_number = get_store_number
          break if store_number == "exit"
          store_number = store_number.to_i
        end
        break if store_number == "exit"
        display_chosen_store(store_number, stores_in_zipcode) unless store_number==0
      end
    end

  end

  def welcome
    puts "Welcome to Lower Manhattan"
  end

  def get_input
    puts "What zip code would you like to visit? If you're done, type in 'exit.'"
    gets.strip.downcase
  end

  def store_by_zip (input, store_array)
    store_array.select do |store|
      store[13] == input
    end
  end

    def display_stores (stores_in_zipcode)
    stores_in_zipcode.each_with_index do |store_info, index|
      puts "#{index+1}. #{store_info[8]}"
    end
  end

  def get_store_number
    puts "Which store's address would you like? Enter its' number, or enter 'exit' when you're done."
    gets.strip.downcase
  end

  def display_chosen_store(store_number, stores_in_zipcode)
    chosen_store = stores_in_zipcode[store_number-1]
    puts "You chose #{chosen_store[8]}."
    puts "The address is:"
    puts "#{chosen_store[9]} #{chosen_store[10]}"
    puts "#{chosen_store[11]}, #{chosen_store[12]} #{chosen_store[13]}"
  end

end
