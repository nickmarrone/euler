# class Fibonacci
#   def initialize
#     @results = []
#   end

#   def [](index)
#     fill_up_to(index) if @results.length - 1 <
#   end

#   private

#     def fill_up_to(index)

#     end
# end

class FibonacciSequence
  def next
    result = if @last1.nil? || @last2.nil?
      1
    else
      @last1 + @last2
    end

    @last1 = @last2
    @last2 = result
    result
  end
end
