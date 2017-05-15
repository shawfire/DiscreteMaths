
require 'benchmark'

#  0.970000   0.020000   0.990000 (  0.986561)
def sum_multiples1(numbers, mutiple)
  numbers
    .reject{ |n| n % mutiple > 0}
    .reduce(:+)
end

#  0.770000   0.010000   0.780000 (  0.770945)
def sum_multiples2(numbers, mutiple)
  sum = 0
  for num in numbers
    if num % mutiple == 0
      sum += num
    end
  end
  sum
end

#numbers = (1..1_000).map{rand(100_000)} #
numbers = (1..10_000_000).map{rand(100_000)}
mutiple = 2

puts Benchmark.measure {
  puts sum_multiples1(numbers, mutiple)
}

puts Benchmark.measure {
  puts sum_multiples2(numbers, mutiple)
}

JSON
  .parse
  .sort { |a, b| b["date"] <=> }

def find_friend(&b)
  friends = JSON.parse(File.read("friends.json"))
  sorted = yield friends
end

# first class functions

find_friend do |fs|
  fs.sort { }
end

# open classes duck typing
class String
  def excited(amount=1)
    ""
  end
end

3.days.ago


class MonthlyData
  Date::MONTHNAMES.each_with_index do |mn, i|
    define_method(mn.downcase) do
      fetch_data(i)
    end
  end
end


def for_month
metaprogramming is the art of writing programs that write programs

class Request
  POSSIBLE_VERBS = ['get', 'put', 'post', 'delete']

  def method_missing(s, *args, &b)
    if POSSIBLE_VERBS.include?
      begin
      end

class Request
  def get(*args, &b)
