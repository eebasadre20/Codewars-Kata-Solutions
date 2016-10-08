def do_math(s)
    split_string = s.split(' ')
    operation = DoTheOperation.new( split_string )
    operation.do_math
end

class DoTheOperation
  OPERATIONS = ['+', '-', '*', '/']

  def initialize( split_string )
    @split_string = split_string
    @letter = []
    @num = []
  end

  def do_math
    total = 0
    @split_string.each do | a |
      extract_array( a )
      do_sorting
    end

    output
    total = do_calculation
  end

  def extract_array( val )
    if val =~ /\d/
      letter = val.gsub(/[^a-zA-Z]/, '')
      @letter << letter
      @num << extract_number( val, letter )
    end
  end

  def do_sorting
    array_length = @letter.length

    loop do
      swapped = false
      (array_length - 1).times do | i |
        if @letter[i] > @letter[i+1]
          @letter[i], @letter[i+1] = @letter[i+1], @letter[i]
          @num[i], @num[i+1] = @num[i+1], @num[i]

          swapped = true
        end
      end
      break if not swapped
    end
  end

  def extract_number( val, letter )
    str_num = []
    val.split('').each do | num |
      if num != letter
        str_num << num
      end
    end

    return str_num.join()
  end

  def do_calculation
    index = 0
    total = 0.0

    array_length = @num.length

    ( array_length - 1 ).times do | i |
      total = @num[i].to_f if i == 0
      index = 0 if index == 4

      puts "OPERATIONS INDEX: #{index}"
      puts "before ---> total: #{total} -- operation: #{OPERATIONS[index]} -- #{@num[i+1].to_f}"
      total = total.send(OPERATIONS[index], @num[i+1].to_f).round
      puts "TOTAL HERE: #{total}"
      index = index + 1
    end

    total
  end

  def output
    puts "Letter sequence: #{@letter}"
    puts "Number sequence: #{@num}"
  end
end

