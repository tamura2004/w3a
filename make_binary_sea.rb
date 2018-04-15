require "pathname"

base = Pathname.pwd + "binary_sea"
base.rmdir if base.exist?
base.mkpath

items = (100000..999999).to_a
items -= [777777]
items = items.sample(8190) + [777777]
items.sort!

('1000'..'9190').each_with_index do |num, i|
  island = base + ("island" + num)
  island.mkpath

  box = island + "box.txt"
  box.open("w") do |fh|
    fh.puts items[i]
  end
end

