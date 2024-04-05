CREATE SCHEMA INSTANCE;

CREATE TABLE WaterConsumptionAndCost.INSTANCE.Dim_BillingCycle ( 
	BillingCycleID int64 NOT NULL  ,
	RevenueMonth string  ,
	ServiceStartDate date  ,
	ServiceEndDate date  ,
	NumberOfDays int64  
 );

ALTER TABLE WaterConsumptionAndCost.INSTANCE.Dim_BillingCycle ADD PRIMARY KEY ( BillingCycleID )  NOT ENFORCED;

CREATE TABLE WaterConsumptionAndCost.INSTANCE.Dim_Development ( 
	DevelopmentID int64 NOT NULL  ,
	DevelopmentName string  ,
	BuildingNumber string  ,
	ElectronicDataProcessingNumber int64  ,
	RC_Code string  ,
	FundingSource string  
 );

ALTER TABLE WaterConsumptionAndCost.INSTANCE.Dim_Development ADD PRIMARY KEY ( DevelopmentID )  NOT ENFORCED;

CREATE TABLE WaterConsumptionAndCost.INSTANCE.Dim_Location ( 
	LocationID int64 NOT NULL  ,
	BoroughName string  ,
	Zone string  ,
	Longitude numeric  ,
	Latitude numeric  
 );

ALTER TABLE WaterConsumptionAndCost.INSTANCE.Dim_Location ADD PRIMARY KEY ( LocationID )  NOT ENFORCED;

CREATE TABLE WaterConsumptionAndCost.INSTANCE.Dim_Meter ( 
	MeterNumber string NOT NULL  ,
	MeterAMR boolean  ,
	MeterScope string  
 );

ALTER TABLE WaterConsumptionAndCost.INSTANCE.Dim_Meter ADD PRIMARY KEY ( MeterNumber )  NOT ENFORCED;

CREATE TABLE WaterConsumptionAndCost.INSTANCE.Dim_Vendor ( 
	VendorID int64 NOT NULL  ,
	VendorName string  
 );

ALTER TABLE WaterConsumptionAndCost.INSTANCE.Dim_Vendor ADD PRIMARY KEY ( VendorID )  NOT ENFORCED;

CREATE TABLE WaterConsumptionAndCost.INSTANCE.Facts_ConsumerWaterUsage ( 
	FactID int64 NOT NULL  ,
	BillingCycleID int64 NOT NULL  ,
	LocationID int64 NOT NULL  ,
	VendorID int64 NOT NULL  ,
	DevelopmentID int64 NOT NULL  ,
	MeterNumber int64 NOT NULL  ,
	ConsumptionVolume numeric  ,
	WaterConsumptionCost numeric  ,
	TotalUtilityCost numeric  ,
	CurrentCharges numeric  ,
	WaterCharges numeric  ,
	SewerCharges numeric  ,
	OtherCharges numeric  ,
	ElectricityCost numeric  ,
	GasCost numeric  
 );

ALTER TABLE WaterConsumptionAndCost.INSTANCE.Facts_ConsumerWaterUsage ADD PRIMARY KEY ( FactID )  NOT ENFORCED;
