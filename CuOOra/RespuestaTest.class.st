Class {
	#name : #RespuestaTest,
	#superclass : #TestCase,
	#category : #'CuOOra-model'
}

{ #category : #tests }
RespuestaTest >> testUserDiferenteA [
	 |r u u2|
		u:= Usuario
		nombre: 'Jose'
		contrasena: '123'
		email: 'jose@gmail.com'.
		u2:= Usuario
		nombre: 'Jose2'
		contrasena: '123'
		email: 'jose@gmail.com'.
		r:= Respuesta text: 'b' user:u.
		self assert:  (r userDiferenteA: u2). 
]

{ #category : #tests }
RespuestaTest >> testUserigualA [
	 |r u |
		u:= Usuario
		nombre: 'Jose'
		contrasena: '123'
		email: 'jose@gmail.com'.
		r:= Respuesta text: 'b' user:u.
		self assert:  (r userIgualA: u). 
]
