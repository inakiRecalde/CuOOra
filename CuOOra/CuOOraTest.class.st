Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#category : #'CuOOra-model'
}

{ #category : #tests }
CuOOraTest >> testPreguntas [
	| pregunta cuora |
	cuora := CuOOra new.
	pregunta := Pregunta
		titulo: 'Posteando'
		descripcion: 'mi primer posteo '
		topicos: 'futbol'
		user: 'usuario'.
	cuora agregarPregunta: pregunta.
	self assert: (cuora incluyePregunta: pregunta).
	cuora eliminarPregunta: pregunta.
	self assert: (cuora incluyePregunta: pregunta) not.
]

{ #category : #tests }
CuOOraTest >> testPreguntasDeUnTopico [
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
	self assert: ((cuora preguntasDeUnTopico:  topico) includes:pregunta)
]

{ #category : #tests }
CuOOraTest >> testPreguntasRelevantes [
	| topico topico2 cuora pregunta pregunta1 coleccionT coleccionT2 usuario usuario2 usuario3 |
	coleccionT := OrderedCollection new.
	coleccionT2 := OrderedCollection new.
	cuora := CuOOra new.
	topico := Topico nombre: 'futbol' descripcion: 'deporte con pelota'.
	cuora agregarTopico: topico.
	coleccionT add: topico.
	topico2 := Topico
		nombre: 'politoca'
		descripcion: 'deporte con pelota'.
	cuora agregarTopico: topico2.
	coleccionT2 add: topico2.
	usuario := Usuario
		nombre: 'Jose'
		contrasena: '123'
		email: 'jose@gmail.com'.
	cuora addUsuario: usuario.
	usuario topicoDeInteres: topico.
	usuario2 := Usuario
		nombre: 'pedrop'
		contrasena: '123'
		email: 'jose@gmail.com'.
	cuora addUsuario: usuario2.
	usuario3 := Usuario
		nombre: 'franco'
		contrasena: '123'
		email: 'jose@gmail.com'.
	cuora addUsuario: usuario3.
	usuario seguirUser: usuario3.
	pregunta := Pregunta
		titulo: 'Posteando'
		descripcion: 'mi primer posteo '
		topicos: coleccionT
		user: usuario2.
	cuora agregarPregunta: pregunta.
	pregunta1 := Pregunta
		titulo: 'Posteando'
		descripcion: 'mi primer posteo '
		topicos: coleccionT2
		user: usuario3.
	cuora agregarPregunta: pregunta1.
	self
		assert: ((cuora preguntasRelevantes: usuario) includes: pregunta).
	self
		assert: ((cuora preguntasRelevantes: usuario) includes: pregunta1)
]

{ #category : #tests }
CuOOraTest >> testPreguntasSeguidores [
	| pregunta cuora usuario usuario2 |
	cuora := CuOOra new.
	usuario := Usuario
		nombre: 'Jose'
		contrasena: '123'
		email: 'jose@gmail.com'.
	cuora addUsuario: usuario.
	usuario2 := Usuario
		nombre: 'Pedro'
		contrasena: '123'
		email: 'pedro@gmail.com'.
	cuora addUsuario: usuario2.
	usuario seguirUser: usuario2.
	usuario2 seguirUser: usuario.
	pregunta := Pregunta
		titulo: 'Posteando'
		descripcion: 'mi primer posteo '
		topicos: 'futbol'
		user: usuario2.
		cuora agregarPregunta: pregunta.
	self
		assert: ((cuora preguntasDeSeguidores: usuario follows) includes: pregunta)
]

{ #category : #tests }
CuOOraTest >> testPuntajeDeUsuarios [
	| topico  cuora pregunta  coleccionT  usuario usuario2  |
	
	coleccionT := OrderedCollection new.
	cuora := CuOOra new.
	topico := Topico nombre: 'futbol' descripcion: 'deporte con pelota'.
	cuora agregarTopico: topico.
	coleccionT add: topico.
	
	usuario := Usuario
		nombre: 'Jose'
		contrasena: '123'
		email: 'jose@gmail.com'.
	cuora addUsuario: usuario.
	usuario topicoDeInteres: topico.
	usuario2 := Usuario
		nombre: 'pedrop'
		contrasena: '123'
		email: 'jose@gmail.com'.
	cuora addUsuario: usuario2.
	
	pregunta := Pregunta
		titulo: 'Posteando'
		descripcion: 'mi primer posteo '
		topicos: coleccionT
		user: usuario2.
	cuora agregarPregunta: pregunta.
	
	pregunta respuestas: (Respuesta text: 'textComent'  user:usuario ).

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
	| usuario cuora |
	cuora := CuOOra new.
	usuario := Usuario
		nombre: 'Jose'
		contrasena: '123'
		email: 'jose@gmail.com'.
	cuora addUsuario: usuario.
	
	self assert: (cuora usuario: usuario nombre protectedBy:  '123') identicalTo: usuario
]
