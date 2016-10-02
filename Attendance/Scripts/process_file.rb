class ProcessFile

  @brothers_with_absences = Array[]

  def initialize(file_path, brother_list)
    @file_path = file_path
    @brother_list = brother_list
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
    #Iterate through the text file

    @file.readlines.each() do |x|
      puts x
    end


    #If a brother is found, remove them from @brother_list

    #set brothers_with_absences

  end
end