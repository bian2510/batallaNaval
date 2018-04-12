numeros = ["°",1,2,3,4]
a = ["a",0,0,0,0]
b = ["b",0,0,0,0]
c = ["c",0,0,0,0]
d = ["d",0,0,0,0]

print "#{numeros}\n"
print "#{a}\n"
print "#{b}\n"
print "#{c}\n"
print "#{d}\n"


def coordenadaBarcos
	posicionNumero = rand(1..4)
	posicionLetra = rand(5..8)

	case posicionLetra
		when 5
			posicionLetra = "a"
		when 6
			posicionLetra = "b"
		when 7
			posicionLetra = "c"
		when 8
			posicionLetra = "d"	
	end
	barco = "#{posicionLetra}#{posicionNumero}"
end

def posicionBarcos
	
@barco1 = coordenadaBarcos
@barco2 = coordenadaBarcos

	while @barco1 == @barco2
		@barco2 = coordenadaBarcos
		puts @barco2
	end
end
@turno = 0

def ronda
	while @turno < 4
		@turno+=1

		puts "Ronda #{@turno}"
		puts "Ingrese una cordenada en letra para su ataque"

		@cordenadaLetra = gets.chomp.to_s

		ataqueLetra

		puts "Ingrese una cordenada en numero para su ataque"

		@cordenadaNumero = gets.chomp.to_i

		ataqueNumero		

		disparo = "#{@cordenadaLetra}#{@cordenadaNumero}"
		puts disparo

	end

end

def ataqueLetra
	
		while @cordenadaLetra != "a" && @cordenadaLetra != "b" && @cordenadaLetra != "c" && @cordenadaLetra != "d" && @cordenadaLetra != "A" && @cordenadaLetra != "B" && @cordenadaLetra != "C" && @cordenadaLetra != "D"

			puts "Ingrese una cordenada en letra de la a a la d para su ataque"

			@cordenadaLetra = gets.chomp.to_s

		end
end

def ataqueNumero

	while @cordenadaNumero != 1 && @cordenadaNumero != 2 && @cordenadaNumero != 3 && @cordenadaNumero != 4

		puts "Ingrese una cordenada en numero del 1 al 4 para su ataque"

		@cordenadaNumero = gets.chomp.to_i

	end
	
end

coordenadaBarcos
posicionBarcos
ronda