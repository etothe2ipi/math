def standard_form(a, b)
  return "x² " + ((a+b) < 0 ? "- " : "+ ") + (a + b).abs.to_s + "x " + ((a*b) < 0 ? "- " : "+ ") + (a * b).abs.to_s
end

def factored_form(a, b)
  return "(x " + ((a < 0) ? "- " : "+ ") + a.abs.to_s + ")(x " + ((b < 0) ? "- " : "+ ") + b.abs.to_s + ")"
end

quadratic_list = []

for a in -10..10
  for b in -10..a
    if b != 0 and a != 0
      quadratic_list.push([a+b, a*b, a, b])
    end
  end
end

quadratic_list.sort!

for quad in quadratic_list
  a = quad[2]
  b = quad[3]
  print "$" + standard_form(a, b) + " = " + factored_form(a, b) + "$\\\\ \n"
end
