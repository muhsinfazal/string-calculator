# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end

  def test_empty_string_should_return_sum_zero
    sum = @calculator.add('')

    assert_equal 0, sum
  end

  def test_single_number_string_should_return_sum_same_as_the_number
    sum = @calculator.add('1')

    assert_equal 1, sum
  end

  def test_should_return_sum_for_two_number_string
    sum = @calculator.add('1,2')

    assert_equal 3, sum
  end

  def test_should_return_sum_for_multiple_number_string
    sum = @calculator.add('1,2,3,4,5')

    assert_equal 15, sum
  end

  def test_should_return_sum_for_number_string_with_trailing_comma
    sum = @calculator.add('1,2,3,')

    assert_equal 6, sum
  end

  def test_should_return_sum_for_number_string_with_leading_comma
    sum = @calculator.add(',1,2,3')

    assert_equal 6, sum
  end

  def test_should_return_sum_for_number_string_separated_by_multiple_commas
    sum = @calculator.add('1,,,2,,3,4')

    assert_equal 10, sum
  end
end