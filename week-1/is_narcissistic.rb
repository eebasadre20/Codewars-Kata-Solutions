# PROBLEM --> https://www.codewars.com/kata/numbers-so-vain-they-probably-think-this-kata-is-about-them/train/ruby
# Click the link for more information
# about the Kata problem.

def is_narcissistic( *args )
  count = 0

  args.each do | num |
    return false if /\D/.match( num.to_s ) || num.to_s.empty?

    narcissistic =  num.to_s.split("").inject( 0 ) do | sum, i |
                      sum = sum + ( i.to_i ** num.to_s.size )
                    end == num.to_i ? true : false

   count = count + 1 if narcissistic
  end

  args.length == count ? true : false
end
