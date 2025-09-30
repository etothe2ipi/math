def standard_form(e, t)
  return "x² " + ((-2*(e) < 0) ? "- " : "+ ") + (-2 * e).abs.to_s + "x + " + (e**2 + t**2).to_s
end

def factored_form(e, t)
  return "(x " + ((e < 0) ? "- " : "+ ") + e.abs.to_s + " " + ((t < 0) ? "- " : "+ ") + t.abs.to_s + "i)(x " + ((e < 0) ? "- " : "+ ") + e.abs.to_s + " " + ((t < 0) ? "+ " : "- ") + t.abs.to_s + "i)"
end

for a in -10..10
  for b in -10..10
     print "$" + standard_form(a, b) + " = " + factored_form(a, b) + "$\\\\ \n"
  end
end
