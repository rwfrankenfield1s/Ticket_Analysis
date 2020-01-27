---- Feature Engineering into temp tables----
/****************************************************************************************************/

if object_id('tempdb..#fee') is not null
drop table #fee;
select d.pkey 
		, cfv.CUSTOMFIELD
       ,   a.issuenum
	   ,   d.pkey + '-' + convert(varchar(10), a.issuenum) as [ISSUE_NUMBER]
	   ,   a.CREATED
	   ,   a.RESOLUTIONDATE
	   ,   a.ASSIGNEE
	   ,   a.REPORTER
	   , cfv.stringvalue Issue_Stakeholder
	   ,   u.DISPLAY_NAME
	   ,     substring(u.DISPLAY_NAME, charindex('(', u.DISPLAY_NAME) ,charindex(')', u.DISPLAY_NAME)) Area
	   ,   a.SUMMARY
	   ,   a.DESCRIPTION
	   ,     case when d.id is not null then 'Fee' else '' end as 'Report_Type'

  into #fee     
  from dbo.jiraissue a
       inner join dbo.project d on a.project = d.ID
       inner join dbo.customfieldvalue cfv on a.ID = cfv.issue
       inner join dbo.customfield cf on CFV.customfield = cf.ID
	   left join [JIRA2016].[dbo].[AO_2D3BEA_USER_INDEX] u on cfv.STRINGVALUE = u.USER_KEY

where cfv.CUSTOMFIELD = '10207'
and d.pkey = 'DATA'
and (a.SUMMARY like '%fee%' or a.SUMMARY like '%Hair%')

/****************************************************************************************************/

if object_id('tempdb..#addr') is not null
drop table #addr;
select d.pkey 
       ,   a.issuenum
	   ,   d.pkey + '-' + convert(varchar(10), a.issuenum) as [ISSUE_NUMBER]
	   ,   a.CREATED
	   ,   a.RESOLUTIONDATE
	   ,   a.ASSIGNEE
	   ,   a.REPORTER
	   , cfv.stringvalue Issue_Stakeholder
	   ,   u.DISPLAY_NAME
	   ,     substring(u.DISPLAY_NAME, charindex('(', u.DISPLAY_NAME) ,charindex(')', u.DISPLAY_NAME)) Area
	   ,   a.SUMMARY
	   ,   a.DESCRIPTION
	   ,     case when d.id is not null then 'Address' else '' end as 'Report_Type'
  
  into #addr
  from dbo.jiraissue a
       inner join dbo.project d on a.project = d.ID
       inner join dbo.customfieldvalue cfv on a.ID = cfv.issue
       inner join dbo.customfield cf on CFV.customfield = cf.ID
	   left join [JIRA2016].[dbo].[AO_2D3BEA_USER_INDEX] u on cfv.STRINGVALUE = u.USER_KEY

where cfv.CUSTOMFIELD = '10207'
and d.pkey = 'DATA'
and (a.SUMMARY like '%address%' or a.SUMMARY like '%name%line%' or a.SUMMARY like '%mailing%')

/****************************************************************************************************/

if object_id('tempdb..#email') is not null
    drop table #email;
select d.pkey 
       ,   a.issuenum
	   ,   d.pkey + '-' + convert(varchar(10), a.issuenum) as [ISSUE_NUMBER]
	   ,   a.CREATED
	   ,   a.RESOLUTIONDATE
	   ,   a.ASSIGNEE
	   ,   a.REPORTER
	   , cfv.stringvalue Issue_Stakeholder
	   ,   u.DISPLAY_NAME
	   ,     substring(u.DISPLAY_NAME, charindex('(', u.DISPLAY_NAME) ,charindex(')', u.DISPLAY_NAME)) Area
	   ,   a.SUMMARY
	   ,   a.DESCRIPTION
	   ,     case when d.id is not null then 'Email' else '' end as 'Report_Type'
  
  into #email
  from dbo.jiraissue a
       inner join dbo.project d ON a.project = d.ID
       inner join dbo.customfieldvalue cfv ON a.ID = cfv.issue
       inner join dbo.customfield cf ON CFV.customfield = cf.ID
	   left join [JIRA2016].[dbo].[AO_2D3BEA_USER_INDEX] u on cfv.STRINGVALUE = u.USER_KEY

