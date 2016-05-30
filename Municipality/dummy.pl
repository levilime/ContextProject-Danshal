%Definition for beliefs
:- dynamic stakeholders/1,
	settings/1,
	functions/1,
	self/1,
	indicator/3,
	indicatorLink/2,
	zone_link/4,
	greenId/1,
	stakeholder/4,
	zone/5,
	building/7,
	land/3,
	request/2,
	havebuiltsomething/0,
	land/3,
	function/3.

% We have a building if the building list has at least 1 element.
havebuilding :- true.

buildPark :- building(Id,_,OwnerID,_,Categories,_,_), member('PARK',Categories).
buildAZC :- building(Id,_,OwnerID,_,_,650,_).