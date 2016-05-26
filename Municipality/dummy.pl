%Definition for beliefs
:- dynamic settings/1,
	functions/1,
	buildings/1,
	indicator/3,
	indicatorLink/2,
	stakeholder/4,
	zone/5,
	building/6,
	land/3,
	request/2.

% we have a building if the building list has at least 1 element.
havebuilding :- buildings([X|Y]).
