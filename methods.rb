#Topic 4

>> n = 7.9
=> 7.9
>> n.ceil
=> 8
>> n.floor
=> 7
>> 7.8.truncate
=> 7
>> n
=> 7.9
>> n.round
=> 8
>> Math.sqrt(n)
=> 2.8106938645110393
>> [1,2,3,4,6,9,2,4,7].max
=> 9
>> [1,2,3,4,6,9,2,4,7].min
=> 1

>> (1..5).reduce(:+)
=> 15
>> (1..5).reduce(:*)
=> 120
>> (1..5).map{|x| x**2 }.reduce(:+)
=> 55
>> (1..5).select{|x| x != 3}.map{|x| x**2 }.reduce(:+)
=> 46
>> ["emperor", "joshua", "abraham", "norton"].map(&:capitalize).join(' ')
=> "Emperor Joshua Abraham Norton"
>> ["   emperor  ", "joshua  ", "abraham ", "norton"].map{|x| x.strip.capitalize}.join(' ')
=> "Emperor Joshua Abraham Norton"

{"4"=>1, "1"=>2, "6"=>2, "3"=>1, "0"=>2}
=> [1,2,3,4,2,4,6,10,2].select{|x| x % 2 == 0}.uniq.map{|x| (x**2).to_s }.join('').split('').reduce({}){ |acc, x| acc[x] = acc[x].nil? ? 1 : acc[x] + 1; acc }
=> {"4"=>1, "1"=>2, "6"=>2, "3"=>1, "0"=>2}
irb(main):034:0>
>> [1,2,3,4,2,4,6,10,2].select{|x| x % 2 == 0}
=> [2, 4, 2, 4, 6, 10, 2]
>> [1,2,3,4,2,4,6,10,2].select{|x| x % 2 == 0}.uniq
=> [2, 4, 6, 10]
>> [1,2,3,4,2,4,6,10,2].select{|x| x % 2 == 0}.uniq.map{|x| (x**2).to_s }
=> ["4", "16", "36", "100"]
>> [1,2,3,4,2,4,6,10,2].select{|x| x % 2 == 0}.uniq.map{|x| (x**2).to_s }.join('')
=> "41636100"
>> [1,2,3,4,2,4,6,10,2].select{|x| x % 2 == 0}.uniq.map{|x| (x**2).to_s }.join('').split('')
=> ["4", "1", "6", "3", "6", "1", "0", "0"]
>> [1,2,3,4,2,4,6,10,2].select{|x| x % 2 == 0}.uniq.map{|x| (x**2).to_s }.join('').split('').reduce({}){ |acc, x| acc[x] = acc[x].nil? ? 1 : acc[x] + 1; acc }
=> {"4"=>1, "1"=>2, "6"=>2, "3"=>1, "0"=>2}
>>
a = []
str = ""
dict = {}
for x in [1,2,3,4,2,4,6,10,2] do
  if (x % 2 == 0) && a.find{|y| y == x}.nil? then
    a.push(x)
    dict = (x**2).to_s.split('').reduce(dict){ |acc, x| acc[x] = acc[x].nil? ? 1 : acc[x] + 1; acc }
  end
end
>> dict
=> {"4"=>1, "1"=>2, "6"=>2, "3"=>1, "0"=>2}

require 'benchmark'

array = (1..1_000).map{rand(100_000)} #
array = (1..10_000_000).map{rand(100_000)}
dict = {}

puts Benchmark.measure {
  dict = array.select{|x| x % 2 == 0}.uniq.map{|x| (x**2).to_s }.join('').split('').reduce({}){ |acc, x| acc[x] = acc[x].nil? ? 1 : acc[x] + 1; acc }
}

=> 1.370000   0.020000   1.390000 (  1.387235)
>> dict
=> {"1"=>46690, "7"=>38675, "2"=>44930, "4"=>63606, "9"=>40281, "0"=>58812, "6"=>62690, "8"=>39593, "3"=>40933, "5"=>40664}

puts Benchmark.measure {
  str = ""
  dict = {}
  for x in array.uniq do
    if x % 2 == 0 then
      (x**2).to_s.each_char {|d| dict[d] = dict[d].nil? ? 1 : dict[d] + 1; }
    end
  end
}


=> 1.500000   0.000000   1.500000 (  1.512021)
>> dict
=> {"1"=>46690, "7"=>38675, "2"=>44930, "4"=>63606, "9"=>40281, "0"=>58812, "6"=>62690, "8"=>39593, "3"=>40933, "5"=>40664}
>>

# really slow
puts Benchmark.measure {
  a = []
  str = ""
  dict = {}
  for x in array do
    if (x % 2 == 0) && a.find{|y| y == x}.nil? then
      a.push(x)
      (x**2).to_s.each_char {|d| dict[d] = dict[d].nil? ? 1 : dict[d] + 1; }
    end
  end
}

# really really slow
puts Benchmark.measure {
  a = []
  str = ""
  dict = {}
  for x in array do
    if (x % 2 == 0) && a.find{|y| y == x}.nil? then
      a.push(x)
      dict = (x**2).to_s.split('').reduce(dict){ |acc, x| acc[x] = acc[x].nil? ? 1 : acc[x] + 1; acc }
    end
  end
}
