# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
require "open-uri"

puts "Clearing Database..."
Reservation.destroy_all
Tool.destroy_all
User.destroy_all

puts "Creating New Users"

user = User.new(
  email: "ernesto@airtool.com",
  password: "ernesto1234",
  name: "Ernesto",
  location: "Lorenzo López 624, Pilar Centro, Provincia de Buenos Aires"
)
file = URI.open('https://ca.slack-edge.com/T02NE0241-U010026QV2Q-21399e9af22d-512')
user.avatar.attach(io: file, filename: "#{user.name}.png", content_type: 'image/png')
user.save!

user = User.new(
  email: "nadia@airtool.com",
  password: "nadia1234",
  name: "Nadia",
  location: "Arévalo 2279, FZC, Buenos Aires"
)
file = URI.open('https://ca.slack-edge.com/T02NE0241-UV362N1GB-99b98618119c-512')
user.avatar.attach(io: file, filename: "#{user.name}.png", content_type: 'image/png')
user.save!

user = User.new(
  email: "mauricio@airtool.com",
  password: "mauricio1234",
  name: "Mauricio",
  location: "Honduras 5207, C1414, Buenos Aires"
)
file = URI.open('https://ca.slack-edge.com/T02NE0241-U0105LQJJ56-bd4c0813ae97-512')
user.avatar.attach(io: file, filename: "#{user.name}.png", content_type: 'image/png')
user.save!

user = User.new(
  email: "bob@airtool.com",
  password: "bobconstruye1234",
  name: "Bob",
  location: "Rueda 755, Rosario, Santa Fe Province"
)
file = URI.open('https://www.silvitablanco.com.ar/bob-the-builder/bobthebuildersssxsssxxab.jpg')
user.avatar.attach(io: file, filename: "#{user.name}.png", content_type: 'image/png')
user.save!

puts "Creating New Tools"

puts "Creating Tool 1"

tool = Tool.new(
  name: "Hidrolavadora Autostop Dosificador - Aburrido en la Cuarentena ®",
  description: "Ideal para lavar tu bici, auto o moto y para limpiar pisos y paredes. Accesorios incluidos lanza, filtro y dispenser de jabon",
  category: "Rare Tools",
  status: true,
  price: Faker::Number.number(digits: 3),
  rating: Faker::Number.between(from: 1, to: 5)
)
file = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTCb3fC9LUpjnH45sXS3oRA9PTu-tVv7LWYquHn2c_bCQ4UN8-_mZ7noa8r1wpQX-LAmGWoRviw&usqp=CAc')
tool.photo.attach(io: file, filename: "#{tool.name}.png", content_type: 'image/png')
tool.user = User.all.sample
tool.adress = tool.user.location
tool.save!

puts "Creating Reservations for Tool 1"

5.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Date.today-rand(30),
    end_start: Date.today+rand(30),
  )
  reservation.user = (User.all - [tool.user]).sample
  reservation.tool = tool
  reservation.save!
end

puts "Creating Tool 2"

tool = Tool.new(
  name: "Set Herramientas para el Hogar - Aburrido en la Cuarentena ®",
  description: "Aburrido en la cuarentena?? Completo kit de 132 herramientas con todo lo que se necesita para realizar cualquier arreglo, fácil de transportar de forma ordenada y cómoda gracias a su maletín rígido desplegable.",
  category: "House Tools",
  status: true,
  price: Faker::Number.number(digits: 3),
  rating: Faker::Number.between(from: 1, to: 5)
)
file = URI.open('https://http2.mlstatic.com/set-herramientas-completo-piezas-juego-kit-caja-nuevo-hogar-D_NQ_NP_907344-MLA42167975173_062020-F.webp')
tool.photo.attach(io: file, filename: "#{tool.name}.png", content_type: 'image/png')
tool.user = User.all.sample
tool.adress = tool.user.location
tool.save!

puts "Creating Reservations for Tool 2"

5.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Date.today-rand(30),
    end_start: Date.today+rand(30),
  )
  reservation.user = (User.all - [tool.user]).sample
  reservation.tool = tool
  reservation.save!
