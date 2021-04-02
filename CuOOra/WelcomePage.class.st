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

{ #category : #rendering }
WelcomePage >> renderContentOn: canvas [
	canvas anchor
		callback: [  ];
		with: 'Registrarse'.
	canvas
		form: [ canvas
				paragraph: [ canvas label: 'Usuario: '.
					canvas textInput on: #user of: self ].
			canvas
				paragraph: [ canvas label: 'Contraseña: '.
					canvas textInput on: #pass of: self ].
			canvas button
				callback: [ self loguear ];
				with: 'Iniciar sesion' ]
]
