require 'minitest/autorun'
require File.dirname(__FILE__) + '/../lib/validators/amka'

class TestAmka <  Minitest::Unit::TestCase
  def test_valid_amka_validation
     valid_amka = ['15067603256','16057602159','16067502233']
     valid_amka.each do |a|
       assert Amka.valid?(a), "ΑΜΚΑ verification failed: #{a}"
     end
  end

  def test_invalid_amka_validation
     invalid_amka = ['15067603253','16057602153','16067502232','00000000000' ]
     invalid_amka.each do |a|
       refute Amka.valid?(a), "Invalid ΑΜΚΑ wrong verification: #{a}"
     end
  end

  def test_empty_amka
    refute Amka.valid?(""), 'Invalid ΑΜΚΑ wrong verification: ""'
    refute Amka.valid?(nil), 'Invalid ΑΜΚΑ wrong verification: nil'
  end
  def test_wrong_length_amka
      refute Amka.valid?('1506760325'), 'Invalid ΑΜΚΑ wrong verification: less numbers'
      refute Amka.valid?('5067603256'), 'Invalid ΑΜΚΑ wrong verification: less numbers'
      refute Amka.valid?('115067603256'), 'Invalid ΑΜΚΑ wrong verification: more numbers'
      refute Amka.valid?('125067603256'), 'Invalid ΑΜΚΑ wrong verification: more numbers'
      refute Amka.valid?('153067603256'), 'Invalid ΑΜΚΑ wrong verification: more numbers'
      refute Amka.valid?('150676032564'), 'Invalid ΑΜΚΑ wrong verification: more numbers'
      refute Amka.valid?('150a67603256'), 'Invalid ΑΜΚΑ wrong verification: more numbers'
      refute Amka.valid?('15067603256 '), 'Invalid ΑΜΚΑ wrong verification: with spaceses'
      refute Amka.valid?(' 15067603256'), 'Invalid ΑΜΚΑ wrong verification: with spaceses'
  end
  def test_includes_letters_amka
      refute Amka.valid?('15067a03256'), 'Invalid ΑΜΚΑ wrong verification: with letters'
      refute Amka.valid?('1506760s356'), 'Invalid ΑΜΚΑ wrong verification: with letters'
      refute Amka.valid?('1506760356s'), 'Invalid ΑΜΚΑ wrong verification: with letters'
      refute Amka.valid?('s1506760356'), 'Invalid ΑΜΚΑ wrong verification: with letters'
  end


end