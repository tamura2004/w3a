require "pathname"

file = Pathname.pwd + "10m.csv"
FileUtils.rm_rf(base) if base.exist?open("10m.csv","w")

file.open("w") do |fh|
  10_000_000.times do |i|
    if i == 7777777
      fh.puts "2018-07-01,123456,weird"
    else
      fh.puts "2018-07-01,123456,happy"
    end
  end
end

