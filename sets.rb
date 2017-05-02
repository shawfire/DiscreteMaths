#Topic 3

http://ruby-doc.org/stdlib-2.4.1/libdoc/set/rdoc/Set.html

>> require 'set'
=> true
>> s1 = Set.new
=> #<Set: {}>
>> s1.merge([1,2,3,4,5,2,7,8])
=> #<Set: {1, 2, 3, 4, 5, 7, 8}>
>> s1
=> #<Set: {1, 2, 3, 4, 5, 7, 8}>
>> s1.to_a
=> [1, 2, 3, 4, 5, 7, 8]

>> a = [1,2,3,4,5,6,7,3,2,5,9]
=> [1, 2, 3, 4, 5, 6, 7, 3, 2, 5, 9]
>> unique_a = Set.new(a).to_a
=> [1, 2, 3, 4, 5, 6, 7, 9]
>> unique_a
=> [1, 2, 3, 4, 5, 6, 7, 9]
>>

>> s1.add(9)
=> #<Set: {1, 2, 3, 4, 5, 7, 8, 9}>
>> s1.add(5)
=> #<Set: {1, 2, 3, 4, 5, 7, 8, 9}>
>> s1.delete(5)
=> #<Set: {1, 2, 3, 4, 7, 8, 9}>
>> s1.delete?(4)
=> #<Set: {1, 2, 3, 7, 8, 9}>
>> s1.delete?(4)
=> nil
>>
