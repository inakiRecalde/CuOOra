Class {
	#name : #HomePage,
	#superclass : #InteraccionesComponent,
	#category : #'CuOOra-ui'
}

{ #category : #callback }
HomePage >> createNewPost [
	self call: NewPostPage new.
]

{ #category : #callback }
HomePage >> elegirTopico [
	self call: ElegirTopicoComponent new.
]

{ #category : #accessing }
HomePage >> model [
	^ CuOOra soleInstance.
]

{ #category : #rendering }
HomePage >> renderContentOn: aCanvas [
	self renderCabecera: aCanvas.
	aCanvas horizontalRule.
	
	self renderPostsOn: aCanvas.
	aCanvas horizontalRule.
	
	"self renderFriendsOn: aCanvas.
	aCanvas horizontalRule."
	
	self renderTopicoInteresOn: aCanvas.
	aCanvas horizontalRule.
	
	aCanvas text: 'Registro de usuarios'.
	aCanvas
		unorderedList: [ self model usuarios
				do: [ :each | 
					aCanvas
						listItem:[
							aCanvas anchor
								callback: [ self perfilUser: each ];
								with: each nombre ]] ].
	aCanvas text: 'Topicos'.
	aCanvas
		unorderedList: [ self model topicos do: [ :each | aCanvas listItem: each nombre ] ]
]

{ #category : #rendering }
HomePage >> renderFriendsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Friends'.
	aCanvas
		unorderedList: [ self session user follows
				do: [ :each | 
					aCanvas
						listItem:
							[aCanvas anchor
								callback: [ self perfilUser: (self model buscarUsuario: each  nombre) ];
								with: each  nombre]] ].
	aCanvas anchor
		callback: [ self findFriend ];
		with: [ aCanvas button: 'Buscar Amigos' ]
]

{ #category : #rendering }
HomePage >> renderPostsOn: canvas [
	canvas heading
			level: 2;
			with: 'Ultimas Preguntas'.
	canvas 
			unorderedList: [ 
				( self session model preguntasRelevantes: self session user )
				do: [ :each |  
					canvas listItem: [ 
								self renderTitulo: canvas pregunta:each. 
								self renderListItem: canvas pregunta: each . ]]].
												
	canvas anchor 
			callback: [ self createNewPost ];
			with: [ canvas button: 'Nueva Pregunta' ].
]

{ #category : #rendering }
HomePage >> renderTopicoInteresOn: aCanvas [
	aCanvas form:[
		aCanvas submitButton 
					callback: [ self elegirTopico ];	
					with: 'Elegir Topico de Interes'.].
]
