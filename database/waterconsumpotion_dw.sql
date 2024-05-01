CREATE SCHEMA IF NOT EXISTS "waterconsumption";

CREATE  TABLE "waterconsumption".dim_date ( 
	date_id              bigint  NOT NULL  ,
	date_iso_format      date    ,
	year_number          integer    ,
	quarter_number       integer    ,
	month_number         integer    ,
	day_number           integer    ,
	month_name           varchar(255)    ,
	day_name             varchar(255)    ,
	week_of_the_year     integer    ,
	week_of_the_month    integer    ,
	CONSTRAINT pk_dim_date PRIMARY KEY ( date_id )
 );

CREATE  TABLE "waterconsumption".dim_development ( 
	development_id       integer  NOT NULL  ,
	development_name     varchar(255)    ,
	CONSTRAINT pk_dim_development PRIMARY KEY ( development_id )
 );

CREATE  TABLE "waterconsumption".dim_funding ( 
	funding_id           integer  NOT NULL  ,
	funding_source       varchar(255)    ,
	CONSTRAINT pk_dim_funding PRIMARY KEY ( funding_id )
 );

CREATE  TABLE "waterconsumption".dim_location ( 
	location_id          integer  NOT NULL  ,
	borough              varchar(255)    ,
	street               varchar(255)    ,
	"location"           varchar(255)    ,
	CONSTRAINT pk_dim_location PRIMARY KEY ( location_id )
 );

CREATE  TABLE "waterconsumption".dim_rate ( 
	rateclass_id         integer  NOT NULL  ,
	rate_class           varchar(255)    ,
	CONSTRAINT pk_dim_rate PRIMARY KEY ( rateclass_id )
 );

CREATE  TABLE "waterconsumption".dim_vendor ( 
	vendor_id            integer  NOT NULL  ,
	vendor_name          varchar(255)    ,
	CONSTRAINT pk_dim_vendor PRIMARY KEY ( vendor_id )
 );

CREATE  TABLE "waterconsumption".fact_waterconsumption ( 
	fact_id              bigint  NOT NULL  ,
	current_charges      numeric(10,2)    ,
	consumption_hcf      numeric(10,2)    ,
	water_sewer_charges  numeric(10,2)    ,
	other_charges        numeric(10,2)    ,
	number_of_days       integer    ,
	location_id          integer    ,
	development_id       integer    ,
	funding_id           integer    ,
	vendor_id            integer    ,
	rateclass_id         integer    ,
	service_startdate_id bigint    ,
	service_enddate_id   bigint    ,
	CONSTRAINT pk_fact_waterconsumption PRIMARY KEY ( fact_id )
 );
