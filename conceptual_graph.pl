# G. C.
# 1) Concept
concept(personne).
concept(homme).
concept(femme).
sous_concept(personne, u).
sous_concept(homme, personne).
sous_concept(femme, personne).

# 2) propriété
propriete(enfant_de, personne, personne)
sous_propriete(enfant_de, u)
propriete(fils_de, homme, personne).
sous_propriete(fils_de, enfant_de).
propriete(fille_de, femme, personne).
sous_propriete(fille_de, enfant_de).
propriete(frere_de, homme, personne).
propriete(soeur_de, femme, personne).
propriete(epouse_de, femme, homme).
propriete(epoux_de, homme, femme).

# 3) G. C.
instance_concept(pierre, homme).
instance_concept(paul,homme).
instance_concept(alphonse,homme).
instance_concept(jean,homme).
instance_concept(jacques,homme).
instance_concept(nicolas,homme).
instance_concept(rene,homme).

instance_concept(monique, femme).
instance_concept(nicole,femme).
instance_concept(marie,femme).
instance_concept(anne,femme).
instance_concept(jeanne,femme).
instance_concept(julie,femme).
instance_concept(sophie,femme).

instance_propriete(enfant_de, alphonse, monique).
instance_propriete(enfant_de, alphonse, paul).
instance_propriete(enfant_de, nicole, monique).
instance_propriete(enfant_de, nicole, paul).
instance_propriete(pere_de, pierre, paul).
instance_propriete(epoux_de, pierre, marie).
instance_propriete(fils_de, jean, marie).
instance_propriete(fils_de, rene, anne).
instance_propriete(soeur_de, anne, jean).
instance_propriete(epouse_de, anne, jacques).
instance_propriete(frere_de, rene, jeanne).
instance_propriete(fille_de, sophie, jacques).
instance_propriete(fille_de, julie, jacques).
instance_propriete(mere_de, julie, nicolas).

instance_propriete_t(frere_de, X, Y):-
          instance_propriete(frere_de, X,Y);
          instance_propriete(enfant_de, X,C),
          instance_propriete(enfant_de, Y,C),
          instance_concept(X, homme).

instance_propriete_t(soeur_de, X, Y):-
          instance_propriete(frere_de, X,Y);
          instance_propriete(enfant_de, X,C),
          instance_propriete(enfant_de, Y,C),
          instance_concept(X, homme).

# Axiomes concepts
instance_concept(X, pere):- instance_concept(X, homme),
                            once(instance_propriete(enfant_de, _E, X)).

# ---> Calcul des instances : saturation de la propriété
instance_concept(X,pere)
findall(X, instance_concept(X,pere), L).
