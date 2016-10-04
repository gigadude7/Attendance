class ProcessFile

  def initialize(file_path, brother_list)
    @file_path = file_path
    @brother_list = brother_list
    @brothers_in_attendance = Array.new
    open_file
    process_file
  end

  def open_file
    @file = File.open(@file_path, 'r')
  end

  #PURPOSE:       To figure out which brothers were absent
  #BEGIN STATE:   Empty array of Brothers with absences
  #END STATE:     Array of Brother Names that were absent at this event
  def process_file

    #Iterate through the text file of brother swipe info
    @file.readlines.each() do |x|
      for bro in @brother_list


        if bro.swipe_info != nil
          if x.include? bro.swipe_info

            @brothers_in_attendance.push(bro)

          end
        end


      end


    end

    #If a brother is found, remove them from @brother_list

    #set brothers_with_absences

  end
end