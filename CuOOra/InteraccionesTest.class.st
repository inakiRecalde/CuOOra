Class {
	#name : #InteraccionesTest,
	#superclass : #TestCase,
	#category : #'CuOOra-test'
}

{ #category : #tests }
InteraccionesTest >> testInteracciones [
|usuario interaccion|
	interaccion := Interacciones new.
	usuario := Usuario nombre: 'Jose'  contrasena:'123'  email:'jose@gmail.com'.
	interaccion user: usuario.
	self assert: (interaccion esDe: usuario).

]
