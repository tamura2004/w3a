require "pathname"

base = Pathname.pwd + "liner_sea"
base.rmdir if base.exist?
base.mkpath

('01'..'20').each do |num|
  island = base + ("island" + num)
  island.mkpath

  box = island + "box.txt"
  box.open("w") do |fh|
    if num == "05"
      fh.puts "map"
    else
      fh.puts "null"
    end
  end
end

