%Definition for beliefs
:- dynamic
	actionlog/4,
	attempttoBuild/1,
	building/7,
	function/3,
	functions/1,
	greenId/2,
	havebuiltsomething/0,
	indicator/4,
	indicatorLink/2,
	land/5,
	my_stakeholder_id/1,
	request/2,
	self/1,
	settings/1,
	stakeholder/4,
	stakeholders/1,
	zone/5,
	zone_link/4.

%We have a building if the building list has at least 1 element.
havebuilding :- true.

%Money money money
money(StartBudget) :- stakeholder(_,'Gemeente',StartBudget,_).

% We want a building if we need it
buildPark(ZoneID,MultiPolygon) :- attempttoBuild(MultiPolygon).
%buildPark(ZoneID,MultiPolygon) :- building(BuildingID,_,OwnerID,_,Categories,_,_), member('PARK',Categories).

% Azc's function ID is 650
buildAZC(Land,Floors) :- building(BuildingID,_,OwnerID,_,_,650,Floors), land(Land,_,_,_,_).