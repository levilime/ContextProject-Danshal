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

% Get our current budget
money(Budget) :- my_stakeholder_id(StakeholderID),indicatorLink(StakeholderID,LinkIndicator),
		 member(indicatorWeights(IndicatorID,'Budget Gemeente',_),LinkIndicator),
		 indicator(IndicatorID,Budget,_,_).
% Progress building azc
azc(Target-Current) :- my_stakeholder_id(StakeholderID),indicatorLink(StakeholderID,LinkIndicator),
	    member(indicatorWeights(IndicatorID,'AZC',_),LinkIndicator),
	    indicator(IndicatorID,Current,Target,_).

% We want a park if we need it
buildPark(ZoneID,MultiPolygon) :- attempttoBuild(MultiPolygon).

% We want a azc if we need it
buildAZC(Land,Floors) :- land(Land,_,MultiPolygon,_,_), attempttoBuild(MultiPolygon).