require "pathname"
require "fileutils"
require "digest/md5"

base = Pathname.pwd + "index_cave"
FileUtils.rm_rf(base) if base.exist?
# base.mkpath

before = (100000..777776).to_a.sample(2000)
after = (777778..999999).to_a.sample(6190)
items = before + [777777] + after

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

