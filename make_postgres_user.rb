require "pg"

conn = PG::connect(
	host: "tr",
	user: "postgres",
	dbname: "calendar"
)

40.times do |n|
	name = "a%03d" % n
	conn.exec("CREATE USER #{name}")
	conn.exec("ALTER USER #{name} WITH SUPERUSER")
end






