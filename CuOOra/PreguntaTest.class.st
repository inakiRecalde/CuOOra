Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#category : #'CuOOra-model'
}

{ #category : #tests }
PreguntaTest >> testPorHacer [
"calcular puntaje y puntajeParticipaciones"
]

{ #category : #tests }
PreguntaTest >> testPreguntasDeTopicos [
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
