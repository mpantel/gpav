module Gpav
  module Validators
    class Amka

      def self.valid?(amka) # 11 char string

        @amka = amka.to_s

        return false unless @amka.length == 11
        return false unless @amka =~ /\A[0-9]{11}\Z/
        return false if @amka.to_i == 0 # do not allow all digits zero

        @amka.each_char.with_index.inject(0) do |sum, (value, index)|
          v = value.to_i
          sum + v + (index.odd? ? (v - ((v>4) ? 9 : 0)) : 0)
        end % 10 == 0

      end

    end
  end
end
