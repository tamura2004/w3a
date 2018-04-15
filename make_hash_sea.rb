require "pathname"
require "fileutils"
require "digest/md5"

base = Pathname.pwd + "hash_sea"
FileUtils.rm_rf(base) if base.exist?
base.mkpath

items = (100000..999999).to_a
items -= [777777,235760,510927]
items = items.sample(8190) + [777777,235760,510927]
items.sort!

items.each do |item|
  digest = Digest::MD5.hexdigest(item.to_s)
  island = base + ("island_" + digest[0,4])
  island.mkpath

  num = "00"
  begin
    num.next!
    box = island + ("box" + num + ".txt")
  end while box.exist?

  box.open("w") do |fh|
    fh.puts item.to_s
  end
end

