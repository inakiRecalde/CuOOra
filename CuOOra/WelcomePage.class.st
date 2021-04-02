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
	^self.
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

{ #category : #rendering }
WelcomePage >> renderContentOn: canvas [
	canvas paragraph: 'CuOOra'.
	"canvas anchor
		callback: [  ];
		with: 'Registrarse'."
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
					canvas textInput on: #pass of: self ].
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
