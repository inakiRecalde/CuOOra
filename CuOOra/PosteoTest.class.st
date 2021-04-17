Class {
	#name : #PosteoTest,
	#superclass : #TestCase,
	#category : #'CuOOra-test'
}

{ #category : #tests }
PosteoTest >> testDarDislike [
	 |p u |
		u:= Usuario
		nombre: 'Jose'
		contrasena: '123'
		email: 'jose@gmail.com'.
		p:= Posteo new.
		p darDislike: u.
		self assert: ((p cantDislikes) = 1).
]

{ #category : #tests }
PosteoTest >> testDarLike [
	 |p u |
		u:= Usuario
		nombre: 'Jose'
		contrasena: '123'
		email: 'jose@gmail.com'.
		p:= Posteo new.
		p darLike: u.
		self assert: ((p cantLikes) = 1).
]

{ #category : #tests }
PosteoTest >> testEsDe [
	 |p u |
		u:= Usuario
		nombre: 'Jose'
		contrasena: '123'
		email: 'jose@gmail.com'.
		p:= Posteo new.
		p user: u.
		self assert: (p esDe: u).
]
