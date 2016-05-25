%Definition for beliefs
:- dynamic stakeholders/1.
:- dynamic settings/1.
:- dynamic functions/1.
:- dynamic buildings/1.
:- dynamic self/1.
:- dynamic indicator/3.
:- dynamic indicatorLink/2.
:- dynamic zone_link/4.
:- dynamic greenId/1.
:- dynamic stakeholder/4.
:- dynamic zone/5.
:- dynamic building/6.

% We have a building if the building list has at least 1 element.
havebuilding :- buildings([X|Y]).
