def do_math(s)
    splitted_str = s.split(' ')
    operation = DoTheOperation.new( splitted_str )
    operation.do_math
end

class DoTheOperation
  OPERATIONS = ['+', '-', '*', '/']

  def initialize( splitted_str )
    @splitted_str = splitted_str
    @char_list = []
    @num_list = []
  end

  def do_math
    total = 0
    splitted_str.each do | a |
      extract_str( a )
    end

    do_sorting
    total = do_calculation.round
  end

  private

  attr_accessor :char_list, :num_list, :splitted_str

  # Extracting the letter and number
  # in each splitted string
  # ex. str = '820b' become
  #     char_list = [`b`]
  #     num_list  = [`820]
  def extract_str( val )
    if val =~ /\d/
      letter = val.gsub(/[^a-zA-Z]/, '')
      char_list << letter
      num_list << extract_number( val, letter )
    end
  end

  # Do sorting based on the list of character
  # ex. char_list [ `z`, `b`, `a` ]
  #     num_list  [ `456`, `736`, `001`]
  #     --- AFTER SORTING --
  #     char_list [ `a`, `b`, `z` ]
  #     num_list [ `001`, `736`, `456` ]
  def do_sorting
    char_list_length = char_list.length

    loop do
      swapped = false
      (char_list_length - 1).times do | i |
        if char_list[i] > char_list[i+1]
          char_list[i], char_list[i+1] = char_list[i+1], char_list[i]
          num_list[i], num_list[i+1] = num_list[i+1], num_list[i]

          swapped = true
        end
      end
      break if not swapped
    end
  end

  # Specific method where extracting the number
  # in the string that has character
  def extract_number( val, letter )
    str_num = []
    val.split('').each do | num |
      if num != letter
        str_num << num
      end
    end

    return str_num.join()
  end

  # Do the calculation of the four
  # basic operation in math
  def do_calculation
    index = 0
    total = 0.0
    total_temp = 0

    num_list_length = num_list.length

    ( num_list_length - 1 ).times do | i |
      total = num_list[i].to_f if i == 0
      index = 0 if index == 4

      total = total.send(OPERATIONS[index], num_list[i+1].to_f)
      index = index + 1
    end

    total
  end

  # A method for debugging purposes
  def output
    puts "Letter sequence: #{@temp_letter}"
    puts "Number sequence: #{@temp}"
  end
end