parent(alya, bima).
parent(alya, satria). 
parent(bima, david).
parent(bima, emma).
parent(satria, yunita).
parent(satria, grace).

sibling(X, Y):-
parent(Z, X),
parent(Z, Y),
x \= y.

grandparent(X, Y):-
parent(X, Z),
parent(Z, Y).

ancestor(X, Y):-
parent(X, Z),
ancestor(Z, Y).