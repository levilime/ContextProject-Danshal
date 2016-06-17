%Definition for beliefs
:- dynamic functions/1,
	indicator/4,
	indicatorLink/2,
	greenId/2,
	stakeholder/4,
	actionlog/4,
	my_stakeholder_id/1,
	open_request/9,
	actionlog/4,
	attempttoBuild/1,
	azc_area/2,
	azc_timeout/1,
	building/7,
	feeling/2,
	function/3,
	havebuiltsomething/0,
	land/5,
	my_indicator/2,
	my_stakeholder_id/1,
	open_request/9,
	answered_request/3,
	sum_indicators/2,
	total_sum/2,
	zone/5,
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
	

usefulFunctions(['azc','stadspark']).

minpriceland(ID, 150) :- stakeholder(ID, "DUWO",_,_).
minpriceland(ID, 450) :- stakeholder(ID, "Private Woningbouw Burgers",_,_).
minpriceland(ID, 300) :- stakeholder(ID, "TU",_,_).
minpriceland(ID, 250) :- stakeholder(ID, "Voorzieningen",_,_).
