require 'csv'

csv = CSV.read('../path/to/csv/test_csv.csv', headers: true)
pubs = []
samples = []

csv.each do |row|
  if row['Opt. Endorsement Line'].nil?
    samples << ['', '', '', '', '', '', row['Itembarcode'], row['FULLNAME'], '', '', '', '']
  else
    pubs << row
  end
end

CSV.open('new_csv.csv', 'w') do |new_csv|
  new_csv << csv.headers
  pubs.each { |item| new_csv << item }
  samples.each { |item| new_csv << item }
end
