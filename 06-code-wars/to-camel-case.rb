def to_camel_case(str)
  # response = []

  # # separate by posible characters and captitalize all words except first one
  # counter = 0
  # response = str.split(/-|_| /).map do |part|
  #   part and next if counter == 0
  #   cointer += 1
  #   part.capitalize
  # end
  # p response.join("")
  # response.join("")

  #     | |
  #     \ /
  #      V

  str.gsub(/[_-](.)/) {"#{$1.upcase}"} # GSUB as lambda
end

to_camel_case('')
to_camel_case("the_stealth_warrior")
to_camel_case("The-Stealth-Warrior")
to_camel_case("A-B-C")