where cfv.CUSTOMFIELD = '10207'
and d.pkey = 'DATA'
and (a.SUMMARY like '%email%' or a.SUMMARY like '%name%line%' or a.SUMMARY like '%mailing%')

/****************************************************************************************************/

if object_id('tempdb..#account') is not null
    drop table #account;
select     d.pkey 
       ,   a.issuenum
	   ,   d.pkey + '-' + convert(varchar(10), a.issuenum) as [ISSUE_NUMBER]
	   ,   a.CREATED
	   ,   a.RESOLUTIONDATE
	   ,   a.ASSIGNEE
	   ,   a.REPORTER
	   , cfv.stringvalue Issue_Stakeholder
	   ,   u.DISPLAY_NAME
	   ,     substring(u.DISPLAY_NAME, charindex('(', u.DISPLAY_NAME) ,charindex(')', u.DISPLAY_NAME)) Area
	   ,   a.SUMMARY
	   ,   a.DESCRIPTION
	   ,     case when d.id is not null then 'Account' else '' end as 'Report_Type'
       --, cf.cfname 
  
  into #account
  from dbo.jiraissue a
       inner join dbo.project d on a.project = d.ID
       inner join dbo.customfieldvalue cfv on a.ID = cfv.issue
       inner join dbo.customfield cf on CFV.customfield = cf.ID
	   left join [JIRA2016].[dbo].[AO_2D3BEA_USER_INDEX] u on cfv.STRINGVALUE = u.USER_KEY

where cfv.CUSTOMFIELD = '10207'
and d.pkey = 'DATA'
and (a.SUMMARY like '%account%' or a.SUMMARY like '%acct%')

/****************************************************************************************************/

if object_id('tempdb..#rep') is not null
    drop table #rep;
select     d.pkey 
       ,   a.issuenum
	   ,   d.pkey + '-' + convert(varchar(10), a.issuenum) as [ISSUE_NUMBER]
	   ,   a.CREATED
	   ,   a.RESOLUTIONDATE
	   ,   a.ASSIGNEE
	   ,   a.REPORTER
	   , cfv.stringvalue Issue_Stakeholder
	   ,   u.DISPLAY_NAME
	   ,     substring(u.DISPLAY_NAME, charindex('(', u.DISPLAY_NAME) ,charindex(')', u.DISPLAY_NAME)) Area
	   ,   a.SUMMARY
	   ,   a.DESCRIPTION
	   ,     case when d.id is not null then 'Rep' else '' end as 'Report_Type'
  
  into #rep
  from dbo.jiraissue a
       inner join dbo.project d ON a.project = d.ID
       inner join dbo.customfieldvalue cfv ON a.ID = cfv.issue
       inner join dbo.customfield cf ON CFV.customfield = cf.ID
	   left join [JIRA2016].[dbo].[AO_2D3BEA_USER_INDEX] u on cfv.STRINGVALUE = u.USER_KEY

where cfv.CUSTOMFIELD = '10207'
and d.pkey = 'DATA'
and (a.SUMMARY like '%rep%')

/****************************************************************************************************/

if object_id('tempdb..#audit') is not null
    drop table #audit;
select     d.pkey 
       ,   a.issuenum
	   ,   d.pkey + '-' + convert(varchar(10), a.issuenum) as [ISSUE_NUMBER]
	   ,   a.CREATED
	   ,   a.RESOLUTIONDATE
	   ,   a.ASSIGNEE
	   ,   a.REPORTER
	   , cfv.stringvalue Issue_Stakeholder
	   ,   u.DISPLAY_NAME
	   ,     substring(u.DISPLAY_NAME, charindex('(', u.DISPLAY_NAME) ,charindex(')', u.DISPLAY_NAME)) Area
	   ,   a.SUMMARY
	   ,   a.DESCRIPTION
	   ,     case when d.id is not null then 'Audit' else '' end as 'Report_Type'
  
  into #audit
  from dbo.jiraissue a
       inner join dbo.project d on a.project = d.ID
       inner join dbo.customfieldvalue cfv on a.ID = cfv.issue
       inner join dbo.customfield cf on CFV.customfield = cf.ID
	   left join [JIRA2016].[dbo].[AO_2D3BEA_USER_INDEX] u on cfv.STRINGVALUE = u.USER_KEY

