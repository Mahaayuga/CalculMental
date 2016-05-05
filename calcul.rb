stop = "!"
puts "\nAppuyer sur #{stop} pour arrêter\n\n"

score = { time: 0, err: 0, try: 0 }
level = { tmp_success: 0, tmp_fail: 0, max_a: 5, max_b: 5 }

loop do
  a = rand(2..level[:max_a])
  b = rand(2..level[:max_b])

  deb = Time.now
  print "#{a} x #{b} = "
  reponse = gets.chomp
  fin     = Time.now

  break if reponse == stop
  if reponse.to_i == a * b

    level[:tmp_success] += 1
    level[:tmp_fail] = 0
     
    if level[:tmp_success] == 3
      level[:max_a] += 1 unless level[:max_a] == 20
      level[:max_b] += 1 unless level[:max_b] == 20 
      level[:tmp_success] = 0
    end

  else
    printf "# => %i \n", a * b
    score[:err]      += 1

    level[:tmp_fail] += 1
    level[:tmp_success] = 0

    unless ( level[:tmp_fail] == 2 ) or ( fin - deb >= 10 )
      level[:max_a] -= 1 unless level[:max_a] == 5
      level[:max_b] -= 1 unless level[:max_b] == 5
      level[:tmp_fail] == 0    
    end

  end
  
  score[:time] += fin - deb
  score[:try] += 1

end



unless score[:try] == 0
  printf "\n\tAu revoir !\n" \
         "\t%2.1f sec par réponse\n" \
         "\t%2.1f %% d'erreur\n\n", \
         score[:time]/score[:try], (score[:err].to_f/score[:try].to_f) * 100

  puts "DEBUG #{level}"
  puts "DEBUG #{score}"
  printf "\n"
  
end
