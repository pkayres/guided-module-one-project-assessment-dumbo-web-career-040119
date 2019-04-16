require 'pry'


class CommandLineInterface

def run
  greet
  list_inputs
end


def greet
  puts `clear`
  puts 'Welcome to Cookie Grades!'
  puts 'What would you like to do?'
end

def list_inputs
  puts `clear`
  puts "Press A to see a list of cookies!"
  puts "Press B to see the reviews for your cookies"
  puts "Press C to see the ratings of your cookies"
  puts "Press D to write your own cookie review!"
  puts "Press E to edit your review"
  puts "Press F to delete your review"
  puts "Press G to exit Cookie Grades"

  user_says = gets.chomp.upcase
    if user_says == "A"
      see_list_cookies
    elsif user_says == "B"
      see_your_reviews
    elsif user_says == "C"
      see_ratings
    elsif user_says == "D"
      write_review
    elsif user_says == "E"
      edit_review
    elsif user_says == "F"
      delete_review
    elsif user_says == "G"
      exit
    else
      puts "#{user_says} is not a invalid input try again!"
      list_inputs
    end
end

def something_else?
  puts "Would you like to do something else?(yes/no)"
  user_response_for_next_step = gets.chomp
  if user_response_for_next_step == "yes"
      list_inputs
  elsif user_response_for_next_step == "no"
    puts "Thanks for reviewing your cookie with us!"
  else
    puts "#{user_response_for_next_step} is not a invalid input try again!"
    something_else?
  end
end

def see_list_cookies
    Cookie.all.select do |cookie|
      puts "#{cookie.name}: #{cookie.description}"
    end
    something_else?
end

def see_your_reviews
  puts "What's your last name?"
    user_response = gets.chomp.capitalize
    finding_user = User.find_by(last_name: user_response)
    if finding_user != nil
      finding_user.reviews.each do |review|
        puts "#{review.id}. Review: #{review.review}"
      end
    else
      puts "Sorry invalid response, try again!"
      see_your_reviews
    end
    something_else?
end

def see_ratings
  puts "What's your last name?"
    user_response = gets.chomp.capitalize
    finding_user = User.find_by(last_name: user_response)
      finding_user.reviews.map do |review|
        puts "#{review.id}. Review: #{review.review} Rating: #{review.rating}"
      end
    something_else?
end

def write_review
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

def edit_review
  puts "What's your last name?"
    user_response = gets.chomp.capitalize
    finding_user = User.find_by(last_name: user_response)
    id = []
  puts "Which review would you like to edit?(enter review number)"
      finding_user.reviews.each do |review|
        id << "#{review.id}"
        puts "#{review.id}. Review: #{review.review}"
      end
          user_review_number = gets.chomp
        if id.include?(user_review_number)
          puts "Let's change it! Type in what you'd like instead."
          user_review_edit = gets.chomp
          changed_review_id = Review.where("id=?",user_review_number)
          changed_review_id.update(review: user_review_edit)
       puts "All set!"
     end
     something_else?
end

def delete_review
  puts "What's your last name?"
    user_response = gets.chomp.capitalize
    finding_user = User.find_by(last_name: user_response)
      id = []
  puts "Which review would you like to delete?(enter review number)"
    finding_user.reviews.each do |review|
      id << "#{review.id}"
  puts "#{review.id}. Review: #{review.review}"
    end
      user_review_number = gets.chomp
        if id.include?(user_review_number)
  puts "Cool! Consider it done!"
      user_review_match = Review.where("id=?",user_review_number)
      user_review_match.destroy_all
   something_else?
 end
end

def exit
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