where cfv.CUSTOMFIELD = '10207'
and d.pkey = 'DATA'
and (a.SUMMARY like '%audit%')

/****************************************************************************************************/

--IF OBJECT_ID('tempdb..#finra') IS NOT NULL
--    DROP TABLE #finra;
--SELECT     d.pkey 
--       ,   a.issuenum
--	   ,   d.pkey + '-' + CONVERT(VARCHAR(10), a.issuenum) AS [ISSUE_NUMBER]
--	   ,   a.ASSIGNEE
--	   ,   a.REPORTER
--	   , cfv.stringvalue Issue_Stakeholder
--	   ,   u.DISPLAY_NAME
--	   ,     substring(u.DISPLAY_NAME, charindex('(', u.DISPLAY_NAME) ,charindex(')', u.DISPLAY_NAME)) Area
--	   ,   a.SUMMARY
--	   ,   a.DESCRIPTION
--	   ,     case when d.id is not null then 'Finra' else '' end as 'Report_Type'
--       --, cf.cfname 
  
--  into #finra
--  from dbo.jiraissue a
--       inner join dbo.project d ON a.project = d.ID
--       inner join dbo.customfieldvalue cfv ON a.ID = cfv.issue
--       inner join dbo.customfield cf ON CFV.customfield = cf.ID
--	   left join [JIRA2016].[dbo].[AO_2D3BEA_USER_INDEX] u on cfv.STRINGVALUE = u.USER_KEY

--where cfv.CUSTOMFIELD = '10207'
--and d.pkey = 'DATA'
--and (a.SUMMARY like '%finra%')

/****************************************************************************************************/

--IF OBJECT_ID('tempdb..#sec') IS NOT NULL
--    DROP TABLE #sec;
--SELECT     d.pkey 
--       ,   a.issuenum
--	   ,   d.pkey + '-' + CONVERT(VARCHAR(10), a.issuenum) AS [ISSUE_NUMBER]
--	   ,   a.ASSIGNEE
--	   ,   a.REPORTER
--	   , cfv.stringvalue Issue_Stakeholder
--	   ,   u.DISPLAY_NAME
--	   ,     substring(u.DISPLAY_NAME, charindex('(', u.DISPLAY_NAME) ,charindex(')', u.DISPLAY_NAME)) Area
--	   ,   a.SUMMARY
--	   ,   a.DESCRIPTION
--	   ,     case when d.id is not null then 'Sec' else '' end as 'Report_Type'
--       --, cf.cfname 
  
--  into #sec
--  from dbo.jiraissue a
--       inner join dbo.project d ON a.project = d.ID
--       inner join dbo.customfieldvalue cfv ON a.ID = cfv.issue
--       inner join dbo.customfield cf ON CFV.customfield = cf.ID
--	   left join [JIRA2016].[dbo].[AO_2D3BEA_USER_INDEX] u on cfv.STRINGVALUE = u.USER_KEY

--where cfv.CUSTOMFIELD = '10207'
--and d.pkey = 'DATA'
--and (a.SUMMARY like '%sec%')

/****************************************************************************************************/

if object_id('tempdb..#tblot') is not null
    drop table #tblot;
select     d.pkey 
       ,   a.issuenum
	   ,   d.pkey + '-' + convert(varchar(10), a.issuenum) as [ISSUE_NUMBER]
	   ,   a.CREATED
	   ,   a.RESOLUTIONDATE
	   ,   a.ASSIGNEE
	   ,   a.REPORTER
	   , cfv.stringvalue Issue_Stakeholder
	   ,   u.DISPLAY_NAME
	   ,     substring(u.DISPLAY_NAME, charindex('(', u.DISPLAY_NAME) ,charindex(')', u.DISPLAY_NAME)) Area
	   ,   a.SUMMARY
	   ,   a.DESCRIPTION
	   ,     case when d.id is not null then 'Blotter' else '' end as 'Report_Type'
  
  into #tblot
  from dbo.jiraissue a
       inner join dbo.project d on a.project = d.ID
       inner join dbo.customfieldvalue cfv on a.ID = cfv.issue
       inner join dbo.customfield cf on CFV.customfield = cf.ID
	   left join [JIRA2016].[dbo].[AO_2D3BEA_USER_INDEX] u on cfv.STRINGVALUE = u.USER_KEY

