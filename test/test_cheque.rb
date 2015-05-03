require 'minitest/autorun'
require File.expand_path(File.dirname(__FILE__)) + '/../lib/validators/cheque'

class TestCheque < Minitest::Unit::TestCase
  include Gpav::Validators

  def test_valid_cheque_validation
    valid_cheque = %w(72349701-0 72349702-8 72349703-6 72349704-4 72349705-2 72349706-1 72349707-9 72349708-7 72349709-5)
    valid_cheque.each do |a|
      assert Cheque.valid?(a), "Cheque verification failed: #{a}"
    end
  end

  def test_invalid_cheque_validation
    invalid_cheque = %w(72349201-0 72339702-8 72349703-4 72345704-4 62349705-2 78349706-1 72349797-9 72049708-7 72049709-5 00000000-0)
    invalid_cheque.each do |a|
      refute Cheque.valid?(a), "Invalid Cheque wrong verification: #{a}"
    end
  end

  def test_empty_cheque
    refute Cheque.valid?(""), 'Invalid Cheque wrong verification: ""'
    refute Cheque.valid?(nil), 'Invalid Cheque wrong verification: nil'
  end

  def test_wrong_length_cheque
    refute Cheque.valid?('7234901-0'), 'Invalid Cheque wrong verification: less numbers'
    refute Cheque.valid?('2349701-0'), 'Invalid Cheque wrong verification: less numbers'
    refute Cheque.valid?('742349701-0'), 'Invalid Cheque wrong verification: more numbers'
    refute Cheque.valid?('72349701-05'), 'Invalid Cheque wrong verification: more numbers'
    refute Cheque.valid?('723497015-0'), 'Invalid Cheque wrong verification: more numbers'
    refute Cheque.valid?('72349701--0'), 'Invalid Cheque wrong verification: more numbers'
    refute Cheque.valid?('723497015-0'), 'Invalid Cheque wrong verification: more numbers'
    refute Cheque.valid?('72349701-0 '), 'Invalid Cheque wrong verification: with spaceses'
    refute Cheque.valid?(' 72349701-0'), 'Invalid Cheque wrong verification: with spaceses'
  end

  def test_includes_letters_cheque
    refute Cheque.valid?('72349701+0'), 'Invalid Cheque wrong verification: with letters'
    refute Cheque.valid?('72349701a0'), 'Invalid Cheque wrong verification: with letters'
    refute Cheque.valid?('7234s701-0'), 'Invalid Cheque wrong verification: with letters'
    refute Cheque.valid?('7a349701-0'), 'Invalid Cheque wrong verification: with letters'
  end


end