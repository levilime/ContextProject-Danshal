%Definition for beliefs
:- dynamic
	actionlog/4,
	answered_request/2,
	attempttoBuild/1,
	azc_area/2,
	azc_timeout/1,
	building/7,
	feeling/2,
	function/3,
	functions/1,
	greenId/2,
	havebuiltsomething/0,
	indicator/4,
	indicatorLink/2,
	land/5,
	my_indicator/2,
	my_stakeholder_id/1,
	open_request/9,
	request/2,
	requests/1,
	self/1,
	settings/1,
	stakeholder/4,
	stakeholders/1,
	answered_request/3,
	my_indicator/2,
	sum_indicators/2,
	total_sum/2,
	zone/5,
	zone_link/4,
	feeling/2,
	history/3.

%We have a building if the building list has at least 1 element.
havebuilding :- true.

% Get our current budget
money(Budget) :- my_stakeholder_id(StakeholderID),indicatorLink(StakeholderID,LinkIndicator),
		 member(indicatorWeights(IndicatorID,'Budget Gemeente',_),LinkIndicator),
		 indicator(IndicatorID,Budget,_,_).
% Progress building azc
azc(Result) :- my_stakeholder_id(StakeholderID),indicatorLink(StakeholderID,LinkIndicator),
	    member(indicatorWeights(IndicatorID,'AZC',_),LinkIndicator),
	    indicator(IndicatorID,Progress,Target,_),
	    Result is Target-(Progress*Target).

% We want a park if we need it
buildPark(ZoneID,MultiPolygon) :- attempttoBuild(MultiPolygon).

% We want a azc if we need it
buildAZC(MultiPolygon) :- attempttoBuild(MultiPolygon).

%Link the actionlogs to the open requests that need to be answered.
actionlogRequestLink(RequestType, ID, SenderID, ActionID) :- open_request(RequestType, ID, ContentLinkID, SenderID, ActionlogIDs, Price, Multipolygon, AreaSize, AnswerList), 
	member(ActionID, ActionlogIDs).
	
minpriceland(ID, 150) :- stakeholder(ID, "DUWO",_,_).
minpriceland(ID, 450) :- stakeholder(ID, "Private Woningbouw Burgers",_,_).
minpriceland(ID, 300) :- stakeholder(ID, "TU",_,_).
minpriceland(ID, 250) :- stakeholder(ID, "Voorzieningen",_,_).
