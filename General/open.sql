;WITH CTEEvent(EventCategory,WeekDays)
        AS
        (
	        SELECT EventCategory,DateName(WEEKDAY,EventDate) As WeekDays
	        FROM tblEvent
        ), CteBaseResult(EventCategory,WeekDays,CntDays)
        AS
        (
	        SELECT EventCategory,WeekDays,Count(*) AS CntDays
	        FROM  CTEEvent 
	        GROUP BY EventCategory,WeekDays
        )

        --SELECT * FROM CteBaseResult

        SELECT PR.EventCategory,ISNULL(PR.Monday,0) AS Monday,ISNULL(PR.Tuesday,0) AS Tuesday,
        ISNULL(PR.Wednesday,0) AS Wednesday,ISNULL(PR.Thursday,0) AS Thursday,ISNULL(PR.Friday,0) AS Friday,
        ISNULL(PR.Saturday,0) AS Saturday,ISNULL(PR.Sunday,0) AS Sunday,
        EventCategoryTotal
        INTO #tmpResult
        FROM (
            SELECT EventCategory,WeekDays,CntDays,
	        /* Row wise Grand Total through aggregate function*/
	        SUM(CntDays) OVER (Partition By EventCategory) EventCategoryTotal
	        FROM CteBaseResult

        ) AS aliasTable
        PIVOT
        (
            SUM(CntDays)
            FOR [WeekDays] IN (Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday)
        )AS PR

        SELECT 
        EventCategory,Monday,Tuesday,Wednesday,Thursday,
        Friday,Saturday,Sunday,EventCategoryTotal 
        FROM #tmpResult
        UNION ALL
        /* Column wise Grand Total through aggregate function*/
        SELECT 'Total' , 
        SUM(Monday),SUM(Tuesday),SUM(Wednesday),
        SUM(Thursday),SUM(Friday),SUM(Saturday)
        ,SUM(Sunday),SUM(EventCategoryTotal) 
        FROM #tmpResult
        DROP TABLE #tmpResult

        