where cfv.CUSTOMFIELD = '10207'
and d.pkey = 'DATA'
and (a.SUMMARY like '%blotter%')

/****************************************************************************************************/

---- Identify Reports that did not appear in data that was created ----
if object_id('tempdb..#total') is not null
    drop table #total;
select d.pkey 
       ,   a.issuenum
	   ,   d.pkey + '-' + convert(varchar(10), a.issuenum) as [ISSUE_NUMBER]
	   ,   a.CREATED
	   ,   a.RESOLUTIONDATE
	   ,   a.ASSIGNEE
	   ,   a.REPORTER
	   , cfv.stringvalue Issue_Stakeholder
	   ,   u.DISPLAY_NAME
	   ,     substring(u.DISPLAY_NAME, charindex('(', u.DISPLAY_NAME) ,charindex(')', u.DISPLAY_NAME)) Area
	   ,   a.SUMMARY
	   ,   a.DESCRIPTION
	   ,     case when d.id is not null then 'Other' else '' end as 'Report_Type'

  into #total     
  from dbo.jiraissue a
       inner join dbo.project d on a.project = d.ID
       inner join dbo.customfieldvalue cfv on a.ID = cfv.issue
       inner join dbo.customfield cf on CFV.customfield = cf.ID
	   left join [JIRA2016].[dbo].[AO_2D3BEA_USER_INDEX] u on cfv.STRINGVALUE = u.USER_KEY

where cfv.CUSTOMFIELD = '10207'
and d.pkey = 'DATA'
and (a.SUMMARY not like '%blotter%'  and a.SUMMARY not like '%audit%'
			and a.SUMMARY not like '%rep%' and a.SUMMARY not like '%account%' and a.SUMMARY not like '%acct%' and 
			a.SUMMARY not like '%email%' and a.SUMMARY not like '%name%line%' and a.SUMMARY not like '%mailing%' and
			a.SUMMARY not like '%address%' and a.SUMMARY not like '%name%line%' and a.SUMMARY not like '%mailing%' and
			a.SUMMARY not like '%fee%' and a.SUMMARY not like '%Hair%')

/****************************************************************************************************/


---- Union Temp DB's with created data into temp table ----
/****************************************************************************************************/
if object_id('tempdb..#ftt') is not null
    drop table #ftt;

select * into #ftt from(

select a.pkey
     , a.issuenum
     , a.ISSUE_NUMBER
	 , a.CREATED
	 , a.RESOLUTIONDATE
     , a.ASSIGNEE
     , a.REPORTER
     , a.Issue_Stakeholder
     , a.DISPLAY_NAME
     , a.Area
     , a.SUMMARY
     , cast(a.DESCRIPTION as nvarchar(max))as Descr
     , a.Report_Type
from #account a
union
select ad.pkey
     , ad.issuenum
     , ad.ISSUE_NUMBER
	 , ad.CREATED
	 , ad.RESOLUTIONDATE
     , ad.ASSIGNEE
     , ad.REPORTER
     , ad.Issue_Stakeholder
     , ad.DISPLAY_NAME
     , ad.Area
     , ad.SUMMARY
     , cast(ad.DESCRIPTION as nvarchar(max))as Descr
     , ad.Report_Type
from #addr ad
union
select au.pkey
     , au.issuenum
     , au.ISSUE_NUMBER
	 , au.CREATED
	 , au.RESOLUTIONDATE
     , au.ASSIGNEE
     , au.REPORTER
     , au.Issue_Stakeholder
     , au.DISPLAY_NAME
     , au.Area
     , au.SUMMARY
     ,    cast(au.DESCRIPTION as nvarchar(max))as Descr
     , au.Report_Type
from #audit au
union
select e.pkey
     , e.issuenum
     , e.ISSUE_NUMBER
	 , e.RESOLUTIONDATE
	 , e.CREATED
     , e.ASSIGNEE
     , e.REPORTER
     , e.Issue_Stakeholder
     , e.DISPLAY_NAME
     , e.Area
	 , e.SUMMARY
     ,   cast(e.DESCRIPTION as nvarchar(max))as Descr
     , e.Report_Type
