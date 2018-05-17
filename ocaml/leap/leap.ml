let leap_year year =
  let is_fourth = year mod 4 = 0 in
  let is_century = year mod 100 = 0 in
  let is_special = year mod 400 = 0 in
  is_fourth && not is_century || is_special
