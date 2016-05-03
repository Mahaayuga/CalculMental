class ScoreKeeper
  def initialize
    @minuteur = []
    @cpt = @err = 0
  end

  def <<(score)
    @minuteur << score.to_f
    @cpt += 1
  end

  def erreur (a, b)
    @err += 1
    printf "# => %i \n", a * b
  end

  def taux
    Float(@err) / @cpt unless @cpt.zero?
  end

  def moyenne
    fail "No score" if @cpt.zero?
    Float( @minuteur.inject(:+) ) / @cpt
  end
end

#IMPROVE init du stop
stop = "!"
puts "\nAppuyer sur #{stop} pour arrêter\n\n"

egg = ScoreKeeper.new

#MAIN
loop do
  a, b= rand(2..15), rand(2..15)

  deb = Time.now

  print "#{a} x #{b} = "
  ans = gets

  fin = Time.now

  break if ans.chomp == stop 
  egg.erreur(a, b) unless ans.to_i == a * b
  egg << fin - deb
end

printf "\nau revoir ! %2.1f sec\t%2.1f pourcent d'erreur\n\n", egg.moyenne, egg.taux * 100

# une multiplication, un prompt pour la réponse, un timer, des moyennes
# un level-up à venir
