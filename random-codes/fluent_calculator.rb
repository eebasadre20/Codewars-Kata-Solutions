require 'pry'

class Calc
  pre = -1
  post = -1
  ops = ''


  num = {  one: 1, two: 2, three: 3, four: 4 , five: 5,
      six: 6, seven: 7, eight: 8, nine: 9, ten: 10,
      plus: "+", minus: "-", times: "*", divide_by: "/" }


  num.each do | method, value |
    define_method "#{method}" do
      if pre == -1 && post == -1
        pre = value
        self
      elsif pre != -1 && post == -1 && ops == ''
        ops = value
        self
      elsif pre != -1 && post == -1 && ops != ''
        post = value
        return pre.send(ops, post)
      end
    end
  end
end

puts Calc.new.four.divide_by.five

