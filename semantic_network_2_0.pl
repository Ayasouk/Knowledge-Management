%TD sur le réseau du TD
genre(alphonse, homme).
genre(paul, homme).
genre(pierre, homme).
genre(jean, homme).
genre(rene, homme).
genre(jacques, homme).
genre(nicolas, homme).
genre(nicole, femme).
genre(monique, femme).
genre(marie, femme).
genre(anne, femme).
genre(julie, femme).
genre(sophie, femme).
genre(jeanne, femme).

genre(x, personne) :- genre(X,homme).
genre(x, personne) :- genre(X,femme).

enfant_de(alphonse,monique).
enfant_de(nicole,monique).
enfant_de(nicole,paul).
enfant_de(paul,pierre).
enfant_de(jean,marie).
enfant_de(rene,anne).
enfant_de(julie,jacques).
enfant_de(sophie,jacques).
enfant_de(nicolas,julie).
enfant_de(alphonse,paul).

% parent de
parent_de(X,Y):- enfant_de(Y,X).
% fille de
fille_de(X,Y):- enfant_de(X,Y), genre(X,femme).
% fils de
fils_de(X,Y):- enfant_de(X,Y), genre(X,homme).
% pere de
pere_de(X,Y):- enfant_de(Y,X), genre(X,homme).
% mere de
mere_de(X,Y):- enfant_de(Y,X), genre(X,femme).
% epaux de
epoux_de(X,Y):- epouse_de(Y,X).
% epouse de
epouse_de(X,Y):- epoux_de(Y,X).
% soeur de
soeur_de(X,Y):- enfant_de(X,Z), enfant_de(Y,Z), genre(X,femme).
% frere de
frere_de(X,Y):- enfant_de(X,Z), enfant_de(Y,Z), genre(X,homme).

% meme_pere
meme_pere(E1,E2):- enfant_de(E1,P), enfant_de(E2,P), E1\=E2, genre(P,homme).

% meme_mere
meme_mere(E1,E2):- enfant_de(E1,P), enfant_de(E2,P), E1\=E2, genre(P,femme).

% meme_parent
meme_parent(E1,E2):- meme_pere(E1,E2).
meme_parent(E1,E2):- meme_mere(E1,E2).




