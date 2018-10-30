require 'csv'
require 'titleize'

CSV.foreach('menu_new.csv') do |row|
  if row[3] != nil
    puts '<li class="menu-item"><h1 class="menu-item-title">' + row[2].downcase.titleize + '</h1><p class="menu-item-description">' + row[3] + '<span class="menu-item-price">' + row[1] + '</span></p></li>'
  else
    puts '<li class="menu-item"><h1 class="menu-item-title">' + row[2].downcase.titleize + '</h1><p class="menu-item-price">' + row[1] + '</p></li>'
  end
end
