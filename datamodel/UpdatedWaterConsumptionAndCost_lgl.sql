CREATE SCHEMA IF NOT EXISTS "WaterConsumptionAndCost";

CREATE  TABLE "WaterConsumptionAndCost".dim_billingcycle ( 
	billingcycleid       integer  NOT NULL  ,
	revenuemonth         varchar(250)    ,
	servicestartdate     date    ,
	serviceenddate       date    ,
	numberofdays         integer    ,
	CONSTRAINT pk_dim_billingcycle PRIMARY KEY ( billingcycleid )
 );

CREATE  TABLE "WaterConsumptionAndCost".dim_development ( 
	developmentid        integer  NOT NULL  ,
	developmentname      varchar(250)    ,
	buildingnumber       varchar(250)    ,
	electronicdataprocessingnumber integer    ,
	rc_code              varchar(100)    ,
	fundingsource        varchar(250)    ,
	CONSTRAINT pk_dim_development PRIMARY KEY ( developmentid )
 );

CREATE  TABLE "WaterConsumptionAndCost".dim_location ( 
	locationid           integer  NOT NULL  ,
	boroughname          varchar(250)    ,
	"zone"               varchar(250)    ,
	longitude            numeric(7,2)    ,
	latitude             numeric(7,2)    ,
	CONSTRAINT pk_dim_location PRIMARY KEY ( locationid )
 );

CREATE  TABLE "WaterConsumptionAndCost".dim_meter ( 
	meternumber          varchar  NOT NULL  ,
	meteramr             boolean    ,
	meterscope           varchar(250)    ,
	CONSTRAINT pk_dim_meter PRIMARY KEY ( meternumber )
 );

CREATE  TABLE "WaterConsumptionAndCost".dim_vendor ( 
	vendorid             integer  NOT NULL  ,
	vendorname           varchar(250)    ,
	CONSTRAINT pk_dim_vendor PRIMARY KEY ( vendorid )
 );

CREATE  TABLE "WaterConsumptionAndCost".facts_consumerwaterusage ( 
	factid               integer  NOT NULL  ,
	billingcycleid       integer  NOT NULL  ,
	locationid           integer  NOT NULL  ,
	vendorid             integer  NOT NULL  ,
	developmentid        integer  NOT NULL  ,
	meternumber          integer  NOT NULL  ,
	consumptionvolume    numeric(7,2)    ,
	waterconsumptioncost numeric(7,2)    ,
	totalutilitycost     numeric(7,2)    ,
	currentcharges       numeric(7,2)    ,
	watercharges         numeric(7,2)    ,
	sewercharges         numeric(7,2)    ,
	othercharges         numeric(7,2)    ,
	electricitycost      numeric(7,2)    ,
	gascost              numeric(7,2)    ,
	CONSTRAINT pk_facts_consumerwaterusage PRIMARY KEY ( factid )
 );