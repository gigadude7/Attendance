#!/usr/bin/ruby

class Brother

def initialize(first_name, last_name, email, phone_number) 
	@first_name = first_name
	@last_name = last_name
	@email = email
	@phone_number = phone_number
end 

def sayHello
    return "I am #{@first_name} #{@last_name} and my email is: #{@email}"
end

	def firstname
		return @first_name
	end

	def lastname
		return @last_name
	end



end 