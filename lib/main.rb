require_relative 'hash_map'

test = HashMap.new

puts '--- Populating Hash Map ---'
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts "Current length: #{test.length}"
puts "Capacity: #{test.instance_variable_get(:@capacity)}"

puts "\n--- Testing Overwrite ---"
test.set('apple', 'bright red')
puts "Apple is now: #{test.get('apple')}"
puts "Length after overwrite: #{test.length}"

puts "\n--- Triggering Growth ---"
test.set('moon', 'silver')
puts "New length: #{test.length}"
puts "New capacity: #{test.instance_variable_get(:@capacity)}"

puts "\n--- Final Checks ---"
puts "Has 'dog' ? #{test.has?('dog')}"
puts "Remove 'frog': #{test.remove('frog')}"
puts "Entries: #{test.entries.inspect}"
