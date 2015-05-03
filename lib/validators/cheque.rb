module Gpav
  module Validators
    class Cheque
      attr_reader :number

      def initialize(number)
        @number = number.to_s
      end

      def check_digit
        i=9
        sum = 0
        @number.each_char { |c|
          sum += c.to_i*i
          i-=1
        }
        # return sum
        y = sum % 11
        result =
            case y
              when 1 then
                0
              when 0 then
                1
              else
                11-y
            end
      end

      def cheque_number
        @number + '-' + check_digit.to_s
      end

      def self.valid?(chequenumber)

        @chequenumber =chequenumber.to_s

        return false unless @chequenumber.length == 10
        return false if not @chequenumber =~ /\A[0-9]{8}-[0-9]\Z/

        @chequenumber[-1].to_i == Cheque.new(@chequenumber[0..7]).check_digit

      end

    end
  end

end



































