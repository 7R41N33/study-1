module Exercise
  module Arrays
    class << self
      def replace(array)
        max = array.max
        array.map { |elem| (elem > 0) ? max : elem }
      end

      def search(array, query)
        return -1 if array.empty?

        search_iter(array, query, 0, array.size - 1)
      end

      def search_iter(array, query, left, right)
        mid = (left + right) / 2

        return mid if array[mid] == query
        return -1 if left == right

        if array[mid] > query
          right = mid
        else
          left = mid + 1
        end

        search_iter(array, query, left, right)
      end
    end
  end
end
