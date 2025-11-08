-- USNDC Schema - Tables Only (Clean)
-- Generated from original schema with foreign keys removed

-- Drop existing tables
DROP TABLE IF EXISTS ACTIVE_ID CASCADE;
DROP TABLE IF EXISTS AFFILIATION CASCADE;
DROP TABLE IF EXISTS ALGORITHM CASCADE;
DROP TABLE IF EXISTS ALPHASITE CASCADE;
DROP TABLE IF EXISTS AMP3C CASCADE;
DROP TABLE IF EXISTS AMPDESCRIPT CASCADE;
DROP TABLE IF EXISTS AMPLITUDE CASCADE;
DROP TABLE IF EXISTS AMPLITUDE_DYN_PARS_DBL CASCADE;
DROP TABLE IF EXISTS AMPLITUDE_DYN_PARS_INT CASCADE;
DROP TABLE IF EXISTS AMPLITUDE_DYN_PARS_STR CASCADE;
DROP TABLE IF EXISTS AOI CASCADE;
DROP TABLE IF EXISTS APMA CASCADE;
DROP TABLE IF EXISTS ARRIVAL CASCADE;
DROP TABLE IF EXISTS ARRIVAL_DYN_PARS_DBL CASCADE;
DROP TABLE IF EXISTS ARRIVAL_DYN_PARS_INT CASCADE;
DROP TABLE IF EXISTS ARRIVAL_DYN_PARS_STR CASCADE;
DROP TABLE IF EXISTS ARRIVAL_TAG CASCADE;
DROP TABLE IF EXISTS AR_INFO CASCADE;
DROP TABLE IF EXISTS ASSOC CASCADE;
DROP TABLE IF EXISTS ASSOC_GA CASCADE;
DROP TABLE IF EXISTS ASSOC_GA_DEL CASCADE;
DROP TABLE IF EXISTS BEAM CASCADE;
DROP TABLE IF EXISTS BULLETIN_RELEASE CASCADE;
DROP TABLE IF EXISTS BULLETIN_RELEASE_EXPORT CASCADE;
DROP TABLE IF EXISTS BUTTERWORTH_FILTER CASCADE;
DROP TABLE IF EXISTS CHANNAME CASCADE;
DROP TABLE IF EXISTS CHAN_GROUPS CASCADE;
DROP TABLE IF EXISTS CLASSIFICATION CASCADE;
DROP TABLE IF EXISTS CLASSIFICATION_LEVEL CASCADE;
DROP TABLE IF EXISTS CLASSIFICATION_LOOKUP CASCADE;
DROP TABLE IF EXISTS CLASSIFICATION_OPR CASCADE;
DROP TABLE IF EXISTS CLASSIFICATION_REFER_TO CASCADE;
DROP TABLE IF EXISTS CLASS_DECLASS_ID CASCADE;
DROP TABLE IF EXISTS CLASS_DERIVED_ID CASCADE;
DROP TABLE IF EXISTS CLASS_DISSEM_ID CASCADE;
DROP TABLE IF EXISTS CLUSTER_INFO CASCADE;
DROP TABLE IF EXISTS CLUSTER_MAGREF CASCADE;
DROP TABLE IF EXISTS CLUSTER_MEC CASCADE;
DROP TABLE IF EXISTS CLUSTER_ORID CASCADE;
DROP TABLE IF EXISTS CLUSTER_OVERRIDE CASCADE;
DROP TABLE IF EXISTS CLUSTER_PHASE_OVERRIDE CASCADE;
DROP TABLE IF EXISTS CLUSTER_STATION CASCADE;
DROP TABLE IF EXISTS CLUSTER_THRESHOLD CASCADE;
DROP TABLE IF EXISTS CODAMAG_INPUT CASCADE;
DROP TABLE IF EXISTS CODAMAG_OUTPUT CASCADE;
DROP TABLE IF EXISTS CONTINUOUS_DATA_STATUS CASCADE;
DROP TABLE IF EXISTS DATAUSER CASCADE;
DROP TABLE IF EXISTS DA_INTERVAL CASCADE;
DROP TABLE IF EXISTS DA_REFSTA_LATENCY CASCADE;
DROP TABLE IF EXISTS DA_REFSTA_SUMMARY CASCADE;
DROP TABLE IF EXISTS DA_SITECHAN_LATENCY CASCADE;
DROP TABLE IF EXISTS DECONVOLUTION CASCADE;
DROP TABLE IF EXISTS DEFINING_OBSTYPES CASCADE;
DROP TABLE IF EXISTS DEFINING_RULES CASCADE;
DROP TABLE IF EXISTS DEFINING_VALUES CASCADE;
DROP TABLE IF EXISTS DETECTION CASCADE;
DROP TABLE IF EXISTS DETECTION_THRESHOLD CASCADE;
DROP TABLE IF EXISTS DISCRIMUSE CASCADE;
DROP TABLE IF EXISTS DISCRIMVOTE CASCADE;
DROP TABLE IF EXISTS DISCRIM_PARAM CASCADE;
DROP TABLE IF EXISTS DLMAN CASCADE;
DROP TABLE IF EXISTS DOPPLER_DETECTION CASCADE;
DROP TABLE IF EXISTS ECM_CHAN_AMPLITUDE CASCADE;
DROP TABLE IF EXISTS ECM_CONSTANT CASCADE;
DROP TABLE IF EXISTS ECM_COV CASCADE;
DROP TABLE IF EXISTS ECM_DISCRIMINANTS CASCADE;
DROP TABLE IF EXISTS ECM_EVENT_RESULTS CASCADE;
DROP TABLE IF EXISTS ECM_REF_CHAN_AMPLITUDE CASCADE;
DROP TABLE IF EXISTS ECM_REF_DISCRIM CASCADE;
DROP TABLE IF EXISTS ECM_REF_EVENT CASCADE;
DROP TABLE IF EXISTS ECM_REGION_PREF_VERSION CASCADE;
DROP TABLE IF EXISTS ECM_SOURCES CASCADE;
DROP TABLE IF EXISTS ECM_STA_PREF_VERSION CASCADE;
DROP TABLE IF EXISTS ENVELOPE_CONTRIBUTION CASCADE;
DROP TABLE IF EXISTS EVENT CASCADE;
DROP TABLE IF EXISTS EVENT_CONTROL CASCADE;
DROP TABLE IF EXISTS EVENT_CORRELATION CASCADE;
DROP TABLE IF EXISTS EVENT_QUALITY CASCADE;
DROP TABLE IF EXISTS FEEDBACK CASCADE;
DROP TABLE IF EXISTS FEEDBACK_CATAFFILIATION CASCADE;
DROP TABLE IF EXISTS FEEDBACK_CATEGORIES CASCADE;
DROP TABLE IF EXISTS FEEDBACK_SCREENSHOTS CASCADE;
DROP TABLE IF EXISTS FEEDBACK_STATE CASCADE;
DROP TABLE IF EXISTS FEEDBACK_STATE_CATEGORIES CASCADE;
DROP TABLE IF EXISTS FILTER CASCADE;
DROP TABLE IF EXISTS FILTER_COEFFICIENTS CASCADE;
DROP TABLE IF EXISTS FILTER_GROUP CASCADE;
DROP TABLE IF EXISTS FILTER_VALUES_DOUBLE CASCADE;
DROP TABLE IF EXISTS FILTER_VALUES_INTEGER CASCADE;
DROP TABLE IF EXISTS FILTER_VALUES_STRING CASCADE;
DROP TABLE IF EXISTS FK_PROCESSING CASCADE;
DROP TABLE IF EXISTS FTPFAILED CASCADE;
DROP TABLE IF EXISTS FTPLOGIN CASCADE;
DROP TABLE IF EXISTS GA_TAG CASCADE;
DROP TABLE IF EXISTS GREGION CASCADE;
DROP TABLE IF EXISTS HISTORIC_INFO_CYLINDER CASCADE;
DROP TABLE IF EXISTS HISTORIC_INFO_SHELL CASCADE;
DROP TABLE IF EXISTS HISTORIC_INFO_STA_PHASE CASCADE;
DROP TABLE IF EXISTS HYDRO_ARRIVAL CASCADE;
DROP TABLE IF EXISTS HYDRO_ARR_GROUP CASCADE;
DROP TABLE IF EXISTS HYDRO_ASSOC CASCADE;
DROP TABLE IF EXISTS HYDRO_ORIGIN CASCADE;
DROP TABLE IF EXISTS INSTRUMENT CASCADE;
DROP TABLE IF EXISTS INTERVAL CASCADE;
DROP TABLE IF EXISTS MDAC_FD CASCADE;
DROP TABLE IF EXISTS MDAC_FI CASCADE;
DROP TABLE IF EXISTS MSGAUX CASCADE;
DROP TABLE IF EXISTS MSGDATATYPE CASCADE;
DROP TABLE IF EXISTS MSGDEST CASCADE;
DROP TABLE IF EXISTS MSGDISC CASCADE;
DROP TABLE IF EXISTS MSVMAX_DESCRIPT CASCADE;
DROP TABLE IF EXISTS MSVMAX_RESULTS CASCADE;
DROP TABLE IF EXISTS NETMAG CASCADE;
DROP TABLE IF EXISTS NETWORK CASCADE;
DROP TABLE IF EXISTS NETYIELD CASCADE;
DROP TABLE IF EXISTS NET_CODA_SPECTRUM CASCADE;
DROP TABLE IF EXISTS OMITTED_CHANNELS CASCADE;
DROP TABLE IF EXISTS ORIGERR CASCADE;
DROP TABLE IF EXISTS ORIGERR_GA CASCADE;
DROP TABLE IF EXISTS ORIGERR_GA_DEL CASCADE;
DROP TABLE IF EXISTS ORIGIN CASCADE;
DROP TABLE IF EXISTS ORIGIN_GA CASCADE;
DROP TABLE IF EXISTS ORIGIN_GA_DEL CASCADE;
DROP TABLE IF EXISTS ORIGIN_MEA_TRACE CASCADE;
DROP TABLE IF EXISTS ORIGIN_SDO CASCADE;
DROP TABLE IF EXISTS ORIGIN_TAG CASCADE;
DROP TABLE IF EXISTS OUTAGE_STATION_DATA CASCADE;
DROP TABLE IF EXISTS OUTAGE_STATION_RECEIVE CASCADE;
DROP TABLE IF EXISTS POLYGON CASCADE;
DROP TABLE IF EXISTS POLYPOINT CASCADE;
DROP TABLE IF EXISTS PROCESSING_RECIPE CASCADE;
DROP TABLE IF EXISTS PROCESS_TRACKING CASCADE;
DROP TABLE IF EXISTS QCMASKDEF CASCADE;
DROP TABLE IF EXISTS QCMASKINFO CASCADE;
DROP TABLE IF EXISTS QCMASKSEG CASCADE;
DROP TABLE IF EXISTS QSHELL_INTERVAL CASCADE;
DROP TABLE IF EXISTS RDA_PARAM CASCADE;
DROP TABLE IF EXISTS REG_RATIO_DISCRIM CASCADE;
DROP TABLE IF EXISTS REMAP CASCADE;
DROP TABLE IF EXISTS REMARK CASCADE;
DROP TABLE IF EXISTS REMOVED_BEAM_DFILE CASCADE;
DROP TABLE IF EXISTS REQUEST CASCADE;
DROP TABLE IF EXISTS SADO_EMAIL_HISTORY CASCADE;
DROP TABLE IF EXISTS SADO_PDF_REPORTS CASCADE;
DROP TABLE IF EXISTS SADO_REPORT CASCADE;
DROP TABLE IF EXISTS SADO_REPORT_LANDMARKS CASCADE;
DROP TABLE IF EXISTS SADO_SCREENSHOTS CASCADE;
DROP TABLE IF EXISTS SADO_STATE CASCADE;
DROP TABLE IF EXISTS SADO_STATE_CATEGORIES CASCADE;
DROP TABLE IF EXISTS SADO_USERS CASCADE;
DROP TABLE IF EXISTS SENSOR CASCADE;
DROP TABLE IF EXISTS SITE CASCADE;
DROP TABLE IF EXISTS SITEAUX CASCADE;
DROP TABLE IF EXISTS SITECHAN CASCADE;
DROP TABLE IF EXISTS SNR_PHASE CASCADE;
DROP TABLE IF EXISTS SREGION CASCADE;
DROP TABLE IF EXISTS STAMAG CASCADE;
DROP TABLE IF EXISTS STANET CASCADE;
DROP TABLE IF EXISTS STAQUAL_DNAMES CASCADE;
DROP TABLE IF EXISTS STATION_PROCESSING CASCADE;
DROP TABLE IF EXISTS STATION_QUALITY CASCADE;
DROP TABLE IF EXISTS STAYIELD CASCADE;
DROP TABLE IF EXISTS STA_CODA_SPECTRUM CASCADE;
DROP TABLE IF EXISTS SVDDISC CASCADE;
DROP TABLE IF EXISTS SVDDISC_CHAN_ORDER CASCADE;
DROP TABLE IF EXISTS TAPER CASCADE;
DROP TABLE IF EXISTS TIMESTAMP CASCADE;
DROP TABLE IF EXISTS TOMO_INFO CASCADE;
DROP TABLE IF EXISTS USER_FILTER CASCADE;
DROP TABLE IF EXISTS USER_PRIVILEGES CASCADE;
DROP TABLE IF EXISTS WFACTIVITY CASCADE;
DROP TABLE IF EXISTS WFAUDIT CASCADE;
DROP TABLE IF EXISTS WFCONV CASCADE;
DROP TABLE IF EXISTS WFDISC CASCADE;
DROP TABLE IF EXISTS WFFILE CASCADE;
DROP TABLE IF EXISTS WFTAG CASCADE;
DROP TABLE IF EXISTS XTAG CASCADE;

