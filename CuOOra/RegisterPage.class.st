Class {
	#name : #RegisterPage,
	#superclass : #WelcomePage,
	#instVars : [
		'name'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
RegisterPage >> name [
	^ name
]

{ #category : #accessing }
RegisterPage >> name: anObject [
	name := anObject
]

{ #category : #callback }
RegisterPage >> register [
	| theUser |
	theUser := Usuario nombre: name contrasena: pass email: email.
	self session model addUsuario: theUser.
	"pordria evaluar que retorna addUsuario y mostrar cartel de user registrado ?"
	self answer .
]

{ #category : #rendering }
RegisterPage >> renderContentOn: canvas [
	canvas heading: 'CuOOra'.
	canvas horizontalRule .
	canvas form: [  
	self renderInputElementsOn: canvas.
	self renderSignUpButtonOn: canvas. 
	canvas text: 'una vez registrado volvera a la pagina de login'. ]
]

{ #category : #rendering }
RegisterPage >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Name'.
	aCanvas paragraph: [ aCanvas textInput on: #name of: self ].
	super renderInputElementsOn: aCanvas
]

{ #category : #rendering }
RegisterPage >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self register ];
		with: 'Registrar'
]
