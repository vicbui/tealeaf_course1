puts "Enter your first number"
a  = gets.chomp.to_f

puts "Enter your secound number "
b = gets.chomp.to_f

puts "Enter your calculation choice 1.add 2.minus 3.multiply 4.divide"
x  = gets.chomp

if x == '1' then 
	puts a + b 
elsif x == '2' then 
	puts a - b 
elsif x == '3' then 
	puts a*b 
elsif x == '4' then 
	puts a/b 
else 
	puts "invalid options"
end 
