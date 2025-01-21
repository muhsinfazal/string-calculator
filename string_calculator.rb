# frozen_string_literal: true

class StringCalculator
  class NegativeNumbersAreNotAllowed < StandardError; end

  ALLOWED_MAX_LIMIT = 1000

  def add(string_numbers)
    0 if string_numbers.empty?

    delimiter, string_numbers = parse_delimiter_and_numbers(string_numbers)

    numbers = string_numbers
              .split(/#{delimiter}|\n/)
              .map(&:to_i)
              .reject { |number| number > ALLOWED_MAX_LIMIT }

    negative_numbers = numbers.select(&:negative?)

    unless negative_numbers.empty?
      raise NegativeNumbersAreNotAllowed, "Negative numbers are not allowed: #{negative_numbers.join(', ')}"
    end

    numbers.sum
  end

  private

  def parse_delimiter_and_numbers(string_numbers)
    return [',', string_numbers] unless string_numbers.start_with?('//')

    if string_numbers.start_with?('//[')
      delimiters = extract_different_delimiters(string_numbers)
      numbers_start = string_numbers.index("\n") + 1

      [delimiters, string_numbers[numbers_start..]]
    else
      [string_numbers[2], string_numbers[4..]]
    end
  end

  def extract_different_delimiters(string_numbers)
    delimiters_section = string_numbers[3..string_numbers.index("\n") - 2]

    delimiters_section
      .split('][')
      .map { |delimiter| Regexp.escape(delimiter) }
      .join('|')
  end
end