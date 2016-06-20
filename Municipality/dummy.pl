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

%getMyIndicatorList/1 - getMyIndicatorList(IndicatorList)
%<IndicatorList> - A list of indicatorWeights representing all our indicators. Output variable.
getMyIndicatorList(IndicatorList) :- my_stakeholder_id(StakeholderID), indicatorLink(StakeholderID, IndicatorList).

%getSpecificIndicatorID/2 - getSpecificIndicatorID(<IndicatorName>,<IndicatorID>)
%<IndicatorName> - Name of the indicator in the IndicatorWeights percept - Input variable.
%<IndicatorID> - Numeral ID representing that specific indicator. - Output variable.
getSpecificIndicatorID(IndicatorName,IndicatorID) :- getMyIndicatorList(IndicatorList),
						member(indicatorWeights(IndicatorID,IndicatorName,_),IndicatorList).

%indicatorCompletedID/1 - indicatorCompleted(<IndicatorID>)
%<IndicatorID> - Checks for this indicator ID if it is completed.				
indicatorCompleted(IndicatorID) :- indicator(IndicatorID,CompleteCurrent,CompleteTarget,ZoneLinkList), CompleteCurrent > CompleteTarget,
					not((member(zone_link(_,_,ZoneCurrent,ZoneTarget),ZoneLinkList), ZoneCurrent < ZoneTarget)).
					
%specificIndicatorCompleted/1 - indicatorCompleted(<IndicatorName>)
%<IndicatorName> - For a given name of an indicator, check if it is completed.
specificIndicatorCompleted(IndicatorName) :- getSpecificIndicatorID(IndicatorName,IndicatorID), indicatorCompleted(IndicatorID).

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

pricePark(60).
priceAZC(1200).

minpriceland(ID, 150) :- stakeholder(ID, "DUWO",_,_).
minpriceland(ID, 450) :- stakeholder(ID, "Private Woningbouw Burgers",_,_).
minpriceland(ID, 300) :- stakeholder(ID, "TU",_,_).
minpriceland(ID, 250) :- stakeholder(ID, "Voorzieningen",_,_).
