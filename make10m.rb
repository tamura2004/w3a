emotions = %w(happy luckey sad angry)

open("10m.csv","w") do |fh|
	10_000_000.times do |n|
		if n % 3_000_000 == 1
			fh.printf("2018-07-%02d,%07d,weird\n",n%30+1,n)
		else
			fh.printf("2018-07-%02d,%07d,#{emotions[n%4]}\n",n%30+1,n)
		end
		
		if n % 10000 == 0
			puts n
			STDOUT.flush
		end
	end
end
