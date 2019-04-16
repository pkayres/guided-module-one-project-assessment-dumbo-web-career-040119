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
  puts "Press B to see your reviews for your cookies"
  puts "Press C to see a your ratings for your cookies"
  puts "Press D to write your own cookie review!"
  puts "Press E to edit your review"
  puts "Press F to exit Cookie Grades"

  user_says = gets.chomp.upcase
    if user_says == "A"
        option_1
    elsif user_says == "B"
      option_2
    elsif user_says == "C"
      option_3
    elsif user_says == "D"
      option_4
    elsif user_says == "E"
      option_5
    elsif user_says == "F"
      option_6
    else
      puts "#{user_says} is not a invalid input try again!"
      list_inputs
    end
end

def something_else?
  puts "Would you like to do something else?(yes/no)"
  user_response_for_next_step = gets.chomp.downcase
  if user_response_for_next_step == "yes"
      list_inputs
  elsif user_response_for_next_step == "no"
    puts "Thanks for reviewing your cookie with us!"
  else user_response_for_next_step == nil
    puts "#{user_response_for_next_step} is not a invalid input try again!"
    something_else?
  end
end

def option_1
    Cookie.all.select do |cookie|
      puts "#{cookie.name}: #{cookie.description}"
    end
    something_else?
end

def option_2
  puts "What's your last name?"
    user_response = gets.chomp
    finding_user = User.find_by(last_name: user_response)
      finding_user.reviews.all.map do |review|
      puts "#{review.id}. Review: #{review.review}"
    end
    something_else?
end

def option_3
  puts "What's your last name?"
    user_response = gets.chomp
    finding_user = User.find_by(last_name: user_response)
      finding_user.reviews.all.map do |review|
       puts "#{review.id}. Review: #{review.review} Rating: #{review.rating}"
    end
    something_else?
end

def option_4
    puts "What's your first name?"
      user_first_name = gets.chomp.capitalize
    puts "Welcome #{user_first_name}!"
    puts "What's your last name?"
      user_last_name = gets.chomp.capitalize
       user_instance = User.create(first_name: user_first_name, last_name: user_last_name)
    puts "What's the name of your cookie?"
      cookie_name = gets.chomp
    puts "Give a description of the #{cookie_name} to us, what's in it?"
      cookie_description = gets.chomp
      cookie_instance = Cookie.create(name: cookie_name, description: cookie_description)
    puts "Great!"
    puts "Now give us a review for the #{cookie_name}? How did it make you feel...?"
      cookie_review = gets.chomp
    puts "Now how would you rate this cookie from 1-10?"
      cookie_rating = gets.chomp
      valid_rating?(user_instance,cookie_instance,cookie_review,cookie_rating)
    end
end

def option_5
  puts "What's your last name?"
    user_response = gets.chomp.capitalize
    finding_user = User.find_by(last_name: user_response)
    id = []
      finding_user.reviews.all.each do |review|
        id << "#{review.id}"
      end
      puts "Which review would you like to edit?(enter review number)"
          user_review_number = gets.chomp
        if id.include?(user_review_number)
        puts "Let's change it! Type in what you'd like instead."
          user_review_edit = gets.chomp
          changed_review = Review.where("id=?",user_review_number)
       changed_review.update(review: user_review_edit)
     end
end



def option_6
  puts "Thanks for stopping by!"
end


def invalid_rating?(user_instance,cookie_instance,cookie_review,cookie_rating)
  puts "Not a valid input, try again!"
    cookie_rating = gets.chomp
  valid_rating?(user_instance,cookie_instance,cookie_review,cookie_rating)
end


def valid_rating?(user_instance,cookie_instance,cookie_review,cookie_rating)
  nums_required = ["1","2","3","4","5","6","7","8","9","10"]
  if nums_required.include?(cookie_rating)
    Review.create(user_id: user_instance.id, cookie_id: cookie_instance.id, review: cookie_review, rating: cookie_rating)
     puts "Thanks for your review! You are now apart of the Cookie Grading nation!"
     something_else?
   else
     invalid_rating?(user_instance,cookie_instance,cookie_review,cookie_rating)
end




end