end

puts "Creating Tool 3"

tool = Tool.new(
  name: "Set De Destornillador - Aburrido en la Cuarentena ®",
  description: " Aburrido en la cuarentena?? Ideal para todo tipo de uso!! Incluye seis puntas intercambiables. Formatos en puntas planas y phillips. Agarre antideslizante",
  category: "House Tools",
  status: true,
  price: Faker::Number.number(digits: 3),
  rating: Faker::Number.between(from: 1, to: 5)
)
file = URI.open('https://http2.mlstatic.com/set-de-destornillador-herramienta-seis-en-uno-hogar-taller-D_NQ_NP_952173-MLA40302899587_012020-F.webp')
tool.photo.attach(io: file, filename: "#{tool.name}.png", content_type: 'image/png')
tool.user = User.all.sample
tool.adress = tool.user.location
tool.save!

puts "Creating Reservations for Tool 3"

5.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Date.today-rand(30),
    end_start: Date.today+rand(30),
  )
  reservation.user = (User.all - [tool.user]).sample
  reservation.tool = tool
  reservation.save!
end

puts "Creating Tool 4"

tool = Tool.new(
  name: "Pinza Multifunción - Aburrido en la Cuarentena ®",
  description: " Aburrido en la cuarentena?? Ideal para sujetar cualquier cosa!!. Cuchillas de acero inoxidable resistente a la corrosión. Cuerpo de aluminio de alta resistencia.",
  category: "House Tools",
  status: true,
  price: Faker::Number.number(digits: 3),
  rating: Faker::Number.between(from: 1, to: 5)
)
file = URI.open('https://http2.mlstatic.com/pinza-multifuncion-bahco-mtt151-18-funciones-estuche-D_NQ_NP_615030-MLA31062826789_062019-F.webp')
tool.photo.attach(io: file, filename: "#{tool.name}.png", content_type: 'image/png')
tool.user = User.all.sample
tool.adress = tool.user.location
tool.save!

puts "Creating Reservations for Tool 4"

5.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Date.today-rand(30),
    end_start: Date.today+rand(30),
  )
  reservation.user = (User.all - [tool.user]).sample
  reservation.tool = tool
  reservation.save!
end

puts "Creating Tool 5"

tool = Tool.new(
  name: "Generador portátil - Aburrido en la Cuarentena ®",
  description: "Aburrido en la cuarentena?? Ilumina TODO!! Alternativa segura para los cortes de suministro. Monofásico. Potencia máxima de 5500W.",
  category: "Industrial Tools",
  status: true,
  price: Faker::Number.number(digits: 3),
  rating: Faker::Number.between(from: 1, to: 5)
)
file = URI.open('https://http2.mlstatic.com/D_NQ_NP_2X_888550-MLA40103563591_122019-F.webp')
tool.photo.attach(io: file, filename: "#{tool.name}.png", content_type: 'image/png')
tool.user = User.all.sample
tool.adress = tool.user.location
tool.save!

puts "Creating Reservations for Tool 5"

5.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Date.today-rand(30),
    end_start: Date.today+rand(30),
  )
  reservation.user = (User.all - [tool.user]).sample
  reservation.tool = tool
  reservation.save!
end

puts "Creating Tool 6"

tool = Tool.new(
  name: "Aspiradora Home & Garden - Aburrido en la Cuarentena ®",
  description: "Aburrido en la cuarentena?? Apira tu casa y tu balcon!! Aspiradora de mano. Funciona sin bolsa. Sistema de filtrado incorporado. Se enciende manualmente. Su potencia es de 500W y puede ser regulada. Tus espacios siempre deslumbrantes.",
  category: "House Tools",
  status: true,
  price: Faker::Number.number(digits: 3),
  rating: Faker::Number.between(from: 1, to: 5)
)
file = URI.open('https://http2.mlstatic.com/D_NQ_NP_2X_840950-MLA41422024060_042020-F.webp')
tool.photo.attach(io: file, filename: "#{tool.name}.png", content_type: 'image/png')
tool.user = User.all.sample
tool.adress = tool.user.location
tool.save!

