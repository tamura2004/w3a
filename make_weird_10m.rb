require "pathname"

file = Pathname.new("/home/tamura/share/big/100k.csv")

base_time = Time.local(2018,7,1)

file.open("w") do |fh|
  100_000.times do |i|
  	time = base_time + rand(30) * 3600 * 24
    if i == 77777
      fh.puts "2018-07-01,123456,weird"
    else
      fh.puts "#{time.strftime('%Y-%m-%d')},#{sprintf('%06d',rand(100000))},happy"
    end
    if i%10000 == 0
      puts i
      STDOUT.flush
    end
  end
end

