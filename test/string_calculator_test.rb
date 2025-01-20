# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../string_calculator'

class StringCalculatorTest < Minitest::Test
  def setup
    @calculator = StringCalculator.new
  end
end