puts "Creating Reservations for Tool 6"

5.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Date.today-rand(30),
    end_start: Date.today+rand(30),
  )
  reservation.user = (User.all - [tool.user]).sample
  reservation.tool = tool
  reservation.save!
end

puts "Creating Tool 7"

tool = Tool.new(
  name: "Clavadora Engrampadora - Aburrido en la Cuarentena ®",
  description: "Aburrido en la cuarentena?? Armate tu propia mesa de fibrofácil!! Funciona con compresor de 50 lts. Calibre: 18Ga. Incluye: Acople rápido, 1 un botella con lubricante, 2 llaves hexagonales. Capacidad de grampas: 16-40mm. Capacidad de clavos: 15-50mm. Cargador de 100 un",
  category: "Industrial Tools",
  status: true,
  price: Faker::Number.number(digits: 3),
  rating: Faker::Number.between(from: 1, to: 5)
)
file = URI.open('https://http2.mlstatic.com/clavadora-engrampadora-neumatica-lusqtoff-grapadora-2-en-1-D_NQ_NP_659067-MLA32319167405_092019-F.webp')
tool.photo.attach(io: file, filename: "#{tool.name}.png", content_type: 'image/png')
tool.user = User.all.sample
tool.adress = tool.user.location
tool.save!

puts "Creating Reservations for Tool 7"

5.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Date.today-rand(30),
    end_start: Date.today+rand(30),
  )
  reservation.user = (User.all - [tool.user]).sample
  reservation.tool = tool
  reservation.save!
end

puts "Creating Tool 8"

tool = Tool.new(
  name: "Aspiradora Industrial - Aburrido en la Cuarentena ®",
  description: "Aburrido en la cuarentena?? Ponete un lavaderao en la vereda!! Aspiradora Industrial de Polvo y Líquido. Marca: RC Distribuidora. Modelo: CB60-2. Posee 2 motores de 1000W c/u. Potencia total 2000W. Tanque inox de 60 lts con manguera para descarga de líquidos. 2 ruedas fijas y 2 ruedas giratorias. Manguera de desagote de líquido. Dimensiones: 63,5x56x108,5 cm. Peso 22 kg",
  category: "Industrial Tools",
  status: true,
  price: Faker::Number.number(digits: 3),
  rating: Faker::Number.between(from: 1, to: 5)
)
file = URI.open('https://http2.mlstatic.com/aspiradora-industrial-60-litros-2000w-polvo-agua-doble-motor-D_NQ_NP_900748-MLA31056432883_062019-F.webp')
tool.photo.attach(io: file, filename: "#{tool.name}.png", content_type: 'image/png')
tool.user = User.all.sample
tool.adress = tool.user.location
tool.save!

puts "Creating Reservations for Tool 8"

5.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Date.today-rand(30),
    end_start: Date.today+rand(30),
  )
  reservation.user = (User.all - [tool.user]).sample
  reservation.tool = tool
  reservation.save!
end

puts "Creating Tool 9"

tool = Tool.new(
  name: "Kit Taladro Percutor - Aburrido en la Cuarentena ®",
  description: "Aburrido en la cuarentena?? Colga todos los cuadros que no colgaste desde la mudanza!! Selector para percutor o mecha, montado sobre block de aluminio inyectado, bobinado en cobre, empuñadora Soft Grip, totalmente montado en rulemanes, empuñadura con medidor de profundidad.",
  category: "House Tools",
  status: true,
  price: Faker::Number.number(digits: 3),
  rating: Faker::Number.between(from: 1, to: 5)
)
file = URI.open('https://http2.mlstatic.com/kit-taladro-percutor-hyundai-600w-maletin-29-piezas-sti-D_NQ_NP_949683-MLA42491655446_072020-F.webp')
tool.photo.attach(io: file, filename: "#{tool.name}.png", content_type: 'image/png')
tool.user = User.all.sample
tool.adress = tool.user.location
tool.save!

