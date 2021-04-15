Class {
	#name : #HomeComponent,
	#superclass : #RecursosCompartidosComponent,
	#category : #'CuOOra-ui'
}

{ #category : #callback }
HomeComponent >> createNewPost [
	self call: NewPostComponent new.
]

{ #category : #callback }
HomeComponent >> elegirTopico [
	self call: ElegirTopicoComponent new.
]

{ #category : #accessing }
HomeComponent >> model [
	^ CuOOra soleInstance.
]

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
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
HomeComponent >> renderFriendsOn: aCanvas [
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
HomeComponent >> renderPostsOn: canvas [
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
HomeComponent >> renderTopicoInteresOn: aCanvas [
	aCanvas heading
			level: 4;
			with: 'Elegi el topico que mas te guste!'.
	aCanvas form:[
		aCanvas submitButton 
					callback: [ self elegirTopico ];	
					with: 'Elegir Topico de Interes'.].
]
