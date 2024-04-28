CREATE SCHEMA IF NOT EXISTS "WaterConsumptionAndCost";

CREATE  TABLE "WaterConsumptionAndCost".dim_date ( 
	dateid               integer  NOT NULL  ,
	"date"               date    ,
	yearnumber           integer    ,
	quarternumber        integer    ,
	monthnumber          integer    ,
	daynumber            integer    ,
	monthname            varchar(350)    ,
	dayname              varchar(350)    ,
	weekofyear           integer    ,
	CONSTRAINT pk_dim_billingcycle PRIMARY KEY ( dateid )
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
	CONSTRAINT pk_dim_location PRIMARY KEY ( locationid )
 );

CREATE  TABLE "WaterConsumptionAndCost".dim_meter ( 
	meterid              varchar  NOT NULL  ,
	meteramr             boolean    ,
	meterscope           varchar(250)    ,
	meternumber          varchar    ,
	CONSTRAINT pk_dim_meter PRIMARY KEY ( meterid )
 );

CREATE  TABLE "WaterConsumptionAndCost".dim_vendor ( 
	vendorid             integer  NOT NULL  ,
	vendorname           varchar(250)    ,
	CONSTRAINT pk_dim_vendor PRIMARY KEY ( vendorid )
 );

CREATE  TABLE "WaterConsumptionAndCost".facts_consumerwaterusage ( 
	factid               integer  NOT NULL  ,
	vendorid             integer  NOT NULL  ,
	locationid           integer  NOT NULL  ,
	servicestartdateid   date  NOT NULL  ,
	serviceenddateid     date  NOT NULL  ,
	developmentid        integer  NOT NULL  ,
	meterid              varchar  NOT NULL  ,
	consumptionvolume    numeric(7,2)    ,
	currentcharges       numeric(7,2)    ,
	waterandsewercharges numeric(7,2)    ,
	othercharges         numeric(7,2)    ,
	serviceduration      numeric(7,2)    ,
	CONSTRAINT pk_facts_consumerwaterusage PRIMARY KEY ( factid )
 );