puts "Creating Reservations for Tool 9"

5.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Date.today-rand(30),
    end_start: Date.today+rand(30),
  )
  reservation.user = (User.all - [tool.user]).sample
  reservation.tool = tool
  reservation.save!
end

puts "Creating Tool 10"

tool = Tool.new(
  name: "Pistola De Encolar - Aburrido en la Cuarentena ®",
  description: "Aburrido en la cuarentena?? Pega, sella y repara todo lo que guardaste en el cajon de las cosas rotas!!. Con exclusivo pico aislante y llave de encendido. Uso intensivo profesional, gran caudal de adhesivo 30 Grs/Min. Funde rápido, no pierde, no se obstruye ni se recalienta. Utiliza barras de pegamento 1,12Cm gruesa, incluye 2 de repuesto en su caja original.",
  category: "House Tools",
  status: true,
  price: Faker::Number.number(digits: 3),
  rating: Faker::Number.between(from: 1, to: 5)
)
file = URI.open('https://http2.mlstatic.com/pistola-de-encolar-dasa-180-w-10-barras-de-silicona-D_NQ_NP_636704-MLA31655757187_082019-F.webp')
tool.photo.attach(io: file, filename: "#{tool.name}.png", content_type: 'image/png')
tool.user = User.all.sample
tool.adress = tool.user.location
tool.save!

puts "Creating Reservations for Tool 10"

5.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Date.today-rand(30),
    end_start: Date.today+rand(30),
  )
  reservation.user = (User.all - [tool.user]).sample
  reservation.tool = tool
  reservation.save!
end

puts "Creating Tool 11"

tool = Tool.new(
  name: "Sierra Multicortadora - Aburrido en la Cuarentena ®",
  description: "Aburrido en la cuarentena?? Corta con tanto Netflix!! Velocidad variable. Trabaja por vibración, segura para el operario. Empuñadura con sistema Soft-Grip, mejor agarre y confortable a la mano. Diseño compacto y ergonómico",
  category: "House Tools",
  status: true,
  price: Faker::Number.number(digits: 3),
  rating: Faker::Number.between(from: 1, to: 5)
)
file = URI.open('https://http2.mlstatic.com/sierra-multicortadora-oscilante-salkor-maletin-kit-22pc-D_NQ_NP_763263-MLA31116406447_062019-F.webp')
tool.photo.attach(io: file, filename: "#{tool.name}.png", content_type: 'image/png')
tool.user = User.all.sample
tool.adress = tool.user.location
tool.save!

puts "Creating Reservations for Tool 11"

5.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Date.today-rand(30),
    end_start: Date.today+rand(30),
  )
  reservation.user = (User.all - [tool.user]).sample
  reservation.tool = tool
  reservation.save!
end

puts "Creating Tool 12"

tool = Tool.new(
  name: "Amoladora Angular - Aburrido en la Cuarentena ®",
  description: "Aburrido en la cuarentena?? Esto para que se usa? El disco tiene un diámetro de 115mm. Tiene interruptor de tecla. Su potencia es de 830W. Velocidad máxima de rotación de 11000rpm. Es antipolvo y protege al motor de la suciedad entrante. Pesa 2.4kg. Herramienta versátil para lijar, pulir y cortar.",
  category: "House Tools",
  status: true,
  price: Faker::Number.number(digits: 3),
  rating: Faker::Number.between(from: 1, to: 5)
)
file = URI.open('https://http2.mlstatic.com/D_NQ_NP_2X_663800-MLA42148121542_062020-F.webp')
tool.photo.attach(io: file, filename: "#{tool.name}.png", content_type: 'image/png')
tool.user = User.all.sample
tool.adress = tool.user.location
tool.save!

puts "Creating Reservations for Tool 12"

5.times do
  reservation = Reservation.new(
    status: Faker::Boolean.boolean,
    start_date: Date.today-rand(30),
    end_start: Date.today+rand(30),
  )
  reservation.user = (User.all - [tool.user]).sample
  reservation.tool = tool
  reservation.save!
end