-- Create tables without foreign key constraints
CREATE TABLE ACTIVE_ID (
    TAGNAME VARCHAR(8) -- The key name (arid or evid),
    TAGID BIGINT -- Tag identifier value (arid or evid),
    CLIENT_INFO VARCHAR(64) -- Client information,
    AUTHOR VARCHAR(64) -- Author,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE AFFILIATION (
    NET VARCHAR(8) -- Unique network identifier,
    STA VARCHAR(6) -- Station identifier,
    TIME DOUBLE PRECISION -- Starting time for station in network,
    ENDTIME DOUBLE PRECISION -- endtime for station in network,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_affiliation PRIMARY KEY (NET, STA, TIME)
);

CREATE TABLE ALGORITHM (
    ALGORITHM_ID BIGINT -- Algorithm identifier,
    ALGORITHM_NAME VARCHAR(64) -- Algorithm name,
    DESCRIPTION VARCHAR(4000) -- Description of algorithm,
    ON_DATE TIMESTAMP -- The date the algorithm first became active or was created,
    OFF_DATE TIMESTAMP -- The date the algorithm was removed from the system or made obsolete,
    AUTHOR VARCHAR(64) -- Author,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_algorithm PRIMARY KEY (ALGORITHM_ID)
);

CREATE TABLE ALPHASITE (
    STA VARCHAR(6) -- Station code,
    ADDRESS VARCHAR(16) -- Source internet address,
    PREFDLID BIGINT -- dlid for preferred DLMan,
    PREFPORT INTEGER -- Preferred network port,
    CON_ALLOWED VARCHAR(1) -- Status on whether DLMAN is allowed to connect to this channel or not,
    DLID BIGINT -- dlid handling station,
    TIME DOUBLE PRECISION -- Clock time of most recent activity,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE AMP3C (
    ARID BIGINT -- Arrival identifier,
    CFREQ REAL -- Center frequency of filter band amplitude is measured on,
    VAMP REAL -- Vertical amplitude,
    VSNR REAL -- Vertical signal-to-noise ratio,
    HAMP REAL -- Horizontal amplitude,
    HSNR REAL -- Horizontal signal-to-noise ratio,
    HTOV REAL -- Horizontal-to-vertical amplitude ratio,
    RID VARCHAR(8) -- Recipe identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE AMPDESCRIPT (
    AMPTYPE VARCHAR(8) -- Amplitude measure descriptor,
    TOFF REAL -- Offset from theoretical or observed arrival time,
    TLEN REAL -- Duration of measurement window,
    GVLO REAL -- Low group velocity for measurement window (km/sec),
    GVHI REAL -- High group velocity for measurement window kilometers per second (km/sec),
    MTYPE VARCHAR(8) -- Measurement type,
    AMPDESCR VARCHAR(255) -- Description,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE AMPLITUDE (
    AMPID BIGINT -- Amplitude identifier,
    ARID BIGINT -- Arrival identifier,
    PARID BIGINT -- Predicted arrival identifier,
    CHAN VARCHAR(8) -- Channel code,
    AMP REAL -- Amplitude,
    PER REAL -- Period(s),
    SNR REAL -- Signal-to-noise ratio,
    AMPTIME DOUBLE PRECISION -- Time of amplitude measure,
    TIME DOUBLE PRECISION -- Start time of measurement window,
    DURATION REAL -- Duration of measurement window,
    DELTAF REAL -- Sample interval width,
    AMPTYPE VARCHAR(8) -- Amplitude measure descriptor,
    UNITS VARCHAR(15) -- Units,
    CLIP VARCHAR(1) -- Clipped flag,
    INARRIVAL VARCHAR(1) -- y or n flag indicating if amplitude (amp) is the same as the amp in the arrival table,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_amplitude PRIMARY KEY (AMPID)
);

CREATE TABLE AMPLITUDE_DYN_PARS_DBL (
    AMPID BIGINT -- Unique amplitude identifier,
    GROUP_NAME VARCHAR(48) -- General function or purpose where attribute is used (e.g. FK),
    PARAM_NAME VARCHAR(48) -- Attribute name (e.g. LEAD, LAG),
    D_VALUE DOUBLE PRECISION -- Double precision value,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_amplitude_dyn_pars_dbl PRIMARY KEY (AMPID)
);

CREATE TABLE AMPLITUDE_DYN_PARS_INT (
    AMPID BIGINT -- Unique amplitude identifier,
    GROUP_NAME VARCHAR(48) -- General function or purpose where attribute is used (e.g. FK),
    PARAM_NAME VARCHAR(48) -- Attribute name (e.g. LEAD, LAG),
    I_VALUE BIGINT -- Integer value,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_amplitude_dyn_pars_int PRIMARY KEY (AMPID)
);

CREATE TABLE AMPLITUDE_DYN_PARS_STR (
    AMPID BIGINT -- Unique amplitude identifier,
    GROUP_NAME VARCHAR(48) -- General function or purpose where attribute is used (e.g. FK),
    PARAM_NAME VARCHAR(48) -- Attribute name (e.g. LEAD, LAG),
    S_VALUE VARCHAR(1024) -- String value,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_amplitude_dyn_pars_str PRIMARY KEY (AMPID)
);

CREATE TABLE AOI (
    LAT DOUBLE PRECISION -- Latitude,
    LON DOUBLE PRECISION -- Longitude,
    AOI_GEOCHAR VARCHAR(1) -- Area of interest geographic region characteristic,
    LFAOI_GEOCHAR VARCHAR(1) -- Look Forward Area of interest geographic region characteristic,
    DEPTH_GEOCHAR VARCHAR(1) -- Depth geographic region characteristic,
    SEISMIC_GEOCHAR VARCHAR(1) -- Seismic geographic region characteristic,
    TERRAIN_GEOCHAR VARCHAR(1) -- Terrain geographic region characteristic,
    ONDATE INTEGER -- Julian on date,
    OFFDATE INTEGER -- Julian off date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE APMA (
    PHASE VARCHAR(8) -- Phase,
    ARID BIGINT -- Arrival identifier,
    FREQ REAL -- Frequency,
    SNR REAL -- Signal-to-noise ratio,
    AMPP REAL -- P-phase amplitude,
    AMPS REAL -- S-phase amplitude,
    AMPLR REAL -- Rayleigh-phase amplitude,
    RECT REAL -- Rectilinearity,
    PLANS REAL -- S-phase planarity,
    PLANLR REAL -- Rayleigh-phase planarity,
    HVRATP REAL -- P-phase horizontal-to-vertical ratio,
    HVRAT REAL -- S-phase horizontal-to-vertical ratio,
    HMXMN REAL -- Maximum-to-minimum horizontal ratio,
    INANG3 REAL -- Short-axis incidence angle,
    SEAZP REAL -- P-phase observed azimuth,
    SEAZS REAL -- S-phase observed azimuth,
    SEAZLR REAL -- Rayleigh-phase observed azimuth,
    INANG1 REAL -- Long-axis incidence angle,
    PPHASETIME DOUBLE PRECISION -- P-phase extraction time,
    SPHASETIME DOUBLE PRECISION -- S-phase extraction time,
    AUTH VARCHAR(15) -- Author,
    APMARID BIGINT -- apma recipe identifier,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ARRIVAL (
    STA VARCHAR(6) -- Station code,
    TIME DOUBLE PRECISION -- Epoch time,
    ARID BIGINT -- Arrival identifier,
    JDATE INTEGER -- Julian date,
    STASSID BIGINT -- Arrival group indentification,
    CHANID BIGINT -- Instrument identifier,
    CHAN VARCHAR(8) -- Channel code,
    IPHASE VARCHAR(8) -- Reported phase,
    STYPE VARCHAR(1) -- Signal type,
    DELTIM REAL -- Time uncertainty,
    AZIMUTH REAL -- Observed azimuth,
    DELAZ REAL -- Azimuth uncertainty,
    SLOW REAL -- Observed slowness, seconds/degree,
    DELSLO REAL -- Slowness uncertainty,
    EMA REAL -- Emergence angle,
    RECT REAL -- Rectilinearity,
    AMP REAL -- Amplitude, instrument corrected,
    PER REAL -- Period,
    LOGAT REAL -- Log (amp/per),
    CLIP VARCHAR(1) -- Clipped flag,
    FM VARCHAR(2) -- First motion,
    SNR REAL -- Signal-to-noise ratio,
    QUAL VARCHAR(1) -- Signal onset quality,
    AUTH VARCHAR(15) -- Author,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_arrival PRIMARY KEY (ARID)
);

CREATE TABLE ARRIVAL_DYN_PARS_DBL (
    ARID BIGINT -- Unique arrival identifier,
    GROUP_NAME VARCHAR(48) -- General function or purpose where attribute is used (e.g. DETECT, ONSET, FK),
    PARAM_NAME VARCHAR(48) -- Attribute name (e.g. FILTERID),
    D_VALUE DOUBLE PRECISION -- Double precision value,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_arrival_dyn_pars_dbl PRIMARY KEY (ARID)
);

CREATE TABLE ARRIVAL_DYN_PARS_INT (
    ARID BIGINT -- Unique arrival identifier,
    GROUP_NAME VARCHAR(48) -- General function or purpose where attribute is used (e.g. DETECT, ONSET, FK),
    PARAM_NAME VARCHAR(48) -- Attribute name (e.g. FILTERID),
    I_VALUE BIGINT -- Integer value,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_arrival_dyn_pars_int PRIMARY KEY (ARID)
);

CREATE TABLE ARRIVAL_DYN_PARS_STR (
    ARID BIGINT -- Unique arrival identifier,
    GROUP_NAME VARCHAR(48) -- General function or purpose where attribute is used (e.g. DETECT, ONSET, FK),
    PARAM_NAME VARCHAR(48) -- Attribute name (e.g. FILTERID),
    S_VALUE VARCHAR(1024) -- String value,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_arrival_dyn_pars_str PRIMARY KEY (ARID)
);

CREATE TABLE ARRIVAL_TAG (
    ARID BIGINT -- Arrival identifier,
    PROCESS_MODE VARCHAR(32) -- Processing mode used to generate arrival,
    PROCESS_ATTRIBUTE VARCHAR(32) -- Attribute of processing mode,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_arrival_tag PRIMARY KEY (ARID)
);

CREATE TABLE AR_INFO (
    ORID BIGINT -- Origin identifier,
    ARID BIGINT -- Arrival identifier,
    TIME_ERROR_CODE INTEGER -- Time error code,
    AZ_ERROR_CODE INTEGER -- Azimuth error code,
    SLOW_ERROR_CODE INTEGER -- Slowness error code,
    SRC_DPNT_CORR_TYPE INTEGER -- Correction code (TT, AZ, SLO),
    VMODEL VARCHAR(16) -- Velocity model for theoretical travel time (TT) and slowness (SLO),
    TOTAL_TRAVEL_TIME REAL -- Predicted travel time including all corrections (seconds),
    TT_TABLE_VALUE REAL -- Base model travel time (uncorrect),
    ELLIP_CORR REAL -- Time correction due to earth's ellipticity (seconds),
    ELEV_CORR REAL -- Time correction due to station elevation (seconds),
    BULK_STATIC_STA_CORR REAL -- Static station correction to travel time (seconds),
    TT_SRC_DPNT_CORR REAL -- Source-specific travel time correction (seconds),
    TT_MODEL_ERROR REAL -- Travel time model uncertainty (seconds),
    TT_MEAS_ERROR REAL -- Travel time measurement uncertainty (seconds),
    TT_MODEL_PLUS_MEAS_ERROR REAL -- Combined travel time model and measurement uncertainty (seconds),
    AZ_SRC_DPNT_CORR REAL -- Source-specific azimuth correction (degrees),
    AZ_MODEL_ERROR REAL -- Azimuth model uncertainty (degrees),
    AZ_MEAS_ERROR REAL -- Azimuth measurement uncertainty (degrees),
    AZ_MODEL_PLUS_MEAS_ERROR REAL -- Combined azimuth model and measurement uncertainty (degrees),
    SL_SRC_DPNT_CORR REAL -- Source-specific slowness correction (s/deg),
    SL_MODEL_ERROR REAL -- Slowness model uncertainty (s/deg),
    SL_MEAS_ERROR REAL -- Slowness measurement uncertainty (s/deg),
    SL_MODEL_PLUS_MEAS_ERROR REAL -- Combined slowness model and measurement uncertainty (s/deg),
    TIME_IMPORT REAL -- Weight applied to travel time in event solution,
    AZ_IMPORT REAL -- Weight applied to azimuth in event solution,
    SLOW_IMPORT REAL -- Weight applied to slowness in event solution,
    SLOW_VEC_RES REAL -- Residual between predicted and observed FK vector (s/deg),
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ASSOC (
    ARID BIGINT -- Arrival identifier,
    ORID BIGINT -- Origin identifier,
    STA VARCHAR(6) -- Station code,
    PHASE VARCHAR(8) -- Associated phase,
    BELIEF REAL -- Phase confidence,
    DELTA REAL -- Station-to-event distance,
    SEAZ REAL -- Station-to-event azimuth,
    ESAZ REAL -- Event-to-station azimuth,
    TIMERES REAL -- Time residual,
    TIMEDEF VARCHAR(1) -- Time = defining (d,D), nondefining (n,N,x,X),
    AZRES REAL -- Azimuth residual,
    AZDEF VARCHAR(1) -- Azimuth = defining (d,D), nondefining (n,N,x,X),
    SLORES REAL -- Slowness residual,
    SLODEF VARCHAR(1) -- Slowness = defining (d,D), nondefining (n,N,x,X),
    EMARES REAL -- Incidence angle residual,
    WGT REAL -- Location weight,
    VMODEL VARCHAR(15) -- Velocity model,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_assoc PRIMARY KEY (ARID, ORID)
);

CREATE TABLE ASSOC_GA (
    ARID BIGINT -- Arrival identifier,
    ORID BIGINT -- Origin identifier,
    STA VARCHAR(6) -- Station code,
    PHASE VARCHAR(8) -- Associated phase,
    BELIEF REAL -- Phase confidence,
    DELTA REAL -- Station-to-event distance,
    SEAZ REAL -- Station-to-event azimuth,
    ESAZ REAL -- Event-to-station azimuth,
    TIMERES REAL -- Time residual,
    TIMEDEF VARCHAR(1) -- Time = defining (d,D), nondefining (n,N,x,X),
    AZRES REAL -- Azimuth residual,
    AZDEF VARCHAR(1) -- Azimuth = defining (d,D), nondefining (n,N,x,X),
    SLORES REAL -- Slowness residual,
    SLODEF VARCHAR(1) -- Slowness = defining (d,D), nondefining (n,N,x,X),
    EMARES REAL -- Incidence angle residual,
    WGT REAL -- Location weight,
    VMODEL VARCHAR(15) -- Velocity model,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ASSOC_GA_DEL (
    ARID BIGINT -- Arrival identifier,
    ORID BIGINT -- Origin identifier,
    STA VARCHAR(6) -- Station code,
    PHASE VARCHAR(8) -- Associated phase,
    BELIEF REAL -- Phase confidence,
    DELTA REAL -- Station-to-event distance,
    SEAZ REAL -- Station-to-event azimuth,
    ESAZ REAL -- Event-to-station azimuth,
    TIMERES REAL -- Time residual,
    TIMEDEF VARCHAR(1) -- Time = defining (d,D), nondefining (n,N,x,X),
    AZRES REAL -- Azimuth residual,
    AZDEF VARCHAR(1) -- Azimuth = defining (d,D), nondefining (n,N,x,X),
    SLORES REAL -- Slowness residual,
    SLODEF VARCHAR(1) -- Slowness = defining (d,D), nondefining (n,N,x,X),
    EMARES REAL -- Incidence angle residual,
    WGT REAL -- Location weight,
    VMODEL VARCHAR(15) -- Velocity model,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE BEAM (
    WFID BIGINT -- Waveform identifier,
    FILTERID BIGINT -- This is a TBD field created in anticipation of the Persistent Parameter module,
    AZIMUTH REAL -- Azimuth,
    SLOW REAL -- Slowness of an arrival,
    DESCRIP VARCHAR(50) -- Text description of the beam,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE BULLETIN_RELEASE (
    ERPID BIGINT -- Event Reporting Process identifier,
    ORID BIGINT -- Origin identifier,
    EVID BIGINT -- Event identifier,
    MAGID BIGINT -- Magnitude identifier,
    AOI_GEOCHAR VARCHAR(1) -- Area of interest geographic region characteristic,
    CLASSIFICATION_COMMENTS VARCHAR(4000) -- Discrim and ECM comments,
    CLASSIFICATION_RESULTS VARCHAR(4000) -- Discrim and ECM results,
    GRNAME VARCHAR(40) -- Geographic region name,
    RELEASE_STATUS VARCHAR(16) -- Action being called for,
    AUTH VARCHAR(15) -- Source/originator,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE BULLETIN_RELEASE_EXPORT (
    ERP_SEQ BIGINT -- Event Release Process export sequence number,
    MAX_ERPID BIGINT -- Maximum Event Release Process Identifier,
    AUTH VARCHAR(15) -- Source/originator,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE BUTTERWORTH_FILTER (
    FILTERID BIGINT -- ID number of a filter processing parameter,
    FILTER_TYPE VARCHAR(16) -- Type of Butterworth filter (BP, LP, HP),
    FILTER_ORDER SMALLINT -- Order of Butterworth filter,
    FILTER_LOW REAL -- Filter low frequency,
    FILTER_HIGH REAL -- Filter high frequency,
    FILTER_ZEROPH SMALLINT -- This is a flag to indicate zero-phase filtering. If this is set to 0, the filter is not zero-phase. If this is set to 1, the filter is zero-phase i.e. no phase lag or group delay.,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE CHANNAME (
    EXTERN_STA VARCHAR(6) -- External station name,
    EXTERN_CHAN VARCHAR(8) -- External channel name,
    EXTERN_AUTH VARCHAR(20) -- External authority using this name,
    INTERN_STA VARCHAR(6) -- Internal station name,
    INTERN_CHAN VARCHAR(8) -- Internal channel name,
    INTERN_CHANID BIGINT -- Internal channel ID,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE CHAN_GROUPS (
    CLASS VARCHAR(16) -- Type of interval,
    NAME VARCHAR(20) -- Name of interval,
    STA VARCHAR(6) -- Station,
    CHAN VARCHAR(8) -- Channel code,
    DURATION REAL -- Duration in seconds of the time region,
    INWFACTIVITY SMALLINT -- Indicates whether class/name/duration is in wfactivity or not,
    ONDATE INTEGER -- On date,
    OFFDATE INTEGER -- Off date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE CLASSIFICATION (
    CLASSIFICATION_ID BIGINT -- Classification Identifier.,
    DESCRIPTION VARCHAR(64) -- Classification description.,
    CLASS_LEVEL_ID BIGINT -- Classification Level Identifier.,
    CLASS_DISSEM_ID BIGINT -- Classification Dissemination Identifier.,
    CLASS_DERIVED_ID BIGINT -- Classification Derived From Identifier.,
    CLASS_DECLASS_ID BIGINT -- Class Declassify Identifier,
    CLASS_REFER_ID BIGINT -- Class Refer To Identifier,
    CLASS_OPR_ID BIGINT -- ID for the classification_opr table. This is the agency, office (or OPR) responsible for classification and classification date.,
    ON_DATE TIMESTAMP -- The date the classification becomes active.,
    OFF_DATE TIMESTAMP -- The date the classification becomes inactive or obsolete.,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load Date,
    MODDATE TIMESTAMP -- Modification date
);

CREATE TABLE CLASSIFICATION_LEVEL (
    CLASS_LEVEL_ID BIGINT -- Classification Level Identifier.,
    CLASS_LEVEL VARCHAR(64) -- Level of Classification, e.g. SECRET,
    PARAGRAPH_MARK VARCHAR(16) -- Abbreviated classification for paragraph marking i.e. UNCLASSIFIED = U.,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE CLASSIFICATION_LOOKUP (
    CLASS_LOOKUP_ID BIGINT -- Classification Lookup Identifier.,
    APPLICATION VARCHAR(64) -- The name of the application using the security marking, e.g. ARS, McTool.,
    CLASSIFICATION_ID BIGINT -- Classification Identifier.,
    ON_DATE TIMESTAMP -- The date the classification becomes active.,
    OFF_DATE TIMESTAMP -- The date the classification becomes inactive or obsolete.,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load Date,
    MODDATE TIMESTAMP -- Modification date
);

CREATE TABLE CLASSIFICATION_OPR (
    CLASS_OPR_ID BIGINT -- See classification.class_opr_id description,
    CLASS_OPR VARCHAR(64) -- See table description,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE CLASSIFICATION_REFER_TO (
    CLASS_REFER_ID BIGINT -- Class Refer To Identifier,
    CLASS_REFER VARCHAR(4000) -- The classification_refer_to.class_refer contains the &quot;Refer to&quot; string which follows the the &quot;Declassify On&quot; part of the Exective Order Box. It provides the source to refer to in order to properly de classify something.,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE CLASS_DECLASS_ID (
    CLASS_DECLASS_ID BIGINT -- Class Declassify Identifier,
    CLASS_DECLASS VARCHAR(4000) -- See comment on table.,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE CLASS_DERIVED_ID (
    CLASS_DERIVED_ID BIGINT -- Classification derived from Identifier.,
    CLASS_DERIVED VARCHAR(4000) -- The source of the classification, i.e. classified by or derived from.,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE CLASS_DISSEM_ID (
    CLASS_DISSEM_ID BIGINT -- Classification Dissemination Identifier.,
    CLASS_DISSEM VARCHAR(64) -- The abbreviated control marking which may follow the classification.,
    PARAGRAPH_MARK VARCHAR(16) -- The paragraph control marking. May be an abbreviated version of the class_dissem control marking.,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE CLUSTER_INFO (
    CLUID BIGINT -- Unique cluster ID,
    DESCRIP VARCHAR(50) -- Text description of cluster,
    PREFOR BIGINT -- Origin that is closest to the center of the cluster,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE CLUSTER_MAGREF (
    CLUSTAID BIGINT -- Cluster Sta ID,
    ACTIVETIME DOUBLE PRECISION -- The epochtime a cluster was activated,
    ORID BIGINT -- Orid of magref event,
    AMPTYPE VARCHAR(8) -- Amplitude type,
    MTYPE VARCHAR(15) -- Amplitude measurement type,
    MVALUE REAL -- Amplitude measurement value (only required for specific mtype(s)),
    FILTERID BIGINT -- Filter identifier that links to the butterworth filter table,
    LEAD REAL -- Number of seconds before preferred phase for amplitude measurement,
    DURATION REAL -- Total number of seconds of the waveform around the preferred phase for amplitude measurement,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE CLUSTER_MEC (
    CLUSTAID BIGINT -- Cluster Station identifier,
    STA VARCHAR(6) -- Element name,
    PHASE VARCHAR(8) -- Phase,
    ACTIVETIME DOUBLE PRECISION -- The epochtime a cluster was activated,
    CORR_TYPE VARCHAR(16) -- Correction type (time, azimuth, slowness),
    CORRECTION REAL -- Correction value,
    UNCERTAINTY REAL -- Model error,
    ONDATE INTEGER -- Julian date that the correction is good from,
    OFFDATE INTEGER -- Julian date that the correction is good to,
    TOTAL_EVENTS SMALLINT -- Total events used to create the MEC
);

CREATE TABLE CLUSTER_ORID (
    CLUSTAID BIGINT -- Cluster Station identifier,
    ORID BIGINT -- Origin identifier,
    ACTIVETIME DOUBLE PRECISION -- The epochtime a cluster was activated,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE CLUSTER_OVERRIDE (
    CLUSTAID BIGINT -- Cluster Station identifier,
    ACTIVETIME DOUBLE PRECISION -- The epochtime a cluster was activated,
    THRESHOLD REAL -- The threshold of the detector,
    SSD_DIMENSION INTEGER -- Specifies how many SVD dimensions to use in the SVDDISC table.,
    SVD_LEAD REAL -- The number of seconds from the start to the first phase of the waveforms used to generate the svds,
    MIN_DETECTION_INTERVAL REAL -- This value is multiplied by the data's sample rate to determine the MEA detection window size.,
    PREFPHASE VARCHAR(16) -- Preferred phase.,
    LEAD REAL -- Number of seconds preceding phase that makes up the reference waveform,
    LAG REAL -- Number of seconds following preferred phase that makes up the reference waveform,
    BEST_EVENT_MATCH_MULTIPLE REAL -- This value is multiplied by a MEA detection window to extend the window to perform correlation to find the best event match.,
    PHASE_ONSET_MULTIPLE REAL -- This value is multiplied by the phase's lead and lag duration to create a window to perform correlation to refine phase onset time.,
    DET_TRACE_TRIM_MULTIPLE REAL -- The value is multiplied by the length of one SVD to define how much to trim from both ends of a detection statistic trace.,
    CHANNEL_MASKING_THRESHOLD REAL -- The proportion of a channel that can be masked before the channel is removed from the threshold calculation,
    PFA REAL -- Probability of false alarm,
    THRESHOLD_PERCENT_OVERLAP INTEGER -- Percent overlap,
    PHASE_SPECIFIC_OVERRIDE_REC VARCHAR(32) -- Name of the phase override recipe to use ('-' value represents no override desired).,
    MAX_DELAZ REAL -- Allowable difference between suspect azimuth and sta-cluster azimuth seconds per kilometer,
    MAX_DELSLOW REAL -- Allowable difference between suspect slowness and ref slowness seconds per kilometer,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE CLUSTER_PHASE_OVERRIDE (
    CLUSTAID BIGINT -- Cluster Station identifier,
    ACTIVETIME DOUBLE PRECISION -- The epochtime a cluster was activated.,
    PHASE_SPECIFIC_OVERRIDE_REC VARCHAR(32) -- Name of the phase override recipe to use ('-' -&gt; &gt;value represents no override desired).,
    PHASE VARCHAR(8) -- Phase type,
    LEAD REAL -- Number of seconds preceding phase that makes up the reference waveform.,
    LAG REAL -- Number of seconds following preferred phase that makes up the reference waveform.,
    FLO REAL -- Low corner frequency for filter.,
    FHI REAL -- High corner frequency for filter.,
    MAXADJ REAL -- The maximum time in seconds that a phase can be adjusted.,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE CLUSTER_STATION (
    CLUSTAID BIGINT -- Cluster Station identifier,
    ACTIVETIME DOUBLE PRECISION -- The epochtime a cluster was activated,
    CLUID BIGINT -- Numeric cluster identifier,
    STA VARCHAR(6) -- Station to which array elements are referenced; used to identify sites to include in cluster,
    MAX_DELAZ REAL -- Allowable difference between suspect azimuth and sta-cluster azimuth seconds per kilometer,
    MAX_DELSLOW REAL -- Allowable difference between suspect slowness and ref slowness seconds per kilometer,
    SSD_DIMENSION INTEGER -- Number of subspace vectors to include for sta/chan processing,
    SVD_LEAD REAL -- The number of seconds from the start to the first phase of the waveforms used to generate the svds,
    SVD_LAG REAL -- The number of seconds from the start to the first phase of the waveforms used to generate the svds,
    PREFPHASE VARCHAR(16) -- Preferred Phase,
    LEAD REAL -- Number of seconds preceding phase that makes up the reference waveform,
    LAG REAL -- Number of seconds following preferred phase that makes up the reference waveform,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date of the data
);

CREATE TABLE CLUSTER_THRESHOLD (
    CLUSTAID BIGINT -- Cluster Station identifier,
    DETECTOR_TYPE VARCHAR(16) -- The dector type to use with this threshold (SSD, CORR, AMP),
    SSD_DIMENSION INTEGER -- SSD Dimension,
    ACTIVETIME DOUBLE PRECISION -- The epochtime a cluster was activated,
    ORID BIGINT -- The orid used to create the threshold if this is a correlation threshold otherwise the value is 0,
    THRESHOLD REAL -- The threshold of the detector,
    PFA REAL -- Probability of false alarm,
    OVERLAP INTEGER -- Percent overlap,
    CHANNEL_MASKING_THRESHOLD REAL -- The proportion of a channel that can be masked before the channel is removed from the threshold calculation,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE CODAMAG_INPUT (
    AMPID BIGINT -- Amplitude identifier,
    FLO REAL -- Low corner freq for filter,
    FHI REAL -- High corner freq for filter,
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(8) -- Channel code,
    ORID BIGINT -- Origin identifier,
    ARID BIGINT -- LR arrival identifier,
    AMPDEF VARCHAR(1) -- d or n flag indicating if station/element is included (d,D) or excluded (n,N) from coda magnitude processing,
    DELTA REAL -- Source-receiver distance,
    BWRATIO REAL -- Pre-filter bandwidth to Nyquist ratio,
    SAMPRATE REAL -- The sample rate of the data corresponding to this record,
    ENVSLOW REAL -- Slowness for envelope stacking,
    HWIDE REAL -- Smoothing half-width for boxcar smoothing,
    POLYID BIGINT -- Polygon identifier for calibrated region,
    TIME DOUBLE PRECISION -- Epoch start time of signal window,
    ENDTIME DOUBLE PRECISION -- Epoch end time of signal window,
    NOISE_START_TIME DOUBLE PRECISION -- Epoch start time of noise window,
    NOISE_END_TIME DOUBLE PRECISION -- Epoch end time of noise window,
    TMEAS DOUBLE PRECISION -- Time of coda amplitude measurement,
    SHAPE_SPREADING REAL -- Coda shape spreading factor,
    SHAPE_DECAY REAL -- Coda shape attenuation decay factor,
    SHAPEDMIN REAL -- Minimum 1-D calibration distance for coda decay and spreading,
    SHAPEDMAX REAL -- Maximum 1-D calibration distance for coda decay and spreading,
    PEAK_VELOCITY REAL -- Synthetic envelope peak velocity,
    VGDMIN REAL -- Minimum 1-D calibration distance for peak velocity,
    VGDMAX REAL -- Maximum 1-D calibration distance for peak velocity,
    PATH_COR_TYPE VARCHAR(8) -- Path correction type (1D or 2D),
    PATH_COR REAL -- Path correction (log10),
    SITE_COR REAL -- Site correction (log10),
    SITEUNIT VARCHAR(9) -- Unit for site correction term,
    WMODEL_NAME VARCHAR(50) -- Yield model name,
    YINTERCEPT REAL -- Yield line fit intercept,
    YSLOPE REAL -- Yield line fit slope,
    FFACTOR REAL -- Yield F factor (log 10),
    SRC_REGION VARCHAR(50) -- Source region name,
    MBINTERCEPT REAL -- mb line fit intercept,
    MBSLOPE REAL -- mb line fit slope,
    MBSIGMA REAL -- mb misfit for weighting,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE CODAMAG_OUTPUT (
    AMPID BIGINT -- Amplitude identifier,
    FLO REAL -- Low corner freq for filter,
    FHI REAL -- High corner freq for filter,
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(8) -- Channel code,
    ORID BIGINT -- Origin identifier,
    ARID BIGINT -- Arrival identifier,
    DELTA REAL -- Source-receiver distance,
    RAW_AMP REAL -- Raw (uncorrected) Coda amplitude,
    UNCERTAINTY REAL -- Uncertainty for Raw (uncorrected) Coda amplitude,
    NOISE_AMP REAL -- Amplitude of noise window,
    AMPCOR REAL -- Amplitude value corrected for path and site,
    AMP_WGT REAL -- Calculated moment amplitude weight factor,
    MB_CODA REAL -- Body coda wave magnitude value,
    YIELD REAL -- Yield,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE CONTINUOUS_DATA_STATUS (
    STATUS_ID BIGINT -- CD Data Status Identifier,
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(8) -- Channel code,
    INDICATOR VARCHAR(64) -- Status of Health Indicator from the CD1.1 Data Frame,
    START_DATE TIMESTAMP -- Initial time the indicator was enabled,
    END_DATE TIMESTAMP -- Last time for which the indicator was enabled,
    AUTHOR VARCHAR(64) -- Author,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE DATAUSER (
    USERID BIGINT -- Identifier for the user,
    POCID BIGINT -- Point of contact identifier,
    USERNAME VARCHAR(24) -- User name from the incoming subscription message,
    DOMAIN VARCHAR(48) -- Domain name from the incoming subscription message,
    MSGTYPE VARCHAR(16) -- Message type,
    USERSTATUS VARCHAR(24) -- Status of this user,
    PRIORITY SMALLINT -- User's priority,
    COMMID BIGINT -- Comment identifier,
    EMAILLIMIT INTEGER -- Maximum size of message (in bytes) that will be delivered via e-mail,
    SERVICETIME DOUBLE PRECISION -- Last time a request from that user was serviced,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_datauser PRIMARY KEY (USERNAME)
);

CREATE TABLE DA_INTERVAL (
    INTVLID BIGINT -- Interval identifier,
    CLASS VARCHAR(16) -- Type of interval,
    NAME VARCHAR(20) -- Name of interval,
    TIME DOUBLE PRECISION -- Starting time of data,
    ENDTIME DOUBLE PRECISION -- Ending time of data,
    STATE VARCHAR(16) -- Current processing state,
    AUTH VARCHAR(15) -- Author of interval,
    PERCENT_AVAILABLE DOUBLE PRECISION -- Percent of data available in interval,
    PROC_START_DATE TIMESTAMP -- Processing start date,
    PROC_END_DATE TIMESTAMP -- Processing stop date,
    MODDATE TIMESTAMP -- Time of last processing state change,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE DA_REFSTA_LATENCY (
    LATENCY_ID BIGINT -- Unique identifier for latency tables.,
    STA VARCHAR(6) -- Station code.,
    INTERVAL_START_TIME TIMESTAMP -- Start time of the interval.,
    INTERVAL_END_TIME TIMESTAMP -- End time of the interval.,
    MIN_LATENCY_SECS DOUBLE PRECISION -- Minimum latency in seconds.,
    MAX_LATENCY_SECS DOUBLE PRECISION -- Maximum latency in seconds.,
    TOTAL_SECS DOUBLE PRECISION -- Total seconds of latency.,
    AUTHOR VARCHAR(64) -- Source/originator,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE DA_REFSTA_SUMMARY (
    SUMMARY_ID BIGINT -- Unique identifier for summary tables.,
    STA VARCHAR(6) -- Station code.,
    INTERVAL_START_TIME TIMESTAMP -- Start time of the interval.,
    INTERVAL_END_TIME TIMESTAMP -- End time of the interval.,
    PERCENT DOUBLE PRECISION -- Percentage of data available in wfdiscs.,
    AUTHOR VARCHAR(64) -- Source/originator,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE DA_SITECHAN_LATENCY (
    LATENCY_ID BIGINT -- Unique identifier for latency tables.,
    STA VARCHAR(6) -- Station code.,
    CHAN VARCHAR(8) -- Channel code.,
    INTERVAL_START_TIME TIMESTAMP -- Start time of the interval.,
    INTERVAL_END_TIME TIMESTAMP -- End time of the interval.,
    MIN_LATENCY_SECS DOUBLE PRECISION -- Minimum latency in seconds.,
    MAX_LATENCY_SECS DOUBLE PRECISION -- Maximum latency in seconds.,
    TOTAL_SECS DOUBLE PRECISION -- Total seconds of latency.,
    AUTHOR VARCHAR(64) -- Source/originator,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE DECONVOLUTION (
    DECONID BIGINT -- Deconvolution identifier,
    TYPE VARCHAR(16) -- Decon type may be 'measured' or 'theoretical',
    LOWCUTFRAC REAL -- Low cut for cosine filter given as a fraction of lowcutfrac,
    LOWPASSFREQ REAL -- Low cut for cosine filter given as a fraction of lowpassfreq,
    HIGHCUTFRAC REAL -- High cut given as a fraction of Nyquist obtained from nominal sample rate,
    HIGHPASSFREQ REAL -- High cut given as a fraction of Nyquist obtained from nominal sample rate,
    WATERLEVEL REAL -- Limit for division (0.0 means do not apply waterlevel),
    FINALUNITS VARCHAR(1) -- Final units for the data once the instrument response has been removed (d, v, or a),
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE DEFINING_OBSTYPES (
    OBSTYPE_ID BIGINT -- Observation Type identifier,
    CLASS VARCHAR(16) -- Defining Observation grouping or class,
    TYPE VARCHAR(10) -- Defining Observation type,
    DESCRIPTION VARCHAR(4000) -- Description of defining value,
    AUTHOR VARCHAR(64) -- &nbsp;,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE DEFINING_RULES (
    RULE_ID BIGINT -- Defining Rule Identifier,
    NET VARCHAR(8) -- Unique network identifier,
    REFSTA VARCHAR(6) -- Reference station for station members,
    SITE VARCHAR(6) -- Individual site/station element,
    PHASE VARCHAR(8) -- Phase restriction for the Defining Rule,
    OBSTYPE_ID BIGINT -- Observation Type identifier,
    VALUE_ID BIGINT -- Defining Value Identifier,
    ON_DATE TIMESTAMP -- Date the defining rule becomes enabled,
    OFF_DATE TIMESTAMP -- Date the defining rule becomes disabled,
    AUTHOR VARCHAR(64) -- &nbsp;,
    PRIORITY INTEGER -- Rule priority,
    COMMENTS VARCHAR(4000) -- Comment text,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE DEFINING_VALUES (
    VALUE_ID BIGINT -- Defining Value Identifier,
    VALUE VARCHAR(1) -- Defining value code,
    DESCRIPTION VARCHAR(4000) -- Description of defining value,
    AUTHOR VARCHAR(64) -- &nbsp;,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE DETECTION (
    ARID BIGINT -- Arrival identifier,
    JDATE INTEGER -- Julian date,
    TIME DOUBLE PRECISION -- Epoch time,
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(8) -- Channel code,
    BMTYP VARCHAR(4) -- Beam type,
    SPROID BIGINT -- Signal processor identifier,
    CFREQ REAL -- Center frequency,
    SEAZ REAL -- Observed azimuth,
    DELAZ REAL -- Azimuth uncertainty,
    SLOW REAL -- Observed slowness, seconds per kilometer (sec/km),
    DELSLO REAL -- Slowness uncertainty,
    SNR REAL -- Signal-to-noise ratio,
    STAV REAL -- Short-term average,
    FSTAT REAL -- f-statistic,
    DELTIM REAL -- Time uncertainty,
    BANDW REAL -- Bandwidth,
    FKQUAL SMALLINT -- f-k quality,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE DETECTION_THRESHOLD (
    CLUSTAID BIGINT -- Cluster Station identifier,
    ORID BIGINT -- Origin identifier,
    DETECTOR_TYPE VARCHAR(16) -- Type of detector (SSD, NARGAR, etc.),
    TIME DOUBLE PRECISION -- Epoch start time of threshold,
    ENDTIME DOUBLE PRECISION -- Epoch end time of threshold,
    THRESHOLD REAL -- Threshold values,
    NUM_DETECTIONS INTEGER -- Number of detections,
    STA VARCHAR(6) -- Station,
    PFA REAL -- Probability of False Alarm,
    OVERLAP INTEGER -- Overlap,
    CHANNEL_MASKING_THRESHOLD REAL -- Channel Masking threshold,
    SSD_DIMENSION INTEGER -- Subspace Dimension,
    DOF REAL -- Degrees of freedom,
    DATA_MASKED INTEGER -- Number of samples masked,
    TOTAL_DATA INTEGER -- Total number of samples,
    DESCRIPT VARCHAR(100) -- Description,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE DISCRIMUSE (
    ORID BIGINT -- Origin identifier,
    DISCRIMTYPE VARCHAR(10) -- Discriminant type,
    STA VARCHAR(6) -- Station,
    DISCRIM_FLAG VARCHAR(1) -- Discriminant is used in event classification for the origin and station (T,F),
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE DISCRIMVOTE (
    ORID BIGINT -- Origin identifier,
    DISCRIMTYPE VARCHAR(10) -- Discriminant type,
    STA VARCHAR(6) -- Station,
    VOTE VARCHAR(1) -- Overall vote for the discriminant factor,
    COMMID BIGINT -- Comment identifier,
    OVERRIDE INTEGER -- Evaluator override vote,
    EVAL_COMMENT VARCHAR(22) -- Evaluator comments on override,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE DISCRIM_PARAM (
    POLYID BIGINT -- Polygon Identifier,
    AMPCOR_VERID BIGINT -- amplitude correction version identifier,
    STA VARCHAR(6) -- Station name,
    CHAN VARCHAR(8) -- Channel where waveform was recorded,
    PARAMSETID BIGINT -- id of parameter set,
    LOWCUTFRAC REAL -- low frequency cut for instrument correction in Hertz,
    MINLOWPASSFREQ REAL -- low frequency pass for instrument correction in Hertz,
    HIGHPASSFRAC REAL -- high frequency pass for instrument correction in Hertz,
    HIGHCUTFRAC REAL -- high frequency cut for instrument correction in Hertz,
    PNGV1 REAL -- beginning group velocity in km/s for Pn phase,
    PNGV2 REAL -- ending group velocity in km/s for Pn phase,
    PNINT DOUBLE PRECISION -- intercept time in seconds for Pg phase,
    PGGV1 REAL -- beginning group velocity in km/s for Pg phase,
    PGGV2 REAL -- ending group velocity in km/s for Pg phase,
    PGINT DOUBLE PRECISION -- intercept time in seconds for Pg phase,
    SNGV1 REAL -- beginning group velocity in km/s for Sn phase,
    SNGV2 REAL -- ending group velocity in km/s for Sn phase,
    SNINT DOUBLE PRECISION -- intercept time in seconds for Sn phase,
    LGGV1 REAL -- beginning group velocity in km/s for Lg phase,
    LGGV2 REAL -- ending group velocity in km/s for Lg phase,
    LGINT DOUBLE PRECISION -- intercept time in seconds for Lg phase,
    TFACTOR REAL -- minimum number of cycles in the window needed to calculate an amplitude,
    TAPERWIDTH REAL -- fraction of waveform to taper at each end,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE DLMAN (
    DLID BIGINT -- Diskloop manager identifier,
    MACHINE VARCHAR(32) -- Machine name,
    RUNNING VARCHAR(1) -- Dlman running = y/n,
    CONNMANPORT INTEGER -- Connman port,
    CONTROLPORT INTEGER -- Datacontrol port,
    ARCHIVEPORT INTEGER -- Archiver port,
    FORWARDPORT INTEGER -- Forwarder port,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE DOPPLER_DETECTION (
    DOPPLERID BIGINT -- Doppler identifier,
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(8) -- Channel code,
    EVENT_TIME DOUBLE PRECISION -- Epoch time,
    DURATION REAL -- Duration of doppler shift window,
    SNR REAL -- Signal-to-noise ratio,
    AZIMUTH REAL -- Observed azimuth,
    ETYPE VARCHAR(7) -- Event type,
    CFREQ REAL -- Center frequency,
    RANGE_MINFREQ REAL -- Detection range minimum frequency.,
    RANGE_MAXFREQ REAL -- Detection range maximum frequency.,
    TRACE_MINFREQ REAL -- Detection trace minimum frequency.,
    TRACE_MAXFREQ REAL -- Detection trace maximum frequency.,
    USE_AS_REFERENCE_EVENT VARCHAR(1) -- When set to &quot;y&quot;, use this event as a reference event for internal AFTAC station tuning process.,
    FILTER_STRING VARCHAR(2000) -- Compact filter representation.,
    CONF REAL -- Confidence,
    COMMENTS VARCHAR(4000) -- Comment text,
    INTERNAL_COMMENTS VARCHAR(4000) -- Comment made by an analyst to leave feedback/questions/observations and tie it to the event without it affecting the Doppler report.,
    ANALYST VARCHAR(32) -- The analyst that created the event report,
    TIMESENT DOUBLE PRECISION -- Time at which the event report was released,
    AUTHOR VARCHAR(64) -- Author,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Time at which the detector generated the event
);

CREATE TABLE ECM_CHAN_AMPLITUDE (
    ORID BIGINT -- Origin identifier,
    STA VARCHAR(6) -- Station name,
    CHAN VARCHAR(8) -- Channel name,
    PHASE VARCHAR(8) -- phase of interest,
    LFREQ DOUBLE PRECISION -- low end of frequency bin used to filter measurement,
    HFREQ DOUBLE PRECISION -- high end of frequency bin used to filter measurement,
    AMPCOR_VERID BIGINT -- AmpCor version Identifier used in ECM Versioning,
    TIME DOUBLE PRECISION -- time of reference event,
    ENDTIME DOUBLE PRECISION -- end time of measurement window,
    AMPRAW DOUBLE PRECISION -- actual amplitude measured,
    AMPMDAC DOUBLE PRECISION -- Magnitude and Distance Amplitude Correction,
    AMPDAC DOUBLE PRECISION -- Distance amplitude correction,
    AMPMAC DOUBLE PRECISION -- Magnitude amplitude correction,
    NTIME DOUBLE PRECISION -- start time of the noise window,
    NENDTIME DOUBLE PRECISION -- end time of the noise window,
    SNR DOUBLE PRECISION -- Signal-to-noise ratio,
    AMPDEF VARCHAR(1) -- Defining flag for element amplitude measurement to be used for station/network average,
    AUTH VARCHAR(15) -- Author,
    COMMENTS VARCHAR(4000) -- comment text,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ECM_CONSTANT (
    NAME VARCHAR(30) -- Name of constant of interest,
    VALUE DOUBLE PRECISION -- Value of this constant,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ECM_COV (
    POLYID BIGINT -- Polygon Identifier,
    COV_VERID BIGINT -- version identifier of the covariance matrix,
    SOURCE_TYPE VARCHAR(15) -- source type of interest,
    DISCRIM_NAME_1 VARCHAR(10) -- first discriminant of interest,
    DISCRIM_NAME_2 VARCHAR(10) -- second discriminant of interest,
    COVARIANCE DOUBLE PRECISION -- covariance of these two discriminants for this source type within this region of interest,
    MEAN_1 DOUBLE PRECISION -- mean value of the first discriminant,
    AUTH VARCHAR(15) -- Author,
    COMMENTS VARCHAR(4000) -- comment text,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ECM_DISCRIMINANTS (
    ORID BIGINT -- id of the origin,
    DISCRIM_NAME VARCHAR(15) -- discriminant of interest,
    COV_VERID BIGINT -- version identifier of the covariance matrix,
    DISCRIM_P_VALUE DOUBLE PRECISION -- p-value of this discriminant for this reference event,
    DISCRIM_DEF VARCHAR(1) -- defining flag for this discriminant,
    EXPLANATION VARCHAR(4000) -- text explanation of how this discriminant was calculated,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ECM_EVENT_RESULTS (
    ORID BIGINT -- id of the origin,
    EVID BIGINT -- id of the event of interest,
    COV_VERID BIGINT -- version identifier of the covariance matrix,
    RDA_VERID BIGINT -- version identifier of the RDA,
    CLASS_TYPE VARCHAR(15) -- source type as determined by ECM,
    CLASS_TYPE_OVRD VARCHAR(15) -- source type as overridden by an analyst,
    COMMENTS VARCHAR(4000) -- comment text,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ECM_REF_CHAN_AMPLITUDE (
    EVID BIGINT -- Event identifier,
    STA VARCHAR(6) -- Station name,
    CHAN VARCHAR(8) -- Channel name,
    PHASE VARCHAR(8) -- phase of interest,
    LFREQ DOUBLE PRECISION -- low end of frequency bin used to filter measurement,
    HFREQ DOUBLE PRECISION -- high end of frequency bin used to filter measurement,
    AMPCOR_VERID BIGINT -- AmpCor version Identifier used in ECM Versioning,
    POLYID BIGINT -- Polygon Identifier,
    DELTA REAL -- Source-receiver distance,
    TIME DOUBLE PRECISION -- time of reference event,
    ENDTIME DOUBLE PRECISION -- end time of measurement window,
    AMPRAW DOUBLE PRECISION -- actual amplitude measured,
    AMPMDAC DOUBLE PRECISION -- Magnitude and Distance Amplitude Correction,
    AMPDAC DOUBLE PRECISION -- Distance amplitude correction,
    AMPMAC DOUBLE PRECISION -- Magnitude amplitude correction,
    NTIME DOUBLE PRECISION -- start time of the noise window,
    NENDTIME DOUBLE PRECISION -- end time of the noise window,
    SNR DOUBLE PRECISION -- Signal-to-noise ratio,
    AMPDEF VARCHAR(1) -- Defining flag for element amplitude measurement to be used for station/network average,
    AUTH VARCHAR(15) -- Author,
    COMMENTS VARCHAR(4000) -- comment text,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ECM_REF_DISCRIM (
    EVID BIGINT -- Event Identifier,
    COV_VERID BIGINT -- version identifier of the covariance matrix,
    DISCRIM_NAME VARCHAR(15) -- discriminant of interest,
    DISCRIM_P_VALUE DOUBLE PRECISION -- p-value of this discriminant for this reference event,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ECM_REF_EVENT (
    EVID BIGINT -- Event Identifier,
    TIME DOUBLE PRECISION -- time of reference event,
    LAT DOUBLE PRECISION -- Latitude,
    LON DOUBLE PRECISION -- Longitude,
    DEPTH REAL -- depth of reference event,
    MB REAL -- body wave magnitude of reference event,
    MS REAL -- surface wave magnitude of reference event,
    MW REAL -- moment magnitude of reference event,
    SOURCE_TYPE VARCHAR(7) -- source type of interest,
    SUB_TYPE VARCHAR(10) -- source sub-type of reference event,
    POLYID BIGINT -- Polygon Identifier,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ECM_REGION_PREF_VERSION (
    POLYID BIGINT -- Polygon Identifier,
    COV_VERID BIGINT -- version identifier of the covariance matrix,
    RDA_VERID BIGINT -- version identifier of the RDA,
    AUTH VARCHAR(15) -- Author,
    COMMENTS VARCHAR(4000) -- comment text,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ECM_SOURCES (
    ORID BIGINT -- id of the origin,
    SOURCE_TYPE VARCHAR(15) -- source type of interest,
    COV_VERID BIGINT -- version identifier of the covariance matrix,
    RDA_VERID BIGINT -- rda version identifier,
    POP_MEM DOUBLE PRECISION -- p-value for this source type,
    CON_PROB DOUBLE PRECISION -- posteriori probability,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ECM_STA_PREF_VERSION (
    POLYID BIGINT -- Polygon Identifier,
    STA VARCHAR(6) -- Station Code,
    AMPCOR_VERID BIGINT -- amplitude correction version identifier,
    AUTH VARCHAR(15) -- Author,
    COMMENTS VARCHAR(4000) -- comment text,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ENVELOPE_CONTRIBUTION (
    FLO REAL -- Low corner freq for filter,
    FHI REAL -- High corner freq for filter,
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(8) -- Channel code,
    ORID BIGINT -- Origin identifier,
    ARID BIGINT -- Arrival identifier,
    AMPDEF VARCHAR(1) -- d or n flag indicating if station/element is included (d,D) or excluded (n,N) from coda magnitude processing,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE EVENT (
    EVID BIGINT -- Event identifier,
    EVNAME VARCHAR(32) -- Event name,
    PREFOR BIGINT -- Preferred origin,
    AUTH VARCHAR(15) -- Source/originator,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_event PRIMARY KEY (EVID)
);

CREATE TABLE EVENT_CONTROL (
    ORID BIGINT -- Origin identification,
    EVID BIGINT -- Event identification,
    PREFER_LOC VARCHAR(1) -- Preferred location identifier (S, F, R),
    CONSTRAIN_OT SMALLINT -- Flag to constrain origin time,
    CONSTRAIN_LATLON SMALLINT -- Flag to constrain latitude/longitude,
    CONSTRAIN_DEPTH SMALLINT -- Flag to constrain depth,
    SRC_DPNT_CORR SMALLINT -- Source-dependent correction code,
    LOC_SRC_DPNT_REG VARCHAR(15) -- Region name of source-dependent location correction,
    LOC_SDV_SCREEN SMALLINT -- Flag to ignore large data residuals in location,
    LOC_SDV_MULT REAL -- Location large residual multiplier factor,
    LOC_ALPHA_ONLY SMALLINT -- Flag to use only primary stations in location,
    LOC_ALL_STAS SMALLINT -- Flag to use only stations with src_dpnt_corr,
    LOC_DIST_VARWGT SMALLINT -- Flag to use distance variance weighting,
    LOC_USER_VARWGT REAL -- User-defined variance weighting,
    MAG_SRC_DPNT_REG VARCHAR(15) -- Region name of source-dependent magnitude correction,
    MAG_SDV_SCREEN SMALLINT -- Flag to ignore large magnitude data residuals,
    MAG_SDV_MULT REAL -- Magnitude large residual multiplier factor,
    MAG_ALPHA_ONLY SMALLINT -- Flag to limit station net used in magnitude,
    MAG_ALL_STAS SMALLINT -- Flag to use only primary stations in magnitude,
    MB_MIN_DIST REAL -- Minimum distance (degrees) for mb,
    MB_MAX_DIST REAL -- Maximum distance (degrees) for mb,
    MMODEL VARCHAR(15) -- Network magnitude model,
    COV_SM_AXES REAL -- Coverage ellipse semi-axes conversion factor,
    COV_DEPTH_TIME REAL -- Coverage ellipse depth/time conversion factor,
    OBS_CORR_METHOD SMALLINT -- Observed Correlation Method,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_event_control PRIMARY KEY (EVID)
);

CREATE TABLE EVENT_CORRELATION (
    CORR_ID BIGINT -- Correlation Identifier,
    SOURCE_ORID BIGINT -- The source origin used in the event correlation.,
    SOURCE_EVID BIGINT -- The source event used in the event correlation.,
    SOURCE_STARTTIME DOUBLE PRECISION -- The start time of the source waveform segment used for correlation.,
    SOURCE_SECS DOUBLE PRECISION -- The length of the source waveform in seconds used for correlation.,
    REFERENCE_ORID BIGINT -- The reference origin for this correlation from the archive database.,
    REFERENCE_EVID BIGINT -- The reference event for this correlation from the archive database.,
    REFERENCE_STARTTIME DOUBLE PRECISION -- The start time of the reference waveform segment used for correlation.,
    REFERENCE_SECS DOUBLE PRECISION -- The length of the reference waveform in seconds used for correlation.,
    STA VARCHAR(6) -- Station identifier,
    FILTER_STRING VARCHAR(2000) -- Compact filter representation used as parameter to filter_data_by_string module.,
    NUM_CHAN INTEGER -- Number of channels in CHAN_LIST,
    CHAN_LIST VARCHAR(2000) -- List of channels used for array correlation,
    CORR_COEF DOUBLE PRECISION -- Correlation coefficient used in this correlation calculation.,
    CORR_TIME DOUBLE PRECISION -- Correlation time of event.,
    SCAN_TYPE VARCHAR(32) -- Correlation Scan type: AUTO, USER, or REF.,
    AUTHOR VARCHAR(64) -- Author of this correlation.,
    MODDATE TIMESTAMP -- Modification Date.,
    LDDATE TIMESTAMP -- Load Date.
);

CREATE TABLE EVENT_QUALITY (
    EQID BIGINT -- Event quality identifier,
    ORID BIGINT -- Origin identifier,
    EVQUAL REAL -- Event quality,
    NETPROB REAL -- Network probability,
    DETPROB REAL -- Detection probability,
    HISTPROB REAL -- Historic probability,
    NNDEF REAL -- Normalized number of defining phases,
    NSMAJAX REAL -- Normalized semi-major axis of error ellipse,
    NDELTA_STA REAL -- Normalized distance to the closest station,
    NTIMERES REAL -- Normalized time residual,
    NAZRES REAL -- Normalized azimuth residual,
    NSLORES REAL -- Normalized slowness residual,
    NAMPRES REAL -- Normalized amplitude residual,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FEEDBACK (
    FEEDBACK_ID BIGINT -- Feedback Identifier,
    EVID BIGINT -- Event Identifier,
    ORID BIGINT -- Origin Identifier,
    EVENT_TIME DOUBLE PRECISION -- Epoch time that the event occurred.,
    TITLE VARCHAR(64) -- Feedback title,
    ANALYST VARCHAR(32) -- The targeted analyst the feedback pertains to.,
    ACCOUNT VARCHAR(15) -- Pipeline account that the analyst is receiving feedback for.,
    FEEDBACK_ANALYST VARCHAR(32) -- The original analyst of the event being reviewed.,
    FEEDBACK_ACCOUNT VARCHAR(15) -- Pipeline account from which the analyst is receiving feedback.,
    RESPONSE VARCHAR(4000) -- This is the response by the analyst to the given feedback. If the feedback is rejected, this is where the reason for rejection should be documented. Rejection is used to allow accurate trending of fe edback,
    AUTHOR VARCHAR(64) -- The analyst creating the feedback,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FEEDBACK_CATAFFILIATION (
    FBAFFILIATION_ID BIGINT -- Feedback Affiliation Identifier.,
    FEEDBACK_ID BIGINT -- Feedback Identifier,
    FBCATEGORY_ID BIGINT -- Feedback Category Identifier,
    AUTHOR VARCHAR(64) -- The analyst creating the feedback.,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FEEDBACK_CATEGORIES (
    FBCATEGORY_ID BIGINT -- Feedback Category Identifier,
    TITLE VARCHAR(64) -- Short description/title of the feedback category,
    DESCRIPTION VARCHAR(4000) -- Detailed description of the feedback category,
    AUTHOR VARCHAR(64) -- The analyst creating the feedback.,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FEEDBACK_SCREENSHOTS (
    FBSCREENSHOT_ID BIGINT -- Feedback Screenshot Identifier,
    FEEDBACK_ID BIGINT -- Feedback Identifier,
    TITLE VARCHAR(64) -- Short description/title of the screenshot,
    DESCRIPTION VARCHAR(4000) -- Detailed description of the screenshot,
    TYPE VARCHAR(10) -- Screenshot image file type (Initial allowable types (jpg, jpeg, png)),
    AUTHOR VARCHAR(64) -- The analyst creating the feedback.,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FEEDBACK_STATE (
    FBSTATE_ID BIGINT -- Feedback State Identifier,
    FEEDBACK_ID BIGINT -- Feedback Identifier,
    FBSTATECATEGORY_ID BIGINT -- Feedback State Category Identifier,
    AUTHOR VARCHAR(64) -- The analyst creating the feedback.,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FEEDBACK_STATE_CATEGORIES (
    FBSTATECATEGORY_ID BIGINT -- Feedback State Category Identifier,
    TITLE VARCHAR(64) -- Short description/title of the feedback state category,
    DESCRIPTION VARCHAR(4000) -- Detailed description of the feedback state category,
    AUTHOR VARCHAR(64) -- The analyst creating the feedback state category.,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FILTER (
    FILTERID BIGINT -- Identifier for a filter or filter collection.,
    FILTER_METHOD VARCHAR(2) -- Filter algorithm family. [Cascade, AR, Butterworth, Phase_Matched, Digital, Dynamic, etc.],
    FILTER_STRING VARCHAR(2000) -- Compact filter representation used as parameter to filter_data_by_string module.,
    FILTER_HASH VARCHAR(2000) -- Standardized filter specification, formatted for uniqueness checking and fast access.,
    LDDATE TIMESTAMP -- Load Date.,
    CONSTRAINT pk_filter PRIMARY KEY (FILTERID)
);

CREATE TABLE FILTER_COEFFICIENTS (
    FILTERID BIGINT -- Filter identifier,
    VALUE_NAME VARCHAR(48) -- Attribute name (e.g. numerator_coeff),
    COL_SEQ INTEGER -- collection sequence/order,
    D_VALUE DOUBLE PRECISION -- Double precision coefficient value,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FILTER_GROUP (
    PARENT_FILTERID BIGINT -- Identifier for a collection or group of filters.,
    CHILD_FILTERID BIGINT -- Identifier for a simple / single filter.,
    CHILD_SEQUENCE INTEGER -- Order that the child filter should be applied.,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE FILTER_VALUES_DOUBLE (
    FILTERID BIGINT -- Filter identifier,
    VALUE_NAME VARCHAR(48) -- Attribute name, (e.g. fhi, flo),
    D_VALUE DOUBLE PRECISION -- Double precision value,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FILTER_VALUES_INTEGER (
    FILTERID BIGINT -- Filter identifier,
    VALUE_NAME VARCHAR(48) -- Attribute name, (e.g. fhi, flo),
    I_VALUE BIGINT -- Integer value.,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FILTER_VALUES_STRING (
    FILTERID BIGINT -- Filter identifier,
    VALUE_NAME VARCHAR(48) -- Attribute name, (e.g. fhi, flo),
    S_VALUE VARCHAR(1024) -- String value,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FK_PROCESSING (
    ARID BIGINT -- Arrival identifier,
    PROCID BIGINT -- ID number of a set of waveform processing parameters,
    LEAD REAL -- Number of seconds before phase to include in processing,
    LAG REAL -- Number of seconds after phase to include in processing,
    FKFHI REAL -- FK fhi value,
    FKFLO REAL -- FK flo value,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FTPFAILED (
    MSGID BIGINT -- Message identifier,
    FTP_ADDRESS VARCHAR(64) -- ftp address for auxilary data,
    NUMFAILEDATTEMPT SMALLINT -- Number of failed attempts,
    LASTFAILEDTIME DOUBLE PRECISION -- Time of most recent attempt,
    FTPSTATUS VARCHAR(8) -- Status of ftp attempt (retry or failed),
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE FTPLOGIN (
    FTP_ADDRESS VARCHAR(64) -- ftp address for auxiliary data,
    USERNAME VARCHAR(24) -- User name for ftp access,
    PASSWORD VARCHAR(16) -- User password for ftp access,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE GA_TAG (
    OBJTYPE VARCHAR(1) -- Type of identifier (a for arrival, o for origin),
    ID BIGINT -- Identification number (arid or orid),
    PROCESS_STATE VARCHAR(20) -- Use of arid or orid,
    LAT REAL -- Latitude of origin,
    LON REAL -- Longitude of origin,
    TIME DOUBLE PRECISION -- Time of origin,
    EVID_REJECT BIGINT -- Evid of origin arrival was rejected from,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE GREGION (
    GRN INTEGER -- Geographic region number,
    GRNAME VARCHAR(40) -- Geographic region name,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE HISTORIC_INFO_CYLINDER (
    HISTORIC_INFO_CYLINDER_ID BIGINT -- Historic information cylinder identifier,
    LAT DOUBLE PRECISION -- Estimated latitude of cylinder,
    LON DOUBLE PRECISION -- Estimated longitude of cylinder,
    RADIUS REAL -- Radius of cylinder,
    DEPTH REAL -- Estimated depth of the cylinder,
    LOWER_DEPTH REAL -- Lower depth of cylinder,
    UPPER_DEPTH REAL -- Upper depth of cylinder,
    AUTHOR VARCHAR(64) -- Author,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE HISTORIC_INFO_SHELL (
    HISTORIC_INFO_SHELL_ID BIGINT -- Historic information shell identifier,
    ALGORITHM_ID BIGINT -- Algorithm identifier,
    LAT DOUBLE PRECISION -- Estimated latitude of the shell,
    LON DOUBLE PRECISION -- Estimated longitude of the shell,
    INNER_RADIUS REAL -- Radius of inner shell,
    OUTER_RADIUS REAL -- Radius of outer shell,
    DEPTH REAL -- Estimated depth,
    LOWER_DEPTH REAL -- Lower depth of shell,
    UPPER_DEPTH REAL -- Upper depth of shell,
    MIN_AZIMUTH REAL -- Minimum observed azimuth,
    MAX_AZIMUTH REAL -- Maximum observed azimuth,
    REFSTA VARCHAR(6) -- Reference station,
    PHASE VARCHAR(8) -- Phase,
    THRESHOLD REAL -- Magnitude detection threshold,
    UNCERTAINTY REAL -- Uncertainty estimate of magnitude threshold,
    RELIABILITY REAL -- Estimate based on percent of events observed,
    NUM_OBSERVATIONS INTEGER -- Number of observations,
    PROCESSING_MODE SMALLINT -- Defines the type of processing used to determine the shell,
    ON_DATE TIMESTAMP -- The date the historic information shell first became active or was created,
    OFF_DATE TIMESTAMP -- The date the historic information shell was removed from the system or made obsolete,
    AUTHOR VARCHAR(64) -- Author,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE HISTORIC_INFO_STA_PHASE (
    HISTORIC_INFO_STA_PHASE_ID BIGINT -- Historic information for stations and phases identifier,
    HISTORIC_INFO_CYLINDER_ID BIGINT -- Historic information cylinder identifier,
    ALGORITHM_ID BIGINT -- Algorithm identifier,
    REFSTA VARCHAR(6) -- Reference station,
    PHASE VARCHAR(8) -- Phase,
    THRESHOLD REAL -- Magnitude detection threshold,
    UNCERTAINTY REAL -- Uncertainty estimate of magnitude threshold,
    RELIABILITY REAL -- Estimate based on percent of events observed,
    NUM_OBSERVATIONS INTEGER -- Number of observations,
    PROCESSING_MODE SMALLINT -- Defines the type of processing used for the station/phase pair,
    ON_DATE TIMESTAMP -- The date the historic information station and phase first became active or was created,
    OFF_DATE TIMESTAMP -- The date the historic information station and phase was removed from the sysem or made obsolete,
    AUTHOR VARCHAR(64) -- Author,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE HYDRO_ARRIVAL (
    ARID BIGINT -- Arrival identifier,
    STA VARCHAR(6) -- Station,
    DURONSET DOUBLE PRECISION -- Duration onset time,
    DUREND DOUBLE PRECISION -- Duration end time,
    ONSET_TIME DOUBLE PRECISION -- Estimated onset time of signal,
    TERMINATION_TIME DOUBLE PRECISION -- Estimated termination time of signal,
    CPLAG REAL -- Crossing point lag of the signal,
    BPFRQAC REAL -- Autocorrelation bubble pulse,
    RT REAL -- Autocovariance peak value,
    BPFRQCEP REAL -- Cepstrum bubble pulse,
    RMS REAL -- The rms amplitude from autocorrelation,
    FLT_RTO REAL -- Filter ratio,
    NORMAMP REAL -- Normalized amplitude,
    AMPCORCLIP REAL -- Correction to raw amplitude for clipping,
    AMPCORDIST REAL -- Correction to raw amplitude for distance,
    AMPCORDEPTH REAL -- Correction to raw amp for depth,
    YIELD REAL -- Sensor yield,
    YLDERR REAL -- Sensor yield error,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE HYDRO_ARR_GROUP (
    HYDRO_ID BIGINT -- Hydro-arrival-group identifier,
    AZ1 REAL -- Azimuth estimated from lag times,
    AZ2 REAL -- Second possible azimuth (2 arrivals),
    SLOW REAL -- Slowness (s/km),
    DELAZ REAL -- Azimuth uncertainty,
    NHYDARR SMALLINT -- Number of arrivals in hydro-arrival-group,
    NET VARCHAR(8) -- Hydro network name,
    HYD_GRP_PHASE VARCHAR(8) -- Hydro-arrival-group phase,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE HYDRO_ASSOC (
    ARID BIGINT -- Arrival identifier,
    HYDRO_ID BIGINT -- Hydro-arrival-group identifier,
    AZCONTRIB VARCHAR(1) -- Azimuth contribution flag (y or n),
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE HYDRO_ORIGIN (
    ORID BIGINT -- Origin identifier,
    HYDROLOC_CODE INTEGER -- Hydroacoustic origin location,
    HYDROYIELD REAL -- Hydroacoustic event yield,
    HYDROYLDERR REAL -- Hydroacoustic event yield error,
    NUM_IN_SERIES INTEGER -- Number of event in series,
    SERID BIGINT -- Series identifier,
    HYD_CLASS_CODE INTEGER -- Hydroacoustic event classification,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE INSTRUMENT (
    INID BIGINT -- Instrument identifier,
    INSNAME VARCHAR(50) -- Instrument name,
    INSTYPE VARCHAR(6) -- Instrument type,
    BAND VARCHAR(1) -- Frequency band,
    DIGITAL VARCHAR(1) -- Data type, digital (d), or analog (a),
    SAMPRATE REAL -- Sampling rate in samples/second,
    NCALIB REAL -- Nominal calibration (nanometers/digital count),
    NCALPER REAL -- Nominal calibration period (seconds),
    DIR VARCHAR(64) -- Directory,
    DFILE VARCHAR(32) -- Data file,
    RSPTYPE VARCHAR(6) -- Response type,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_instrument PRIMARY KEY (INID)
);

CREATE TABLE INTERVAL (
    INTVLID BIGINT -- Interval identifier,
    CLASS VARCHAR(16) -- Type of interval,
    NAME VARCHAR(20) -- Name of interval,
    TIME DOUBLE PRECISION -- Starting time of data,
    ENDTIME DOUBLE PRECISION -- Ending time of data,
    STATE VARCHAR(16) -- Current processing state,
    AUTH VARCHAR(15) -- Author of interval,
    PERCENT_AVAILABLE DOUBLE PRECISION -- Percent of data available in interval,
    PROC_START_DATE TIMESTAMP -- Processing start date,
    PROC_END_DATE TIMESTAMP -- Processing stop date,
    MODDATE TIMESTAMP -- Time of last processing state change,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE MDAC_FD (
    FDID BIGINT -- Frequency dependent correction identifier,
    AMPCOR_VERID BIGINT -- amplitude correction version identifier,
    CORRID BIGINT -- Correction identifier,
    LFREQ REAL -- Low frequency of amplitude measurement,
    STA VARCHAR(6) -- Station name,
    CHAN VARCHAR(8) -- Channel name,
    TOMOID BIGINT -- Tomographic identifier,
    POLYID BIGINT -- Polygon Identifier,
    A DOUBLE PRECISION -- First surface fit coefficient,
    B DOUBLE PRECISION -- Second surface fit coefficient,
    C DOUBLE PRECISION -- Third surface fit coefficient,
    SITEFACT DOUBLE PRECISION -- Site effect factor,
    ALGOID BIGINT -- Algorithm identifier,
    AUTH VARCHAR(15) -- Author, source of data,
    LDDATE TIMESTAMP -- Load date (format YY//MM/DD HH24:MI:SS)
);

CREATE TABLE MDAC_FI (
    CORRID BIGINT -- Correction identifier,
    AMPCOR_VERID BIGINT -- amplitude correction version identifier,
    POLYID BIGINT -- Polygon identifier,
    STA VARCHAR(6) -- Station name,
    PHASE VARCHAR(8) -- Phase of interest,
    CHAN VARCHAR(8) -- Channel name,
    CORRNAME VARCHAR(32) -- Name of correction parameter set,
    SIGMA DOUBLE PRECISION -- Stress-drop in pascals,
    DELSIGMA DOUBLE PRECISION -- Stress-drop in pascals uncertainty,
    PSI REAL -- Exponent controlling moment-corner frequency scaling,
    DELPSI REAL -- Uncertainty of psi,
    Q0 DOUBLE PRECISION -- Attenuation at 1 Hz,
    DELQ0 DOUBLE PRECISION -- Uncertainty of q0,
    GAMMA REAL -- Frequency exponent of attenuation,
    DELGAMMA REAL -- Frequency exponent of attenuation uncertainty,
    ZETA REAL -- Ratio of P and S wave corner frequencies,
    M0_REF DOUBLE PRECISION -- Reference seismic moment used with psi in Nm,
    U0 REAL -- Velocity of phase in m/s,
    ETA REAL -- Geometric spreading exponent,
    DELETA REAL -- Geometric spreading exponent uncertainty,
    DISTCRIT DOUBLE PRECISION -- Critical distance for geometric spreading function in meters,
    ALPHAS REAL -- P velocity at the source in m/s,
    BETAS REAL -- S velocity at the source in m/s,
    RHOS DOUBLE PRECISION -- Density at the source in kg/m3,
    ALPHAR REAL -- P velocity at the receiver in m/s,
    BETAR REAL -- S velocity at the receiver in m/s,
    RHOR DOUBLE PRECISION -- Density at the receiver in kg/m3,
    RADPATP REAL -- Radiation pattern excitation factor for P waves,
    RADPATS REAL -- Radiation pattern excitation factor for S waves,
    SNR1 DOUBLE PRECISION -- Minimum signal-to-noise ratio used to select spectral amplitudes,
    SNR2 DOUBLE PRECISION -- Minimum signal-to-noise for applying MDAC parameters,
    NOISETYPE VARCHAR(15) -- Noise identifier e.g. pre-event or pre-phase,
    MAGID BIGINT -- Magnitude identifier,
    MAGTYPE VARCHAR(6) -- Magnitude type,
    ALGOID BIGINT -- Algorithm used,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date (format YY/MM/DD HH24:MI:SS
);

CREATE TABLE MSGAUX (
    MSGID BIGINT -- Message identifier,
    MSGROW SMALLINT -- Line number in message,
    STATECOUNT INTEGER -- Number of failures,
    COMMAND VARCHAR(24) -- Command that could not be processed,
    SUB_STATUS VARCHAR(24) -- Cause of failure,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE MSGDATATYPE (
    MSGID BIGINT -- Message identifier,
    MSGDTYPE VARCHAR(16) -- Data type of the data section within the message,
    MSGDFORMAT VARCHAR(16) -- General format of data that follows,
    MSGSTATUS VARCHAR(32) -- Status of the data section,
    FOFF BIGINT -- File offset to beginning of data section,
    MSIZE INTEGER -- Size of data section,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE MSGDEST (
    MSGDID BIGINT -- Message destination identifier,
    MSGID BIGINT -- Message identifier,
    TRANSMETH VARCHAR(16) -- Method by which the response is to be delivered to the requester,
    EMAILTO VARCHAR(64) -- E-mail address to send message,
    MSGSTATUS VARCHAR(32) -- Current status of the response message,
    ITIME DOUBLE PRECISION -- Time at which table entry was made,
    TIMESENT DOUBLE PRECISION -- Time at which message was sent,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE MSGDISC (
    MSGID BIGINT -- Message identifier,
    USERID BIGINT -- User identifier,
    MSGVER VARCHAR(8) -- Message system version number,
    MSGTYPE VARCHAR(16) -- Message type,
    SUBTYPE VARCHAR(20) -- Message subtype,
    EXTMSGID VARCHAR(20) -- Message identification string provided by the sender,
    INTID BIGINT -- Either the locally generated msgid of an earlier table entry that evoked the creation of this table entry or the reqid from the request table of an internally generated request,
    INTIDTYPE VARCHAR(16) -- Intid type,
    MSGSRC VARCHAR(16) -- Message source code,
    ITIME DOUBLE PRECISION -- Initial time message was received,
    IDATE INTEGER -- Initial date message was received,
    IMETHOD VARCHAR(8) -- Input method (e-mail or ftp),
    ISRC VARCHAR(64) -- Initial source of message,
    MSIZE INTEGER -- Message size in bytes,
    MSGSTATUS VARCHAR(32) -- Status of message,
    SUBJECT VARCHAR(64) -- Subject header from e-mail message,
    DIR VARCHAR(64) -- Directory to find file,
    DFILE VARCHAR(32) -- Name of data file,
    FOFF BIGINT -- Byte offset of data segment within file,
    MFOFF INTEGER -- Offset in bytes to beginning of message,
    FILEOFF INTEGER -- Number of bytes to the first character of the e-mail file (first character of the e-mail header),
    FILESIZE INTEGER -- Size of file,
    SIGTYPE VARCHAR(64) -- Digital signature type,
    VERIFSTATUS VARCHAR(4) -- Status of verification,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE MSVMAX_DESCRIPT (
    AMPID BIGINT -- Amplitude identifier,
    STA VARCHAR(6) -- Station code,
    ORID BIGINT -- Origin identifier,
    ARID BIGINT -- LR arrival identifier,
    HIGH_SNR_COUNT SMALLINT -- Count of periods where noise is greater than signal,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE MSVMAX_RESULTS (
    AMPID BIGINT -- Amplitude identifier,
    PER REAL -- Period (8 - 25 second),
    MEASTYPE VARCHAR(1) -- Measurement type,
    AMP REAL -- Amplitude value in nanometers,
    AMPTIME DOUBLE PRECISION -- Time of amplitude measure,
    INS_RESPONSE REAL -- Instrument response value,
    AMPCOR REAL -- Amplitude value corrected for Airy phase Butterworth filter,
    MAGNITUDE REAL -- Magnitude value,
    UNCERTAINTY REAL -- Magnitude uncertainty-future use,
    TIME DOUBLE PRECISION -- Epoch start time of signal window,
    ENDTIME DOUBLE PRECISION -- Epoch start time of signal window,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE NETMAG (
    MAGID BIGINT -- Network magnitude identifier,
    NET VARCHAR(8) -- Unique network identifier,
    ORID BIGINT -- Origin identifier,
    EVID BIGINT -- Event identifier,
    MAGTYPE VARCHAR(6) -- Magnitude type (ms, mb, etc.),
    NSTA INTEGER -- Number of stations used,
    MAGNITUDE REAL -- Magnitude,
    UNCERTAINTY REAL -- Magnitude uncertainty,
    AUTH VARCHAR(15) -- Source/originator,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_netmag PRIMARY KEY (MAGID)
);

CREATE TABLE NETWORK (
    NETWORKID BIGINT -- Unique network identifier,
    NET VARCHAR(8) -- Network name,
    NETWORK_NAME VARCHAR(32) -- Long network name,
    DESCRIPTION VARCHAR(4000) -- Network description,
    NETWORK_TYPE VARCHAR(15) -- Network type (array, local, world-wide, etc.),
    ON_DATE TIMESTAMP -- The date the network first became active or was created,
    OFF_DATE TIMESTAMP -- The date the network was removed from the system or made obsolete,
    AUTHOR VARCHAR(64) -- Source/originator,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE NETYIELD (
    YIELDID BIGINT -- Yield identifier,
    NET VARCHAR(8) -- Unique network identifier,
    ORID BIGINT -- Origin identifier,
    EVID BIGINT -- Event identifier,
    YIELD REAL -- Yield,
    NSTA INTEGER -- Number of stations used,
    FFACTOR REAL -- Yield F factor (log 10),
    WMODEL_NAME VARCHAR(50) -- Yield model name,
    AUTH VARCHAR(15) -- Author,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE NET_CODA_SPECTRUM (
    MAGID BIGINT -- Magnitude identifier,
    FREQ REAL -- Frequency,
    AMPCOR REAL -- Amplitude value corrected for path and site,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE OMITTED_CHANNELS (
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(8) -- Channel code,
    TIME DOUBLE PRECISION -- Epoch time for start of channel omitted,
    ENDTIME DOUBLE PRECISION -- Epoch time for end of channel omitted,
    COMMID BIGINT -- Comment identifier,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ORIGERR (
    ORID BIGINT -- Origin identifier,
    SXX REAL -- Covariance matrix element,
    SYY REAL -- Covariance matrix element,
    SZZ REAL -- Covariance matrix element,
    STT REAL -- Covariance matrix element,
    SXY REAL -- Covariance matrix element,
    SXZ REAL -- Covariance matrix element,
    SYZ REAL -- Covariance matrix element,
    STX REAL -- Covariance matrix element,
    STY REAL -- Covariance matrix element,
    STZ REAL -- Covariance matrix element,
    SDOBS REAL -- Standard error of observations,
    SMAJAX REAL -- Semi-major axis of error,
    SMINAX REAL -- Semi-minor axis of error,
    STRIKE REAL -- Strike of the semi-major axis,
    SDEPTH REAL -- Depth error,
    STIME REAL -- Origin time error,
    CONF REAL -- Confidence,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ORIGERR_GA (
    ORID BIGINT -- Origin identifier,
    SXX REAL -- Covariance matrix element,
    SYY REAL -- Covariance matrix element,
    SZZ REAL -- Covariance matrix element,
    STT REAL -- Covariance matrix element,
    SXY REAL -- Covariance matrix element,
    SXZ REAL -- Covariance matrix element,
    SYZ REAL -- Covariance matrix element,
    STX REAL -- Covariance matrix element,
    STY REAL -- Covariance matrix element,
    STZ REAL -- Covariance matrix element,
    SDOBS REAL -- Standard error of observations,
    SMAJAX REAL -- Semi-major axis of error,
    SMINAX REAL -- Semi-minor axis of error,
    STRIKE REAL -- Strike of the semi-major axis,
    SDEPTH REAL -- Depth error,
    STIME REAL -- Origin time error,
    CONF REAL -- Confidence,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ORIGERR_GA_DEL (
    ORID BIGINT -- Origin identifier,
    SXX REAL -- Covariance matrix element,
    SYY REAL -- Covariance matrix element,
    SZZ REAL -- Covariance matrix element,
    STT REAL -- Covariance matrix element,
    SXY REAL -- Covariance matrix element,
    SXZ REAL -- Covariance matrix element,
    SYZ REAL -- Covariance matrix element,
    STX REAL -- Covariance matrix element,
    STY REAL -- Covariance matrix element,
    STZ REAL -- Covariance matrix element,
    SDOBS REAL -- Standard error of observations,
    SMAJAX REAL -- Semi-major axis of error,
    SMINAX REAL -- Semi-minor axis of error,
    STRIKE REAL -- Strike of the semi-major axis,
    SDEPTH REAL -- Depth error,
    STIME REAL -- Origin time error,
    CONF REAL -- Confidence,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE ORIGIN (
    LAT REAL -- Estimated latitude,
    LON REAL -- Estimated longitude,
    DEPTH REAL -- Estimated depth,
    TIME DOUBLE PRECISION -- Epoch time,
    ORID BIGINT -- Origin identifier,
    EVID BIGINT -- Event identifier,
    JDATE INTEGER -- Julian date,
    NASS SMALLINT -- Number of associated phases,
    NDEF SMALLINT -- Number of locating phases,
    NDP SMALLINT -- Number of depth phases,
    GRN INTEGER -- Geographic region number,
    SRN INTEGER -- Seismic region number,
    ETYPE VARCHAR(7) -- Event type,
    DEPDP REAL -- Estimated depth from depth phases,
    DTYPE VARCHAR(1) -- Depth method used,
    MB REAL -- Body wave magnitude,
    MBID BIGINT -- Mb magnitude identifier,
    MS REAL -- Surface wave magnitude,
    MSID BIGINT -- Ms magnitude identifier,
    ML REAL -- Local magnitude,
    MLID BIGINT -- ML magnitude identifier,
    ALGORITHM VARCHAR(15) -- Location algorithm used,
    AUTH VARCHAR(15) -- Source/originator,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_origin PRIMARY KEY (ORID)
);

CREATE TABLE ORIGIN_GA (
    LAT REAL -- Estimated latitude,
    LON REAL -- Estimated longitude,
    DEPTH REAL -- Estimated depth,
    TIME DOUBLE PRECISION -- Epoch time,
    ORID BIGINT -- Origin identifier,
    EVID BIGINT -- Event identifier,
    JDATE INTEGER -- Julian date,
    NASS SMALLINT -- Number of associated phases,
    NDEF SMALLINT -- Number of locating phases,
    NDP SMALLINT -- Number of depth phases,
    GRN INTEGER -- Geographic region number,
    SRN INTEGER -- Seismic region number,
    ETYPE VARCHAR(7) -- Event type,
    DEPDP REAL -- Estimated depth from depth phases,
    DTYPE VARCHAR(1) -- Depth method used,
    MB REAL -- Body wave magnitude,
    MBID BIGINT -- Mb magnitude identifier,
    MS REAL -- Surface wave magnitude,
    MSID BIGINT -- Ms magnitude identifier,
    ML REAL -- Local magnitude,
    MLID BIGINT -- ML magnitude identifier,
    ALGORITHM VARCHAR(15) -- Location algorithm used,
    AUTH VARCHAR(15) -- Source/originator,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_origin_ga PRIMARY KEY (ORID)
);

CREATE TABLE ORIGIN_GA_DEL (
    LAT REAL -- Estimated latitude,
    LON REAL -- Estimated longitude,
    DEPTH REAL -- Estimated depth,
    TIME DOUBLE PRECISION -- Epoch time,
    ORID BIGINT -- Origin identifier,
    EVID BIGINT -- Event identifier,
    JDATE INTEGER -- Julian date,
    NASS SMALLINT -- Number of associated phases,
    NDEF SMALLINT -- Number of locating phases,
    NDP SMALLINT -- Number of depth phases,
    GRN INTEGER -- Geographic region number,
    SRN INTEGER -- Seismic region number,
    ETYPE VARCHAR(7) -- Event type,
    DEPDP REAL -- Estimated depth from depth phases,
    DTYPE VARCHAR(1) -- Depth method used,
    MB REAL -- Body wave magnitude,
    MBID BIGINT -- Mb magnitude identifier,
    MS REAL -- Surface wave magnitude,
    MSID BIGINT -- Ms magnitude identifier,
    ML REAL -- Local magnitude,
    MLID BIGINT -- ML magnitude identifier,
    ALGORITHM VARCHAR(15) -- Location algorithm used,
    AUTH VARCHAR(15) -- Source/originator,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_origin_ga_del PRIMARY KEY (ORID)
);

CREATE TABLE ORIGIN_MEA_TRACE (
    ORID BIGINT -- Origin identifier,
    CLUSTAID BIGINT -- Cluster Station identifier,
    ACTIVETIME_LOOKUP DOUBLE PRECISION -- The time used to lookup the epoch time a cluster was activated. This value is either the application data start time or set to the value of 'cluster-active-time-override' parameter.,
    BEST_REF_MATCH_ORID BIGINT -- Best reference event,
    APPLIED_THRESHOLD REAL -- Threshold used for this detection,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_origin_mea_trace PRIMARY KEY (ORID)
);

CREATE TABLE ORIGIN_SDO (
    ORID BIGINT -- Origin identifier,
    CONSTRAINT pk_origin_sdo PRIMARY KEY (ORID)
);

CREATE TABLE ORIGIN_TAG (
    ORID BIGINT -- Origin identifier,
    PROCESS_MODE VARCHAR(32) -- Automated processing mode of defining arrivals or analysis mode,
    PROCESS_ATTRIBUTE VARCHAR(32) -- Additional information to augment the process_mode (e.g. specific spotlight),
    NDEF SMALLINT -- Number of defining arrivals for automated processing mode,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_origin_tag PRIMARY KEY (ORID)
);

CREATE TABLE OUTAGE_STATION_DATA (
    OUTAGE_ID BIGINT -- Outage identifier,
    STA VARCHAR(6) -- Station name,
    START_DATE TIMESTAMP -- Process Start date/time,
    END_DATE TIMESTAMP -- Last time the process ran,
    AUTHOR VARCHAR(64) -- Author,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE OUTAGE_STATION_RECEIVE (
    OUTAGE_ID BIGINT -- Outage identifier,
    STA VARCHAR(6) -- Station name,
    START_DATE TIMESTAMP -- Process Start date/time.,
    END_DATE TIMESTAMP -- Last time the process ran,
    ENDTIME DOUBLE PRECISION -- Station outage ending time.,
    AUTHOR VARCHAR(64) -- Author,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE POLYGON (
    POLYID BIGINT -- Polygon Identifier,
    REGION_NAME VARCHAR(30) -- name of region,
    PERIMETERTYPE VARCHAR(8) -- type of perimeter (unused),
    INSIDEFLAG VARCHAR(1) -- inside flag (unused),
    OUTSIDEFLAG VARCHAR(1) -- outage flag (unused),
    EDGEFLAG VARCHAR(1) -- edge flag (unused),
    AUTH VARCHAR(15) -- Author,
    COMMENTS VARCHAR(4000) -- comment text,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE POLYPOINT (
    POLYID BIGINT -- Polygon Identifier,
    SEQUENCE BIGINT -- point of interest,
    LAT DOUBLE PRECISION -- Latitude,
    LON DOUBLE PRECISION -- Longitude,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE PROCESSING_RECIPE (
    PROCID BIGINT -- ID of the processing recipe. This ID and the procorder form the primary key,
    PROCMETHOD VARCHAR(20) -- Method of processing (taper, deconvolution, butterworth_filter, etc),
    IDNAME VARCHAR(15) -- The name of the id field (taperid, filterid, etc),
    IDVALUE BIGINT -- The value of the id field,
    PROCORDER INTEGER -- The value of the id field,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE PROCESS_TRACKING (
    TRACKINGID BIGINT -- Process Tracking Identifier,
    PROCESS VARCHAR(256) -- Process name (Ex: pipeline_daemon, interactive_daemon),
    MACHINE VARCHAR(128) -- Machine name,
    SYS_AREA VARCHAR(128) -- System Area,
    SYS_SITE VARCHAR(128) -- Where the process was started.,
    PROC_START_DATE TIMESTAMP -- Process start date.,
    PROC_END_DATE TIMESTAMP -- Process end date,
    STATE VARCHAR(16) -- Current processing state,
    AUTHOR VARCHAR(64) -- Author,
    MODDATE TIMESTAMP -- Modification date.,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE QCMASKDEF (
    QCDEFID BIGINT -- Definition identifier,
    FIX SMALLINT -- Flag indicating how to fix the bad segment,
    NTAPER INTEGER -- Number of points to taper outside segment of length &gt;=drop_thr,
    DROP_THR INTEGER -- Number of consecutive equal-valued samples to call a bad segment,
    SINGLE_TRACE_SPIKE_THR DOUBLE PRECISION -- Amplitude ratio threshold for single-point spikes,
    NITER INTEGER -- Number of iterations to perform extended QC,
    NSAMP INTEGER -- Number of samples in a time interval for extended QC,
    NOVER INTEGER -- Number of overlap samples for extended QC,
    SPIKE_THR DOUBLE PRECISION -- Amplitude ratio threshold for extended QC spikes,
    SPIKE_STAT INTEGER -- Flag for statistic to use for spike detection across multiple data vectors,
    SPIKE_VAL DOUBLE PRECISION -- Value to use for spike_stat,
    SPIKE_NPWIN INTEGER -- Number of points to use for single vector extended QC spike detection,
    SPIKE_DSET INTEGER -- Flag for data set to use for extended QC across multiple data vectors,
    NOISE_THRESH DOUBLE PRECISION -- Noisy channel threshold value,
    SPIKE_WINLEN INTEGER -- Number of samples used in single-trace QC,
    INTERQUAR_COEF DOUBLE PRECISION -- Inter-quartile range multiplier for single-trace QC,
    NOISE_NSAMP INTEGER -- Number of samples in averaging window for noisy channel processing,
    NOISE_NOVERLAP INTEGER -- Number of samples windows overlap for noisy channel processing,
    ALGORITHM_LIST VARCHAR(100) -- List of algorithms applied during QC processing,
    ONDATE INTEGER -- The date this record starts to be used,
    OFFDATE INTEGER -- The date this record is no longer used,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE QCMASKINFO (
    QCMASKID BIGINT -- QC mask identifier,
    STA VARCHAR(6) -- Station name,
    CHAN VARCHAR(8) -- Channel name,
    TIME DOUBLE PRECISION -- Start time of Mask,
    ENDTIME DOUBLE PRECISION -- End time of Mask,
    SAMPRATE REAL -- Sample rate in samples/sec,
    NSEG INTEGER -- The number of segments for this mask ( see qcmaskseg table ),
    QCDEFID BIGINT -- QC definition ientifier,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE QCMASKSEG (
    QCMASKID BIGINT -- QC mask identifier,
    STARTSAMPLE INTEGER -- Number of the starting sample,
    ENDSAMPLE INTEGER -- Number of the ending sample,
    MASKTYPE INTEGER -- Flag indicating type of mask for a given segment,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE QSHELL_INTERVAL (
    QSHELL_INTVLID BIGINT -- QShell Interval identifier,
    INTVLID BIGINT -- Interval identifier,
    CLASS VARCHAR(16) -- Type of interval,
    NAME VARCHAR(20) -- Name of interval,
    PROC_START_DATE TIMESTAMP -- Processing start date,
    PROC_END_DATE TIMESTAMP -- Processing stop date,
    STATE VARCHAR(16) -- Current processing state,
    AUTHOR VARCHAR(64) -- Author of interval,
    MODDATE TIMESTAMP -- Time of last processing state change,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE RDA_PARAM (
    POLYID BIGINT -- Polygon Identifier,
    RDA_VERID BIGINT -- version identifier of the RDA,
    GAMMA DOUBLE PRECISION -- Frequency exponent of attenuation,
    LAMBDA DOUBLE PRECISION -- Smoothing parameter,
    CLASS_DECISION_THRESH DOUBLE PRECISION -- Decision threshold,
    AUTH VARCHAR(15) -- Author,
    COMMENTS VARCHAR(4000) -- comment text,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE REG_RATIO_DISCRIM (
    POLYID BIGINT -- Polygon Identifier,
    COV_VERID BIGINT -- version identifier of the covariance matrix,
    NUMERATOR_PHASE VARCHAR(8) -- Numerator phase of interest,
    DENOMINATOR_PHASE VARCHAR(8) -- Denominator phase of interest,
    NUM_LOW_FREQ DOUBLE PRECISION -- Low end of frequency band used to filter numerator measurement,
    NUM_HI_FREQ DOUBLE PRECISION -- High end of frequency band used to filter numerator measurement,
    DEN_LOW_FREQ DOUBLE PRECISION -- Low end of frequency band used to filter denominator measurement,
    DEN_HI_FREQ DOUBLE PRECISION -- High end of frequency band used to filter denominator measurement,
    MEAN_EX_VAL DOUBLE PRECISION -- Mean p-value for explosions for this discriminant within this region,
    NUM_STATION_VAR DOUBLE PRECISION -- Variability due to station in the numerator phase,
    DEN_STATION_VAR DOUBLE PRECISION -- Variability due to station in the denominator phase,
    NUM_EVENT_VAR DOUBLE PRECISION -- Variability due to event in the numerator phase,
    DEN_EVENT_VAR DOUBLE PRECISION -- Variability due to event in the denominator phase,
    LDDATE TIMESTAMP -- Date this parameter set was loaded
);

CREATE TABLE REMAP (
    SOURCE VARCHAR(512) -- &nbsp;,
    ID_NAME VARCHAR(12) -- &nbsp;,
    ORIGINAL_ID BIGINT -- &nbsp;,
    CURRENT_ID BIGINT -- &nbsp;,
    LDDATE TIMESTAMP -- &nbsp;
);

CREATE TABLE REMARK (
    COMMID BIGINT -- Comment identifier,
    LINENO INTEGER -- Comment line number,
    REMARK VARCHAR(160) -- Free-format comment,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_remark PRIMARY KEY (COMMID)
);

CREATE TABLE REMOVED_BEAM_DFILE (
    DFILE VARCHAR(32) -- Beam file name,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE REQUEST (
    REQID BIGINT -- Request identifier,
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(8) -- Channel code,
    ARRAY VARCHAR(8) -- Array code,
    ORID BIGINT -- Origin identifier,
    EVID BIGINT -- Event identifier,
    TIME DOUBLE PRECISION -- Starting time of requested waveform data,
    ENDTIME DOUBLE PRECISION -- Ending time of requested waveform data,
    CLASS VARCHAR(16) -- Type of request,
    REQ_STATE VARCHAR(16) -- Current request state,
    STATECOUNT INTEGER -- Number of failed attempts (when state = failed),
    COMPLETE INTEGER -- Percentage of data acquired,
    REQUESTOR VARCHAR(15) -- Original author of record,
    MODTIME DOUBLE PRECISION -- Time of last state change (epoch time),
    MODAUTHOR VARCHAR(15) -- Author of last state change,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE SADO_EMAIL_HISTORY (
    SADO_EMAIL_ID BIGINT -- SADO Email History Identifier.,
    REPORT_ID BIGINT -- Report Identifier.,
    SUBJECT VARCHAR(1000) -- SADO Email Subject Text,
    RECIPIENTS VARCHAR(4000) -- SADO Email recipients,
    AUTHOR VARCHAR(64) -- Author of the SADO Email,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE SADO_PDF_REPORTS (
    SADO_PDF_REPORT_ID BIGINT -- SADO PDF Report Identifier,
    REPORT_ID BIGINT -- SADO Report Identifier,
    AUTHOR VARCHAR(64) -- Author of the SADO PDF Report.,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE SADO_REPORT (
    REPORT_ID BIGINT -- Report Identifier,
    EVID BIGINT -- Event Identifier,
    ORID BIGINT -- Origin Identifier,
    GRN INTEGER -- Geographic region number,
    EVENT_TIME DOUBLE PRECISION -- Epoch time of an Event,
    TITLE VARCHAR(64) -- Title of the report. Combination of the evid number and date and timestamp of the report,
    ANALYST VARCHAR(32) -- The analyst that created the event of the report,
    ACCOUNT VARCHAR(15) -- Pipeline account the report is being written from,
    CLASSIFICATION VARCHAR(256) -- The classification of the report material,
    TTGE VARCHAR(1) -- Boolean indicating the Alert Manager sent an email for this report,
    SADO_RELEASED VARCHAR(1) -- Boolean indicating the SADO report has been released to the AFTAC website,
    ALERT_MANAGER_CALLED VARCHAR(1) -- Boolean indicating if the user called the alert manager,
    EXERCISE VARCHAR(1) -- Boolean indicating if the report is an exercise report,
    EMAIL_TYPE VARCHAR(32) -- Indicates the report type of type 0, 1, or 2,
    ALERT_MANAGER VARCHAR(64) -- Indicates which alert manager was called if an alert manager was called,
    YIELD_CALCULATOR_REGION_SELECT VARCHAR(64) -- Region selected for chemical and yield calculator.,
    FINAL_DETERMINATION VARCHAR(32) -- SADO final determination of the event,
    MAG_MAGTYPE VARCHAR(32) -- String variable of magnitude + magtype used for magtypes selection in SADO tool.,
    OVERBURDEN_SET VARCHAR(1) -- Boolean value indicating if the user set the depth of burial manually.,
    OVERBURDEN REAL -- Manually set Depth of Burial in meters.,
    COMMENTS VARCHAR(4000) -- Commentary section for the SADO to write any extra information they would like to include in report.,
    ECM_DETERMINATION VARCHAR(32) -- ECM determination selected by the user,
    AUTHOR VARCHAR(64) -- Author of the SADO Report.,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE SADO_REPORT_LANDMARKS (
    REPORT_LANDMARKS_ID BIGINT -- Report Landmarks Identifier,
    REPORT_ID BIGINT -- Report Identifier,
    LOCATION_ID BIGINT -- Location Identifier,
    TESTSITE VARCHAR(1) -- Boolean indicating if the landmark is a testsite from the testsite table,
    NAME VARCHAR(64) -- Name for the landmark. If it is a testsite, it is the testsite name. If it is user added, it is the name provided by the user.,
    LAT REAL -- Estimated latitude,
    LON REAL -- Estimated longitude,
    DISTANCE REAL -- Distance of landmark from event location in degrees.,
    AUTHOR VARCHAR(64) -- Author of this SADO Report Landmark,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE SADO_SCREENSHOTS (
    SADO_SCREENSHOT_ID BIGINT -- SADO Screenshot Identifier,
    REPORT_ID BIGINT -- Report Identifier,
    TYPE VARCHAR(10) -- Screenshot image file types (Initial allowable types (jpg, jpeg, png)),
    AUTHOR VARCHAR(64) -- Author of this SADO Screenshot,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE SADO_STATE (
    SADO_STATE_ID BIGINT -- SADO State Identifier,
    REPORT_ID BIGINT -- Report Identifier,
    SADO_STATE_CATEGORY_ID BIGINT -- SADO State Category Identifier,
    AUTHOR VARCHAR(64) -- Author of this SADO State,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE SADO_STATE_CATEGORIES (
    SADO_STATE_CATEGORY_ID BIGINT -- SADO State Category Identifier,
    TITLE VARCHAR(64) -- Short description/title of the sado report category,
    AUTHOR VARCHAR(64) -- Author of this SADO State Category,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE SADO_USERS (
    SADO_USERS_ID BIGINT -- SADO Users Identifier,
    SADO_NAME VARCHAR(64) -- First and last name of the SADO.,
    OFFICE_SYMBOL VARCHAR(64) -- &nbsp;,
    AUTHOR VARCHAR(64) -- SADO OS User.,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load Date
);

CREATE TABLE SENSOR (
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(8) -- Channel code,
    TIME DOUBLE PRECISION -- Epoch time of start of recording period,
    ENDTIME DOUBLE PRECISION -- Epoch time of end of recording period,
    INID BIGINT -- Instrument identifier,
    CHANID BIGINT -- Channel identifier,
    JDATE INTEGER -- Julian date,
    CALRATIO REAL -- Calibration,
    CALPER REAL -- Calibration period,
    TSHIFT REAL -- Correction of data processing time,
    INSTANT VARCHAR(1) -- Discrete/continuing (y, n) snapshot,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_sensor PRIMARY KEY (STA, CHAN, TIME, ENDTIME)
);

CREATE TABLE SITE (
    STA VARCHAR(6) -- Station identifier,
    ONDATE INTEGER -- Julian start date,
    OFFDATE INTEGER -- Julian off date,
    LAT DOUBLE PRECISION -- Latitude,
    LON DOUBLE PRECISION -- Longitude,
    ELEV REAL -- Elevation,
    STANAME VARCHAR(50) -- Station description,
    STATYPE VARCHAR(4) -- Station type (single station, array),
    REFSTA VARCHAR(6) -- Reference station for array members,
    DNORTH REAL -- Offset from array reference (km),
    DEAST REAL -- Offset from array reference (km),
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_site PRIMARY KEY (STA, ONDATE)
);

CREATE TABLE SITEAUX (
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(8) -- Channel code,
    TIME DOUBLE PRECISION -- Epoch time,
    NOIS REAL -- Noise amplitude,
    NOISSD REAL -- Standard deviation of log noise,
    AMCOR REAL -- Amplitude correction,
    AMCORSD REAL -- Correction standard deviation,
    SNTHRSH REAL -- Signal/noise detection threshold,
    RELY REAL -- Station reliability,
    PTMCOR REAL -- P arrival time correction,
    STMCOR REAL -- S arrival time correction,
    STAPER REAL -- Period for measurements,
    DELK REAL -- Estimate of slowness model uncertainty,
    DELS REAL -- Estimate of slowness measurement uncertainty,
    AUTH VARCHAR(15) -- Author,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE SITECHAN (
    STA VARCHAR(6) -- Station identifier,
    CHAN VARCHAR(8) -- Channel code,
    ONDATE INTEGER -- Julian start date,
    CHANID BIGINT -- Channel identifier,
    OFFDATE INTEGER -- Julian off date,
    CTYPE VARCHAR(4) -- Channel type,
    EDEPTH REAL -- Emplacement depth,
    HANG REAL -- Horizontal angle,
    VANG REAL -- Vertical angle,
    DESCRIP VARCHAR(50) -- Channel description,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_sitechan PRIMARY KEY (STA, CHAN, ONDATE)
);

CREATE TABLE SNR_PHASE (
    POLYID BIGINT -- Polygon Identifier,
    AMPCOR_VERID BIGINT -- amplitude correction version identifier,
    STA VARCHAR(6) -- Station name,
    CHAN VARCHAR(8) -- Channel name,
    PHASE VARCHAR(8) -- phase of interest,
    MIN_NUM_ELEM SMALLINT -- Minimum number of elements needed,
    SNR_THRESH DOUBLE PRECISION -- Minimum signal-to-noise ratio needed,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE SREGION (
    SRN INTEGER -- Seismic region number,
    SRNAME VARCHAR(40) -- Seismic region name,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE STAMAG (
    MAGID BIGINT -- Magnitude identifier,
    AMPID BIGINT -- Amplitude identifier,
    STA VARCHAR(6) -- Station code,
    ARID BIGINT -- Arrival identifier,
    ORID BIGINT -- Origin identifier,
    EVID BIGINT -- Event identifier,
    PHASE VARCHAR(8) -- Associated phase,
    DELTA REAL -- Station-to-event distance,
    MAGTYPE VARCHAR(6) -- Magnitude type (ml, ms, mb, etc.),
    MAGNITUDE REAL -- Magnitude,
    UNCERTAINTY REAL -- Magnitude uncertainty,
    MAGRES REAL -- Magnitude residual,
    MAGDEF VARCHAR(1) -- flag indicating if magnitude is defining (d,D) or nondefining (n,N,x,X),
    MMODEL VARCHAR(15) -- Magnitude model,
    AUTH VARCHAR(15) -- Author,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_stamag PRIMARY KEY (MAGID)
);

CREATE TABLE STANET (
    NET VARCHAR(8) -- Unique network identifier,
    STA VARCHAR(6) -- Station identifier,
    TIME DOUBLE PRECISION -- Starting time for station in network,
    ENDTIME DOUBLE PRECISION -- endtime for station in network,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE STAQUAL_DNAMES (
    ID BIGINT -- Station Quality Dname Unique identifier,
    STA VARCHAR(6) -- Station name,
    DNAME VARCHAR(8) -- Detection beam or channel name,
    ON_TIME DOUBLE PRECISION -- Epoch time when a station was turned on,
    OFF_TIME DOUBLE PRECISION -- Epoch time when a station was or will be turned off,
    AUTHOR VARCHAR(64) -- Author,
    MODDATE TIMESTAMP -- Modification date,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE STATION_PROCESSING (
    CLUSTAID BIGINT -- ID number of a cluster and refsta combination,
    ACTIVETIME DOUBLE PRECISION -- The epochtime a cluster was activated,
    PROCID BIGINT -- procid of the processing recipe,
    PROCTYPE VARCHAR(15) -- The type of processing (ex: SVD, AMP, Corr),
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE STATION_QUALITY (
    SQID BIGINT -- Station quality identifier,
    STA VARCHAR(6) -- Station name,
    DNAME VARCHAR(8) -- Detection beam or channel name,
    TIME DOUBLE PRECISION -- Epoch start time of segment,
    ENDTIME DOUBLE PRECISION -- Epoch end time of segment,
    JDATE INTEGER -- Julian date of start time,
    AVGCHANS REAL -- Average number of active channels,
    EXPECTED DOUBLE PRECISION -- Expected number of seconds of data for segment,
    RETRIEVED DOUBLE PRECISION -- Actual number of seconds of data for a segment,
    MASKED DOUBLE PRECISION -- Number of seconds masked in segment,
    MASKS INTEGER -- Number of masks in segment,
    NDET_THRES REAL -- Normalized detection threshold,
    AZIMUTH REAL -- Beam azimuth,
    SLOW REAL -- Beam slowness,
    NOISE REAL -- Noise level for segment,
    NOISEDEV REAL -- Estimate of variability in noise level for the segment,
    NOISETYPE VARCHAR(10) -- mean-sd; noise=power beam mean; noisedev=standard deviation; med-mad; noise=power beam median; noisedev=median absolute deviation,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE STAYIELD (
    YIELDID BIGINT -- Yield identifier,
    AMPID BIGINT -- Amplitude identifier,
    STA VARCHAR(6) -- Station identifier,
    CHAN VARCHAR(8) -- Channel code,
    ORID BIGINT -- Origin identifier,
    ARID BIGINT -- Arrival identifier,
    YIELD REAL -- Yield,
    FFACTOR REAL -- Yield F factor (log 10),
    WMODEL_NAME VARCHAR(50) -- Yield model name,
    AUTH VARCHAR(15) -- Author,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE STA_CODA_SPECTRUM (
    AMPID BIGINT -- Amplitude identifier,
    FREQ REAL -- Frequency,
    AMPCOR REAL -- Amplitude value corrected for path and site,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE SVDDISC (
    LSVID BIGINT -- Left Singular Vector identifier,
    CLUSTAID BIGINT -- Detector identifier,
    ACTIVETIME DOUBLE PRECISION -- The epochtime a cluster was activated,
    STA VARCHAR(6) -- Station code (Ref Sta),
    NSAMP INTEGER -- Number of samples,
    SAMPRATE REAL -- Sampling rate in samples/sec,
    SINGULAR_VALUE REAL -- Singular value,
    UNITS VARCHAR(1) -- Units of waveform used to create LSV,
    DIR VARCHAR(64) -- Directory,
    DFILE VARCHAR(32) -- Data file,
    FOFF BIGINT -- Byte offset of data segment within file,
    COMMID BIGINT -- Comment identifier,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE SVDDISC_CHAN_ORDER (
    CLUSTAID BIGINT -- ID of the Cluster and Station,
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(6) -- Channel code,
    ACTIVETIME DOUBLE PRECISION -- The epochtime a cluster was activated,
    SORT_ORDER INTEGER -- Sort order
);

CREATE TABLE TAPER (
    TAPERID BIGINT -- ID number of a taper processing parameter,
    TAPER_TYPE VARCHAR(16) -- Type of tapering to be applied during filtering,
    TAPER_PERCT REAL -- Percent of points to be tapered,
    TAPER_MAXPTS INTEGER -- Max allowed taper points,
    TAPER_MINPTS INTEGER -- Min allowed taper points,
    AUTH VARCHAR(15) -- Author,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE TIMESTAMP (
    PROCCLASS VARCHAR(16) -- Process class,
    PROCNAME VARCHAR(16) -- Process name,
    TIME DOUBLE PRECISION -- Last epoch time,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE TOMO_INFO (
    TOMOID BIGINT -- Tomography identifier,
    MINLAT REAL -- Minimum latitude,
    MAXLAT REAL -- Maximum latitude,
    DLAT REAL -- Latitude grid spacing (latitude interval),
    MINLON REAL -- Minimum longitude,
    MAXLON REAL -- Maximum longitude,
    DLON REAL -- Longitude grid spacing (longitude interval),
    DIR VARCHAR(64) -- Directory,
    DFILE VARCHAR(32) -- Data file,
    AUTH VARCHAR(15) -- Author,
    DESCRIP VARCHAR(50) -- Description,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE USER_FILTER (
    OSUSER VARCHAR(30) -- System user identifier,
    SEQ INTEGER -- Order that the filter will be displayed in the list.,
    FILTER_STRING VARCHAR(1024) -- Compact filter representation used as parameter to filter_data_by_string module.,
    FILTERID BIGINT -- Filter pointer to desired filter.,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE USER_PRIVILEGES (
    AUTH VARCHAR(15) -- Author (authorized user),
    MAX_DURATION INTEGER -- Maximum length of channel masking,
    APP_TABLE VARCHAR(32) -- Table that this authorization applies to,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE WFACTIVITY (
    CLASS VARCHAR(16) -- Type of interval,
    NAME VARCHAR(20) -- Name of interval,
    TIME DOUBLE PRECISION -- Last epoch time,
    DURATION REAL -- Duration in seconds of the time region,
    MIN_TIME DOUBLE PRECISION -- Minimum time found in wfdisc for the time period,
    MAX_ENDTIME NUMERIC -- Maximum endtime found in wfdisc for the time period,
    MODDATE TIMESTAMP -- Time of last processing state change,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE WFAUDIT (
    WFAUDITID BIGINT -- Wfaudit unique identifier,
    STA VARCHAR(6) -- Station code.,
    CHAN VARCHAR(8) -- Channel code.,
    OLD_TIME DOUBLE PRECISION -- :old.time value provided to the wfdisc trigger,
    NEW_TIME DOUBLE PRECISION -- :new.time value provided to the wfdisc trigger,
    OLD_ENDTIME DOUBLE PRECISION -- :old.endtime provided to the wfdisc trigger,
    NEW_ENDTIME DOUBLE PRECISION -- :new.endtime provided to the wfdisc trigger,
    MODDATE TIMESTAMP -- Time of last processing state change
);

CREATE TABLE WFCONV (
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(8) -- Channel code,
    CHANID BIGINT -- Channel identifier,
    INAUTH VARCHAR(1) -- Input authenticated (y or n),
    INCOMP VARCHAR(2) -- Input compression type,
    INTYPE VARCHAR(2) -- Input fixed-width datatype,
    INSAMP INTEGER -- Input samples per packet,
    OUTAUTH VARCHAR(1) -- Output authenticated (y or n),
    OUTCOMP VARCHAR(2) -- Output compression type,
    OUTTYPE VARCHAR(2) -- Output fixed-width datatype,
    OUTSAMP INTEGER -- Output samples per packet,
    STRIP VARCHAR(1) -- Data stripped of headers,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date
);

CREATE TABLE WFDISC (
    STA VARCHAR(6) -- Station code,
    CHAN VARCHAR(8) -- Channel code,
    TIME DOUBLE PRECISION -- Epoch time of first sample in file,
    WFID BIGINT -- Waveform identifier,
    CHANID BIGINT -- Channel identifier,
    JDATE INTEGER -- Julian date,
    ENDTIME DOUBLE PRECISION -- Time + (nsamp-1)/ samprate,
    NSAMP INTEGER -- Number of samples,
    SAMPRATE REAL -- Sampling rate in samples/sec,
    CALIB REAL -- Nominal calibration,
    CALPER REAL -- Nominal calibration period,
    INSTYPE VARCHAR(6) -- Instrument code,
    SEGTYPE VARCHAR(1) -- Indexing method,
    DATATYPE VARCHAR(2) -- Numeric storage,
    CLIP VARCHAR(1) -- Clipped flag,
    DIR VARCHAR(64) -- Directory,
    DFILE VARCHAR(32) -- Data file,
    FOFF BIGINT -- Byte offset of data segment within file,
    COMMID BIGINT -- Comment identifier,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_wfdisc PRIMARY KEY (WFID)
);

CREATE TABLE WFFILE (
    WFFID BIGINT -- Wave Form File identifier,
    DIR VARCHAR(64) -- Directory name,
    DFILE VARCHAR(32) -- Filename,
    MACHINE VARCHAR(32) -- Machine name,
    LOCAL_DIR VARCHAR(64) -- Local directory,
    TLEN REAL -- Length of file, in seconds,
    TIME DOUBLE PRECISION -- Start time,
    REAPTIME DOUBLE PRECISION -- Clock time for expiration,
    STA VARCHAR(6) -- Station name,
    CHAN VARCHAR(8) -- Channel code,
    SAMPRATE REAL -- Sampling Rate in samples per second,
    CHANID BIGINT -- Channel identifier,
    WFMID BIGINT -- Wave Form Manager identifier,
    MODDATE TIMESTAMP -- &nbsp;,
    LDDATE TIMESTAMP -- &nbsp;
);

CREATE TABLE WFTAG (
    TAGNAME VARCHAR(8) -- Key (arid, orid, evid, etc.),
    TAGID BIGINT -- Tagname value,
    WFID BIGINT -- Waveform identifier,
    LDDATE TIMESTAMP -- Load date,
    CONSTRAINT pk_wftag PRIMARY KEY (TAGID, WFID)
);

CREATE TABLE XTAG (
    THISID BIGINT -- thisname identifier,
    THATID BIGINT -- thatname identifier,
    THISNAME VARCHAR(8) -- Key for thisid (grid, orid, ntid, and so on),
    THATNAME VARCHAR(8) -- Key for thatid (arid, orid, nfid, and so on),
    THISDB VARCHAR(32) -- Database account for the records specified by thisid and thisname,
    THATDB VARCHAR(32) -- Database account for the records specified by thatid and thatname,
    LDDATE TIMESTAMP -- Load date
);

