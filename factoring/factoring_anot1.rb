def gcd(a, b)
  biggest_factor = [a, b].min
  gcf = 1
  
  for i in 2..biggest_factor
    if (a % i) == 0 and (b % i) == 0
      gcf = i
    end
  end
  
  return gcf
end

def linear_factor(coefficients)
  linear_factor = ((coefficients[0] == 1) ? "" : coefficients[0].to_s) + "x"
  b = coefficients[1]
  linear_factor = linear_factor + ((b < 0) ? " - " : " + ") + b.abs.to_s  
  
  return "(" + linear_factor + ")"
end

def quadratic_polynomial(factor1, factor2)
  a = factor1[0] * factor2[0]
  b = factor1[1] * factor2[0] + factor1[0] * factor2[1] 
  c = factor1[1] * factor2[1]

  standard_form = ((a == 1) ? "" : ((a == -1) ? "-" : a.to_s)) + "x^2" + ((b < 0) ? " - " : " + ") + b.abs.to_s + "x" + ((c < 0) ? " - " : " + ") + c.abs.to_s  
  
  # Negative a values have a "mirror" trinomial that has a positive a value
  # Also filter out a values that are too large or that have already been listed
  if(a > 10 or a == 1 or a < 0 or c == 0) 
    return nil
  else
    factors = [linear_factor(factor1), linear_factor(factor2)].sort
    
    # There is more than one factoring available for a > 1 cases.
    # Filter out the one with negative linear coefficients.
    return nil if factors[0].index("(-") != nil 
    
    return standard_form + " = " + factors[0] + factors[1] 
  end
end

list_of_factor_pairs = []

for a in 1..10 # do not include zero because otherwise the factor is not linear
  for b in 0..10
    if gcd(a, b) == 1
      list_of_factor_pairs.push([a, b])
      list_of_factor_pairs.push([a, -1 * b])
      list_of_factor_pairs.push([-1 * a, b])
      list_of_factor_pairs.push([-1 * a, -1 * b])
    end
  end
end

all_quadratics = []

for i in 0..(list_of_factor_pairs.length - 1)
  for j in 0..(list_of_factor_pairs.length - 1)
    if i != j
      a = list_of_factor_pairs[i][0] * list_of_factor_pairs[j][0]
      b = list_of_factor_pairs[i][0] * list_of_factor_pairs[j][1] + list_of_factor_pairs[j][0] * list_of_factor_pairs[i][1] 
      c = list_of_factor_pairs[i][1] * list_of_factor_pairs[j][1]
      str = [a, b, c, list_of_factor_pairs[i][0], list_of_factor_pairs[i][1], list_of_factor_pairs[j][0], list_of_factor_pairs[j][1]]
      all_quadratics.push(str)
    end
  end
end

all_quadratics.sort!
all_quad_strings = []

for quad in all_quadratics
  str = quadratic_polynomial(quad[3..4], quad[5..6])
  if str != nil
    all_quad_strings.push(str)
  end
end

all_quad_strings.uniq!

file = open("factorable_quad_anot1.txt", "w")
for quad in all_quad_strings
  file.write("$" + quad.to_s + "$\\\\ \n")
end
file.close()

arry = all_quad_strings.chunk { |x|
  x.split("x^2")[0].to_i
}

arry.each { |idx, cnt|
  print "When a = " + idx.to_s + ", there are " + cnt.length.to_s + " unique trinomials\n"
}
