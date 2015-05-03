module Gpav
  module Validators
    class Afm
      def self.valid?(afm) #9 chars, string

        @afm = afm.to_s

        return false if @afm.length != 9 # length == 9
        return false if not @afm =~ /\A[0-9]{9}\Z/ # only digits
        return false if @afm.to_i == 0 # do not allow all digits zero

        y = @afm[-1].to_i # rest / ninth digit
        s = 0 # runnning sum
        pow2 = 2 # 2 power cache

        7.downto(0) do |i|
          s += pow2 * @afm[i].to_i
          pow2 = pow2 * 2
        end

        s = s % 11
        s = 0 if s == 10

        return s == y

      end
    end
  end
end