from #email e
union
select f.pkey
     , f.issuenum
     , f.ISSUE_NUMBER
	 , f.CREATED
	 , f.RESOLUTIONDATE
     , f.ASSIGNEE
     , f.REPORTER
     , f.Issue_Stakeholder
     , f.DISPLAY_NAME
     , f.Area
     , f.SUMMARY
     ,   cast(f.DESCRIPTION as nvarchar(max))as Descr
     , f.Report_Type
from #fee f
--union
--select fi.pkey
--     , fi.issuenum
--     , fi.ISSUE_NUMBER
--     , fi.ASSIGNEE
--     , fi.REPORTER
--     , fi.Issue_Stakeholder
--     , fi.DISPLAY_NAME
--     , fi.Area
--     , fi.SUMMARY
--     ,    cast(fi.DESCRIPTION AS NVARCHAR(MAX))as Descr
--     , fi.Report_Type
--from #finra fi
union
select r.pkey
     , r.issuenum
     , r.ISSUE_NUMBER
	 , r.CREATED
	 , r.RESOLUTIONDATE
     , r.ASSIGNEE
     , r.REPORTER
     , r.Issue_Stakeholder
     , r.DISPLAY_NAME
     , r.Area
     , r.SUMMARY
     ,   cast(r.DESCRIPTION as nvarchar(max))as Descr
     , r.Report_Type
from #rep r
--union
--select sec.pkey
--     , sec.issuenum
--     , sec.ISSUE_NUMBER
--     , sec.ASSIGNEE
--     , sec.REPORTER
--     , sec.Issue_Stakeholder
--     , sec.DISPLAY_NAME
--     , sec.Area
--     , sec.SUMMARY
--     ,     cast(sec.DESCRIPTION AS NVARCHAR(MAX))as Descr
--     , sec.Report_Type
--from #sec sec
union
select t.pkey
     , t.issuenum
     , t.ISSUE_NUMBER
	 , t.CREATED
	 , t.RESOLUTIONDATE
     , t.ASSIGNEE
     , t.REPORTER
     , t.Issue_Stakeholder
     , t.DISPLAY_NAME
     , t.Area
     , t.SUMMARY
     ,   cast(t.DESCRIPTION as nvarchar(max)) as Descr
     , t.Report_Type
from #tblot t 
) tmp

/****************************************************************************************************/

---- Union Created union Data and Data that Did not fit the critieria of the feature engineering :: labeled as "Other" ----
if object_id('tempdb..#ft') is not null
    drop table #ft;

select * into #ft from(
select f.pkey
     , f.issuenum
     , f.ISSUE_NUMBER
	 , f.CREATED
	 , f.RESOLUTIONDATE
     , f.ASSIGNEE
     , f.REPORTER
     , f.Issue_Stakeholder
     , f.DISPLAY_NAME
     , f.Area
     , f.SUMMARY
     , f.Descr
     , f.Report_Type
from #ftt f
union 
select t.pkey
     , t.issuenum
     , t.ISSUE_NUMBER
	 , t.CREATED
	 , t.RESOLUTIONDATE
     , t.ASSIGNEE
     , t.REPORTER
     , t.Issue_Stakeholder
     , t.DISPLAY_NAME
     , t.Area
     , t.SUMMARY
     , cast(t.DESCRIPTION as nvarchar(max)) as Descr
     , t.Report_Type 
from #total t) g

/****************************************************************************************************/


/****************************************************************************************************/

---- script pulled to retrieve stakeholder information ----
if object_id('tempdb..#JiraStake_ADs') is not null drop table #JiraStake_ADs ;

create table #JiraStake_ADs
(	StakeHolder nvarchar(255)
	, NumTickets int ) ;

insert	#JiraStake_ADs
	(		StakeHolder
		, NumTickets	)
select
	cfv.STRINGVALUE as StakeHolder
	, count(1) as NumTickets
from	JIRA2016.dbo.jiraissue as ji
	left join JIRA2016.dbo.customfieldvalue as cfv --Bring in the stakeholder
	on cfv.ISSUE = ji.ID AND cfv.CUSTOMFIELD = 10207	--Stakeholder
where	ji.PROJECT = 10312 --Data tickets

group by cfv.STRINGVALUE ;



