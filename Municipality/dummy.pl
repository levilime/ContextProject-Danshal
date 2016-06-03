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
	function/3,
	actionlog/4.

%getMyID/1 - myID(<StakeholderID)
%<StakeholderID> - Numeral ID for the stakeholder the agent is representing. Output variable.
getMyID(StakeholderID):- stakeholder(ID,'Gemeente',_,_).

%getMyIndicatorList/1 - getMyIndicatorList(IndicatorList)
%<IndicatorList> - A list of indicatorWeights representing all our indicators. Output variable.
getMyIndicatorList(IndicatorList) :- getMyID(StakeholderID), indicatorLink(StakeholderID, WeightsList).

%getMyIndicatorID/1 - getMyIndicatorID(<IndicatorID>)
%<IndicatorID> - Numeral ID representing one of the indicators the agent has. - Output variable.
getRandomIndicatorID(IndicatorID) :- getMyIndicatorList(IndicatorList), 
					member(indicatorWeights(IndicatorID,_,_),IndicatorList).

%getSpecificIndicatorID/2 - getSpecificIndicatorID(<IndicatorName>,<IndicatorID>)
%<IndicatorName> - Name of the indicator in the IndicatorWeights percept - Input variable.
%<IndicatorID> - Numeral ID representing that specific indicator. - Output variable.
getSpecificIndicatorID(IndicatorName,IndicatorID) :- getMyIndicatorList(IndicatorList),
						member(indicatorWeights(IndicatorID,IndicatorName,_),IndicatorList).
						
indicatorCompleted(IndicatorID) :- true.

%We have a building if the building list has at least 1 element.
havebuilding :- true.

%Money money money
money(StartBudget) :- stakeholder(_,'Gemeente',StartBudget,_).

% We want a building if we need it
buildPark :- building(BuildingID,_,OwnerID,_,Categories,_,_), member('PARK',Categories).
% Azc's function ID is 650
buildAZC :- building(BuildingID,_,OwnerID,_,_,650,_).

