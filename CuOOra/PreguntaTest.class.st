Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#category : #'CuOOra-test'
}

{ #category : #tests }
PreguntaTest >> testPorHacer [
"calcular puntaje y puntajeParticipaciones"
]

{ #category : #tests }
PreguntaTest >> testPreguntaDeTopico [
	| topico cuora pregunta coleccionT|
	coleccionT:= OrderedCollection new.
	cuora := CuOOra new.
	topico := Topico nombre: 'futbol' descripcion: 'deporte con pelota'.
	cuora agregarTopico: topico.
	coleccionT add: topico.
	pregunta := Pregunta
		titulo: 'Posteando'
		descripcion: 'mi primer posteo '
		topicos: coleccionT
		user: 'usuario'.
	cuora agregarPregunta: pregunta.
	self assert: (pregunta preguntaDeTopico:  topico)
]

{ #category : #tests }
PreguntaTest >> testPreguntaDeUser [
| topico cuora pregunta coleccionT u|
	coleccionT:= OrderedCollection new.
	cuora := CuOOra new.
	topico := Topico nombre: 'futbol' descripcion: 'deporte con pelota'.
	cuora agregarTopico: topico.
	coleccionT add: topico.
	u:= Usuario
		nombre: 'Jose'
		contrasena: '123'
		email: 'jose@gmail.com'.
	pregunta := Pregunta
		titulo: 'Posteando'
		descripcion: 'mi primer posteo '
		topicos: coleccionT
		user: u.
	
	cuora agregarPregunta: pregunta.
	self assert: (pregunta preguntaDeUser:  u)
	
]

{ #category : #tests }
PreguntaTest >> testRespuestasDeUser [
| topico cuora pregunta coleccionT u r|
	coleccionT:= OrderedCollection new.
	cuora := CuOOra new.
	topico := Topico nombre: 'futbol' descripcion: 'deporte con pelota'.
	cuora agregarTopico: topico.
	coleccionT add: topico.
	u:= Usuario
		nombre: 'Jose'
		contrasena: '123'
		email: 'jose@gmail.com'.
	pregunta := Pregunta
		titulo: 'Posteando'
		descripcion: 'mi primer posteo '
		topicos: coleccionT
		user: u.
	r:= Respuesta text: 'hola' user: u. 
	cuora agregarPregunta: pregunta.
	pregunta respuestas: r.
	self assert: (((pregunta respuestasDeUser:  u) asOrderedCollection )first = r).
]
