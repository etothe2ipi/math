def standard_form(a, b)
  return "x² " + ((a+b) < 0 ? "- " : "+ ") + (a + b).abs.to_s + "x " + ((a*b) < 0 ? "- " : "+ ") + (a* b).abs.to_s
end

def factored_form(a, b)
  return "(x " + ((a < 0) ? "- " : "+ ") + a.abs.to_s + ")(x " + ((b < 0) ? "- " : "+ ") + b.abs.to_s + ")"
end

for a in -10..10
  for b in -10..a
     print "$" + standard_form(a, b) + " = " + factored_form(a, b) + "$\\\\ \n"
  end
end
