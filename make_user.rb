40.times do |n|
	name = "a%03d" % n
	# `sudo ln -s /home/tamura/w3a/index_cave /home/#{name}/index_cave`
	# `sudo ln -s /home/tamura/w3a/binary_sea /home/#{name}/binary_sea`
	# `sudo ln -s /home/tamura/w3a/liner_sea /home/#{name}/liner_sea`
	# `sudo ln -s /home/tamura/w3a/hash_sea /home/#{name}/hash_sea`
	# `sudo ln -s /home/tamura/w3a/collision /home/#{name}/collision`
	# `sudo ln -s /home/tamura/w3a/golden_statue /home/#{name}/golden_statue`
		puts `createuser -d -s #{name}`
end

__END__

require "pg"

conn = PG::connect(
	host: "localhost",
	user: "tamura",
	password: "tamura",
	dbname: "calendar"
)

40.times do |n|
	name = "a%03d" % n
	# conn.exec("GRANT select ON m10 to #{name}")
	conn.exec("ALTER USER #{name} WITH SUPERUSER")
end

outf = open("users.txt","w")

40.times do |n|
	name = "a%03d" % n
	outf.puts "%s:%s::::/home/%s:/bin/bash" % ([name]*3)
end

outf.close

`newusers users.txt`
