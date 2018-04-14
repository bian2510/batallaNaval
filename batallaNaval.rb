class BatallaNaval

	@@mejoresDisparos = Array.new
	def initialize

		@turno = 0
		@numeros = 	["°","1","2","3","4"]
		@a = 		["a","0","0","0","0"]
		@b = 		["b","0","0","0","0"]
		@c = 		["c","0","0","0","0"]
		@d = 		["d","0","0","0","0"]

		@golpeado = Array.new
		@disparosRealizados = Array.new
		@barcosUbicacion = Array.new

		#COMIENZA LA UBICACION DE LOS BARCOS
		def coordenadaBarcos
			@posicionNumero = rand(1..4)
			@posicionLetra = rand(5..8)
			
				case @posicionLetra
					when 5
						@posicionLetra = "a"
					when 6
						@posicionLetra = "b"
					when 7
						@posicionLetra = "c"
					when 8
						@posicionLetra = "d"	
					end

			@barco = "#{@posicionLetra}#{@posicionNumero}"
		end

		def posicionBarcos
			
		@barco1 = coordenadaBarcos
		@barco2 = coordenadaBarcos
			while @barco1 == @barco2
				@barco2 = coordenadaBarcos
			end
		@barcos = [@barco1,@barco2]
		puts "#{@barco1}#{@barco2}"
		end
		#TERMINA LA UBICACION DE LOS BARCOS
		#COMIENZA LA RONDA DEL JUEGO

		def ronda

			while @turno < 8 && @barcos != @golpeado	
				@turno+=1

				puts "Ronda #{@turno} disparos restantes #{8 - @turno}"
				
				posicionDisparo
				noSeanIguales	
				verificarDisparo

				@disparosRealizados.push(@disparo)
				tableroJuego

			end
			if @barcos == @golpeado
				puts "*******************\nGanaste con #{@turno} disparos"
				@@mejoresDisparos.push("Disparos: #{@turno}")
				puts "*******************\nMejores puntuaciones\n*******************"
				puts @@mejoresDisparos.sort
				puts "*******************"
			else
				puts "*******************\nPerdiste"
				puts "*******************\nMejores puntuaciones\n*******************"
				puts @@mejoresDisparos
				puts "*******************"
			end
				
		end
#VERIFICAR QUE UN DISPARO DIO EN UN BARCO O NO
		def verificarDisparo

			if @disparo == @barco1
					cambioTablero("X")
					@golpeado.push(@barco1)
					puts "Destruirte un barco\n"
				elsif @disparo == @barco2
					cambioTablero("X")
					@golpeado.push(@barco2)
					puts "Destruirte un barco\n"
					else
					@disparo =! @barco1 && @barco2
					cambioTablero("*")
					puts "Fallaste\n"
				end
			
		end
#MARCA EL TABLERO CON UN SIMBOLO		
		def cambioTablero(marca)
			
			if @cordenadaLetra == "a" || @cordenadaLetra == "A"

				@a[@cordenadaNumero] = marca

				elsif @cordenadaLetra == "b" || @cordenadaLetra == "B"

					@b[@cordenadaNumero] = marca

					elsif  @cordenadaLetra == "c" || @cordenadaLetra == "C"

						@c[@cordenadaNumero] = marca

						elsif @cordenadaLetra == "d" || @cordenadaLetra == "D"

							@d[@cordenadaNumero] = marca			 	 

				end
			
		end

		def ataqueLetra
			
			while @cordenadaLetra != "a" && @cordenadaLetra != "b" && @cordenadaLetra != "c" && @cordenadaLetra != "d" && @cordenadaLetra != "A" && @cordenadaLetra != "B" && @cordenadaLetra != "C" && @cordenadaLetra != "D"

				puts "Ingrese una cordenada en letra de la \"a\" a la \"d\" para su ataque"

				@cordenadaLetra = gets.chomp.to_s

			end
		end

		def ataqueNumero

			while @cordenadaNumero != 1 && @cordenadaNumero != 2 && @cordenadaNumero != 3 && @cordenadaNumero != 4

				puts "Ingrese una cordenada en numero del \"1\" al \"4\" para su ataque"

				@cordenadaNumero = gets.chomp.to_i

			end	
			
		end

		def tableroJuego
			@numeros.each do |i|
				print "#{i} "
			end
		puts ""
			@a.each do |i|
				print "#{i} "
			end
		puts ""
			@b.each do |i|
				print "#{i} "
			end
		puts ""
			@c.each do |i|
				print "#{i} "
			end
		puts ""
			@d.each do |i|
				print "#{i} "
			end
		puts ""			
		end

		def reiniciar
			puts "Desea volver a jugar\n 1 = Reiniciar\n 2 = Salir"
			@opcion = gets.chomp.to_i
			while @opcion != 1 && @opcion != 2
				puts "Seleccione:\n1 = Reiniciar\n2= Salir"		
			end
			if @opcion == 1
				@turno = 0
				initialize
				tableroJuego
				coordenadaBarcos
				posicionBarcos
				ronda
				reiniciar
			elsif @opcion == 2
				puts "Adios"

			end
		end
	end
	
		def noSeanIguales

			@disparosRealizados.each do |i|
		
				if i != @disparo
		
				else 
			
					while i == @disparo
				
						puts "Ingrese otro punto ya ese fue utilizado"
						posicionDisparo
					end
		
				end
			end
					@disparosRealizados.push(@disparo)

		end

		def posicionDisparo
			
				puts "Ingrese una cordenada en letra para su ataque"

						@cordenadaLetra = gets.chomp.to_s

						ataqueLetra

						puts "Ingrese una cordenada en numero para su ataque"

						@cordenadaNumero = gets.chomp.to_i

						ataqueNumero

						@disparo = "#{@cordenadaLetra}#{@cordenadaNumero}"

		end
	
	
end
objeto = BatallaNaval.new
objeto.tableroJuego
objeto.coordenadaBarcos
objeto.posicionBarcos
objeto.ronda
objeto.reiniciar