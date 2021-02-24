# task_3
START_CAPITAL = 50
TOWN_PRICE = [
  [ 1, 'Lubeck',
    { salt: 20,
      fish: 50,
      cloth: 60,
      copper: 36,
      furs: 96,
    }
  ],
  [ 2, 'Reval',
    { salt: 35,
      fish: 50,
      cloth: 40,
      copper: 60,
      furs: 45,
    }
  ],
  [ 3, 'Bergen',
    { salt: 62,
      fish: 15,
      cloth: 18,
      copper: 82,
      furs: 54,
    }
  ]
]
@result = []

def way_to_success(start, cash)
  puts "Run #{start}"
  puts "Initial coins: #{cash}"

  first_max_profit_1_2 = []
  first_max_profit_2_3 = []

  TOWN_PRICE.select do |n| 
    if n[0] == start
      @city_1_num  = n[0]     # город 1
      @city_1_name = n[1]     # город 1
      @products_1_city = n[2] # укладываем продукты 1 города
    end
  end

  TOWN_PRICE.each do |c2|
    unless c2[0] == @city_1_num # Выбираем для сравнения не первый город
      c2[2].each do |prod, coins|
        if @products_1_city[prod] <= cash                # проверяем хватит ли денег в этом городе
          profit_1 = coins - @products_1_city[prod].to_i # находим прибыль по одинаковым продуктам
          if profit_1 > first_max_profit_1_2[3].to_i     # если результат больше предыдущего, то перезаписываем новым
            @city_2_num = c2[0]   # № города 2
            @city_2_name = c2[1]  # Назв города 2

            first_max_profit_1_2 = [
              prod,                   # 0 продукт
              @products_1_city[prod], # 1 цена за шт при покупке
              coins,                  # 2 цена за шт при продаже
              profit_1,               # 3 прибыль за 1 шт
              amount_1 = (cash / @products_1_city[prod].to_i), # 4 куплено штук
              remain_1 = (cash % @products_1_city[prod].to_i), # 5 остаток налички
              (amount_1 * coins + remain_1)                   # 6 итоговая сумма приб и нала
            ]
          end
        end
      end
    end
  end

  puts "Buy #{first_max_profit_1_2[0]} for #{first_max_profit_1_2[1]} coins in #{@city_1_name}. #{first_max_profit_1_2[5]} coins left."
  puts "Sell #{first_max_profit_1_2[0]} for #{first_max_profit_1_2[2]} coins in #{@city_2_name}. #{first_max_profit_1_2[6]} coins left."

  cash2 = first_max_profit_1_2[6]
  TOWN_PRICE.select do |n| 
    if n[0] == @city_2_num
      @products_2_city = n[2] # укладываем продукты 2 города
    end
  end

  TOWN_PRICE.each do |c3|
    if c3[0] != @city_1_num && c3[0] != @city_2_num # выбираем последний город
      @city_3_num  = c3[0]  # № города 3
      @city_3_name = c3[1]  # Назв города 3

      c3[2].each do |prod3, coins3|         # перебираем продукты 3 города
        if @products_2_city[prod3] <= cash2 # проверяем хватит ли кэша в этом городе на этот продукт

          profit_2 = coins3 - @products_2_city[prod3] # находим прибыль по одинаковым продуктам
          if profit_2 > first_max_profit_2_3[3].to_i  # если результат больше предыдущего, то перезаписываем новым
            
            first_max_profit_2_3 = [
              prod3,                   # 0 продукт
              @products_2_city[prod3], # 1 цена за шт при покупке
              coins3,                  # 2 цена за шт при продаже
              profit_2,                # 3 прибыль на 1 шт
              amount_2 = (cash2 / @products_2_city[prod3].to_i),  # 4 куплено штук
              remain_2 = (cash2 % @products_2_city[prod3].to_i),  # 5 остаток налички
              (amount_2 * coins3 + remain_2)                      # 6 итоговая сумма приб и нала
            ]
          end
        end
      end
    end
  end
  puts "Buy #{first_max_profit_2_3[0]} for #{first_max_profit_2_3[1]} coins in #{@city_2_name}. #{first_max_profit_2_3[5]} coins left."
  puts "Sell #{first_max_profit_2_3[0]} for #{first_max_profit_2_3[2]} coins in #{@city_3_name}."
  puts "Final coins: #{first_max_profit_2_3[6]}"
  puts
  @result << first_max_profit_2_3[6]
end

(1..3).each do |city| 
  way_to_success(city, START_CAPITAL)
end

puts "Max result: #{@result.max} coins."