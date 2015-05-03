class Iban

  def valid?(iban)

    @iban = iban.to_s

    return false unless @iban.length == 27
    return false unless @iban =~ /\A[a-zA-Z]{2}[0-9]{25}\Z/


    # rotate 4
    #change letters to numbers: A=10 --> Z=35
    #divide with 97 mod == 1

    (@iban[4..27] + char_to_numbers(@iban[0]) + char_to_numbers(@iban[1]) + @iban[2..3]).to_i % 97 == 1

  end

  def char_to_numbers(char)

    # iban characters to number transformation table
    #
    # A=10 F=15 K=20 P=25 U=30 Z=35
    # B=11 G=16 L=21 Q=26 V=31
    # C=12 H=17 M=22 R=27 W=32
    # D=13 I=18 N=23 S=28 X=33
    # E=14 J=19 O=24 T=29 Y=34
    #

    (char.upcase.ord - 'a'.upcase.ord + 10).to_s

  end

end