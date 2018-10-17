=begin
perfect: sum of positive factors (excluding number) = number
abundant: sum  > number
deficient: sum < number
  prime are therefore deficient

e.g.
28 = 1 + 2 + 4 + 7 + 14

- guard clause for natural numbers (excl 0)
- figure out the positive factors of n, excluding n
- sum them
- compare to n

=end

class PerfectNumber
  def self.classify(number)
    raise RuntimeError, "Number can't be less than 1" if number < 1

    aliquot = (1..number / 2).reduce(0) do |sum, n| 
      number % n == 0 ? sum + n : sum
    end
    
    case aliquot <=> number
    when 0  then "perfect"
    when -1 then "deficient"
    when 1  then "abundant"
    end
  end
end