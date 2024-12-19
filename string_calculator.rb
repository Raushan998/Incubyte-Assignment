# frozen_string_literal: true

# class for string calculator
class StringCalculator
  def add_number(num)
    return 0 if num.empty?

    handle_negative_number(num)
    num_arr = parse_data(num)
    num_arr.sum
  end

  private

  def parse_data(num_str)
    num_arr = []
    current_num = 0
    num_str.each_char do |char|
      if integer?(char)
        current_num = current_num * 10 + char.to_i
      else
        num_arr << current_num
        current_num = 0
      end
    end
    num_arr << current_num unless current_num.zero?
    num_arr
  end

  def handle_negative_number(num_arr)
    negative_arr = []
    num_arr.each_char.with_index do |char, index|
      next unless char == '-'

      parsed_number, index = parse_negative_number(index + 1, num_arr)
      negative_arr << parsed_number * -1 unless parsed_number.zero?
    end
    raise "negative numbers not allowed #{negative_arr}" unless negative_arr.empty?
  end

  def valid_num(index, num_arr)
    index < num_arr.size && integer?(num_arr[index])
  end

  def integer?(value)
    value >= '0' && value <= '9'
  end

  def parse_negative_number(index, num_arr)
    current_number = 0
    while valid_num(index, num_arr)
      current_number = current_number * 10 + num_arr[index].to_i
      index += 1
    end
    [current_number, index]
  end
end
