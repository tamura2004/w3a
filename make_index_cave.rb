require "pathname"
require "fileutils"
require "digest/md5"

base = Pathname.pwd + "index_cave"
FileUtils.rm_rf(base) if base.exist?
# base.mkpath

bootstrap = [500000,400000,900000,350000,450000,700000,950000,600000,800000]

items = (100000..999999).to_a.sample(8181)
items += [777777]
items.shuffle!
items = bootstrap + items

def insert(path,item)
  path.mkpath unless path.exist?

  box = path + "box.txt"
  if box.exist?
    num = box.read.to_i

    if num < item
      newpath = path + "right"
    else
      newpath = path + "left"
    end

    insert(newpath, item)

  else
    box.open("w") do |fh|
      fh.puts item.to_s
    end
  end
end

items.each do |item|
  insert(base, item)
  puts item
  STDOUT.flush
end

