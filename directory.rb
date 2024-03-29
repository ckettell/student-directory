def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit the return button twice"
  #great empty array
  students = [] 
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user 
    name = gets.chomp
  end
students 
end

# and then print them
def print_header
  puts "The students of Villains Academy"
  puts "---------"
end
def print(names)
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort"
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)