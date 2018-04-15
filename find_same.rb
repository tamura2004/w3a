require "digest/md5"

items = (100000..999999).to_a

items.each do |item|
  digest = Digest::MD5.hexdigest(item.to_s)

  if digest[0,4] == "f63f"
    p [item, digest]
  end
end

