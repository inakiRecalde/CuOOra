Class {
	#name : #WelcomePage,
	#superclass : #WAComponent,
	#instVars : [
		'user',
		'pass'
	],
	#category : #'CuOOra-ui'
}

{ #category : #callbacks }
WelcomePage >> loguear [
	"(self model userWithUser: user protectedBy: password)
		ifNotNil: [ :it | self proceedWith: it ].
	user := nil.
	password := nil"
	| usuario |
	usuario := Usuario nombre: user contrasena: pass  email: 'jorge'.
	self model addUsuario: usuario.
	self proceedWith: usuario
	
	
]

{ #category : #model }
WelcomePage >> model [
	^ CuOOra soleInstance
]

{ #category : #callbacks }
WelcomePage >> newUser [
	| registro |
	registro= RegisterPage user: Usuario new.
	self call: registro.
	"registro user ifNotNil:  [ #group addUser: registro user]"
]

{ #category : #accessing }
WelcomePage >> pass [
	^ pass
]

{ #category : #accessing }
WelcomePage >> pass: anObject [
	pass := anObject
]

{ #category : #private }
WelcomePage >> proceedWith: aUser [
	self session user: aUser.
	self call: HomePage new
]

{ #category : #rendering }
WelcomePage >> renderContentOn: canvas [
	canvas paragraph: 'CuOOra'.
	canvas anchor
		callback: [  ];
		with: 'Registrarse'.
	canvas
		form: [ canvas space.
			canvas space.
			canvas space.
			canvas
				paragraph: [ canvas space.
					canvas space.
					canvas space.
					canvas space.
					canvas space.
					canvas space.
					canvas space.
					canvas space.
					canvas label: 'Usuario: '.
					canvas textInput on: #user of: self ].
			canvas
				paragraph: [ canvas space.
					canvas space.
					canvas space.
					canvas space.
					canvas space.
					canvas space.
					canvas space.
					canvas space.
					canvas label: 'Contraseña: '.
					canvas passwordInput on: #pass of: self ].
			canvas button
				callback: [ self loguear ];
				with: 'Iniciar sesion' ]
]

{ #category : #accessing }
WelcomePage >> user [
	^ user
]

{ #category : #accessing }
WelcomePage >> user: anObject [
	user := anObject
]
