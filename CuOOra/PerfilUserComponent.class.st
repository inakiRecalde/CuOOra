Class {
	#name : #PerfilUserComponent,
	#superclass : #PerfilComponent,
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
PerfilUserComponent class >> user: aUser [
	^self new 
		user: aUser.
]

{ #category : #callback }
PerfilUserComponent >> perfilVisitor: aUser [

	self call:(PerfilVisitorComponent new user:aUser).
]

{ #category : #rendering }
PerfilUserComponent >> renderContentOn: aCanvas [
	self renderCabecera: aCanvas .
	self renderBackButtonOn: aCanvas.
	
	self renderPreguntasOn: aCanvas.
	self renderSeguidosOn: aCanvas.
]

{ #category : #rendering }
PerfilUserComponent >> renderPreguntasOn: aCanvas [
	aCanvas heading
			level: 2;
			with: 'misPreguntas', self session user nombre.
	aCanvas unorderedList: [ 
			(CuOOra soleInstance preguntasDeUser: self user)
										do: [ :each | aCanvas space. aCanvas anchor 
													callback: [];
													with: each titulo ] ] .
]

{ #category : #rendering }
PerfilUserComponent >> renderSeguidosOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Friends'.
	aCanvas
		unorderedList: [ self session user follows
				do: [ :each | 
					aCanvas
						listItem:
							[aCanvas anchor
								callback: [ self perfilVisitor: 
									( CuOOra soleInstance  buscarUsuario: each  nombre) ];
								with: each  nombre]] ].
]
