# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.
# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

class Calendar
  WEEKDAYS = {
    :sunday => 0,
    :monday => 1,
    :tuesday => 2,
    :wednesday => 3,
    :thursday => 4,
    :friday => 5,
    :saturday => 6
  }

  MONTHS = {
    1 => 31,
    2 => 28,
    3 => 31,
    4 => 30,
    5 => 31,
    6 => 30,
    7 => 31,
    8 => 31,
    9 => 30,
    10 => 31,
    11 => 30,
    12 => 31
  }

  def self.is_leap_year(year)
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    elsif year % 4 == 0
      true
    else
      false
    end
  end

  def self.days_in_year(year)
    self.is_leap_year(year) ? 366 : 365
  end

  def self.julian_date(month, day, leap_year = false)
    total = (leap_year && month > 2) ? 1 : 0

    (1...month).each { |m| total += MONTHS[m] }
    total + day
  end

  # Julian date including the year given that Jan 1, 1900 == 1
  def self.total_julian_date(year, month, day)
    total = 0

    days_per_year = []
    (1900...year).each { |y| days_per_year << self.days_in_year(y) }

    total += days_per_year.inject(&:+) unless days_per_year.length == 0
    total += self.julian_date(month, day, self.is_leap_year(year))

    total
  end
end

input_results = [
  [1900, 365],
  [2000, 366],
  [1985, 365],
  [1944, 366]
]

input_results.each do |year, num_days|
  result = Calendar.days_in_year(year)
  unless result == num_days
    puts "#{result} does not equal #{num_days}"
  end
end

input_results2 = [
  [1, 1, false, 1],
  [1, 1, true, 1],
  [3, 15, false, 74],
  [3, 15, true, 75],
  [12, 31, false, 365],
  [12, 31, true, 366]
]

input_results2.each do |month, day, leap_year, expected|
  julian = Calendar.julian_date(month, day, leap_year)
  unless  julian == expected
    puts "#{julian} does not equal #{expected}"
  end
end

input_results3 = [
  [1900, 1, 1, 1],
  [1900, 3, 15, 74],
  [1901, 1, 1, 366],
  [1904, 3, 1, 1521]
]

input_results3.each do |year, month, day, expected|
  julian = Calendar.total_julian_date(year, month, day)
  unless  julian == expected
    puts "#{julian} does not equal #{expected}"
  end
end

sunday_count = 0
(1901..2000).each do |year|
  (1..12).each do |month|
    julian_date = Calendar.total_julian_date(year, month, 1)
    sunday_count += 1 if julian_date % 7 == Calendar::WEEKDAYS[:sunday]
  end
end

puts sunday_count
