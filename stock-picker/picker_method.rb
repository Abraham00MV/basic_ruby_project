def stock_picker(prices)
    max_profit = 0
    buy_day = 0
    sell_day = 0

    # Iterate through the buy prices (current day)
     (0...(prices.length - 1)).each do |i|
      # Iterate through  the sell prices (days following)
      ((i + 1)...prices.length).each do |j|
        profit = prices[j] - prices[i]

    # if current profit is greater than the last profit, the current profit is the max profit
    # buy day and sell day turn into the better days to buy and sell
        if profit > max_profit
          max_profit = profit
          buy_day = i
          sell_day = j
        end
      end
    end

    if max_profit > 0
      puts "Best buy day in day #{buy_day}, best sell day in day #{sell_day}. Total profit :  $#{max_profit}"
     [buy_day, sell_day]
    end

  end