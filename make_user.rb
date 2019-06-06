40.times do |n|
	name = "a%03d" % n
	puts `createuser -d #{name}`
end

	name = "a%03d" % n
	`sudo ln -s /home/tamura/project/ruby/w3a/index_cave /home/#{name}/index_cave`
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





