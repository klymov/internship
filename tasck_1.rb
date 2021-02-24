# task_1
ORDER_ITEMS = [100.0, 112.2, 301.1]
DISCOUNTS   = [10.0, 0.0, 0.0]
# TOTAL_SUM   = 503.3

def total_sum(arr_items, arr_disconts)
  i = 0
  @sum = 0 
  arr_items.each do |price|
    @sum += price - arr_disconts[i]
    i += 1
  end
  @sum
end

puts total_sum(ORDER_ITEMS, DISCOUNTS)
