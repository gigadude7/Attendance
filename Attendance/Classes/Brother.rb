#!/usr/bin/ruby

class Brother

  @swipe_info

  def initialize(first_name, last_name, email, phone_number)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone_number = phone_number
    @number_of_absences = Array.new
  end

  def say_hello
    "I am #{@first_name} #{@last_name} and my email is: #{@email}"
  end

  def firstname
    @first_name
  end

  def lastname
    @last_name
  end

  def swipe_info
    @swipe_info
  end

  def set_swipe_info(swipe_info)
    @swipe_info = swipe_info
  end

  def number_of_absences
    @number_of_absences
  end

  def add_absence(absence)
    unless @number_of_absences.include?(absence)
      @number_of_absences.push(absence)
    end
  end


end