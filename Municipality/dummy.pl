%Definition for beliefs
:- dynamic settings/1,
	functions/1,
	indicator/4,
	indicatorLink/2,
	greenId/2,
	attempttoBuild/1,
	stakeholder/4,
	zone/5,
	building/7,
	land/5,
	request/2,
	havebuiltsomething/0,
	function/3,
	actionlog/4,
	my_stakeholder_id/1,
	open_request/9,
	answered_request/2,
	my_indicator/2,
	sum_indicators/2,
	total_sum/2,
	feeling/2.

%Money money money
money(StartBudget) :- stakeholder(_,'Gemeente',StartBudget,_).

% We want a building if we need it
buildPark(ZoneID,MultiPolygon) :- attempttoBuild(MultiPolygon).
%buildPark(ZoneID,MultiPolygon) :- building(BuildingID,_,OwnerID,_,Categories,_,_), member('PARK',Categories).

% Azc's function ID is 650
buildAZC :- building(BuildingID,_,OwnerID,_,_,650,_).

%Link the actionlogs to the open requests that need to be answered.
actionlogRequestLink(ID, SenderID, ActionID) :- open_request(RequestType, ID, ContentLinkID, SenderID, ActionlogIDs, Price, Multipolygon, AreaSize, AnswerList), 
	member(ActionID, ActionlogIDs).

