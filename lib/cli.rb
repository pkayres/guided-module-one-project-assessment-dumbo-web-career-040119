require 'pry'


class CommandLineInterface

def run
  greet
  list_inputs
end


def greet
  puts 'Welcome to Cookie Grades!'
  puts 'What would you like to do?'
end

def list_inputs
  puts "Press A to see a list of cookies!"
  puts "Press B to see reviews for cookies"
  puts "Press C to see rating for cookie"
  puts "Press D to edit your cookie review"
  puts "Press E to delete your cookie review"
  user_input = gets.chomp
    if user_input == "A"
      Cookie.all.select do |cookie|
        puts "#{cookie.name}: #{cookie.description}"
      end
    elsif user_input == "B"
      Review.all.select do |review|
        puts "#{review.cookie.name}: #{review.review}  "
      end
    elsif user_input == "C"
      Review.all.map

    end

  end



end
