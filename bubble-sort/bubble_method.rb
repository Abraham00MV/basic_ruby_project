def bubble_sort(list)
  list_size = list.length
  loop do
    swapped = false
    (list_size - 1).times do |i|
      if list[i] > list[i + 1]
        list[i], list[i + 1] = list[i + 1], list[i]
        swapped = true
      end
    end

    break if !swapped
  end
  list
end