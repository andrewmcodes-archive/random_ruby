require 'csv'

AddressList = Struct.new(:in_file, :out_file, :blank_condition) do
  def data
    @data ||= CSV.read(in_file, headers: true)
  end

  def parse_csv
    pubs = []
    samples = []

    data.each do |row|
      if row[blank_condition].nil?
        samples << ['', '', '', '', '', '', row['Itembarcode'], row['FULLNAME'], '', '', '', '']
      else
        pubs << row
      end
    end

    return pubs, samples
  end

  def create_csv
    pubs, samples = parse_csv

    CSV.open(out_file, 'w') do |new_csv|
      new_csv << data.headers
      pubs.each { |item| new_csv << item }
      samples.each { |item| new_csv << item }
    end
  end
end

AddressList.new('test_csv.csv', 'new_csv.csv', 'Opt. Endorsement Line').create_csv
