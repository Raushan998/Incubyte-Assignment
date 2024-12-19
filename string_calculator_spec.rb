# frozen_string_literal: true

require_relative './string_calculator'
RSpec.describe StringCalculator do
  let(:calculator) { described_class.new }

  context 'when empty string' do
    it 'returns 0' do
      expect(calculator.add_number('')).to eq(0)
    end
  end

  context 'when one digit without delimeters' do
    it 'returns 1' do
      expect(calculator.add_number('1')).to eq(1)
    end
  end

  context 'when two digit without delimeters' do
    it 'returns sum with 15' do
      expect(calculator.add_number('12;3')).to eq(15)
    end
  end

  context 'when digits with comma' do
    it 'returns sum 10' do
      expect(calculator.add_number('1,2,3,4')).to eq(10)
    end
  end

  context 'when digits with delimeters' do
    it 'return sum 3' do
      expect(calculator.add_number('//;\n1;2')).to eq(3)
    end

    it 'return sum 5' do
        expect(calculator.add_number('//;\n2;3-;')).to eq(5)
    end
  end

  context 'when digits with negative number' do
    it 'raise error for one digit' do
      expect { calculator.add_number('-12') }.to raise_error('negative numbers not allowed [-12]')
    end

    it 'raise error for multiple digit' do
        expect { calculator.add_number('-1,-2,-3') }.to raise_error('negative numbers not allowed [-1, -2, -3]')
    end

    it 'raise error for digits with delimeters' do
        expect { calculator.add_number('-1/-2-;-34;')}.to raise_error('negative numbers not allowed [-1, -2, -34]')
    end
  end
end