/* NOTE: Didn't have time to build in dupe treatment here, so ticket counts are liable to dupe 
if the adlogin hit multiple employees. */
if object_id('tempdb..#JiraStake_Emps') is not null drop table #JiraStake_Emps ;
select	distinct
		Jira.StakeHolder
		, Jira.NumTickets
		, cast(isnull(dir.EmployeeNum, dir_termed.EmployeeNum) as int) as EmpNo
into #JiraStake_Emps
from #JiraStake_ADs as Jira
	LEFT JOIN DB.StifelDirectory.dbo.Directory as dir on dir.ADLogin = Jira.StakeHolder
	--Termed employees don't have an ADLogin anymore. Let's try checking emails...
	LEFT JOIN DB.StifelDirectory.dbo.Directory as dir_termed 
		on Jira.StakeHolder = LEFT(dir_termed.Email, nullif(charindex('@',	dir_termed.Email), 0))
		and dir.ADLogin is null
		and dir_termed.deleted = 1
order by Jira.NumTickets desc
		, Jira.StakeHolder ;

/* Join to the directories for some quick info. This is not particularly refined. */

if object_id('tempdb..#JiraStake_Final') is not null drop table #JiraStake_Final ;
select	distinct
		je.StakeHolder
		, je.NumTickets
		, je.EmpNo
		, dir.JobTitle
		, dir.DeptCode as OrgCode
		, OrgCode.DeptName DeptName_Org
		, OrgCode.OrgRollup OrgRollup_Org
		, OrgCode.BusinessAreaID BusinessAreaID_Org
		, bus_org.BusinessAreaDesc BusinessAreaDesc_Org
		, dir.DeptNum
		, dept_Num.DeptName DeptName_Dept
		, dept_Num.OrgRollup OrgRollup_Dept
		, dept_Num.BusinessAreaID BusinessAreaID_Dept
		, bus_dept.BusinessAreaDesc BusinessAreaDesc_Dept
into #JiraStake_Final

from	#JiraStake_Emps as je
	left join DB.Directory.dbo.Directory as dir on je.EmpNo = dir.EmployeeNum
	left join DB.Directory.dbo.Department as dept_Num on dir.DeptNum = dept_Num.DeptCNT
	left join DB.Directory.dbo.BusinessAreas as bus_dept on dept_Num.BusinessAreaID = bus_dept.BusinessAreaID
	left join DB.Directory.dbo.Department_ActiveOrg_vw as OrgCode on dir.DeptCode = OrgCode.OrgCode
	left join DB.Directory.dbo.BusinessAreas as bus_org on dept_Num.BusinessAreaID = bus_org.BusinessAreaID
order by je.StakeHolder ;

drop table #JiraStake_ADs ;
drop table #JiraStake_Emps ;

/****************************************************************************************************/


/****************************************************************************************************/

--TOTAL DATA TICKETS == 1894 @ 1/23/2020
--
--Dups add 125 records by dual labeling

--6.65% more tickets

--over 39 months == avg error oer month is .171 %

---- Join created to bring data on stakeholders for insight on business unit/org request ----
select ft.pkey
     , ft.issuenum
     , ft.ISSUE_NUMBER
	 , ft.CREATED
	 , left(cast(ft.CREATED as date),7) Year_Month
	 , ft.RESOLUTIONDATE
	 , datediff(day, ft.CREATED, ft.RESOLUTIONDATE) Days_Open
     , ft.ASSIGNEE
     , ft.REPORTER
     , ft.Issue_Stakeholder
     , ft.DISPLAY_NAME
     , ft.Area
     , ft.SUMMARY
     , ft.Descr
     , ft.Report_Type
     , jf.NumTickets
     , jf.EmpNo
     , jf.JobTitle
     , jf.OrgCode
     , jf.DeptName_Org
     , jf.OrgRollup_Org
     , jf.BusinessAreaID_Org
     , jf.BusinessAreaDesc_Org
     , jf.DeptNum
     , jf.DeptName_Dept
     , jf.OrgRollup_Dept
     , jf.BusinessAreaID_Dept
     , jf.BusinessAreaDesc_Dept
from #ft ft
left join #JiraStake_Final jf on ft.Issue_Stakeholder collate SQL_Latin1_General_CP1_CI_AS = jf.StakeHolder collate SQL_Latin1_General_CP1_CI_AS

order by ft.CREATED asc, ft.Report_Type asc
