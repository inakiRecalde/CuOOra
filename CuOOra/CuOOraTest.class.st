Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#category : #'CuOOra-model'
}

{ #category : #tests }
CuOOraTest >> testPreguntas [
|pregunta cuora |
	cuora := CuOOra new.
	
	pregunta := Pregunta titulo:'Posteando' descripcion:'mi primer posteo 'topicos: 'futbol' user: 'usuario'.
	cuora agregarPregunta: pregunta.
	self assert: (cuora incluyePregunta: pregunta).
]

{ #category : #tests }
CuOOraTest >> testTopicos [
|topico cuora|
	cuora := CuOOra new.
	topico := Topico nombre: 'futbol' descripcion: 'deporte con pelota'.
	cuora agregarTopico: topico.
	self assert: (cuora incluyeTopico:topico).
]

{ #category : #tests }
CuOOraTest >> testUsuario [
|usuario cuora|
	cuora := CuOOra new.
	usuario := Usuario nombre: 'Jose'  contrasena:'123'  email:'jose@gmail.com'.
	cuora addUsuario: usuario.
	self assert: (cuora incluyeUsuario: usuario).

]
