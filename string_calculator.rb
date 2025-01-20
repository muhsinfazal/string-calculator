# frozen_string_literal: true

class StringCalculator
  class NegativeNumbersAreNotAllowed < StandardError; end

  def add(string_numbers)
    0 if string_numbers.empty?

    delimiter, string_numbers = parse_delimiter_and_numbers(string_numbers)

    numbers = string_numbers.split(/[#{delimiter}\\n]/).map(&:to_i)

    negative_numbers = numbers.select(&:negative?)

    unless negative_numbers.empty?
      raise NegativeNumbersAreNotAllowed, "Negative numbers are not allowed: #{negative_numbers.join(', ')}"
    end

    numbers.sum
  end

  private

  def parse_delimiter_and_numbers(string_numbers)
    if string_numbers.start_with?('//')
      delimiter = string_numbers[2]
      string_numbers = string_numbers[4..]
    else
      delimiter = ','
    end

    [delimiter, string_numbers]
  end
end