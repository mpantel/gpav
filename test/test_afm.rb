require 'minitest/autorun'
require File.dirname(__FILE__) + '/../lib/validators/afm'

class TestAfm <  Minitest::Unit::TestCase
  def test_valid_afm_validation
     valid_afm = ['101676480','102676489','103676487']
     valid_afm.each do |a|
       assert Afm.valid?(a), "ΑΦΜ verification failed: #{a}"
     end
  end

  def test_invalid_afm_validation
     invalid_afm = ['101676481','102676481','103676481','000000000' ]
     invalid_afm.each do |a|
       refute Afm.valid?(a), "Invalid ΑΦΜ wrong verification: #{a}"
     end
  end

  def test_empty_afm
    refute Afm.valid?(""), 'Invalid ΑΦΜ wrong verification: ""'
    refute Afm.valid?(nil), 'Invalid ΑΦΜ wrong verification: nil'
  end
  def test_wrong_length_afm
      refute Afm.valid?('01676480'), 'Invalid ΑΦΜ wrong verification: less numbers'
      refute Afm.valid?('10167680'), 'Invalid ΑΦΜ wrong verification: less numbers'
      refute Afm.valid?('1016763480'), 'Invalid ΑΦΜ wrong verification: more numbers'
      refute Afm.valid?('1012676480'), 'Invalid ΑΦΜ wrong verification: more numbers'
      refute Afm.valid?('1016762480'), 'Invalid ΑΦΜ wrong verification: more numbers'
      refute Afm.valid?('1016764802'), 'Invalid ΑΦΜ wrong verification: more numbers'
      refute Afm.valid?('1101676480'), 'Invalid ΑΦΜ wrong verification: more numbers'
      refute Afm.valid?('101676480 '), 'Invalid ΑΦΜ wrong verification: with spaceses'
      refute Afm.valid?(' 101676480'), 'Invalid ΑΦΜ wrong verification: with spaceses'
  end
  def test_includes_letters_afm
      refute Afm.valid?('10d676480'), 'Invalid ΑΦΜ wrong verification: with letters'
      refute Afm.valid?('101676s80'), 'Invalid ΑΦΜ wrong verification: with letters'
      refute Afm.valid?('10167648s'), 'Invalid ΑΦΜ wrong verification: with letters'
      refute Afm.valid?('a01676480'), 'Invalid ΑΦΜ wrong verification: with letters'
  end


end