
:- dynamic stakeholders/1.
:- dynamic settings/1.
:- dynamic functions/1.
:- dynamic buildings/1.
:- dynamic self/1.
:- dynamic indicator_link/2.
:- dynamic indicator/3.
:- dynamic zone_link/4.
:- dynamic greenId/1.

% we have a building if the building list has at least 1 element.
havebuilding :- buildings([X|Y]).
