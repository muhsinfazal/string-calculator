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
end