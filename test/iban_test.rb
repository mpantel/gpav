require 'test_helper'

class TestIban < Minitest::Test
  include Gpav::Validators

  def test_valid_iban_validation
    valid_iban = %w(GR9401406010601002001000246 GR5401406010601002001000190 GR9101406010601002001000300 GR9001406010601002001000318 GR0701406010601002001001812)
    valid_iban.each do |a|
      assert Iban.valid?(a), "IBAN verification failed: #{a}"
      assert Iban.valid?(a,'014'), "IBAN verification failed: #{a}, 014"
    end
    end
  def test_invalid_iban_with_code_validation
    valid_iban = %w(GR9401406010601002001000246 GR5401406010601002001000190 GR9101406010601002001000300 GR9001406010601002001000318 GR0701406010601002001001812)
    valid_iban.each do |a|
      refute Iban.valid?(a,'010'), "Invalid IBAN wrong verification: #{a}, 010"
    end
  end

  def test_invalid_iban_validation
    invalid_iban = %w(DR9401406010601002001000246 GF5401406010601002001000190 GR9101406010631002001000300 GR9001406010601002001400318 GR0701406010601002001001814)
    invalid_iban.each do |a|
      refute Iban.valid?(a), "Invalid IBAN wrong verification: #{a}"
      refute Iban.valid?(a,'014'), "Invalid IBAN wrong verification: #{a}, 014"
    end
  end

  def test_empty_iban
    refute Iban.valid?(""), 'Invalid IBAN wrong verification: ""'
    refute Iban.valid?(nil), 'Invalid IBAN wrong verification: nil'
  end

  def test_wrong_length_iban
    refute Iban.valid?('9401406010601002001000246'), 'Invalid IBAN wrong verification: less numbers'
    refute Iban.valid?('R9401406010601002001000246'), 'Invalid IBAN wrong verification: less numbers'
    refute Iban.valid?('GR940140601060100200100024'), 'Invalid IBAN wrong verification: less numbers'
    refute Iban.valid?('G2R9401406010601002001000246'), 'Invalid IBAN wrong verification: more numbers'
    refute Iban.valid?('GGR9401406010601002001000246'), 'Invalid IBAN wrong verification: more numbers'
    refute Iban.valid?('1GR9401406010601002001000246'), 'Invalid IBAN wrong verification: more numbers'
    refute Iban.valid?('GR94014060106010020021000246'), 'Invalid IBAN wrong verification: more numbers'
    refute Iban.valid?('GR94014060106010020010002462'), 'Invalid IBAN wrong verification: more numbers'
    refute Iban.valid?('GR9401406010601002001000246 '), 'Invalid IBAN wrong verification: with spaceses'
    refute Iban.valid?(' GR9401406010601002001000246'), 'Invalid IBAN wrong verification: with spaceses'
  end

  def test_includes_letters_iban
    refute Iban.valid?('GR94014060106010F2001000246'), 'Invalid IBAN wrong verification: with letters'
    refute Iban.valid?('9401406010601002001000246GR'), 'Invalid IBAN wrong verification: with letters'
    refute Iban.valid?('01406010601002001000246GR94'), 'Invalid IBAN wrong verification: with letters'
    refute Iban.valid?('GRR901406010601002001000246'), 'Invalid IBAN wrong verification: with letters'
  end


end