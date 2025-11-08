-- Generated Oracle DDL from USNDC_Tables_A_to_Z.html
-- Note: SDO_GEOMETRY metadata registration is not included (add SDO_GEOM_METADATA if needed).

-- Table: ACTIVE_ID
CREATE TABLE ACTIVE_ID (
    TAGNAME VARCHAR2(8),
    TAGID NUMBER(18),
    CLIENT_INFO VARCHAR2(64),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT ACTIVE_ID_PK PRIMARY KEY (TAGID),
    ,CONSTRAINT ACTIVE_ID__TAGID__CK CHECK (tagid > 0),
    ,CONSTRAINT ACTIVE_ID__TAGNAME__CK CHECK (tagname IN ('arid', 'evid', 'intvlid', '-'))
);
COMMENT ON TABLE ACTIVE_ID IS 'The active_id table is used to track events or arrivals bein g actively worked interactively to prevent the same event/ar rival from being worked by more than one individual.';
COMMENT ON COLUMN ACTIVE_ID.TAGNAME IS 'The key name (arid or evid)';
COMMENT ON COLUMN ACTIVE_ID.TAGID IS 'Tag identifier value (arid or evid)';
COMMENT ON COLUMN ACTIVE_ID.CLIENT_INFO IS 'Client information';
COMMENT ON COLUMN ACTIVE_ID.AUTHOR IS 'Author';
COMMENT ON COLUMN ACTIVE_ID.MODDATE IS 'Modification date';
COMMENT ON COLUMN ACTIVE_ID.LDDATE IS 'Load date';

-- Table: AFFILIATION
CREATE TABLE AFFILIATION (
    NET VARCHAR2(8),
    STA VARCHAR2(6),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT AFFILIATION_PK PRIMARY KEY (TIME),
    ,CONSTRAINT AFFILIATION__ENDTIME__CK CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT AFFILIATION__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT AFFILIATION__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE AFFILIATION IS 'The affiliation table groups stations into networks.';
COMMENT ON COLUMN AFFILIATION.NET IS 'Unique network identifier';
COMMENT ON COLUMN AFFILIATION.STA IS 'Station identifier';
COMMENT ON COLUMN AFFILIATION.TIME IS 'Starting time for station in network';
COMMENT ON COLUMN AFFILIATION.ENDTIME IS 'endtime for station in network';
COMMENT ON COLUMN AFFILIATION.LDDATE IS 'Load date';

-- Table: ALGORITHM
CREATE TABLE ALGORITHM (
    ALGORITHM_ID NUMBER(18),
    ALGORITHM_NAME VARCHAR2(64),
    DESCRIPTION VARCHAR2(4000),
    ON_DATE DATE,
    OFF_DATE DATE,
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT ALGORITHM_PK PRIMARY KEY (ALGORITHM_ID),
    ,CONSTRAINT ALGORITHM__ALGORITHM_ID__CK CHECK (algorithm_id > 0)
);
COMMENT ON TABLE ALGORITHM IS 'The algorithm table describes the algorithm and valid time p eriod';
COMMENT ON COLUMN ALGORITHM.ALGORITHM_ID IS 'Algorithm identifier';
COMMENT ON COLUMN ALGORITHM.ALGORITHM_NAME IS 'Algorithm name';
COMMENT ON COLUMN ALGORITHM.DESCRIPTION IS 'Description of algorithm';
COMMENT ON COLUMN ALGORITHM.ON_DATE IS 'The date the algorithm first became active or was created';
COMMENT ON COLUMN ALGORITHM.OFF_DATE IS 'The date the algorithm was removed from the system or made obsolete';
COMMENT ON COLUMN ALGORITHM.AUTHOR IS 'Author';
COMMENT ON COLUMN ALGORITHM.MODDATE IS 'Modification date';
COMMENT ON COLUMN ALGORITHM.LDDATE IS 'Load date';

-- Table: ALPHASITE
CREATE TABLE ALPHASITE (
    STA VARCHAR2(6),
    ADDRESS VARCHAR2(16),
    PREFDLID NUMBER(18),
    PREFPORT NUMBER(8),
    CON_ALLOWED VARCHAR2(1),
    DLID NUMBER(18),
    TIME FLOAT(53),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT ALPHASITE_PK PRIMARY KEY (STA),
    ,CONSTRAINT ALPHASITE__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT ALPHASITE__CON_ALLOWED__CK CHECK (con_allowed IN ('y', 'n', '-')),
    ,CONSTRAINT ALPHASITE__DLID__CK CHECK (dlid >= 0),
    ,CONSTRAINT ALPHASITE__PREFDLID__CK CHECK (prefdlid > 0),
    ,CONSTRAINT ALPHASITE__PREFPORT__CK CHECK ((prefport >= 0 AND prefport <= 16383) OR prefport = -1),
    ,CONSTRAINT ALPHASITE__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT ALPHASITE__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE ALPHASITE IS 'The alphasite table is used for tracking continuous data con nections by the DLMan application. For a given station, ther e must be a row in the table for each address from which the station may send continuous data. The columns prefdlid and prefport describe the preferred DLMan connection for the sta tion. DLMan fills in dlid and time while a station is active ly connected. The column dlid indicates to which dlid the st ation is currently connected (may be different from prefdlid ) and the column time is the system time for the last activi ty on the station''s connection (not the time of any data rec eived). For stations that are not connected, time and dlid a re zero.';
COMMENT ON COLUMN ALPHASITE.STA IS 'Station code';
COMMENT ON COLUMN ALPHASITE.ADDRESS IS 'Source internet address';
COMMENT ON COLUMN ALPHASITE.PREFDLID IS 'dlid for preferred DLMan';
COMMENT ON COLUMN ALPHASITE.PREFPORT IS 'Preferred network port';
COMMENT ON COLUMN ALPHASITE.CON_ALLOWED IS 'Status on whether DLMAN is allowed to connect to this channel or not';
COMMENT ON COLUMN ALPHASITE.DLID IS 'dlid handling station';
COMMENT ON COLUMN ALPHASITE.TIME IS 'Clock time of most recent activity';
COMMENT ON COLUMN ALPHASITE.COMMID IS 'Comment identifier';
COMMENT ON COLUMN ALPHASITE.LDDATE IS 'Load date';

-- Table: AMP3C
CREATE TABLE AMP3C (
    ARID NUMBER(18),
    CFREQ FLOAT(24),
    VAMP FLOAT(24),
    VSNR FLOAT(24),
    HAMP FLOAT(24),
    HSNR FLOAT(24),
    HTOV FLOAT(24),
    RID VARCHAR2(8),
    LDDATE DATE,
    ,CONSTRAINT AMP3C_PK PRIMARY KEY (CFREQ),
    ,CONSTRAINT AMP3C__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT AMP3C__CFREQ__CK CHECK (cfreq > 0.0 OR cfreq = -1.0),
    ,CONSTRAINT AMP3C__HAMP__CK CHECK (hamp >= 0.0 OR hamp = -999.0),
    ,CONSTRAINT AMP3C__HSNR__CK CHECK (hsnr >= 0.0 OR hsnr = -999.0),
    ,CONSTRAINT AMP3C__HTOV__CK CHECK (htov >= 0.0 OR htov = -999.0),
    ,CONSTRAINT AMP3C__VAMP__CK CHECK (vamp >= 0.0 OR vamp = -999.0),
    ,CONSTRAINT AMP3C__VSNR__CK CHECK (vsnr >= 0.0 OR vsnr = -999.0)
);
COMMENT ON TABLE AMP3C IS 'The amp3c table contains amplitude measurements made on thre e-component data for a specific detection.';
COMMENT ON COLUMN AMP3C.ARID IS 'Arrival identifier';
COMMENT ON COLUMN AMP3C.CFREQ IS 'Center frequency of filter band amplitude is measured on';
COMMENT ON COLUMN AMP3C.VAMP IS 'Vertical amplitude';
COMMENT ON COLUMN AMP3C.VSNR IS 'Vertical signal-to-noise ratio';
COMMENT ON COLUMN AMP3C.HAMP IS 'Horizontal amplitude';
COMMENT ON COLUMN AMP3C.HSNR IS 'Horizontal signal-to-noise ratio';
COMMENT ON COLUMN AMP3C.HTOV IS 'Horizontal-to-vertical amplitude ratio';
COMMENT ON COLUMN AMP3C.RID IS 'Recipe identifier';
COMMENT ON COLUMN AMP3C.LDDATE IS 'Load date';

-- Table: AMPDESCRIPT
CREATE TABLE AMPDESCRIPT (
    AMPTYPE VARCHAR2(8),
    TOFF FLOAT(24),
    TLEN FLOAT(24),
    GVLO FLOAT(24),
    GVHI FLOAT(24),
    MTYPE VARCHAR2(8),
    AMPDESCR VARCHAR2(255),
    LDDATE DATE,
    ,CONSTRAINT AMPDESCRIPT_PK PRIMARY KEY (AMPTYPE),
    ,CONSTRAINT AMPDESCRIPT__GVHI__CK CHECK (gvhi > gvlo OR gvhi = -999.0),
    ,CONSTRAINT AMPDESCRIPT__GVLO__CK CHECK (gvlo > 0.0 OR gvlo = -999.0),
    ,CONSTRAINT AMPDESCRIPT__TLEN__CK CHECK (tlen > 0.0 OR tlen = -1.0),
    ,CONSTRAINT AMPDESCRIPT__TOFF__CK CHECK (toff >= 0.0 OR toff = -999.0)
);
COMMENT ON TABLE AMPDESCRIPT IS 'The ampdescript table contains descriptions of how amplitude measurements in amplitude were made.';
COMMENT ON COLUMN AMPDESCRIPT.AMPTYPE IS 'Amplitude measure descriptor';
COMMENT ON COLUMN AMPDESCRIPT.TOFF IS 'Offset from theoretical or observed arrival time';
COMMENT ON COLUMN AMPDESCRIPT.TLEN IS 'Duration of measurement window';
COMMENT ON COLUMN AMPDESCRIPT.GVLO IS 'Low group velocity for measurement window (km/sec)';
COMMENT ON COLUMN AMPDESCRIPT.GVHI IS 'High group velocity for measurement window kilometers per second (km/sec)';
COMMENT ON COLUMN AMPDESCRIPT.MTYPE IS 'Measurement type';
COMMENT ON COLUMN AMPDESCRIPT.AMPDESCR IS 'Description';
COMMENT ON COLUMN AMPDESCRIPT.LDDATE IS 'Load date';

-- Table: AMPLITUDE
CREATE TABLE AMPLITUDE (
    AMPID NUMBER(18),
    ARID NUMBER(18),
    PARID NUMBER(18),
    CHAN VARCHAR2(8),
    AMP FLOAT(24),
    PER FLOAT(24),
    SNR FLOAT(24),
    AMPTIME FLOAT(53),
    TIME FLOAT(53),
    DURATION FLOAT(24),
    DELTAF FLOAT(24),
    AMPTYPE VARCHAR2(8),
    UNITS VARCHAR2(15),
    CLIP VARCHAR2(1),
    INARRIVAL VARCHAR2(1),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT AMPLITUDE_PK PRIMARY KEY (AMPID),
    ,CONSTRAINT AMPLITUDE__AMPID__CK CHECK (ampid > 0),
    ,CONSTRAINT AMPLITUDE__AMPTIME__CK CHECK (amptime >= -9999999999.999),
    ,CONSTRAINT AMPLITUDE__AMP__CK CHECK (amp > 0.0 OR amp = -1.0),
    ,CONSTRAINT AMPLITUDE__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT AMPLITUDE__CLIP__CK CHECK (clip IN ('c','n','-')),
    ,CONSTRAINT AMPLITUDE__DELTAF__CK CHECK (deltaf >= 0.0 OR deltaf = -1.0),
    ,CONSTRAINT AMPLITUDE__DURATION__CK CHECK (duration >= 0.0 OR duration = -999.0),
    ,CONSTRAINT AMPLITUDE__INARRIVAL__CK CHECK (inarrival IN ('y','n')),
    ,CONSTRAINT AMPLITUDE__PER__CK CHECK (per > 0.0 OR per = -1.0),
    ,CONSTRAINT AMPLITUDE__SNR__CK CHECK (snr > 0.0 OR snr = -1.0),
    ,CONSTRAINT AMPLITUDE__TIME__CK CHECK (time >= -9999999999.999),
    ,CONSTRAINT AMPLITUDE__UNITS__CK CHECK (units IN ('nm', 'log10Nm', 'Pa', 'uPa', 'Hz', '-'))
);
COMMENT ON TABLE AMPLITUDE IS 'The amplitude table contains arrival-based and origin-based amplitude measurements. The amplitude measurement is describ ed in ampdescript.';
COMMENT ON COLUMN AMPLITUDE.AMPID IS 'Amplitude identifier';
COMMENT ON COLUMN AMPLITUDE.ARID IS 'Arrival identifier';
COMMENT ON COLUMN AMPLITUDE.PARID IS 'Predicted arrival identifier';
COMMENT ON COLUMN AMPLITUDE.CHAN IS 'Channel code';
COMMENT ON COLUMN AMPLITUDE.AMP IS 'Amplitude';
COMMENT ON COLUMN AMPLITUDE.PER IS 'Period(s)';
COMMENT ON COLUMN AMPLITUDE.SNR IS 'Signal-to-noise ratio';
COMMENT ON COLUMN AMPLITUDE.AMPTIME IS 'Time of amplitude measure';
COMMENT ON COLUMN AMPLITUDE.TIME IS 'Start time of measurement window';
COMMENT ON COLUMN AMPLITUDE.DURATION IS 'Duration of measurement window';
COMMENT ON COLUMN AMPLITUDE.DELTAF IS 'Sample interval width';
COMMENT ON COLUMN AMPLITUDE.AMPTYPE IS 'Amplitude measure descriptor';
COMMENT ON COLUMN AMPLITUDE.UNITS IS 'Units';
COMMENT ON COLUMN AMPLITUDE.CLIP IS 'Clipped flag';
COMMENT ON COLUMN AMPLITUDE.INARRIVAL IS 'y or n flag indicating if amplitude (amp) is the same as the amp in the arrival table';
COMMENT ON COLUMN AMPLITUDE.AUTH IS 'Author';
COMMENT ON COLUMN AMPLITUDE.LDDATE IS 'Load date';

-- Table: AMPLITUDE_DYN_PARS_DBL
CREATE TABLE AMPLITUDE_DYN_PARS_DBL (
    AMPID NUMBER(18),
    GROUP_NAME VARCHAR2(48),
    PARAM_NAME VARCHAR2(48),
    D_VALUE FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT AMPLITUDE_DYN_PARS_DBL_PK PRIMARY KEY (GROUP_NAME),
    ,CONSTRAINT AMP_DYNPARS_DBL_AMPID_CK CHECK (AMPID > 0),
    ,CONSTRAINT AMP_DYNPARS_DBL_D_VALUE_CK CHECK (D_VALUE >= -9999999999.999),
    ,CONSTRAINT AMP_DYNPARS_DBL_GROUP_NAME_CK CHECK (GROUP_NAME IN('DETECT','FK','MEASURE','ONSET')),
    ,CONSTRAINT AMP_DYNPARS_DBL_PARAM_NAME_CK CHECK (PARAM_NAME IN('FILTERID','LEAD','LAG'))
);
COMMENT ON TABLE AMPLITUDE_DYN_PARS_DBL IS 'The amplitude_dyn_pars_dbl table will store amplitude parame ters and metadata (float values). Each record will contain o nly one piece of information.';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_DBL.AMPID IS 'Unique amplitude identifier';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_DBL.GROUP_NAME IS 'General function or purpose where attribute is used (e.g. FK)';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_DBL.PARAM_NAME IS 'Attribute name (e.g. LEAD, LAG)';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_DBL.D_VALUE IS 'Double precision value';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_DBL.LDDATE IS 'Load date';

-- Table: AMPLITUDE_DYN_PARS_INT
CREATE TABLE AMPLITUDE_DYN_PARS_INT (
    AMPID NUMBER(18),
    GROUP_NAME VARCHAR2(48),
    PARAM_NAME VARCHAR2(48),
    I_VALUE NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT AMPLITUDE_DYN_PARS_INT_PK PRIMARY KEY (PARAM_NAME),
    ,CONSTRAINT AMP_DYNPARS_INT_AMPID_CK CHECK (AMPID > 0),
    ,CONSTRAINT AMP_DYNPARS_INT_GROUP_NAME_CK CHECK (GROUP_NAME IN('DETECT','FK','MEASURE','ONSET')),
    ,CONSTRAINT AMP_DYNPARS_INT_PARAM_NAME_CK CHECK (PARAM_NAME IN('FILTERID','LEAD','LAG'))
);
COMMENT ON TABLE AMPLITUDE_DYN_PARS_INT IS 'The amplitude_dyn_pars_int table will store amplitude parame ters and metadata (integer values). Each record will contain only one piece of information.';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_INT.AMPID IS 'Unique amplitude identifier';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_INT.GROUP_NAME IS 'General function or purpose where attribute is used (e.g. FK)';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_INT.PARAM_NAME IS 'Attribute name (e.g. LEAD, LAG)';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_INT.I_VALUE IS 'Integer value';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_INT.LDDATE IS 'Load date';

-- Table: AMPLITUDE_DYN_PARS_STR
CREATE TABLE AMPLITUDE_DYN_PARS_STR (
    AMPID NUMBER(18),
    GROUP_NAME VARCHAR2(48),
    PARAM_NAME VARCHAR2(48),
    S_VALUE VARCHAR2(1024),
    LDDATE DATE,
    ,CONSTRAINT AMPLITUDE_DYN_PARS_STR_PK PRIMARY KEY (PARAM_NAME),
    ,CONSTRAINT AMP_DYNPARS_STR_AMPID_CK CHECK (AMPID > 0),
    ,CONSTRAINT AMP_DYNPARS_STR_GROUP_NAME_CK CHECK (GROUP_NAME IN('DETECT','FK','MEASURE','ONSET')),
    ,CONSTRAINT AMP_DYNPARS_STR_PARAM_NAME_CK CHECK (PARAM_NAME IN('FILTERID','LEAD','LAG'))
);
COMMENT ON TABLE AMPLITUDE_DYN_PARS_STR IS 'The amplitude_dyn_pars_str table will store amplitude parame ters and metadata (string values). Each record will contain only one piece of information.';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_STR.AMPID IS 'Unique amplitude identifier';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_STR.GROUP_NAME IS 'General function or purpose where attribute is used (e.g. FK)';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_STR.PARAM_NAME IS 'Attribute name (e.g. LEAD, LAG)';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_STR.S_VALUE IS 'String value';
COMMENT ON COLUMN AMPLITUDE_DYN_PARS_STR.LDDATE IS 'Load date';

-- Table: AOI
CREATE TABLE AOI (
    LAT FLOAT(53),
    LON FLOAT(53),
    AOI_GEOCHAR VARCHAR2(1),
    LFAOI_GEOCHAR VARCHAR2(1),
    DEPTH_GEOCHAR VARCHAR2(1),
    SEISMIC_GEOCHAR VARCHAR2(1),
    TERRAIN_GEOCHAR VARCHAR2(1),
    ONDATE NUMBER(8),
    OFFDATE NUMBER(8),
    LDDATE DATE,
    ,CONSTRAINT AOI_PK PRIMARY KEY (LON),
    ,CONSTRAINT AOI__DEPTH_GEOCHAR__CK CHECK (depth_geochar IN ('S', 'D')),
    ,CONSTRAINT AOI__GEOCHAR__CK CHECK (aoi_geochar IN ('A', 'O' )),
    ,CONSTRAINT AOI__LAT__CK CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT AOI__LON__CK CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT AOI__SEISMIC_GEOCHAR__CK CHECK (seismic_geochar IN ('A', 'S')),
    ,CONSTRAINT AOI__TERRAIN_GEOCHAR__CK CHECK (terrain_geochar IN ('L', 'O')),
    ,CONSTRAINT LFAOI__GEOCHAR__CK CHECK (lfaoi_geochar IN ('A', 'O' ))
);
COMMENT ON TABLE AOI IS 'The aoi table contains geographic characteristics of a parti cluar region of the Earth, based on five criteria: aoi_geoch ar, depth_geochar, lfaoi_geochar, seismic_geochar, and terra in_geochar. The entire content of this table is classified S ECRET.';
COMMENT ON COLUMN AOI.LAT IS 'Latitude';
COMMENT ON COLUMN AOI.LON IS 'Longitude';
COMMENT ON COLUMN AOI.AOI_GEOCHAR IS 'Area of interest geographic region characteristic';
COMMENT ON COLUMN AOI.LFAOI_GEOCHAR IS 'Look Forward Area of interest geographic region characteristic';
COMMENT ON COLUMN AOI.DEPTH_GEOCHAR IS 'Depth geographic region characteristic';
COMMENT ON COLUMN AOI.SEISMIC_GEOCHAR IS 'Seismic geographic region characteristic';
COMMENT ON COLUMN AOI.TERRAIN_GEOCHAR IS 'Terrain geographic region characteristic';
COMMENT ON COLUMN AOI.ONDATE IS 'Julian on date';
COMMENT ON COLUMN AOI.OFFDATE IS 'Julian off date';
COMMENT ON COLUMN AOI.LDDATE IS 'Load date';

-- Table: APMA
CREATE TABLE APMA (
    PHASE VARCHAR2(8),
    ARID NUMBER(18),
    FREQ FLOAT(24),
    SNR FLOAT(24),
    AMPP FLOAT(24),
    AMPS FLOAT(24),
    AMPLR FLOAT(24),
    RECT FLOAT(24),
    PLANS FLOAT(24),
    PLANLR FLOAT(24),
    HVRATP FLOAT(24),
    HVRAT FLOAT(24),
    HMXMN FLOAT(24),
    INANG3 FLOAT(24),
    SEAZP FLOAT(24),
    SEAZS FLOAT(24),
    SEAZLR FLOAT(24),
    INANG1 FLOAT(24),
    PPHASETIME FLOAT(53),
    SPHASETIME FLOAT(53),
    AUTH VARCHAR2(15),
    APMARID NUMBER(18),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT APMA_PK PRIMARY KEY (ARID),
    ,CONSTRAINT APMA__AMPLR__CK CHECK (amplr > 0.0 OR amplr = -1.0),
    ,CONSTRAINT APMA__AMPP__CK CHECK (ampp > 0.0 OR ampp = -1.0),
    ,CONSTRAINT APMA__AMPS__CK CHECK (amps > 0.0 OR amps = -1.0),
    ,CONSTRAINT APMA__APMARID__CK CHECK (apmarid > 0 OR apmarid = -1),
    ,CONSTRAINT APMA__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT APMA__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT APMA__FREQ__CK CHECK (freq > 0.0 OR freq = -1.0),
    ,CONSTRAINT APMA__HMXMN__CK CHECK (hmxmn >= 0.0 OR hmxmn = -1.0),
    ,CONSTRAINT APMA__HVRATP__CK CHECK (hvratp >= 0.0 OR hvratp = -1.0),
    ,CONSTRAINT APMA__HVRAT__CK CHECK (hvrat >= 0.0 OR hvrat = -1.0),
    ,CONSTRAINT APMA__INANG1__CK CHECK ((inang1 >= 0.0 AND inang1 < 90.0) OR inang1 = -1.0),
    ,CONSTRAINT APMA__INANG3__CK CHECK ((inang3 >= 0.0 AND inang3 < 90.0) OR inang3 = -1.0),
    ,CONSTRAINT APMA__PLANLR__CK CHECK ((planlr >= 0.0 AND planlr <= 1.0) OR planlr = -1.0),
    ,CONSTRAINT APMA__PLANS__CK CHECK ((plans >= 0.0 AND plans <= 1.0) OR plans = -1.0),
    ,CONSTRAINT APMA__PPHASETIME__CK CHECK (pphasetime > 0.0 OR pphasetime = -9999999999.999),
    ,CONSTRAINT APMA__RECT__CK CHECK ((rect >= 0.0 AND rect <= 1.0) OR rect = -1.0),
    ,CONSTRAINT APMA__SEAZLR__CK CHECK ((seazlr >= 0.0 AND seazlr <= 360.0) OR seazlr = -999.0),
    ,CONSTRAINT APMA__SEAZP__CK CHECK ((seazp >= 0.0 AND seazp <= 360.0) OR seazp = -999.0),
    ,CONSTRAINT APMA__SEAZS__CK CHECK ((seazs >= 0.0 AND seazs <= 360.0) OR seazs = -999.0),
    ,CONSTRAINT APMA__SNR__CK CHECK (snr > 0.0 OR snr = -1.0),
    ,CONSTRAINT APMA__SPHASETIME__CK CHECK (sphasetime > 0.0 OR sphasetime = -9999999999.999)
);
COMMENT ON TABLE APMA IS 'The apma table contains results of particle motion analysis for a specific detection.';
COMMENT ON COLUMN APMA.PHASE IS 'Phase';
COMMENT ON COLUMN APMA.ARID IS 'Arrival identifier';
COMMENT ON COLUMN APMA.FREQ IS 'Frequency';
COMMENT ON COLUMN APMA.SNR IS 'Signal-to-noise ratio';
COMMENT ON COLUMN APMA.AMPP IS 'P-phase amplitude';
COMMENT ON COLUMN APMA.AMPS IS 'S-phase amplitude';
COMMENT ON COLUMN APMA.AMPLR IS 'Rayleigh-phase amplitude';
COMMENT ON COLUMN APMA.RECT IS 'Rectilinearity';
COMMENT ON COLUMN APMA.PLANS IS 'S-phase planarity';
COMMENT ON COLUMN APMA.PLANLR IS 'Rayleigh-phase planarity';
COMMENT ON COLUMN APMA.HVRATP IS 'P-phase horizontal-to-vertical ratio';
COMMENT ON COLUMN APMA.HVRAT IS 'S-phase horizontal-to-vertical ratio';
COMMENT ON COLUMN APMA.HMXMN IS 'Maximum-to-minimum horizontal ratio';
COMMENT ON COLUMN APMA.INANG3 IS 'Short-axis incidence angle';
COMMENT ON COLUMN APMA.SEAZP IS 'P-phase observed azimuth';
COMMENT ON COLUMN APMA.SEAZS IS 'S-phase observed azimuth';
COMMENT ON COLUMN APMA.SEAZLR IS 'Rayleigh-phase observed azimuth';
COMMENT ON COLUMN APMA.INANG1 IS 'Long-axis incidence angle';
COMMENT ON COLUMN APMA.PPHASETIME IS 'P-phase extraction time';
COMMENT ON COLUMN APMA.SPHASETIME IS 'S-phase extraction time';
COMMENT ON COLUMN APMA.AUTH IS 'Author';
COMMENT ON COLUMN APMA.APMARID IS 'apma recipe identifier';
COMMENT ON COLUMN APMA.COMMID IS 'Comment identifier';
COMMENT ON COLUMN APMA.LDDATE IS 'Load date';

-- Table: AR_INFO
CREATE TABLE AR_INFO (
    ORID NUMBER(18),
    ARID NUMBER(18),
    TIME_ERROR_CODE NUMBER(9),
    AZ_ERROR_CODE NUMBER(9),
    SLOW_ERROR_CODE NUMBER(9),
    SRC_DPNT_CORR_TYPE NUMBER(9),
    VMODEL VARCHAR2(16),
    TOTAL_TRAVEL_TIME FLOAT(24),
    TT_TABLE_VALUE FLOAT(24),
    ELLIP_CORR FLOAT(24),
    ELEV_CORR FLOAT(24),
    BULK_STATIC_STA_CORR FLOAT(24),
    TT_SRC_DPNT_CORR FLOAT(24),
    TT_MODEL_ERROR FLOAT(24),
    TT_MEAS_ERROR FLOAT(24),
    TT_MODEL_PLUS_MEAS_ERROR FLOAT(24),
    AZ_SRC_DPNT_CORR FLOAT(24),
    AZ_MODEL_ERROR FLOAT(24),
    AZ_MEAS_ERROR FLOAT(24),
    AZ_MODEL_PLUS_MEAS_ERROR FLOAT(24),
    SL_SRC_DPNT_CORR FLOAT(24),
    SL_MODEL_ERROR FLOAT(24),
    SL_MEAS_ERROR FLOAT(24),
    SL_MODEL_PLUS_MEAS_ERROR FLOAT(24),
    TIME_IMPORT FLOAT(24),
    AZ_IMPORT FLOAT(24),
    SLOW_IMPORT FLOAT(24),
    SLOW_VEC_RES FLOAT(24),
    LDDATE DATE,
    ,CONSTRAINT AR_INFO_PK PRIMARY KEY (ARID),
    ,CONSTRAINT AR_INFO__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT AR_INFO__AZ_ERROR_CODE__CK CHECK (az_error_code >= 0 AND az_error_code <= 19),
    ,CONSTRAINT AR_INFO__AZ_IMPORT__CK CHECK ((az_import >= 0.0 AND az_import <= 1.0) OR az_import = -1.0),
    ,CONSTRAINT AR_INFO__AZ_MEAS_ERROR__CK CHECK ((az_meas_error > 0.0 AND az_meas_error <= 180.0) OR az_meas_error= -1.0),
    ,CONSTRAINT AR_INFO__AZ_MODEL_ERROR__CK CHECK ((az_model_error > 0.0 AND az_model_error <= 180.0) OR az_model_error = -1.0),
    ,CONSTRAINT AR_INFO__AZ_MOD_PLS_MS_ERR__CK CHECK ((az_model_plus_meas_error > 0.0 AND az_model_plus_meas_error <= 360.0) OR az_model_plus_meas_error = -1.0),
    ,CONSTRAINT AR_INFO__AZ_SRC_DPNT_CORR__CK CHECK (az_src_dpnt_corr >= -180.0 AND az_src_dpnt_corr <= 180.0),
    ,CONSTRAINT AR_INFO__BLK_STAT_STA_CORR__CK CHECK (bulk_static_sta_corr >= -50.0 AND bulk_static_sta_corr <= 50.0),
    ,CONSTRAINT AR_INFO__ELEV_CORR__CK CHECK (elev_corr >= -50.0 AND elev_corr <= 50.0),
    ,CONSTRAINT AR_INFO__ELLIP_CORR__CK CHECK (ellip_corr >= -50.0 AND ellip_corr <= 50.0),
    ,CONSTRAINT AR_INFO__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT AR_INFO__SLOW_ERROR_CODE__CK CHECK (slow_error_code >= 0 AND slow_error_code <= 19),
    ,CONSTRAINT AR_INFO__SLOW_IMPORT__CK CHECK ((slow_import >= 0.0 AND slow_import <= 1.0) OR slow_import = -1.0),
    ,CONSTRAINT AR_INFO__SLOW_VEC_RES__CK CHECK ((slow_vec_res >= -1000.0 AND slow_vec_res <= 1000.0) OR slow_vec_res = -999),
    ,CONSTRAINT AR_INFO__SL_MEAS_ERROR__CK CHECK ((sl_meas_error > 0.0) OR sl_meas_error = -1.0),
    ,CONSTRAINT AR_INFO__SL_MODEL_ERROR__CK CHECK ((sl_model_error > 0.0) OR sl_model_error = -1.0),
    ,CONSTRAINT AR_INFO__SL_MOD_PLS_MS_ERR__CK CHECK ((sl_model_plus_meas_error > 0.0) OR sl_model_plus_meas_error = -1.0),
    ,CONSTRAINT AR_INFO__SL_SRC_DPNT_CORR__CK CHECK (sl_src_dpnt_corr >= -50.0 AND sl_src_dpnt_corr <= 50.0),
    ,CONSTRAINT AR_INFO__SRC_DPNT_CORR_TY__CK CHECK ((src_dpnt_corr_type > 0 AND src_dpnt_corr_type <= 15) OR src_dpnt_corr_type = 0),
    ,CONSTRAINT AR_INFO__TIME_ERROR_CODE__CK CHECK (time_error_code >= 0 AND time_error_code <= 19),
    ,CONSTRAINT AR_INFO__TIME_IMPORT__CK CHECK ((time_import >= 0.0 AND time_import <= 1.0) OR time_import = -1.0),
    ,CONSTRAINT AR_INFO__TOTAL_TRAVEL_TIME__CK CHECK ((total_travel_time > 0.0 AND total_travel_time <= 86400) OR total_travel_time = -1.0),
    ,CONSTRAINT AR_INFO__TT_MEAS_ERROR__CK CHECK ((tt_meas_error > 0.0) OR tt_meas_error = -1.0),
    ,CONSTRAINT AR_INFO__TT_MODEL_ERROR__CK CHECK ((tt_model_error > 0.0) OR tt_model_error = -1.0),
    ,CONSTRAINT AR_INFO__TT_MOD_PLS_MS_ERR__CK CHECK ((tt_model_plus_meas_error > 0.0) OR tt_model_plus_meas_error = -1.0),
    ,CONSTRAINT AR_INFO__TT_SRC_DPNT_CORR__CK CHECK (tt_src_dpnt_corr >= -50.0 AND tt_src_dpnt_corr <= 50.0),
    ,CONSTRAINT AR_INFO__TT_TABLE_VALUE__CK CHECK ((tt_table_value > 0.0 AND tt_table_value <= 86400) OR tt_table_value = -1.0)
);
COMMENT ON TABLE AR_INFO IS 'The ar_info table contains information about arrival observa tions used in event location. This includes the predicted ob servation values, the model used to predict the values, and all uncertainties associated with that observation.';
COMMENT ON COLUMN AR_INFO.ORID IS 'Origin identifier';
COMMENT ON COLUMN AR_INFO.ARID IS 'Arrival identifier';
COMMENT ON COLUMN AR_INFO.TIME_ERROR_CODE IS 'Time error code';
COMMENT ON COLUMN AR_INFO.AZ_ERROR_CODE IS 'Azimuth error code';
COMMENT ON COLUMN AR_INFO.SLOW_ERROR_CODE IS 'Slowness error code';
COMMENT ON COLUMN AR_INFO.SRC_DPNT_CORR_TYPE IS 'Correction code (TT, AZ, SLO)';
COMMENT ON COLUMN AR_INFO.VMODEL IS 'Velocity model for theoretical travel time (TT) and slowness (SLO)';
COMMENT ON COLUMN AR_INFO.TOTAL_TRAVEL_TIME IS 'Predicted travel time including all corrections (seconds)';
COMMENT ON COLUMN AR_INFO.TT_TABLE_VALUE IS 'Base model travel time (uncorrect)';
COMMENT ON COLUMN AR_INFO.ELLIP_CORR IS 'Time correction due to earth''s ellipticity (seconds)';
COMMENT ON COLUMN AR_INFO.ELEV_CORR IS 'Time correction due to station elevation (seconds)';
COMMENT ON COLUMN AR_INFO.BULK_STATIC_STA_CORR IS 'Static station correction to travel time (seconds)';
COMMENT ON COLUMN AR_INFO.TT_SRC_DPNT_CORR IS 'Source-specific travel time correction (seconds)';
COMMENT ON COLUMN AR_INFO.TT_MODEL_ERROR IS 'Travel time model uncertainty (seconds)';
COMMENT ON COLUMN AR_INFO.TT_MEAS_ERROR IS 'Travel time measurement uncertainty (seconds)';
COMMENT ON COLUMN AR_INFO.TT_MODEL_PLUS_MEAS_ERROR IS 'Combined travel time model and measurement uncertainty (seconds)';
COMMENT ON COLUMN AR_INFO.AZ_SRC_DPNT_CORR IS 'Source-specific azimuth correction (degrees)';
COMMENT ON COLUMN AR_INFO.AZ_MODEL_ERROR IS 'Azimuth model uncertainty (degrees)';
COMMENT ON COLUMN AR_INFO.AZ_MEAS_ERROR IS 'Azimuth measurement uncertainty (degrees)';
COMMENT ON COLUMN AR_INFO.AZ_MODEL_PLUS_MEAS_ERROR IS 'Combined azimuth model and measurement uncertainty (degrees)';
COMMENT ON COLUMN AR_INFO.SL_SRC_DPNT_CORR IS 'Source-specific slowness correction (s/deg)';
COMMENT ON COLUMN AR_INFO.SL_MODEL_ERROR IS 'Slowness model uncertainty (s/deg)';
COMMENT ON COLUMN AR_INFO.SL_MEAS_ERROR IS 'Slowness measurement uncertainty (s/deg)';
COMMENT ON COLUMN AR_INFO.SL_MODEL_PLUS_MEAS_ERROR IS 'Combined slowness model and measurement uncertainty (s/deg)';
COMMENT ON COLUMN AR_INFO.TIME_IMPORT IS 'Weight applied to travel time in event solution';
COMMENT ON COLUMN AR_INFO.AZ_IMPORT IS 'Weight applied to azimuth in event solution';
COMMENT ON COLUMN AR_INFO.SLOW_IMPORT IS 'Weight applied to slowness in event solution';
COMMENT ON COLUMN AR_INFO.SLOW_VEC_RES IS 'Residual between predicted and observed FK vector (s/deg)';
COMMENT ON COLUMN AR_INFO.LDDATE IS 'Load date';

-- Table: ARRIVAL
CREATE TABLE ARRIVAL (
    STA VARCHAR2(6),
    TIME FLOAT(53),
    ARID NUMBER(18),
    JDATE NUMBER(8),
    STASSID NUMBER(18),
    CHANID NUMBER(18),
    CHAN VARCHAR2(8),
    IPHASE VARCHAR2(8),
    STYPE VARCHAR2(1),
    DELTIM FLOAT(24),
    AZIMUTH FLOAT(24),
    DELAZ FLOAT(24),
    SLOW FLOAT(24),
    DELSLO FLOAT(24),
    EMA FLOAT(24),
    RECT FLOAT(24),
    AMP FLOAT(24),
    PER FLOAT(24),
    LOGAT FLOAT(24),
    CLIP VARCHAR2(1),
    FM VARCHAR2(2),
    SNR FLOAT(24),
    QUAL VARCHAR2(1),
    AUTH VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT ARRIVAL_PK PRIMARY KEY (TIME),
    ,CONSTRAINT ARRIVAL_UK UNIQUE (ARID),
    ,CONSTRAINT ARRIVAL__AMP__CK CHECK (amp > 0.0 OR amp = -1.0),
    ,CONSTRAINT ARRIVAL__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT ARRIVAL__AZIMUTH__CK CHECK ((azimuth >= 0.0 AND azimuth <= 360.0) OR azimuth = -1.0),
    ,CONSTRAINT ARRIVAL__CHANID__CK CHECK (chanid > 0 OR chanid = -1),
    ,CONSTRAINT ARRIVAL__CLIP__CK CHECK (clip IN ('c','n','-')),
    ,CONSTRAINT ARRIVAL__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT ARRIVAL__DELAZ__CK CHECK (delaz > 0.0 OR delaz = -1.0),
    ,CONSTRAINT ARRIVAL__DELSLO__CK CHECK (delslo > 0.0 OR delslo = -1.0),
    ,CONSTRAINT ARRIVAL__DELTIM__CK CHECK (deltim > 0.0 OR deltim = -1.0),
    ,CONSTRAINT ARRIVAL__EMA__CK CHECK ((ema >= 0.0 AND ema <= 90.0) OR (ema = -1.0)),
    ,CONSTRAINT ARRIVAL__FM__CK CHECK (fm IN ('cu','cr','c.','du','dr','d.','.u','.r','..','-')),
    ,CONSTRAINT ARRIVAL__JDATE__CK CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT ARRIVAL__LOGAT__CK CHECK (logat > 0.0 OR logat = -999.0),
    ,CONSTRAINT ARRIVAL__PER__CK CHECK (per > 0.0 OR per = -1.0),
    ,CONSTRAINT ARRIVAL__QUAL__CK CHECK (qual IN ('i', 'e', 'w', '-', '1', '2', '3', '4')),
    ,CONSTRAINT ARRIVAL__RECT__CK CHECK ((rect >= 0.0 AND rect <= 1.0) OR rect = -1.0),
    ,CONSTRAINT ARRIVAL__SLOW__CK CHECK (slow >= 0.0 OR slow = -1.0),
    ,CONSTRAINT ARRIVAL__SNR__CK CHECK (snr > 0.0 OR snr = -1.0),
    ,CONSTRAINT ARRIVAL__STASSID__CK CHECK (stassid > 0 OR stassid = -1),
    ,CONSTRAINT ARRIVAL__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT ARRIVAL__STYPE__CK CHECK (stype IN ('l', 'r', 't', 'm', 'g', 'e', '-')),
    ,CONSTRAINT ARRIVAL__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE ARRIVAL IS 'The arrival table contains summary information about arrival s.';
COMMENT ON COLUMN ARRIVAL.STA IS 'Station code';
COMMENT ON COLUMN ARRIVAL.TIME IS 'Epoch time';
COMMENT ON COLUMN ARRIVAL.ARID IS 'Arrival identifier';
COMMENT ON COLUMN ARRIVAL.JDATE IS 'Julian date';
COMMENT ON COLUMN ARRIVAL.STASSID IS 'Arrival group indentification';
COMMENT ON COLUMN ARRIVAL.CHANID IS 'Instrument identifier';
COMMENT ON COLUMN ARRIVAL.CHAN IS 'Channel code';
COMMENT ON COLUMN ARRIVAL.IPHASE IS 'Reported phase';
COMMENT ON COLUMN ARRIVAL.STYPE IS 'Signal type';
COMMENT ON COLUMN ARRIVAL.DELTIM IS 'Time uncertainty';
COMMENT ON COLUMN ARRIVAL.AZIMUTH IS 'Observed azimuth';
COMMENT ON COLUMN ARRIVAL.DELAZ IS 'Azimuth uncertainty';
COMMENT ON COLUMN ARRIVAL.SLOW IS 'Observed slowness, seconds/degree';
COMMENT ON COLUMN ARRIVAL.DELSLO IS 'Slowness uncertainty';
COMMENT ON COLUMN ARRIVAL.EMA IS 'Emergence angle';
COMMENT ON COLUMN ARRIVAL.RECT IS 'Rectilinearity';
COMMENT ON COLUMN ARRIVAL.AMP IS 'Amplitude, instrument corrected';
COMMENT ON COLUMN ARRIVAL.PER IS 'Period';
COMMENT ON COLUMN ARRIVAL.LOGAT IS 'Log (amp/per)';
COMMENT ON COLUMN ARRIVAL.CLIP IS 'Clipped flag';
COMMENT ON COLUMN ARRIVAL.FM IS 'First motion';
COMMENT ON COLUMN ARRIVAL.SNR IS 'Signal-to-noise ratio';
COMMENT ON COLUMN ARRIVAL.QUAL IS 'Signal onset quality';
COMMENT ON COLUMN ARRIVAL.AUTH IS 'Author';
COMMENT ON COLUMN ARRIVAL.COMMID IS 'Comment identifier';
COMMENT ON COLUMN ARRIVAL.LDDATE IS 'Load date';

-- Table: ARRIVAL_DYN_PARS_DBL
CREATE TABLE ARRIVAL_DYN_PARS_DBL (
    ARID NUMBER(18),
    GROUP_NAME VARCHAR2(48),
    PARAM_NAME VARCHAR2(48),
    D_VALUE FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT ARRIVAL_DYN_PARS_DBL_PK PRIMARY KEY (GROUP_NAME),
    ,CONSTRAINT ARR_DYNPARS_DBL_ARID_CK CHECK (ARID > 0),
    ,CONSTRAINT ARR_DYNPARS_DBL_D_VALUE_CK CHECK (D_VALUE >= -9999999999.999),
    ,CONSTRAINT ARR_DYNPARS_DBL_GROUP_NAME_CK CHECK (GROUP_NAME IN('DETECT','FK','MEASURE','ONSET')),
    ,CONSTRAINT ARR_DYNPARS_DBL_PARAM_NAME_CK CHECK (PARAM_NAME IN('FILTERID','LEAD','LAG'))
);
COMMENT ON TABLE ARRIVAL_DYN_PARS_DBL IS 'The arrival_dyn_pars_dbl table will store arrival parameters and metadata (float values). Each record will contain only one piece of information.';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_DBL.ARID IS 'Unique arrival identifier';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_DBL.GROUP_NAME IS 'General function or purpose where attribute is used (e.g. DETECT, ONSET, FK)';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_DBL.PARAM_NAME IS 'Attribute name (e.g. FILTERID)';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_DBL.D_VALUE IS 'Double precision value';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_DBL.LDDATE IS 'Load date';

-- Table: ARRIVAL_DYN_PARS_INT
CREATE TABLE ARRIVAL_DYN_PARS_INT (
    ARID NUMBER(18),
    GROUP_NAME VARCHAR2(48),
    PARAM_NAME VARCHAR2(48),
    I_VALUE NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT ARRIVAL_DYN_PARS_INT_PK PRIMARY KEY (PARAM_NAME),
    ,CONSTRAINT ARR_DYNPARS_INT_ARID_CK CHECK (ARID > 0),
    ,CONSTRAINT ARR_DYNPARS_INT_GROUP_NAME_CK CHECK (GROUP_NAME IN('DETECT','FK','MEASURE','ONSET')),
    ,CONSTRAINT ARR_DYNPARS_INT_PARAM_NAME_CK CHECK (PARAM_NAME IN('FILTERID','LEAD','LAG'))
);
COMMENT ON TABLE ARRIVAL_DYN_PARS_INT IS 'The arrival_dyn_pars_int table will store arrival parameters and metadata (integer values). Each record will contain onl y one piece of information.';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_INT.ARID IS 'Unique arrival identifier';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_INT.GROUP_NAME IS 'General function or purpose where attribute is used (e.g. DETECT, ONSET, FK)';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_INT.PARAM_NAME IS 'Attribute name (e.g. FILTERID)';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_INT.I_VALUE IS 'Integer value';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_INT.LDDATE IS 'Load date';

-- Table: ARRIVAL_DYN_PARS_STR
CREATE TABLE ARRIVAL_DYN_PARS_STR (
    ARID NUMBER(18),
    GROUP_NAME VARCHAR2(48),
    PARAM_NAME VARCHAR2(48),
    S_VALUE VARCHAR2(1024),
    LDDATE DATE,
    ,CONSTRAINT ARRIVAL_DYN_PARS_STR_PK PRIMARY KEY (PARAM_NAME),
    ,CONSTRAINT ARR_DYNPARS_STR_ARID_CK CHECK (ARID > 0),
    ,CONSTRAINT ARR_DYNPARS_STR_GROUP_NAME_CK CHECK (GROUP_NAME IN('DETECT','FK','MEASURE','ONSET')),
    ,CONSTRAINT ARR_DYNPARS_STR_PARAM_NAME_CK CHECK (PARAM_NAME IN('FILTERID','LEAD','LAG'))
);
COMMENT ON TABLE ARRIVAL_DYN_PARS_STR IS 'The arrival_dyn_pars_str table will store arrival parameters and metadata (string values). Each record will contain only one piece of information.';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_STR.ARID IS 'Unique arrival identifier';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_STR.GROUP_NAME IS 'General function or purpose where attribute is used (e.g. DETECT, ONSET, FK)';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_STR.PARAM_NAME IS 'Attribute name (e.g. FILTERID)';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_STR.S_VALUE IS 'String value';
COMMENT ON COLUMN ARRIVAL_DYN_PARS_STR.LDDATE IS 'Load date';

-- Table: ARRIVAL_TAG
CREATE TABLE ARRIVAL_TAG (
    ARID NUMBER(18),
    PROCESS_MODE VARCHAR2(32),
    PROCESS_ATTRIBUTE VARCHAR2(32),
    LDDATE DATE,
    ,CONSTRAINT ARRIVAL_TAG_PK PRIMARY KEY (ARID),
    ,CONSTRAINT ARRIVAL_TAG_PROCESS_MODE_CK CHECK (process_mode IN ('GL', 'SL', 'LF', 'MEA', 'XA', 'SL-reviewed', 'GL-reviewed', 'SL-only, GL-mod', 'GL-only , SL-mod', 'ANALYST', 'HY', '-')),
    ,CONSTRAINT ARRIVAL_TAG__ARID__CK CHECK (arid > 0)
);
COMMENT ON TABLE ARRIVAL_TAG IS 'The arrival_tag table contains information to indicate which mode was used to generate the arrival.';
COMMENT ON COLUMN ARRIVAL_TAG.ARID IS 'Arrival identifier';
COMMENT ON COLUMN ARRIVAL_TAG.PROCESS_MODE IS 'Processing mode used to generate arrival';
COMMENT ON COLUMN ARRIVAL_TAG.PROCESS_ATTRIBUTE IS 'Attribute of processing mode';
COMMENT ON COLUMN ARRIVAL_TAG.LDDATE IS 'Load date';

-- Table: ASSOC
CREATE TABLE ASSOC (
    ARID NUMBER(18),
    ORID NUMBER(18),
    STA VARCHAR2(6),
    PHASE VARCHAR2(8),
    BELIEF FLOAT(24),
    DELTA FLOAT(24),
    SEAZ FLOAT(24),
    ESAZ FLOAT(24),
    TIMERES FLOAT(24),
    TIMEDEF VARCHAR2(1),
    AZRES FLOAT(24),
    AZDEF VARCHAR2(1),
    SLORES FLOAT(24),
    SLODEF VARCHAR2(1),
    EMARES FLOAT(24),
    WGT FLOAT(24),
    VMODEL VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT ASSOC_PK PRIMARY KEY (ORID),
    ,CONSTRAINT ASSOC__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT ASSOC__AZDEF__CK CHECK (azdef IN ('d', 'D', 'n', 'N', '-', 'X', 'x')),
    ,CONSTRAINT ASSOC__AZRES__CK CHECK ((azres >= -180.0 AND azres <= 180.0) OR azres = -999.0),
    ,CONSTRAINT ASSOC__BELIEF__CK CHECK ((belief >= 0.0 AND belief <= 1.0) OR belief = -1.0),
    ,CONSTRAINT ASSOC__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT ASSOC__DELTA__CK CHECK (delta >= 0.0 OR delta = -1.0),
    ,CONSTRAINT ASSOC__EMARES__CK CHECK ((emares >= -90.0 AND emares <= 90.0) OR emares = -999.0),
    ,CONSTRAINT ASSOC__ESAZ__CK CHECK ((esaz >= 0.0 AND esaz <= 360.0) OR esaz = -999.0),
    ,CONSTRAINT ASSOC__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT ASSOC__SEAZ__CK CHECK ((seaz >= 0.0 AND seaz <= 360.0) OR seaz = -999.0),
    ,CONSTRAINT ASSOC__SLODEF__CK CHECK (slodef IN ('d', 'D', 'n', 'N', '-', 'X', 'x')),
    ,CONSTRAINT ASSOC__SLORES__CK CHECK (slores > -999.0 OR slores = -999.0),
    ,CONSTRAINT ASSOC__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT ASSOC__TIMEDEF__CK CHECK (timedef IN ('d', 'D', 'n', 'N', '-', 'X', 'x')),
    ,CONSTRAINT ASSOC__TIMERES__CK CHECK (timeres > -999.0 OR timeres = -999.0),
    ,CONSTRAINT ASSOC__WGT__CK CHECK (wgt > 0.0 OR wgt = -1.0)
);
COMMENT ON TABLE ASSOC IS 'The assoc table contains information that connects arrivals (entries in the arrival table) to a particular origin.';
COMMENT ON COLUMN ASSOC.ARID IS 'Arrival identifier';
COMMENT ON COLUMN ASSOC.ORID IS 'Origin identifier';
COMMENT ON COLUMN ASSOC.STA IS 'Station code';
COMMENT ON COLUMN ASSOC.PHASE IS 'Associated phase';
COMMENT ON COLUMN ASSOC.BELIEF IS 'Phase confidence';
COMMENT ON COLUMN ASSOC.DELTA IS 'Station-to-event distance';
COMMENT ON COLUMN ASSOC.SEAZ IS 'Station-to-event azimuth';
COMMENT ON COLUMN ASSOC.ESAZ IS 'Event-to-station azimuth';
COMMENT ON COLUMN ASSOC.TIMERES IS 'Time residual';
COMMENT ON COLUMN ASSOC.TIMEDEF IS 'Time = defining (d,D), nondefining (n,N,x,X)';
COMMENT ON COLUMN ASSOC.AZRES IS 'Azimuth residual';
COMMENT ON COLUMN ASSOC.AZDEF IS 'Azimuth = defining (d,D), nondefining (n,N,x,X)';
COMMENT ON COLUMN ASSOC.SLORES IS 'Slowness residual';
COMMENT ON COLUMN ASSOC.SLODEF IS 'Slowness = defining (d,D), nondefining (n,N,x,X)';
COMMENT ON COLUMN ASSOC.EMARES IS 'Incidence angle residual';
COMMENT ON COLUMN ASSOC.WGT IS 'Location weight';
COMMENT ON COLUMN ASSOC.VMODEL IS 'Velocity model';
COMMENT ON COLUMN ASSOC.COMMID IS 'Comment identifier';
COMMENT ON COLUMN ASSOC.LDDATE IS 'Load date';

-- Table: ASSOC_GA
CREATE TABLE ASSOC_GA (
    ARID NUMBER(18),
    ORID NUMBER(18),
    STA VARCHAR2(6),
    PHASE VARCHAR2(8),
    BELIEF FLOAT(24),
    DELTA FLOAT(24),
    SEAZ FLOAT(24),
    ESAZ FLOAT(24),
    TIMERES FLOAT(24),
    TIMEDEF VARCHAR2(1),
    AZRES FLOAT(24),
    AZDEF VARCHAR2(1),
    SLORES FLOAT(24),
    SLODEF VARCHAR2(1),
    EMARES FLOAT(24),
    WGT FLOAT(24),
    VMODEL VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT ASSOC_GA_PK PRIMARY KEY (ORID)
);
COMMENT ON TABLE ASSOC_GA IS 'The assoc_ga table is used by the GA application to store te mporary associations.';
COMMENT ON COLUMN ASSOC_GA.ARID IS 'Arrival identifier';
COMMENT ON COLUMN ASSOC_GA.ORID IS 'Origin identifier';
COMMENT ON COLUMN ASSOC_GA.STA IS 'Station code';
COMMENT ON COLUMN ASSOC_GA.PHASE IS 'Associated phase';
COMMENT ON COLUMN ASSOC_GA.BELIEF IS 'Phase confidence';
COMMENT ON COLUMN ASSOC_GA.DELTA IS 'Station-to-event distance';
COMMENT ON COLUMN ASSOC_GA.SEAZ IS 'Station-to-event azimuth';
COMMENT ON COLUMN ASSOC_GA.ESAZ IS 'Event-to-station azimuth';
COMMENT ON COLUMN ASSOC_GA.TIMERES IS 'Time residual';
COMMENT ON COLUMN ASSOC_GA.TIMEDEF IS 'Time = defining (d,D), nondefining (n,N,x,X)';
COMMENT ON COLUMN ASSOC_GA.AZRES IS 'Azimuth residual';
COMMENT ON COLUMN ASSOC_GA.AZDEF IS 'Azimuth = defining (d,D), nondefining (n,N,x,X)';
COMMENT ON COLUMN ASSOC_GA.SLORES IS 'Slowness residual';
COMMENT ON COLUMN ASSOC_GA.SLODEF IS 'Slowness = defining (d,D), nondefining (n,N,x,X)';
COMMENT ON COLUMN ASSOC_GA.EMARES IS 'Incidence angle residual';
COMMENT ON COLUMN ASSOC_GA.WGT IS 'Location weight';
COMMENT ON COLUMN ASSOC_GA.VMODEL IS 'Velocity model';
COMMENT ON COLUMN ASSOC_GA.COMMID IS 'Comment identifier';
COMMENT ON COLUMN ASSOC_GA.LDDATE IS 'Load date';

-- Table: ASSOC_GA_DEL
CREATE TABLE ASSOC_GA_DEL (
    ARID NUMBER(18),
    ORID NUMBER(18),
    STA VARCHAR2(6),
    PHASE VARCHAR2(8),
    BELIEF FLOAT(24),
    DELTA FLOAT(24),
    SEAZ FLOAT(24),
    ESAZ FLOAT(24),
    TIMERES FLOAT(24),
    TIMEDEF VARCHAR2(1),
    AZRES FLOAT(24),
    AZDEF VARCHAR2(1),
    SLORES FLOAT(24),
    SLODEF VARCHAR2(1),
    EMARES FLOAT(24),
    WGT FLOAT(24),
    VMODEL VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT ASSOC_GA_DEL_PK PRIMARY KEY (ORID),
    ,CONSTRAINT ASSOC_GA_DEL__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT ASSOC_GA_DEL__AZDEF__CK CHECK (azdef IN ('d', 'D', 'n', 'N', '-', 'X', 'x')),
    ,CONSTRAINT ASSOC_GA_DEL__AZRES__CK CHECK ((azres >= -180.0 AND azres <= 180.0) OR azres = -999.0),
    ,CONSTRAINT ASSOC_GA_DEL__BELIEF__CK CHECK ((belief >= 0.0 AND belief <= 1.0) OR belief = -1.0),
    ,CONSTRAINT ASSOC_GA_DEL__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT ASSOC_GA_DEL__DELTA__CK CHECK (delta >= 0.0 OR delta = -1.0),
    ,CONSTRAINT ASSOC_GA_DEL__EMARES__CK CHECK ((emares >= -90.0 AND emares <= 90.0) OR emares = -999.0),
    ,CONSTRAINT ASSOC_GA_DEL__ESAZ__CK CHECK ((esaz >= 0.0 AND esaz <= 360.0) OR esaz = -999.0),
    ,CONSTRAINT ASSOC_GA_DEL__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT ASSOC_GA_DEL__SEAZ__CK CHECK ((seaz >= 0.0 AND seaz <= 360.0) OR seaz = -999.0),
    ,CONSTRAINT ASSOC_GA_DEL__SLODEF__CK CHECK (slodef IN ('d', 'D', 'n', 'N', '-', 'X', 'x')),
    ,CONSTRAINT ASSOC_GA_DEL__SLORES__CK CHECK (slores > -999.0 OR slores = -999.0),
    ,CONSTRAINT ASSOC_GA_DEL__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT ASSOC_GA_DEL__TIMEDEF__CK CHECK (timedef IN ('d', 'D', 'n', 'N', '-', 'X', 'x')),
    ,CONSTRAINT ASSOC_GA_DEL__TIMERES__CK CHECK (timeres > -999.0 OR timeres = -999.0),
    ,CONSTRAINT ASSOC_GA_DEL__WGT__CK CHECK (wgt > 0.0 OR wgt = -1.0)
);
COMMENT ON TABLE ASSOC_GA_DEL IS 'The assoc_ga_del table is used by the GA application to stor e deleted associations for later reference, if necessary.';
COMMENT ON COLUMN ASSOC_GA_DEL.ARID IS 'Arrival identifier';
COMMENT ON COLUMN ASSOC_GA_DEL.ORID IS 'Origin identifier';
COMMENT ON COLUMN ASSOC_GA_DEL.STA IS 'Station code';
COMMENT ON COLUMN ASSOC_GA_DEL.PHASE IS 'Associated phase';
COMMENT ON COLUMN ASSOC_GA_DEL.BELIEF IS 'Phase confidence';
COMMENT ON COLUMN ASSOC_GA_DEL.DELTA IS 'Station-to-event distance';
COMMENT ON COLUMN ASSOC_GA_DEL.SEAZ IS 'Station-to-event azimuth';
COMMENT ON COLUMN ASSOC_GA_DEL.ESAZ IS 'Event-to-station azimuth';
COMMENT ON COLUMN ASSOC_GA_DEL.TIMERES IS 'Time residual';
COMMENT ON COLUMN ASSOC_GA_DEL.TIMEDEF IS 'Time = defining (d,D), nondefining (n,N,x,X)';
COMMENT ON COLUMN ASSOC_GA_DEL.AZRES IS 'Azimuth residual';
COMMENT ON COLUMN ASSOC_GA_DEL.AZDEF IS 'Azimuth = defining (d,D), nondefining (n,N,x,X)';
COMMENT ON COLUMN ASSOC_GA_DEL.SLORES IS 'Slowness residual';
COMMENT ON COLUMN ASSOC_GA_DEL.SLODEF IS 'Slowness = defining (d,D), nondefining (n,N,x,X)';
COMMENT ON COLUMN ASSOC_GA_DEL.EMARES IS 'Incidence angle residual';
COMMENT ON COLUMN ASSOC_GA_DEL.WGT IS 'Location weight';
COMMENT ON COLUMN ASSOC_GA_DEL.VMODEL IS 'Velocity model';
COMMENT ON COLUMN ASSOC_GA_DEL.COMMID IS 'Comment identifier';
COMMENT ON COLUMN ASSOC_GA_DEL.LDDATE IS 'Load date';

-- Table: BEAM
CREATE TABLE BEAM (
    WFID NUMBER(18),
    FILTERID NUMBER(18),
    AZIMUTH FLOAT(24),
    SLOW FLOAT(24),
    DESCRIP VARCHAR2(50),
    LDDATE DATE,
    ,CONSTRAINT BEAM_PK PRIMARY KEY (WFID),
    ,CONSTRAINT BEAM__AZIMUTH__CK CHECK ((azimuth >= 0.0 AND azimuth <= 360.0) OR azimuth = -1.0),
    ,CONSTRAINT BEAM__FILTERID__CK CHECK (filterid > 0 OR filterid = -1),
    ,CONSTRAINT BEAM__SLOW__CK CHECK (slow >= 0.0 OR slow = -1.0),
    ,CONSTRAINT BEAM__WFID__CK CHECK (wfid > 0)
);
COMMENT ON TABLE BEAM IS 'The beam table stores the azimuth and slowness used during t he production of a beam. Whenever an origin beam is produced , a beam record is also produced and linked through the wfid to the beam waveform stored in the wfdisc table.';
COMMENT ON COLUMN BEAM.WFID IS 'Waveform identifier';
COMMENT ON COLUMN BEAM.FILTERID IS 'This is a TBD field created in anticipation of the Persistent Parameter module';
COMMENT ON COLUMN BEAM.AZIMUTH IS 'Azimuth';
COMMENT ON COLUMN BEAM.SLOW IS 'Slowness of an arrival';
COMMENT ON COLUMN BEAM.DESCRIP IS 'Text description of the beam';
COMMENT ON COLUMN BEAM.LDDATE IS 'Load date';

-- Table: BULLETIN_RELEASE
CREATE TABLE BULLETIN_RELEASE (
    ERPID NUMBER(18),
    ORID NUMBER(18),
    EVID NUMBER(18),
    MAGID NUMBER(18),
    AOI_GEOCHAR VARCHAR2(1),
    CLASSIFICATION_COMMENTS VARCHAR2(4000),
    CLASSIFICATION_RESULTS VARCHAR2(4000),
    GRNAME VARCHAR2(40),
    RELEASE_STATUS VARCHAR2(16),
    AUTH VARCHAR2(15),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT BULLETIN_RELEASE_PK PRIMARY KEY (ERPID),
    ,CONSTRAINT BULLETIN_RELEASE__ERPID__CK CHECK (erpid > 0),
    ,CONSTRAINT BULLETIN_RELEASE__EVID__CK CHECK (evid > 0),
    ,CONSTRAINT BULLETIN_RELEASE__GEOCHAR__CK CHECK (aoi_geochar IN ('A', 'O' )),
    ,CONSTRAINT BULLETIN_RELEASE__MAGID__CK CHECK (magid >= 0 OR magid = -1),
    ,CONSTRAINT BULLETIN_RELEASE__ORID__CK CHECK (orid > 0)
);
COMMENT ON TABLE BULLETIN_RELEASE IS 'The bulletin release table contains .';
COMMENT ON COLUMN BULLETIN_RELEASE.ERPID IS 'Event Reporting Process identifier';
COMMENT ON COLUMN BULLETIN_RELEASE.ORID IS 'Origin identifier';
COMMENT ON COLUMN BULLETIN_RELEASE.EVID IS 'Event identifier';
COMMENT ON COLUMN BULLETIN_RELEASE.MAGID IS 'Magnitude identifier';
COMMENT ON COLUMN BULLETIN_RELEASE.AOI_GEOCHAR IS 'Area of interest geographic region characteristic';
COMMENT ON COLUMN BULLETIN_RELEASE.CLASSIFICATION_COMMENTS IS 'Discrim and ECM comments';
COMMENT ON COLUMN BULLETIN_RELEASE.CLASSIFICATION_RESULTS IS 'Discrim and ECM results';
COMMENT ON COLUMN BULLETIN_RELEASE.GRNAME IS 'Geographic region name';
COMMENT ON COLUMN BULLETIN_RELEASE.RELEASE_STATUS IS 'Action being called for';
COMMENT ON COLUMN BULLETIN_RELEASE.AUTH IS 'Source/originator';
COMMENT ON COLUMN BULLETIN_RELEASE.MODDATE IS 'Modification date';
COMMENT ON COLUMN BULLETIN_RELEASE.LDDATE IS 'Load date';

-- Table: BULLETIN_RELEASE_EXPORT
CREATE TABLE BULLETIN_RELEASE_EXPORT (
    ERP_SEQ NUMBER(18),
    MAX_ERPID NUMBER(18),
    AUTH VARCHAR2(15),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT BULLETIN_RELEASE_EXPORT_PK PRIMARY KEY (ERP_SEQ),
    ,CONSTRAINT BULL_REL_EXP__ERP_SEQ__CK CHECK (erp_seq > 0),
    ,CONSTRAINT BULL_REL_EXP__MAX_ERPID__CK CHECK (max_erpid > 0)
);
COMMENT ON TABLE BULLETIN_RELEASE_EXPORT IS 'The bulletin release export table contains information to tr ack Event Release files in the event they are not recieved a t the intended destination.';
COMMENT ON COLUMN BULLETIN_RELEASE_EXPORT.ERP_SEQ IS 'Event Release Process export sequence number';
COMMENT ON COLUMN BULLETIN_RELEASE_EXPORT.MAX_ERPID IS 'Maximum Event Release Process Identifier';
COMMENT ON COLUMN BULLETIN_RELEASE_EXPORT.AUTH IS 'Source/originator';
COMMENT ON COLUMN BULLETIN_RELEASE_EXPORT.MODDATE IS 'Modification date';
COMMENT ON COLUMN BULLETIN_RELEASE_EXPORT.LDDATE IS 'Load date';

-- Table: BUTTERWORTH_FILTER
CREATE TABLE BUTTERWORTH_FILTER (
    FILTERID NUMBER(18),
    FILTER_TYPE VARCHAR2(16),
    FILTER_ORDER NUMBER(2),
    FILTER_LOW FLOAT(24),
    FILTER_HIGH FLOAT(24),
    FILTER_ZEROPH NUMBER(1),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT BUTTERWORTH_FILTER_PK PRIMARY KEY (FILTERID),
    ,CONSTRAINT BUTTERWORTH_FILTER__FHI__CK CHECK (filter_high > 0 OR filter_high = -1),
    ,CONSTRAINT BUTTERWORTH_FILTER__FID__CK CHECK (filterid > 0 OR filterid = -1),
    ,CONSTRAINT BUTTERWORTH_FILTER__FLOW__CK CHECK (filter_low > 0 OR filter_low = -1),
    ,CONSTRAINT BUTTERWORTH_FILTER__FO__CK CHECK ((filter_order >= 0 AND filter_order <= 99) OR filter_order = -1)
);
COMMENT ON TABLE BUTTERWORTH_FILTER IS 'The butterworth_filter table stores filter processing parame ter.';
COMMENT ON COLUMN BUTTERWORTH_FILTER.FILTERID IS 'ID number of a filter processing parameter';
COMMENT ON COLUMN BUTTERWORTH_FILTER.FILTER_TYPE IS 'Type of Butterworth filter (BP, LP, HP)';
COMMENT ON COLUMN BUTTERWORTH_FILTER.FILTER_ORDER IS 'Order of Butterworth filter';
COMMENT ON COLUMN BUTTERWORTH_FILTER.FILTER_LOW IS 'Filter low frequency';
COMMENT ON COLUMN BUTTERWORTH_FILTER.FILTER_HIGH IS 'Filter high frequency';
COMMENT ON COLUMN BUTTERWORTH_FILTER.FILTER_ZEROPH IS 'This is a flag to indicate zero-phase filtering. If this is set to 0, the filter is not zero-phase. If this is set to 1, the filter is zero-phase i.e. no phase lag or group delay.';
COMMENT ON COLUMN BUTTERWORTH_FILTER.AUTH IS 'Author';
COMMENT ON COLUMN BUTTERWORTH_FILTER.LDDATE IS 'Load date';

-- Table: CHAN_GROUPS
CREATE TABLE CHAN_GROUPS (
    CLASS VARCHAR2(16),
    NAME VARCHAR2(20),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    DURATION FLOAT(24),
    INWFACTIVITY NUMBER(1),
    ONDATE NUMBER(8),
    OFFDATE NUMBER(8),
    LDDATE DATE,
    ,CONSTRAINT CHAN_GROUPS_PK PRIMARY KEY (CHAN),
    ,CONSTRAINT CHAN_GROUPS__DURATION__CK CHECK (duration > 0.0 OR duration = -1.0),
    ,CONSTRAINT CHAN_GROUPS__INWFACTIVITY__CK CHECK (inwfactivity IN (0,1)),
    ,CONSTRAINT CHAN_GROUPS__OFFDATE__CK CHECK ((offdate > 1901348 AND offdate < 3001000) OR offdate = -1),
    ,CONSTRAINT CHAN_GROUPS__ONDATE__CK CHECK (ondate > 1901348 AND ondate < 3001000),
    ,CONSTRAINT CHAN_GROUPS__STA__CK CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE CHAN_GROUPS IS 'The chan_groups table is used to indicate which sta/chan pai rs belong to a given class/name (wfactivity) group.';
COMMENT ON COLUMN CHAN_GROUPS.CLASS IS 'Type of interval';
COMMENT ON COLUMN CHAN_GROUPS.NAME IS 'Name of interval';
COMMENT ON COLUMN CHAN_GROUPS.STA IS 'Station';
COMMENT ON COLUMN CHAN_GROUPS.CHAN IS 'Channel code';
COMMENT ON COLUMN CHAN_GROUPS.DURATION IS 'Duration in seconds of the time region';
COMMENT ON COLUMN CHAN_GROUPS.INWFACTIVITY IS 'Indicates whether class/name/duration is in wfactivity or not';
COMMENT ON COLUMN CHAN_GROUPS.ONDATE IS 'On date';
COMMENT ON COLUMN CHAN_GROUPS.OFFDATE IS 'Off date';
COMMENT ON COLUMN CHAN_GROUPS.LDDATE IS 'Load date';

-- Table: CHANNAME
CREATE TABLE CHANNAME (
    EXTERN_STA VARCHAR2(6),
    EXTERN_CHAN VARCHAR2(8),
    EXTERN_AUTH VARCHAR2(20),
    INTERN_STA VARCHAR2(6),
    INTERN_CHAN VARCHAR2(8),
    INTERN_CHANID NUMBER(18),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT CHANNAME_PK PRIMARY KEY (EXTERN_CHAN),
    ,CONSTRAINT CHANNAME__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT CHANNAME__INTERN_CHANID__CK CHECK (intern_chanid > 0 OR intern_chanid = -1)
);
COMMENT ON TABLE CHANNAME IS 'The channame table provides mapping between channel and stat ion names.';
COMMENT ON COLUMN CHANNAME.EXTERN_STA IS 'External station name';
COMMENT ON COLUMN CHANNAME.EXTERN_CHAN IS 'External channel name';
COMMENT ON COLUMN CHANNAME.EXTERN_AUTH IS 'External authority using this name';
COMMENT ON COLUMN CHANNAME.INTERN_STA IS 'Internal station name';
COMMENT ON COLUMN CHANNAME.INTERN_CHAN IS 'Internal channel name';
COMMENT ON COLUMN CHANNAME.INTERN_CHANID IS 'Internal channel ID';
COMMENT ON COLUMN CHANNAME.COMMID IS 'Comment identifier';
COMMENT ON COLUMN CHANNAME.LDDATE IS 'Load date';

-- Table: CLASSIFICATION
CREATE TABLE CLASSIFICATION (
    CLASSIFICATION_ID NUMBER(18),
    DESCRIPTION VARCHAR2(64),
    CLASS_LEVEL_ID NUMBER(18),
    CLASS_DISSEM_ID NUMBER(18),
    CLASS_DERIVED_ID NUMBER(18),
    CLASS_DECLASS_ID NUMBER(18),
    CLASS_REFER_ID NUMBER(18),
    CLASS_OPR_ID NUMBER(18),
    ON_DATE DATE,
    OFF_DATE DATE,
    AUTH VARCHAR2(15),
    LDDATE DATE,
    MODDATE DATE,
    ,CONSTRAINT CLASSIFICATION_PK PRIMARY KEY (CLASSIFICATION_ID),
    ,CONSTRAINT CLASS__CLASSIFICATION_ID__CK CHECK (classification_id > 0),
    ,CONSTRAINT CLASS__CLASS_DECLASS_ID__CK CHECK (class_declass_id > 0),
    ,CONSTRAINT CLASS__CLASS_DERIVED_ID__CK CHECK (class_derived_id > 0),
    ,CONSTRAINT CLASS__CLASS_DISSEM_ID__CK CHECK (class_dissem_id > 0),
    ,CONSTRAINT CLASS__CLASS_LEVEL_ID__CK CHECK (class_level_id > 0),
    ,CONSTRAINT CLASS__CLASS_OPR_ID__CK CHECK (class_opr_id > 0)
);
COMMENT ON TABLE CLASSIFICATION IS 'Contains the table ID information for other tables. Makes u p the overall classification consisting of classification le vel, control markings office of primary responsibility, sour ce used for classification and declassification instructions .';
COMMENT ON COLUMN CLASSIFICATION.CLASSIFICATION_ID IS 'Classification Identifier.';
COMMENT ON COLUMN CLASSIFICATION.DESCRIPTION IS 'Classification description.';
COMMENT ON COLUMN CLASSIFICATION.CLASS_LEVEL_ID IS 'Classification Level Identifier.';
COMMENT ON COLUMN CLASSIFICATION.CLASS_DISSEM_ID IS 'Classification Dissemination Identifier.';
COMMENT ON COLUMN CLASSIFICATION.CLASS_DERIVED_ID IS 'Classification Derived From Identifier.';
COMMENT ON COLUMN CLASSIFICATION.CLASS_DECLASS_ID IS 'Class Declassify Identifier';
COMMENT ON COLUMN CLASSIFICATION.CLASS_REFER_ID IS 'Class Refer To Identifier';
COMMENT ON COLUMN CLASSIFICATION.CLASS_OPR_ID IS 'ID for the classification_opr table. This is the agency, office (or OPR) responsible for classification and classification date.';
COMMENT ON COLUMN CLASSIFICATION.ON_DATE IS 'The date the classification becomes active.';
COMMENT ON COLUMN CLASSIFICATION.OFF_DATE IS 'The date the classification becomes inactive or obsolete.';
COMMENT ON COLUMN CLASSIFICATION.AUTH IS 'Author';
COMMENT ON COLUMN CLASSIFICATION.LDDATE IS 'Load Date';
COMMENT ON COLUMN CLASSIFICATION.MODDATE IS 'Modification date';

-- Table: CLASSIFICATION_DECLASSIFY _ON
CREATE TABLE CLASSIFICATION_DECLASSIFY _ON (
    CLASS_DECLASS_ID NUMBER(18),
    CLASS_DECLASS VARCHAR2(4000),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CLASSIFICATION_DECLASSIFY _ON_PK PRIMARY KEY (CLASS_DECLASS_ID),
    ,CONSTRAINT CLASS_DECLASS_ON__CD_ID__CK CHECK (class_declass_id > 0)
);
COMMENT ON TABLE CLASSIFICATION_DECLASSIFY _ON IS 'Contains the declassification date and reference information . Used as part of the Executive Order Box.';
COMMENT ON COLUMN CLASSIFICATION_DECLASSIFY _ON.CLASS_DECLASS_ID IS 'Class Declassify Identifier';
COMMENT ON COLUMN CLASSIFICATION_DECLASSIFY _ON.CLASS_DECLASS IS 'See comment on table.';
COMMENT ON COLUMN CLASSIFICATION_DECLASSIFY _ON.AUTH IS 'Author';
COMMENT ON COLUMN CLASSIFICATION_DECLASSIFY _ON.LDDATE IS 'Load Date';

-- Table: CLASSIFICATION_DERIVED_FR OM
CREATE TABLE CLASSIFICATION_DERIVED_FR OM (
    CLASS_DERIVED_ID NUMBER(18),
    CLASS_DERIVED VARCHAR2(4000),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CLASSIFICATION_DERIVED_FR OM_PK PRIMARY KEY (CLASS_DERIVED_ID),
    ,CONSTRAINT CLASS_DERIVED_FROM__CD_ID__CK CHECK (class_derived_id > 0)
);
COMMENT ON TABLE CLASSIFICATION_DERIVED_FR OM IS 'Identification of the source of classification (Classified b y or Derived From line). Part of the Executive Order Box.';
COMMENT ON COLUMN CLASSIFICATION_DERIVED_FR OM.CLASS_DERIVED_ID IS 'Classification derived from Identifier.';
COMMENT ON COLUMN CLASSIFICATION_DERIVED_FR OM.CLASS_DERIVED IS 'The source of the classification, i.e. classified by or derived from.';
COMMENT ON COLUMN CLASSIFICATION_DERIVED_FR OM.AUTH IS 'Author';
COMMENT ON COLUMN CLASSIFICATION_DERIVED_FR OM.LDDATE IS 'Load Date';

-- Table: CLASSIFICATION_DISSEMINAT ION
CREATE TABLE CLASSIFICATION_DISSEMINAT ION (
    CLASS_DISSEM_ID NUMBER(18),
    CLASS_DISSEM VARCHAR2(64),
    PARAGRAPH_MARK VARCHAR2(16),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CLASSIFICATION_DISSEMINAT ION_PK PRIMARY KEY (CLASS_DISSEM_ID),
    ,CONSTRAINT CLASS_DISS__CLASS_DISS_ID__CK CHECK (class_dissem_id > 0)
);
COMMENT ON TABLE CLASSIFICATION_DISSEMINAT ION IS 'Contains the control markings of the overall security markin g. i.e. FOUO, NOFORN';
COMMENT ON COLUMN CLASSIFICATION_DISSEMINAT ION.CLASS_DISSEM_ID IS 'Classification Dissemination Identifier.';
COMMENT ON COLUMN CLASSIFICATION_DISSEMINAT ION.CLASS_DISSEM IS 'The abbreviated control marking which may follow the classification.';
COMMENT ON COLUMN CLASSIFICATION_DISSEMINAT ION.PARAGRAPH_MARK IS 'The paragraph control marking. May be an abbreviated version of the class_dissem control marking.';
COMMENT ON COLUMN CLASSIFICATION_DISSEMINAT ION.AUTH IS 'Author';
COMMENT ON COLUMN CLASSIFICATION_DISSEMINAT ION.LDDATE IS 'Load Date';

-- Table: CLASSIFICATION_LEVEL
CREATE TABLE CLASSIFICATION_LEVEL (
    CLASS_LEVEL_ID NUMBER(18),
    CLASS_LEVEL VARCHAR2(64),
    PARAGRAPH_MARK VARCHAR2(16),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CLASSIFICATION_LEVEL_PK PRIMARY KEY (CLASS_LEVEL_ID),
    ,CONSTRAINT CLASS_LVL__CLASS_LVL_ID__CK CHECK (class_level_id > 0)
);
COMMENT ON TABLE CLASSIFICATION_LEVEL IS 'Provides the overall classification for marking the top and bottom of documents.';
COMMENT ON COLUMN CLASSIFICATION_LEVEL.CLASS_LEVEL_ID IS 'Classification Level Identifier.';
COMMENT ON COLUMN CLASSIFICATION_LEVEL.CLASS_LEVEL IS 'Level of Classification, e.g. SECRET';
COMMENT ON COLUMN CLASSIFICATION_LEVEL.PARAGRAPH_MARK IS 'Abbreviated classification for paragraph marking i.e. UNCLASSIFIED = U.';
COMMENT ON COLUMN CLASSIFICATION_LEVEL.AUTH IS 'Author';
COMMENT ON COLUMN CLASSIFICATION_LEVEL.LDDATE IS 'Load Date';

-- Table: CLASSIFICATION_LOOKUP
CREATE TABLE CLASSIFICATION_LOOKUP (
    CLASS_LOOKUP_ID NUMBER(18),
    APPLICATION VARCHAR2(64),
    CLASSIFICATION_ID NUMBER(18),
    ON_DATE DATE,
    OFF_DATE DATE,
    AUTH VARCHAR2(15),
    LDDATE DATE,
    MODDATE DATE,
    ,CONSTRAINT CLASSIFICATION_LOOKUP_PK PRIMARY KEY (CLASS_LOOKUP_ID),
    ,CONSTRAINT CLASS_LOOKUP__CLASS_ID__CK CHECK (classification_id > 0),
    ,CONSTRAINT CLASS_LOOKUP__CLASS_LU_ID__CK CHECK (class_lookup_id > 0)
);
COMMENT ON TABLE CLASSIFICATION_LOOKUP IS 'Looks up the classification information in the classificatio n table.';
COMMENT ON COLUMN CLASSIFICATION_LOOKUP.CLASS_LOOKUP_ID IS 'Classification Lookup Identifier.';
COMMENT ON COLUMN CLASSIFICATION_LOOKUP.APPLICATION IS 'The name of the application using the security marking, e.g. ARS, McTool.';
COMMENT ON COLUMN CLASSIFICATION_LOOKUP.CLASSIFICATION_ID IS 'Classification Identifier.';
COMMENT ON COLUMN CLASSIFICATION_LOOKUP.ON_DATE IS 'The date the classification becomes active.';
COMMENT ON COLUMN CLASSIFICATION_LOOKUP.OFF_DATE IS 'The date the classification becomes inactive or obsolete.';
COMMENT ON COLUMN CLASSIFICATION_LOOKUP.AUTH IS 'Author';
COMMENT ON COLUMN CLASSIFICATION_LOOKUP.LDDATE IS 'Load Date';
COMMENT ON COLUMN CLASSIFICATION_LOOKUP.MODDATE IS 'Modification date';

-- Table: CLASSIFICATION_OPR
CREATE TABLE CLASSIFICATION_OPR (
    CLASS_OPR_ID NUMBER(18),
    CLASS_OPR VARCHAR2(64),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CLASSIFICATION_OPR_PK PRIMARY KEY (CLASS_OPR_ID),
    ,CONSTRAINT CLASS_OPR__CLASS_OPR_ID__CK CHECK (class_opr_id > 0)
);
COMMENT ON TABLE CLASSIFICATION_OPR IS 'Used to contain the agency, office (or OPR) responsible for classification';
COMMENT ON COLUMN CLASSIFICATION_OPR.CLASS_OPR_ID IS 'See classification.class_opr_id description';
COMMENT ON COLUMN CLASSIFICATION_OPR.CLASS_OPR IS 'See table description';
COMMENT ON COLUMN CLASSIFICATION_OPR.AUTH IS 'Author';
COMMENT ON COLUMN CLASSIFICATION_OPR.LDDATE IS 'Load Date';

-- Table: CLASSIFICATION_REFER_TO
CREATE TABLE CLASSIFICATION_REFER_TO (
    CLASS_REFER_ID NUMBER(18),
    CLASS_REFER VARCHAR2(4000),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CLASSIFICATION_REFER_TO_PK PRIMARY KEY (CLASS_REFER_ID),
    ,CONSTRAINT CLASS_REF_TO__CLASS_REF_ID__CK CHECK (class_refer_id > 0)
);
COMMENT ON TABLE CLASSIFICATION_REFER_TO IS 'The classification_refer_to table will contain the "Refer to :..." information for the Exective Order Box.';
COMMENT ON COLUMN CLASSIFICATION_REFER_TO.CLASS_REFER_ID IS 'Class Refer To Identifier';
COMMENT ON COLUMN CLASSIFICATION_REFER_TO.CLASS_REFER IS 'The classification_refer_to.class_refer contains the "Refer to" string which follows the the "Declassify On" part of the Exective Order Box. It provides the source to refer to in order to properly de classify something.';
COMMENT ON COLUMN CLASSIFICATION_REFER_TO.AUTH IS 'Author';
COMMENT ON COLUMN CLASSIFICATION_REFER_TO.LDDATE IS 'Load Date';

-- Table: CLUSTER_INFO
CREATE TABLE CLUSTER_INFO (
    CLUID NUMBER(18),
    DESCRIP VARCHAR2(50),
    PREFOR NUMBER(18),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CLUSTER_INFO_PK PRIMARY KEY (CLUID),
    ,CONSTRAINT CLUSTER_INFO__CLUID__CK CHECK (cluid > 0),
    ,CONSTRAINT CLUSTER_INFO__PREFOR__CK CHECK (prefor > 0)
);
COMMENT ON TABLE CLUSTER_INFO IS 'The cluster_info table contains information relating to the cluster of events. It relates to versions of the same cluste r (same events) together. It also contains the orid of the e vent closest to the center of the cluster and the radius of the cluster.';
COMMENT ON COLUMN CLUSTER_INFO.CLUID IS 'Unique cluster ID';
COMMENT ON COLUMN CLUSTER_INFO.DESCRIP IS 'Text description of cluster';
COMMENT ON COLUMN CLUSTER_INFO.PREFOR IS 'Origin that is closest to the center of the cluster';
COMMENT ON COLUMN CLUSTER_INFO.AUTH IS 'Author';
COMMENT ON COLUMN CLUSTER_INFO.LDDATE IS 'Load date';

-- Table: CLUSTER_MAGREF
CREATE TABLE CLUSTER_MAGREF (
    CLUSTAID NUMBER(18),
    ACTIVETIME FLOAT(53),
    ORID NUMBER(18),
    AMPTYPE VARCHAR2(8),
    MTYPE VARCHAR2(15),
    MVALUE FLOAT(24),
    FILTERID NUMBER(18),
    LEAD FLOAT(24),
    DURATION FLOAT(24),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CLUSTER_MAGREF_PK PRIMARY KEY (CLUSTAID),
    ,CONSTRAINT CLUSTER_MAGREF__CLUSTAID__CK CHECK (clustaid > 0)
);
COMMENT ON TABLE CLUSTER_MAGREF IS 'The cluster_magref table provides the magnitude reference ev ent for the cluster. This reference event will be used in de termining the relative magnitude of new events found using t he SSD. Each cluster will need a magnitude reference event t o make a relative magnitude calculation on events identified by the SSD. If the magnitude reference event was not seen a t a refsta we will be unable to perform a relative magnitude calculation for that refsta.';
COMMENT ON COLUMN CLUSTER_MAGREF.CLUSTAID IS 'Cluster Sta ID';
COMMENT ON COLUMN CLUSTER_MAGREF.ACTIVETIME IS 'The epochtime a cluster was activated';
COMMENT ON COLUMN CLUSTER_MAGREF.ORID IS 'Orid of magref event';
COMMENT ON COLUMN CLUSTER_MAGREF.AMPTYPE IS 'Amplitude type';
COMMENT ON COLUMN CLUSTER_MAGREF.MTYPE IS 'Amplitude measurement type';
COMMENT ON COLUMN CLUSTER_MAGREF.MVALUE IS 'Amplitude measurement value (only required for specific mtype(s))';
COMMENT ON COLUMN CLUSTER_MAGREF.FILTERID IS 'Filter identifier that links to the butterworth filter table';
COMMENT ON COLUMN CLUSTER_MAGREF.LEAD IS 'Number of seconds before preferred phase for amplitude measurement';
COMMENT ON COLUMN CLUSTER_MAGREF.DURATION IS 'Total number of seconds of the waveform around the preferred phase for amplitude measurement';
COMMENT ON COLUMN CLUSTER_MAGREF.AUTH IS 'Author';
COMMENT ON COLUMN CLUSTER_MAGREF.LDDATE IS 'Load date';

-- Table: CLUSTER_MEC
CREATE TABLE CLUSTER_MEC (
    CLUSTAID NUMBER(18),
    STA VARCHAR2(6),
    PHASE VARCHAR2(8),
    ACTIVETIME FLOAT(53),
    CORR_TYPE VARCHAR2(16),
    CORRECTION FLOAT(24),
    UNCERTAINTY FLOAT(24),
    ONDATE NUMBER(8),
    OFFDATE NUMBER(8),
    TOTAL_EVENTS NUMBER(3),
    ,CONSTRAINT CLUSTER_MEC_PK PRIMARY KEY (STA),
    ,CONSTRAINT CLUSTER_MEC__CLUSTAID__CK CHECK (clustaid > 0),
    ,CONSTRAINT CLUSTER_MEC__STA__CK CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE CLUSTER_MEC IS 'The cluster_mec table provides the location correction infor mation for a sta (element). This information is used to refi ne the locations of origins. The flat file database (fdb) th at is imported into this table should not include commented lines. The cluster_mec''s format is the current output of jhd sat. It will have to be augmented by the addition of clustai d when it is imported into a US NDC cluster_mec table. This will make it possible to distinguish between two different e vent clusters for the same station.';
COMMENT ON COLUMN CLUSTER_MEC.CLUSTAID IS 'Cluster Station identifier';
COMMENT ON COLUMN CLUSTER_MEC.STA IS 'Element name';
COMMENT ON COLUMN CLUSTER_MEC.PHASE IS 'Phase';
COMMENT ON COLUMN CLUSTER_MEC.ACTIVETIME IS 'The epochtime a cluster was activated';
COMMENT ON COLUMN CLUSTER_MEC.CORR_TYPE IS 'Correction type (time, azimuth, slowness)';
COMMENT ON COLUMN CLUSTER_MEC.CORRECTION IS 'Correction value';
COMMENT ON COLUMN CLUSTER_MEC.UNCERTAINTY IS 'Model error';
COMMENT ON COLUMN CLUSTER_MEC.ONDATE IS 'Julian date that the correction is good from';
COMMENT ON COLUMN CLUSTER_MEC.OFFDATE IS 'Julian date that the correction is good to';
COMMENT ON COLUMN CLUSTER_MEC.TOTAL_EVENTS IS 'Total events used to create the MEC';

-- Table: CLUSTER_ORID
CREATE TABLE CLUSTER_ORID (
    CLUSTAID NUMBER(18),
    ORID NUMBER(18),
    ACTIVETIME FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT CLUSTER_ORID_PK PRIMARY KEY (ORID),
    ,CONSTRAINT CLUSTER_ORID_CLUSTAID_NN CHECK ("CLUSTAID" IS NOT NULL),
    ,CONSTRAINT CLUSTER_ORID_ORID_NN CHECK ("ORID" IS NOT NULL),
    ,CONSTRAINT CLUSTER_ORID__CLUSTAID__CK CHECK (clustaid > 0),
    ,CONSTRAINT CLUSTER_ORID__ORID__CK CHECK (orid > 0)
);
COMMENT ON TABLE CLUSTER_ORID IS 'The cluster_orid table provides the cluster to orid mapping.';
COMMENT ON COLUMN CLUSTER_ORID.CLUSTAID IS 'Cluster Station identifier';
COMMENT ON COLUMN CLUSTER_ORID.ORID IS 'Origin identifier';
COMMENT ON COLUMN CLUSTER_ORID.ACTIVETIME IS 'The epochtime a cluster was activated';
COMMENT ON COLUMN CLUSTER_ORID.LDDATE IS 'Load date';

-- Table: CLUSTER_OVERRIDE
CREATE TABLE CLUSTER_OVERRIDE (
    CLUSTAID NUMBER(18),
    ACTIVETIME FLOAT(53),
    THRESHOLD FLOAT(24),
    SSD_DIMENSION NUMBER(5),
    SVD_LEAD FLOAT(24),
    MIN_DETECTION_INTERVAL FLOAT(24),
    PREFPHASE VARCHAR2(16),
    LEAD FLOAT(24),
    LAG FLOAT(24),
    BEST_EVENT_MATCH_MULTIPLE FLOAT(24),
    PHASE_ONSET_MULTIPLE FLOAT(24),
    DET_TRACE_TRIM_MULTIPLE FLOAT(24),
    CHANNEL_MASKING_THRESHOLD FLOAT(24),
    PFA FLOAT(24),
    THRESHOLD_PERCENT_OVERLAP NUMBER(9),
    PHASE_SPECIFIC_OVERRIDE_REC VARCHAR2(32),
    MAX_DELAZ FLOAT(24),
    MAX_DELSLOW FLOAT(24),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CLUSTER_OVERRIDE_PK PRIMARY KEY (CLUSTAID),
    ,CONSTRAINT CLUSTER_OVERRIDE__ACTV__CK CHECK (activetime > 0),
    ,CONSTRAINT CLUSTER_OVERRIDE__BEMM__CK CHECK (best_event_match_multiple > 0 OR best_event_match_multiple = -1),
    ,CONSTRAINT CLUSTER_OVERRIDE__CLUSTAID__CK CHECK (clustaid > 0),
    ,CONSTRAINT CLUSTER_OVERRIDE__CMT__CK CHECK (channel_masking_threshold >= 0.0 AND channel_masking_threshold <= 1.0),
    ,CONSTRAINT CLUSTER_OVERRIDE__DTTM__CK CHECK (det_trace_trim_multiple > 0 OR det_trace_trim_multiple = -1),
    ,CONSTRAINT CLUSTER_OVERRIDE__LAG__CK CHECK (lag > 0 OR lag = -1),
    ,CONSTRAINT CLUSTER_OVERRIDE__LEAD__CK CHECK (lead > 0 OR lead = -1),
    ,CONSTRAINT CLUSTER_OVERRIDE__MDI__CK CHECK (min_detection_interval > 0 OR min_detection_interval = -1),
    ,CONSTRAINT CLUSTER_OVERRIDE__PFA__CK CHECK ((pfa >= 0.0 AND pfa <= 1.0 ) OR pfa = -1),
    ,CONSTRAINT CLUSTER_OVERRIDE__POM__CK CHECK (phase_onset_multiple > 0 OR phase_onset_multiple = -1),
    ,CONSTRAINT CLUSTER_OVERRIDE__SSD_DIM__CK CHECK (ssd_dimension >= 0),
    ,CONSTRAINT CLUSTER_OVERRIDE__SVD_LEAD__CK CHECK (svd_lead >= 0.0 OR svd_lead = -1.0),
    ,CONSTRAINT CLUSTER_OVERRIDE__TH__CK CHECK (( threshold >= 0.0 AND threshold <= 1.0 ) OR threshold = -1),
    ,CONSTRAINT CLUSTER_OVERRIDE__TPO__CK CHECK (threshold_percent_overlap > 0 OR threshold_percent_overlap = -1),
    ,CONSTRAINT CLUSTER_OVRD__MAX_DELAZ__CK CHECK (max_delaz > 0 OR max_delaz = -1),
    ,CONSTRAINT CLUSTER_OVRD__MAX_DELSL__CK CHECK (max_delslow > 0 OR max_delslow = -1)
);
COMMENT ON TABLE CLUSTER_OVERRIDE IS 'The cluster_override table contains Multiple Event Analysis (MEA) parameter file overrides for historical purposes. This table is populated when a new cluster version is pushed int o the NDC database with the previous override values.';
COMMENT ON COLUMN CLUSTER_OVERRIDE.CLUSTAID IS 'Cluster Station identifier';
COMMENT ON COLUMN CLUSTER_OVERRIDE.ACTIVETIME IS 'The epochtime a cluster was activated';
COMMENT ON COLUMN CLUSTER_OVERRIDE.THRESHOLD IS 'The threshold of the detector';
COMMENT ON COLUMN CLUSTER_OVERRIDE.SSD_DIMENSION IS 'Specifies how many SVD dimensions to use in the SVDDISC table.';
COMMENT ON COLUMN CLUSTER_OVERRIDE.SVD_LEAD IS 'The number of seconds from the start to the first phase of the waveforms used to generate the svds';
COMMENT ON COLUMN CLUSTER_OVERRIDE.MIN_DETECTION_INTERVAL IS 'This value is multiplied by the data''s sample rate to determine the MEA detection window size.';
COMMENT ON COLUMN CLUSTER_OVERRIDE.PREFPHASE IS 'Preferred phase.';
COMMENT ON COLUMN CLUSTER_OVERRIDE.LEAD IS 'Number of seconds preceding phase that makes up the reference waveform';
COMMENT ON COLUMN CLUSTER_OVERRIDE.LAG IS 'Number of seconds following preferred phase that makes up the reference waveform';
COMMENT ON COLUMN CLUSTER_OVERRIDE.BEST_EVENT_MATCH_MULTIPLE IS 'This value is multiplied by a MEA detection window to extend the window to perform correlation to find the best event match.';
COMMENT ON COLUMN CLUSTER_OVERRIDE.PHASE_ONSET_MULTIPLE IS 'This value is multiplied by the phase''s lead and lag duration to create a window to perform correlation to refine phase onset time.';
COMMENT ON COLUMN CLUSTER_OVERRIDE.DET_TRACE_TRIM_MULTIPLE IS 'The value is multiplied by the length of one SVD to define how much to trim from both ends of a detection statistic trace.';
COMMENT ON COLUMN CLUSTER_OVERRIDE.CHANNEL_MASKING_THRESHOLD IS 'The proportion of a channel that can be masked before the channel is removed from the threshold calculation';
COMMENT ON COLUMN CLUSTER_OVERRIDE.PFA IS 'Probability of false alarm';
COMMENT ON COLUMN CLUSTER_OVERRIDE.THRESHOLD_PERCENT_OVERLAP IS 'Percent overlap';
COMMENT ON COLUMN CLUSTER_OVERRIDE.PHASE_SPECIFIC_OVERRIDE_REC IS 'Name of the phase override recipe to use (''-'' value represents no override desired).';
COMMENT ON COLUMN CLUSTER_OVERRIDE.MAX_DELAZ IS 'Allowable difference between suspect azimuth and sta-cluster azimuth seconds per kilometer';
COMMENT ON COLUMN CLUSTER_OVERRIDE.MAX_DELSLOW IS 'Allowable difference between suspect slowness and ref slowness seconds per kilometer';
COMMENT ON COLUMN CLUSTER_OVERRIDE.AUTH IS 'Author';
COMMENT ON COLUMN CLUSTER_OVERRIDE.LDDATE IS 'Load date';

-- Table: CLUSTER_PHASE_OVERRIDE
CREATE TABLE CLUSTER_PHASE_OVERRIDE (
    CLUSTAID NUMBER(18),
    ACTIVETIME FLOAT(53),
    PHASE_SPECIFIC_OVERRIDE_REC VARCHAR2(32),
    PHASE VARCHAR2(8),
    LEAD FLOAT(24),
    LAG FLOAT(24),
    FLO FLOAT(24),
    FHI FLOAT(24),
    MAXADJ FLOAT(24),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CLUSTER_PHASE_OVERRIDE_PK PRIMARY KEY (PHASE_SPECIFIC_OVERRIDE_REC),
    ,CONSTRAINT CLUSTER_PHASE_OVRD__ACTV__CK CHECK (activetime > 0),
    ,CONSTRAINT CLUSTER_PHASE_OVRD__FHI__CK CHECK (fhi > 0),
    ,CONSTRAINT CLUSTER_PHASE_OVRD__FLO__CK CHECK (flo > 0),
    ,CONSTRAINT CLUSTER_PHASE_OVRD__LAG__CK CHECK (lag > 0 OR lag = -1),
    ,CONSTRAINT CLUSTER_PHASE_OVRD__LEAD__CK CHECK (lead > 0 OR lead = -1),
    ,CONSTRAINT CLUSTER_PHASE_OVRD__MAXADJ__CK CHECK (maxadj > 0 OR maxadj = -1),
    ,CONSTRAINT CLUSTER_PHSE_OVRD__CLSTAID__CK CHECK (clustaid > 0)
);
COMMENT ON TABLE CLUSTER_PHASE_OVERRIDE IS 'The cluster_phase_override table contains Multiple Event Ana lysis (MEA) parameter file overrides for historical purposes . This table is populated when a new cluster version is push ed into the NDC database with the previous override values.';
COMMENT ON COLUMN CLUSTER_PHASE_OVERRIDE.CLUSTAID IS 'Cluster Station identifier';
COMMENT ON COLUMN CLUSTER_PHASE_OVERRIDE.ACTIVETIME IS 'The epochtime a cluster was activated.';
COMMENT ON COLUMN CLUSTER_PHASE_OVERRIDE.PHASE_SPECIFIC_OVERRIDE_REC IS 'Name of the phase override recipe to use (''-'' -> >value represents no override desired).';
COMMENT ON COLUMN CLUSTER_PHASE_OVERRIDE.PHASE IS 'Phase type';
COMMENT ON COLUMN CLUSTER_PHASE_OVERRIDE.LEAD IS 'Number of seconds preceding phase that makes up the reference waveform.';
COMMENT ON COLUMN CLUSTER_PHASE_OVERRIDE.LAG IS 'Number of seconds following preferred phase that makes up the reference waveform.';
COMMENT ON COLUMN CLUSTER_PHASE_OVERRIDE.FLO IS 'Low corner frequency for filter.';
COMMENT ON COLUMN CLUSTER_PHASE_OVERRIDE.FHI IS 'High corner frequency for filter.';
COMMENT ON COLUMN CLUSTER_PHASE_OVERRIDE.MAXADJ IS 'The maximum time in seconds that a phase can be adjusted.';
COMMENT ON COLUMN CLUSTER_PHASE_OVERRIDE.AUTH IS 'Author';
COMMENT ON COLUMN CLUSTER_PHASE_OVERRIDE.LDDATE IS 'Load date';

-- Table: CLUSTER_STATION
CREATE TABLE CLUSTER_STATION (
    CLUSTAID NUMBER(18),
    ACTIVETIME FLOAT(53),
    CLUID NUMBER(18),
    STA VARCHAR2(6),
    MAX_DELAZ FLOAT(24),
    MAX_DELSLOW FLOAT(24),
    SSD_DIMENSION NUMBER(5),
    SVD_LEAD FLOAT(24),
    SVD_LAG FLOAT(24),
    PREFPHASE VARCHAR2(16),
    LEAD FLOAT(24),
    LAG FLOAT(24),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CLUSTER_STATION_PK PRIMARY KEY (ACTIVETIME)
);
COMMENT ON TABLE CLUSTER_STATION IS 'The cluster_station table is used to store station-specific (not element-specific) information, e.g., stations used in c luster, azimuth limits, slowness limits.';
COMMENT ON COLUMN CLUSTER_STATION.CLUSTAID IS 'Cluster Station identifier';
COMMENT ON COLUMN CLUSTER_STATION.ACTIVETIME IS 'The epochtime a cluster was activated';
COMMENT ON COLUMN CLUSTER_STATION.CLUID IS 'Numeric cluster identifier';
COMMENT ON COLUMN CLUSTER_STATION.STA IS 'Station to which array elements are referenced; used to identify sites to include in cluster';
COMMENT ON COLUMN CLUSTER_STATION.MAX_DELAZ IS 'Allowable difference between suspect azimuth and sta-cluster azimuth seconds per kilometer';
COMMENT ON COLUMN CLUSTER_STATION.MAX_DELSLOW IS 'Allowable difference between suspect slowness and ref slowness seconds per kilometer';
COMMENT ON COLUMN CLUSTER_STATION.SSD_DIMENSION IS 'Number of subspace vectors to include for sta/chan processing';
COMMENT ON COLUMN CLUSTER_STATION.SVD_LEAD IS 'The number of seconds from the start to the first phase of the waveforms used to generate the svds';
COMMENT ON COLUMN CLUSTER_STATION.SVD_LAG IS 'The number of seconds from the start to the first phase of the waveforms used to generate the svds';
COMMENT ON COLUMN CLUSTER_STATION.PREFPHASE IS 'Preferred Phase';
COMMENT ON COLUMN CLUSTER_STATION.LEAD IS 'Number of seconds preceding phase that makes up the reference waveform';
COMMENT ON COLUMN CLUSTER_STATION.LAG IS 'Number of seconds following preferred phase that makes up the reference waveform';
COMMENT ON COLUMN CLUSTER_STATION.AUTH IS 'Author';
COMMENT ON COLUMN CLUSTER_STATION.LDDATE IS 'Load date of the data';

-- Table: CLUSTER_THRESHOLD
CREATE TABLE CLUSTER_THRESHOLD (
    CLUSTAID NUMBER(18),
    DETECTOR_TYPE VARCHAR2(16),
    SSD_DIMENSION NUMBER(5),
    ACTIVETIME FLOAT(53),
    ORID NUMBER(18),
    THRESHOLD FLOAT(24),
    PFA FLOAT(24),
    OVERLAP NUMBER(9),
    CHANNEL_MASKING_THRESHOLD FLOAT(24),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CLUSTER_THRESHOLD_PK PRIMARY KEY (CLUSTAID),
    ,CONSTRAINT CLUSTER_THRESHOLD__CA__CK CHECK (clustaid > 0),
    ,CONSTRAINT CLUSTER_THRESHOLD__SSD_DIM__CK CHECK (ssd_dimension >= 0)
);
COMMENT ON TABLE CLUSTER_THRESHOLD IS 'The cluster_threshold table provides the threshold informati on for the cluster. It is possible for a cluster to have sev eral different threshold values.';
COMMENT ON COLUMN CLUSTER_THRESHOLD.CLUSTAID IS 'Cluster Station identifier';
COMMENT ON COLUMN CLUSTER_THRESHOLD.DETECTOR_TYPE IS 'The dector type to use with this threshold (SSD, CORR, AMP)';
COMMENT ON COLUMN CLUSTER_THRESHOLD.SSD_DIMENSION IS 'SSD Dimension';
COMMENT ON COLUMN CLUSTER_THRESHOLD.ACTIVETIME IS 'The epochtime a cluster was activated';
COMMENT ON COLUMN CLUSTER_THRESHOLD.ORID IS 'The orid used to create the threshold if this is a correlation threshold otherwise the value is 0';
COMMENT ON COLUMN CLUSTER_THRESHOLD.THRESHOLD IS 'The threshold of the detector';
COMMENT ON COLUMN CLUSTER_THRESHOLD.PFA IS 'Probability of false alarm';
COMMENT ON COLUMN CLUSTER_THRESHOLD.OVERLAP IS 'Percent overlap';
COMMENT ON COLUMN CLUSTER_THRESHOLD.CHANNEL_MASKING_THRESHOLD IS 'The proportion of a channel that can be masked before the channel is removed from the threshold calculation';
COMMENT ON COLUMN CLUSTER_THRESHOLD.AUTH IS 'Author';
COMMENT ON COLUMN CLUSTER_THRESHOLD.LDDATE IS 'Load date';

-- Table: CODAMAG_INPUT
CREATE TABLE CODAMAG_INPUT (
    AMPID NUMBER(18),
    FLO FLOAT(24),
    FHI FLOAT(24),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    ORID NUMBER(18),
    ARID NUMBER(18),
    AMPDEF VARCHAR2(1),
    DELTA FLOAT(24),
    BWRATIO FLOAT(24),
    SAMPRATE FLOAT(24),
    ENVSLOW FLOAT(24),
    HWIDE FLOAT(24),
    POLYID NUMBER(18),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    NOISE_START_TIME FLOAT(53),
    NOISE_END_TIME FLOAT(53),
    TMEAS FLOAT(53),
    SHAPE_SPREADING FLOAT(24),
    SHAPE_DECAY FLOAT(24),
    SHAPEDMIN FLOAT(24),
    SHAPEDMAX FLOAT(24),
    PEAK_VELOCITY FLOAT(24),
    VGDMIN FLOAT(24),
    VGDMAX FLOAT(24),
    PATH_COR_TYPE VARCHAR2(8),
    PATH_COR FLOAT(24),
    SITE_COR FLOAT(24),
    SITEUNIT VARCHAR2(9),
    WMODEL_NAME VARCHAR2(50),
    YINTERCEPT FLOAT(24),
    YSLOPE FLOAT(24),
    FFACTOR FLOAT(24),
    SRC_REGION VARCHAR2(50),
    MBINTERCEPT FLOAT(24),
    MBSLOPE FLOAT(24),
    MBSIGMA FLOAT(24),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CODAMAG_INPUT_PK PRIMARY KEY (FLO),
    ,CONSTRAINT CODAMAG_INPUT__AMPDEF__CK CHECK (ampdef IN ( 'd','n','D','N' )),
    ,CONSTRAINT CODAMAG_INPUT__AMPID__CK CHECK (ampid > 0),
    ,CONSTRAINT CODAMAG_INPUT__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT CODAMAG_INPUT__BWRATIO__CK CHECK (bwratio > 0.0 OR bwratio = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__DELTA__CK CHECK ((delta >= 0.0 AND delta <= 180.0) OR delta = -1.0),
    ,CONSTRAINT CODAMAG_INPUT__ENDTIME__CK CHECK (endtime < 9999999999.999),
    ,CONSTRAINT CODAMAG_INPUT__ENVSLOW__CK CHECK (envslow >= 0.0 OR envslow = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__FFACTOR__CK CHECK (ffactor > 0.0 OR ffactor = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__HWIDE__CK CHECK (hwide >= 0.0),
    ,CONSTRAINT CODAMAG_INPUT__MBINTERCEPT__CK CHECK (mbintercept >= -999.0),
    ,CONSTRAINT CODAMAG_INPUT__MBSIGMA__CK CHECK (mbsigma > 0.0 OR mbsigma = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__MBSLOPE__CK CHECK (mbslope > 0.0 OR mbslope = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__NEND_TIME__CK CHECK (noise_end_time < 9999999999.999),
    ,CONSTRAINT CODAMAG_INPUT__NSTART_TIME__CK CHECK (noise_start_time > -9999999999.999),
    ,CONSTRAINT CODAMAG_INPUT__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT CODAMAG_INPUT__PATHCORTYPE__CK CHECK (path_cor_type in ('none', '1D', '2D','-')),
    ,CONSTRAINT CODAMAG_INPUT__PATHCOR__CK CHECK (path_cor >= -999.0),
    ,CONSTRAINT CODAMAG_INPUT__PEAKVEL__CK CHECK (peak_velocity > 0.0 OR peak_velocity = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__POLYID__CK CHECK (polyid > 0 OR polyid = -1),
    ,CONSTRAINT CODAMAG_INPUT__SAMPRATE__CK CHECK (samprate > 0.0),
    ,CONSTRAINT CODAMAG_INPUT__SHAPEDECAY__CK CHECK (shape_decay > 0.0 OR shape_decay = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__SHAPEDMAX__CK CHECK (shapedmax > 0.0 OR shapedmax = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__SHAPEDMIN__CK CHECK (shapedmin >= 0.0 OR shapedmin = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__SHAPESPREAD__CK CHECK (shape_spreading > 0.0 OR shape_spreading = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__SITECOR__CK CHECK (site_cor > 0.0 OR site_cor = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT CODAMAG_INPUT__TIME__CK CHECK (time > -9999999999.999),
    ,CONSTRAINT CODAMAG_INPUT__TMEAS__CK CHECK (tmeas >= -9999999999.999),
    ,CONSTRAINT CODAMAG_INPUT__VGDMAX__CK CHECK (vgdmax > 0.0 OR vgdmax = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__VGDMIN__CK CHECK (vgdmin > 0.0 OR vgdmin = -999.0),
    ,CONSTRAINT CODAMAG_INPUT__YINTERCEPT__CK CHECK (yintercept >= -999.0),
    ,CONSTRAINT CODAMAG_INPUT__YSLOPE__CK CHECK (yslope > 0.0 OR yslope = -999.0)
);
COMMENT ON TABLE CODAMAG_INPUT IS 'The codamag_input table contains key input parameters that a re used to calculate coda amplitudes, including the boundari es of the noise and signal windows and the path and site cor rection values.';
COMMENT ON COLUMN CODAMAG_INPUT.AMPID IS 'Amplitude identifier';
COMMENT ON COLUMN CODAMAG_INPUT.FLO IS 'Low corner freq for filter';
COMMENT ON COLUMN CODAMAG_INPUT.FHI IS 'High corner freq for filter';
COMMENT ON COLUMN CODAMAG_INPUT.STA IS 'Station code';
COMMENT ON COLUMN CODAMAG_INPUT.CHAN IS 'Channel code';
COMMENT ON COLUMN CODAMAG_INPUT.ORID IS 'Origin identifier';
COMMENT ON COLUMN CODAMAG_INPUT.ARID IS 'LR arrival identifier';
COMMENT ON COLUMN CODAMAG_INPUT.AMPDEF IS 'd or n flag indicating if station/element is included (d,D) or excluded (n,N) from coda magnitude processing';
COMMENT ON COLUMN CODAMAG_INPUT.DELTA IS 'Source-receiver distance';
COMMENT ON COLUMN CODAMAG_INPUT.BWRATIO IS 'Pre-filter bandwidth to Nyquist ratio';
COMMENT ON COLUMN CODAMAG_INPUT.SAMPRATE IS 'The sample rate of the data corresponding to this record';
COMMENT ON COLUMN CODAMAG_INPUT.ENVSLOW IS 'Slowness for envelope stacking';
COMMENT ON COLUMN CODAMAG_INPUT.HWIDE IS 'Smoothing half-width for boxcar smoothing';
COMMENT ON COLUMN CODAMAG_INPUT.POLYID IS 'Polygon identifier for calibrated region';
COMMENT ON COLUMN CODAMAG_INPUT.TIME IS 'Epoch start time of signal window';
COMMENT ON COLUMN CODAMAG_INPUT.ENDTIME IS 'Epoch end time of signal window';
COMMENT ON COLUMN CODAMAG_INPUT.NOISE_START_TIME IS 'Epoch start time of noise window';
COMMENT ON COLUMN CODAMAG_INPUT.NOISE_END_TIME IS 'Epoch end time of noise window';
COMMENT ON COLUMN CODAMAG_INPUT.TMEAS IS 'Time of coda amplitude measurement';
COMMENT ON COLUMN CODAMAG_INPUT.SHAPE_SPREADING IS 'Coda shape spreading factor';
COMMENT ON COLUMN CODAMAG_INPUT.SHAPE_DECAY IS 'Coda shape attenuation decay factor';
COMMENT ON COLUMN CODAMAG_INPUT.SHAPEDMIN IS 'Minimum 1-D calibration distance for coda decay and spreading';
COMMENT ON COLUMN CODAMAG_INPUT.SHAPEDMAX IS 'Maximum 1-D calibration distance for coda decay and spreading';
COMMENT ON COLUMN CODAMAG_INPUT.PEAK_VELOCITY IS 'Synthetic envelope peak velocity';
COMMENT ON COLUMN CODAMAG_INPUT.VGDMIN IS 'Minimum 1-D calibration distance for peak velocity';
COMMENT ON COLUMN CODAMAG_INPUT.VGDMAX IS 'Maximum 1-D calibration distance for peak velocity';
COMMENT ON COLUMN CODAMAG_INPUT.PATH_COR_TYPE IS 'Path correction type (1D or 2D)';
COMMENT ON COLUMN CODAMAG_INPUT.PATH_COR IS 'Path correction (log10)';
COMMENT ON COLUMN CODAMAG_INPUT.SITE_COR IS 'Site correction (log10)';
COMMENT ON COLUMN CODAMAG_INPUT.SITEUNIT IS 'Unit for site correction term';
COMMENT ON COLUMN CODAMAG_INPUT.WMODEL_NAME IS 'Yield model name';
COMMENT ON COLUMN CODAMAG_INPUT.YINTERCEPT IS 'Yield line fit intercept';
COMMENT ON COLUMN CODAMAG_INPUT.YSLOPE IS 'Yield line fit slope';
COMMENT ON COLUMN CODAMAG_INPUT.FFACTOR IS 'Yield F factor (log 10)';
COMMENT ON COLUMN CODAMAG_INPUT.SRC_REGION IS 'Source region name';
COMMENT ON COLUMN CODAMAG_INPUT.MBINTERCEPT IS 'mb line fit intercept';
COMMENT ON COLUMN CODAMAG_INPUT.MBSLOPE IS 'mb line fit slope';
COMMENT ON COLUMN CODAMAG_INPUT.MBSIGMA IS 'mb misfit for weighting';
COMMENT ON COLUMN CODAMAG_INPUT.AUTH IS 'Author';
COMMENT ON COLUMN CODAMAG_INPUT.LDDATE IS 'Load Date';

-- Table: CODAMAG_OUTPUT
CREATE TABLE CODAMAG_OUTPUT (
    AMPID NUMBER(18),
    FLO FLOAT(24),
    FHI FLOAT(24),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    ORID NUMBER(18),
    ARID NUMBER(18),
    DELTA FLOAT(24),
    RAW_AMP FLOAT(24),
    UNCERTAINTY FLOAT(24),
    NOISE_AMP FLOAT(24),
    AMPCOR FLOAT(24),
    AMP_WGT FLOAT(24),
    MB_CODA FLOAT(24),
    YIELD FLOAT(24),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT CODAMAG_OUTPUT_PK PRIMARY KEY (FLO),
    ,CONSTRAINT CODAMAG_OUTPUT__AMPCOR__CK CHECK (ampcor >= -999.0),
    ,CONSTRAINT CODAMAG_OUTPUT__AMPID__CK CHECK (ampid > 0),
    ,CONSTRAINT CODAMAG_OUTPUT__AMP_WGT__CK CHECK ((amp_wgt >= 0.0 AND amp_wgt <= 1.0) OR amp_wgt = -999.0),
    ,CONSTRAINT CODAMAG_OUTPUT__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT CODAMAG_OUTPUT__DELTA__CK CHECK ((delta >= 0.0 AND delta <= 180.0) OR delta = -1.0),
    ,CONSTRAINT CODAMAG_OUTPUT__MB_CODA__CK CHECK ((mb_coda > -9.99 AND mb_coda < 50.00) OR mb_coda = -999.0),
    ,CONSTRAINT CODAMAG_OUTPUT__NOISE_AMP__CK CHECK (noise_amp >= -999.0),
    ,CONSTRAINT CODAMAG_OUTPUT__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT CODAMAG_OUTPUT__RAW_AMP__CK CHECK (raw_amp >= -999.0),
    ,CONSTRAINT CODAMAG_OUTPUT__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT CODAMAG_OUTPUT__UNCERTNTY__CK CHECK (uncertainty > 0.0 OR uncertainty = -1.0),
    ,CONSTRAINT CODAMAG_OUTPUT__YIELD__CK CHECK (yield >= 0.0 OR yield = -1.0)
);
COMMENT ON TABLE CODAMAG_OUTPUT IS 'The codamag_output table contains raw and corrected coda amp litudes for each station/channel/frequency band.';
COMMENT ON COLUMN CODAMAG_OUTPUT.AMPID IS 'Amplitude identifier';
COMMENT ON COLUMN CODAMAG_OUTPUT.FLO IS 'Low corner freq for filter';
COMMENT ON COLUMN CODAMAG_OUTPUT.FHI IS 'High corner freq for filter';
COMMENT ON COLUMN CODAMAG_OUTPUT.STA IS 'Station code';
COMMENT ON COLUMN CODAMAG_OUTPUT.CHAN IS 'Channel code';
COMMENT ON COLUMN CODAMAG_OUTPUT.ORID IS 'Origin identifier';
COMMENT ON COLUMN CODAMAG_OUTPUT.ARID IS 'Arrival identifier';
COMMENT ON COLUMN CODAMAG_OUTPUT.DELTA IS 'Source-receiver distance';
COMMENT ON COLUMN CODAMAG_OUTPUT.RAW_AMP IS 'Raw (uncorrected) Coda amplitude';
COMMENT ON COLUMN CODAMAG_OUTPUT.UNCERTAINTY IS 'Uncertainty for Raw (uncorrected) Coda amplitude';
COMMENT ON COLUMN CODAMAG_OUTPUT.NOISE_AMP IS 'Amplitude of noise window';
COMMENT ON COLUMN CODAMAG_OUTPUT.AMPCOR IS 'Amplitude value corrected for path and site';
COMMENT ON COLUMN CODAMAG_OUTPUT.AMP_WGT IS 'Calculated moment amplitude weight factor';
COMMENT ON COLUMN CODAMAG_OUTPUT.MB_CODA IS 'Body coda wave magnitude value';
COMMENT ON COLUMN CODAMAG_OUTPUT.YIELD IS 'Yield';
COMMENT ON COLUMN CODAMAG_OUTPUT.AUTH IS 'Author';
COMMENT ON COLUMN CODAMAG_OUTPUT.LDDATE IS 'Load date';

-- Table: CONTINUOUS_DATA_STATUS
CREATE TABLE CONTINUOUS_DATA_STATUS (
    STATUS_ID NUMBER(18),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    INDICATOR VARCHAR2(64),
    START_DATE DATE,
    END_DATE DATE,
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT CONTINUOUS_DATA_STATUS_PK PRIMARY KEY (STATUS_ID),
    ,CONSTRAINT CD_STATUS__STATUS_ID__CK CHECK (status_id > 0)
);
COMMENT ON TABLE CONTINUOUS_DATA_STATUS IS 'A table tracking the SOH indicators embedded in the CD1.1 Da ta Frame';
COMMENT ON COLUMN CONTINUOUS_DATA_STATUS.STATUS_ID IS 'CD Data Status Identifier';
COMMENT ON COLUMN CONTINUOUS_DATA_STATUS.STA IS 'Station code';
COMMENT ON COLUMN CONTINUOUS_DATA_STATUS.CHAN IS 'Channel code';
COMMENT ON COLUMN CONTINUOUS_DATA_STATUS.INDICATOR IS 'Status of Health Indicator from the CD1.1 Data Frame';
COMMENT ON COLUMN CONTINUOUS_DATA_STATUS.START_DATE IS 'Initial time the indicator was enabled';
COMMENT ON COLUMN CONTINUOUS_DATA_STATUS.END_DATE IS 'Last time for which the indicator was enabled';
COMMENT ON COLUMN CONTINUOUS_DATA_STATUS.AUTHOR IS 'Author';
COMMENT ON COLUMN CONTINUOUS_DATA_STATUS.MODDATE IS 'Modification date';
COMMENT ON COLUMN CONTINUOUS_DATA_STATUS.LDDATE IS 'Load date';

-- Table: DA_INTERVAL
CREATE TABLE DA_INTERVAL (
    INTVLID NUMBER(18),
    CLASS VARCHAR2(16),
    NAME VARCHAR2(20),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    STATE VARCHAR2(16),
    AUTH VARCHAR2(15),
    PERCENT_AVAILABLE FLOAT(53),
    PROC_START_DATE DATE,
    PROC_END_DATE DATE,
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT DA_INTERVAL_PK PRIMARY KEY (CLASS),
    ,CONSTRAINT DA_INTERVAL_UK UNIQUE (INTVLID),
    ,CONSTRAINT DA_INTVL__ENDTIME__CK CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT DA_INTVL__INTVLID__CK CHECK (intvlid > 0),
    ,CONSTRAINT DA_INTVL__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE DA_INTERVAL IS 'The da_interval table defines units of processing for data a cquistion . The time, endtime, and name types indicate proce ssing times for a named object. The class type allows a sing le interval table to be used for different classes of object s.';
COMMENT ON COLUMN DA_INTERVAL.INTVLID IS 'Interval identifier';
COMMENT ON COLUMN DA_INTERVAL.CLASS IS 'Type of interval';
COMMENT ON COLUMN DA_INTERVAL.NAME IS 'Name of interval';
COMMENT ON COLUMN DA_INTERVAL.TIME IS 'Starting time of data';
COMMENT ON COLUMN DA_INTERVAL.ENDTIME IS 'Ending time of data';
COMMENT ON COLUMN DA_INTERVAL.STATE IS 'Current processing state';
COMMENT ON COLUMN DA_INTERVAL.AUTH IS 'Author of interval';
COMMENT ON COLUMN DA_INTERVAL.PERCENT_AVAILABLE IS 'Percent of data available in interval';
COMMENT ON COLUMN DA_INTERVAL.PROC_START_DATE IS 'Processing start date';
COMMENT ON COLUMN DA_INTERVAL.PROC_END_DATE IS 'Processing stop date';
COMMENT ON COLUMN DA_INTERVAL.MODDATE IS 'Time of last processing state change';
COMMENT ON COLUMN DA_INTERVAL.LDDATE IS 'Load date';

-- Table: DA_REFSTA_LATENCY
CREATE TABLE DA_REFSTA_LATENCY (
    LATENCY_ID NUMBER(18),
    STA VARCHAR2(6),
    INTERVAL_START_TIME DATE,
    INTERVAL_END_TIME DATE,
    MIN_LATENCY_SECS FLOAT(53),
    MAX_LATENCY_SECS FLOAT(53),
    TOTAL_SECS FLOAT(53),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT DA_REFSTA_LATENCY_PK PRIMARY KEY (LATENCY_ID),
    ,CONSTRAINT DA_REFSTA_LATENCY__LAT_ID__CK CHECK (latency_id > 0),
    ,CONSTRAINT DA_REFSTA_LATENCY__STA__CK CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE DA_REFSTA_LATENCY IS 'The da_refsta_latency table contains latency data for the re ference stations.';
COMMENT ON COLUMN DA_REFSTA_LATENCY.LATENCY_ID IS 'Unique identifier for latency tables.';
COMMENT ON COLUMN DA_REFSTA_LATENCY.STA IS 'Station code.';
COMMENT ON COLUMN DA_REFSTA_LATENCY.INTERVAL_START_TIME IS 'Start time of the interval.';
COMMENT ON COLUMN DA_REFSTA_LATENCY.INTERVAL_END_TIME IS 'End time of the interval.';
COMMENT ON COLUMN DA_REFSTA_LATENCY.MIN_LATENCY_SECS IS 'Minimum latency in seconds.';
COMMENT ON COLUMN DA_REFSTA_LATENCY.MAX_LATENCY_SECS IS 'Maximum latency in seconds.';
COMMENT ON COLUMN DA_REFSTA_LATENCY.TOTAL_SECS IS 'Total seconds of latency.';
COMMENT ON COLUMN DA_REFSTA_LATENCY.AUTHOR IS 'Source/originator';
COMMENT ON COLUMN DA_REFSTA_LATENCY.MODDATE IS 'Modification date';
COMMENT ON COLUMN DA_REFSTA_LATENCY.LDDATE IS 'Load date';

-- Table: DA_REFSTA_SUMMARY
CREATE TABLE DA_REFSTA_SUMMARY (
    SUMMARY_ID NUMBER(18),
    STA VARCHAR2(6),
    INTERVAL_START_TIME DATE,
    INTERVAL_END_TIME DATE,
    PERCENT FLOAT(53),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT DA_REFSTA_SUMMARY_PK PRIMARY KEY (SUMMARY_ID),
    ,CONSTRAINT DA_REFSTA_SUMMARY__PERCENT__CK CHECK (percent >= 0.0 AND percent <= 1.0),
    ,CONSTRAINT DA_REFSTA_SUMMARY__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT DA_REFSTA_SUMMARY__SUM_ID__CK CHECK (summary_id > 0)
);
COMMENT ON TABLE DA_REFSTA_SUMMARY IS 'Summary of expected percentage of data available for a refer ence station.';
COMMENT ON COLUMN DA_REFSTA_SUMMARY.SUMMARY_ID IS 'Unique identifier for summary tables.';
COMMENT ON COLUMN DA_REFSTA_SUMMARY.STA IS 'Station code.';
COMMENT ON COLUMN DA_REFSTA_SUMMARY.INTERVAL_START_TIME IS 'Start time of the interval.';
COMMENT ON COLUMN DA_REFSTA_SUMMARY.INTERVAL_END_TIME IS 'End time of the interval.';
COMMENT ON COLUMN DA_REFSTA_SUMMARY.PERCENT IS 'Percentage of data available in wfdiscs.';
COMMENT ON COLUMN DA_REFSTA_SUMMARY.AUTHOR IS 'Source/originator';
COMMENT ON COLUMN DA_REFSTA_SUMMARY.MODDATE IS 'Modification date';
COMMENT ON COLUMN DA_REFSTA_SUMMARY.LDDATE IS 'Load date';

-- Table: DA_SITECHAN_LATENCY
CREATE TABLE DA_SITECHAN_LATENCY (
    LATENCY_ID NUMBER(18),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    INTERVAL_START_TIME DATE,
    INTERVAL_END_TIME DATE,
    MIN_LATENCY_SECS FLOAT(53),
    MAX_LATENCY_SECS FLOAT(53),
    TOTAL_SECS FLOAT(53),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT DA_SITECHAN_LATENCY_PK PRIMARY KEY (LATENCY_ID),
    ,CONSTRAINT DA_SITECHAN_LATENCY__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT DA_SITECHAN_LAT__LAT_ID__CK CHECK (latency_id > 0)
);
COMMENT ON TABLE DA_SITECHAN_LATENCY IS 'The da_sitechan_latency table contains latency data for the stations and channels.';
COMMENT ON COLUMN DA_SITECHAN_LATENCY.LATENCY_ID IS 'Unique identifier for latency tables.';
COMMENT ON COLUMN DA_SITECHAN_LATENCY.STA IS 'Station code.';
COMMENT ON COLUMN DA_SITECHAN_LATENCY.CHAN IS 'Channel code.';
COMMENT ON COLUMN DA_SITECHAN_LATENCY.INTERVAL_START_TIME IS 'Start time of the interval.';
COMMENT ON COLUMN DA_SITECHAN_LATENCY.INTERVAL_END_TIME IS 'End time of the interval.';
COMMENT ON COLUMN DA_SITECHAN_LATENCY.MIN_LATENCY_SECS IS 'Minimum latency in seconds.';
COMMENT ON COLUMN DA_SITECHAN_LATENCY.MAX_LATENCY_SECS IS 'Maximum latency in seconds.';
COMMENT ON COLUMN DA_SITECHAN_LATENCY.TOTAL_SECS IS 'Total seconds of latency.';
COMMENT ON COLUMN DA_SITECHAN_LATENCY.AUTHOR IS 'Source/originator';
COMMENT ON COLUMN DA_SITECHAN_LATENCY.MODDATE IS 'Modification date';
COMMENT ON COLUMN DA_SITECHAN_LATENCY.LDDATE IS 'Load date';

-- Table: DATAUSER
CREATE TABLE DATAUSER (
    USERID NUMBER(18),
    POCID NUMBER(18),
    USERNAME VARCHAR2(24),
    DOMAIN VARCHAR2(48),
    MSGTYPE VARCHAR2(16),
    USERSTATUS VARCHAR2(24),
    PRIORITY NUMBER(2),
    COMMID NUMBER(18),
    EMAILLIMIT NUMBER(8),
    SERVICETIME FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT DATAUSER_PK PRIMARY KEY (USERID),
    ,CONSTRAINT DATAUSER__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT DATAUSER__EMAILLIMIT__CK CHECK (emaillimit >= 0 OR emaillimit = -1),
    ,CONSTRAINT DATAUSER__POCID__CK CHECK (pocid > 0 OR pocid = -1),
    ,CONSTRAINT DATAUSER__PRIORITY__CK CHECK (priority > 0),
    ,CONSTRAINT DATAUSER__SERVICETIME__CK CHECK (servicetime >= 0.0 OR servicetime = -9999999999.999),
    ,CONSTRAINT DATAUSER__USERID__CK CHECK (userid > 0 OR userid = -1),
    ,CONSTRAINT DATAUSER__USERSTATUS__CK CHECK (userstatus IN ('ACTIVE', 'INACTIVE'))
);
COMMENT ON TABLE DATAUSER IS 'The datauser table tracks authorized users of the Message an d Subscription Subsystems. Each user is identified by a (uni que) username and domain, which must match all e-mail header s. The priority column specifies the class of user, and serv icetime is the last time a request from the user was process ed. Priority and servicetime are considered when selecting t he order in which requests will be processed. The status can either be active or inactive.';
COMMENT ON COLUMN DATAUSER.USERID IS 'Identifier for the user';
COMMENT ON COLUMN DATAUSER.POCID IS 'Point of contact identifier';
COMMENT ON COLUMN DATAUSER.USERNAME IS 'User name from the incoming subscription message';
COMMENT ON COLUMN DATAUSER.DOMAIN IS 'Domain name from the incoming subscription message';
COMMENT ON COLUMN DATAUSER.MSGTYPE IS 'Message type';
COMMENT ON COLUMN DATAUSER.USERSTATUS IS 'Status of this user';
COMMENT ON COLUMN DATAUSER.PRIORITY IS 'User''s priority';
COMMENT ON COLUMN DATAUSER.COMMID IS 'Comment identifier';
COMMENT ON COLUMN DATAUSER.EMAILLIMIT IS 'Maximum size of message (in bytes) that will be delivered via e-mail';
COMMENT ON COLUMN DATAUSER.SERVICETIME IS 'Last time a request from that user was serviced';
COMMENT ON COLUMN DATAUSER.LDDATE IS 'Load date';

-- Table: DECONVOLUTION
CREATE TABLE DECONVOLUTION (
    DECONID NUMBER(18),
    TYPE VARCHAR2(16),
    LOWCUTFRAC FLOAT(24),
    LOWPASSFREQ FLOAT(24),
    HIGHCUTFRAC FLOAT(24),
    HIGHPASSFREQ FLOAT(24),
    WATERLEVEL FLOAT(24),
    FINALUNITS VARCHAR2(1),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT DECONVOLUTION_PK PRIMARY KEY (DECONID),
    ,CONSTRAINT DECONVOLUTION__DECONID__CK CHECK (deconid > 0),
    ,CONSTRAINT DECONVOLUTION__HIGHCUTFRAC__CK CHECK (( highcutfrac >= 0 AND highcutfrac <=1 ) OR highcutfrac = -1),
    ,CONSTRAINT DECONVOLUTION__HIPASSFREQ__CK CHECK (highpassfreq > 0 OR highpassfreq = -1),
    ,CONSTRAINT DECONVOLUTION__LOWCUTFRAC__CK CHECK (( lowcutfrac >= 0 AND lowcutfrac <=1 ) OR lowcutfrac = -1),
    ,CONSTRAINT DECONVOLUTION__LOWPASSFREQ__CK CHECK (lowpassfreq > 0 OR lowpassfreq = -1),
    ,CONSTRAINT DECONVOLUTION__TYPE__CK CHECK (type IN('measured', 'theoretical')),
    ,CONSTRAINT DECONVOLUTION__WATERLEVEL__CK CHECK (waterlevel > 0 OR waterlevel = 0)
);
COMMENT ON TABLE DECONVOLUTION IS 'The deconvolution table provides some of the parameters nece ssary for deconvolution of the instrument response. The inst rument response information for a particular station at a ce rtain time is contained in the sensor and instrument table. The sensor and instrument tables provide the instrument resp onse, type (measured or theoretical), and units. Once the in strument response is removed it will be necessary to convert everything to the same unit.';
COMMENT ON COLUMN DECONVOLUTION.DECONID IS 'Deconvolution identifier';
COMMENT ON COLUMN DECONVOLUTION.TYPE IS 'Decon type may be ''measured'' or ''theoretical''';
COMMENT ON COLUMN DECONVOLUTION.LOWCUTFRAC IS 'Low cut for cosine filter given as a fraction of lowcutfrac';
COMMENT ON COLUMN DECONVOLUTION.LOWPASSFREQ IS 'Low cut for cosine filter given as a fraction of lowpassfreq';
COMMENT ON COLUMN DECONVOLUTION.HIGHCUTFRAC IS 'High cut given as a fraction of Nyquist obtained from nominal sample rate';
COMMENT ON COLUMN DECONVOLUTION.HIGHPASSFREQ IS 'High cut given as a fraction of Nyquist obtained from nominal sample rate';
COMMENT ON COLUMN DECONVOLUTION.WATERLEVEL IS 'Limit for division (0.0 means do not apply waterlevel)';
COMMENT ON COLUMN DECONVOLUTION.FINALUNITS IS 'Final units for the data once the instrument response has been removed (d, v, or a)';
COMMENT ON COLUMN DECONVOLUTION.AUTH IS 'Author';
COMMENT ON COLUMN DECONVOLUTION.LDDATE IS 'Load date';

-- Table: DEFINING_OBSTYPES
CREATE TABLE DEFINING_OBSTYPES (
    OBSTYPE_ID NUMBER(18),
    CLASS VARCHAR2(16),
    TYPE VARCHAR2(10),
    DESCRIPTION VARCHAR2(4000),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT DEFINING_OBSTYPES_PK PRIMARY KEY (OBSTYPE_ID),
    ,CONSTRAINT DEFINING_OBSTYPES_UK UNIQUE (TYPE),
    ,CONSTRAINT DEF_OBSTYPES__OBSTYPE_ID__CK CHECK (obstype_id > 0)
);
COMMENT ON TABLE DEFINING_OBSTYPES IS 'Defines and describes all valid observation types that can b e used as defining for the USNDC.';
COMMENT ON COLUMN DEFINING_OBSTYPES.OBSTYPE_ID IS 'Observation Type identifier';
COMMENT ON COLUMN DEFINING_OBSTYPES.CLASS IS 'Defining Observation grouping or class';
COMMENT ON COLUMN DEFINING_OBSTYPES.TYPE IS 'Defining Observation type';
COMMENT ON COLUMN DEFINING_OBSTYPES.DESCRIPTION IS 'Description of defining value';
COMMENT ON COLUMN DEFINING_OBSTYPES.MODDATE IS 'Modification date';
COMMENT ON COLUMN DEFINING_OBSTYPES.LDDATE IS 'Load Date';

-- Table: DEFINING_RULES
CREATE TABLE DEFINING_RULES (
    RULE_ID NUMBER(18),
    NET VARCHAR2(8),
    REFSTA VARCHAR2(6),
    SITE VARCHAR2(6),
    PHASE VARCHAR2(8),
    OBSTYPE_ID NUMBER(18),
    VALUE_ID NUMBER(18),
    ON_DATE DATE,
    OFF_DATE DATE,
    AUTHOR VARCHAR2(64),
    PRIORITY NUMBER(8),
    COMMENTS VARCHAR2(4000),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT DEFINING_RULES_PK PRIMARY KEY (RULE_ID),
    ,CONSTRAINT DEFINING_RULES__OBSTYPE_ID__CK CHECK (obstype_id > 0),
    ,CONSTRAINT DEFINING_RULES__RULE_ID__CK CHECK (rule_id > 0),
    ,CONSTRAINT DEFINING_RULES__VALUE_ID__CK CHECK (value_id > 0)
);
COMMENT ON TABLE DEFINING_RULES IS 'Provides the rules for when an observation can be defining a nd the appropriate default value to be assigned.';
COMMENT ON COLUMN DEFINING_RULES.RULE_ID IS 'Defining Rule Identifier';
COMMENT ON COLUMN DEFINING_RULES.NET IS 'Unique network identifier';
COMMENT ON COLUMN DEFINING_RULES.REFSTA IS 'Reference station for station members';
COMMENT ON COLUMN DEFINING_RULES.SITE IS 'Individual site/station element';
COMMENT ON COLUMN DEFINING_RULES.PHASE IS 'Phase restriction for the Defining Rule';
COMMENT ON COLUMN DEFINING_RULES.OBSTYPE_ID IS 'Observation Type identifier';
COMMENT ON COLUMN DEFINING_RULES.VALUE_ID IS 'Defining Value Identifier';
COMMENT ON COLUMN DEFINING_RULES.ON_DATE IS 'Date the defining rule becomes enabled';
COMMENT ON COLUMN DEFINING_RULES.OFF_DATE IS 'Date the defining rule becomes disabled';
COMMENT ON COLUMN DEFINING_RULES.PRIORITY IS 'Rule priority';
COMMENT ON COLUMN DEFINING_RULES.COMMENTS IS 'Comment text';
COMMENT ON COLUMN DEFINING_RULES.MODDATE IS 'Modification date';
COMMENT ON COLUMN DEFINING_RULES.LDDATE IS 'Load Date';

-- Table: DEFINING_VALUES
CREATE TABLE DEFINING_VALUES (
    VALUE_ID NUMBER(18),
    VALUE VARCHAR2(1),
    DESCRIPTION VARCHAR2(4000),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT DEFINING_VALUES_PK PRIMARY KEY (VALUE_ID),
    ,CONSTRAINT DEFINING_VALUES_UK UNIQUE (VALUE),
    ,CONSTRAINT DEFINING_VALUES__VALUE_ID__CK CHECK (value_id > 0)
);
COMMENT ON TABLE DEFINING_VALUES IS 'Defines and describes all valid defining values that can be assigned to an observation type in the USNDC.';
COMMENT ON COLUMN DEFINING_VALUES.VALUE_ID IS 'Defining Value Identifier';
COMMENT ON COLUMN DEFINING_VALUES.VALUE IS 'Defining value code';
COMMENT ON COLUMN DEFINING_VALUES.DESCRIPTION IS 'Description of defining value';
COMMENT ON COLUMN DEFINING_VALUES.MODDATE IS 'Modification date';
COMMENT ON COLUMN DEFINING_VALUES.LDDATE IS 'Load Date';

-- Table: DETECTION
CREATE TABLE DETECTION (
    ARID NUMBER(18),
    JDATE NUMBER(8),
    TIME FLOAT(53),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    BMTYP VARCHAR2(4),
    SPROID NUMBER(18),
    CFREQ FLOAT(24),
    SEAZ FLOAT(24),
    DELAZ FLOAT(24),
    SLOW FLOAT(24),
    DELSLO FLOAT(24),
    SNR FLOAT(24),
    STAV FLOAT(24),
    FSTAT FLOAT(24),
    DELTIM FLOAT(24),
    BANDW FLOAT(24),
    FKQUAL NUMBER(4),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT DETECTION_PK PRIMARY KEY (TIME),
    ,CONSTRAINT DETECTION_UK UNIQUE (ARID),
    ,CONSTRAINT DETECTION__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT DETECTION__BANDW__CK CHECK (bandw > 0.0 OR bandw = -1.0),
    ,CONSTRAINT DETECTION__BMTYP__CK CHECK (bmtyp IN ('coh','inc','hor','fsta','-')),
    ,CONSTRAINT DETECTION__CFREQ__CK CHECK (cfreq > 0.0 OR cfreq = -1.0),
    ,CONSTRAINT DETECTION__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT DETECTION__DELAZ__CK CHECK (delaz > 0.0 OR delaz = -1.0),
    ,CONSTRAINT DETECTION__DELSLO__CK CHECK (delslo > 0.0 OR delslo = -1.0),
    ,CONSTRAINT DETECTION__DELTIM__CK CHECK (deltim > 0.0 OR deltim = -1.0),
    ,CONSTRAINT DETECTION__FKQUAL__CK CHECK ((fkqual >= 1 AND fkqual <= 4) OR fkqual = -1),
    ,CONSTRAINT DETECTION__FSTAT__CK CHECK (fstat >= 0.0 OR fstat = -1.0),
    ,CONSTRAINT DETECTION__JDATE__CK CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT DETECTION__SLOW__CK CHECK (slow >= 0.0 OR slow = -1.0),
    ,CONSTRAINT DETECTION__SNR__CK CHECK (snr > 0.0 OR snr = -1.0),
    ,CONSTRAINT DETECTION__SPROID__CK CHECK (sproid > 0 OR sproid = -1),
    ,CONSTRAINT DETECTION__STAV__CK CHECK (stav > 0.0 OR stav = -1.0),
    ,CONSTRAINT DETECTION__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT DETECTION__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE DETECTION IS 'The detection table contains summary information about wavef orms.';
COMMENT ON COLUMN DETECTION.ARID IS 'Arrival identifier';
COMMENT ON COLUMN DETECTION.JDATE IS 'Julian date';
COMMENT ON COLUMN DETECTION.TIME IS 'Epoch time';
COMMENT ON COLUMN DETECTION.STA IS 'Station code';
COMMENT ON COLUMN DETECTION.CHAN IS 'Channel code';
COMMENT ON COLUMN DETECTION.BMTYP IS 'Beam type';
COMMENT ON COLUMN DETECTION.SPROID IS 'Signal processor identifier';
COMMENT ON COLUMN DETECTION.CFREQ IS 'Center frequency';
COMMENT ON COLUMN DETECTION.SEAZ IS 'Observed azimuth';
COMMENT ON COLUMN DETECTION.DELAZ IS 'Azimuth uncertainty';
COMMENT ON COLUMN DETECTION.SLOW IS 'Observed slowness, seconds per kilometer (sec/km)';
COMMENT ON COLUMN DETECTION.DELSLO IS 'Slowness uncertainty';
COMMENT ON COLUMN DETECTION.SNR IS 'Signal-to-noise ratio';
COMMENT ON COLUMN DETECTION.STAV IS 'Short-term average';
COMMENT ON COLUMN DETECTION.FSTAT IS 'f-statistic';
COMMENT ON COLUMN DETECTION.DELTIM IS 'Time uncertainty';
COMMENT ON COLUMN DETECTION.BANDW IS 'Bandwidth';
COMMENT ON COLUMN DETECTION.FKQUAL IS 'f-k quality';
COMMENT ON COLUMN DETECTION.COMMID IS 'Comment identifier';
COMMENT ON COLUMN DETECTION.LDDATE IS 'Load date';

-- Table: DETECTION_THRESHOLD
CREATE TABLE DETECTION_THRESHOLD (
    CLUSTAID NUMBER(18),
    ORID NUMBER(18),
    DETECTOR_TYPE VARCHAR2(16),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    THRESHOLD FLOAT(24),
    NUM_DETECTIONS NUMBER(9),
    STA VARCHAR2(6),
    PFA FLOAT(24),
    OVERLAP NUMBER(9),
    CHANNEL_MASKING_THRESHOLD FLOAT(24),
    SSD_DIMENSION NUMBER(5),
    DOF FLOAT(24),
    DATA_MASKED NUMBER(9),
    TOTAL_DATA NUMBER(9),
    DESCRIPT VARCHAR2(100),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT DETECTION_THRESHOLD_PK PRIMARY KEY (CLUSTAID),
    ,CONSTRAINT DETECTION_THRESHOLD__CA__CK CHECK (clustaid > 0),
    ,CONSTRAINT DETECTION_THRESHOLD__CMT__CK CHECK (channel_masking_threshold >= 0 AND channel_masking_threshold <= 100),
    ,CONSTRAINT DETECTION_THRESHOLD__DOF__CK CHECK (dof > 0 OR dof = -1),
    ,CONSTRAINT DETECTION_THRESHOLD__ND__CK CHECK (num_detections >= 0 OR num_detections = -1),
    ,CONSTRAINT DETECTION_THRESHOLD__OL__CK CHECK (overlap > 0 OR overlap = -1),
    ,CONSTRAINT DETECTION_THRESHOLD__PFA__CK CHECK ((pfa >= 0.0 AND pfa <= 1.0 ) OR pfa = -1),
    ,CONSTRAINT DETECTION_THRESHOLD__SD__CK CHECK (ssd_dimension >= 0),
    ,CONSTRAINT DETECTION_THRESHOLD__TD__CK CHECK (total_data > 0 OR total_data = -1),
    ,CONSTRAINT DETECTION_THRESHOLD__TH__CK CHECK (( threshold >= 0.0 AND threshold <= 1.0 ) OR threshold = -1)
);
COMMENT ON TABLE DETECTION_THRESHOLD IS 'The detection_threshold table contains the calculated thresh old for the timeframe processed.';
COMMENT ON COLUMN DETECTION_THRESHOLD.CLUSTAID IS 'Cluster Station identifier';
COMMENT ON COLUMN DETECTION_THRESHOLD.ORID IS 'Origin identifier';
COMMENT ON COLUMN DETECTION_THRESHOLD.DETECTOR_TYPE IS 'Type of detector (SSD, NARGAR, etc.)';
COMMENT ON COLUMN DETECTION_THRESHOLD.TIME IS 'Epoch start time of threshold';
COMMENT ON COLUMN DETECTION_THRESHOLD.ENDTIME IS 'Epoch end time of threshold';
COMMENT ON COLUMN DETECTION_THRESHOLD.THRESHOLD IS 'Threshold values';
COMMENT ON COLUMN DETECTION_THRESHOLD.NUM_DETECTIONS IS 'Number of detections';
COMMENT ON COLUMN DETECTION_THRESHOLD.STA IS 'Station';
COMMENT ON COLUMN DETECTION_THRESHOLD.PFA IS 'Probability of False Alarm';
COMMENT ON COLUMN DETECTION_THRESHOLD.OVERLAP IS 'Overlap';
COMMENT ON COLUMN DETECTION_THRESHOLD.CHANNEL_MASKING_THRESHOLD IS 'Channel Masking threshold';
COMMENT ON COLUMN DETECTION_THRESHOLD.SSD_DIMENSION IS 'Subspace Dimension';
COMMENT ON COLUMN DETECTION_THRESHOLD.DOF IS 'Degrees of freedom';
COMMENT ON COLUMN DETECTION_THRESHOLD.DATA_MASKED IS 'Number of samples masked';
COMMENT ON COLUMN DETECTION_THRESHOLD.TOTAL_DATA IS 'Total number of samples';
COMMENT ON COLUMN DETECTION_THRESHOLD.DESCRIPT IS 'Description';
COMMENT ON COLUMN DETECTION_THRESHOLD.AUTH IS 'Author';
COMMENT ON COLUMN DETECTION_THRESHOLD.LDDATE IS 'Load date';

-- Table: DISCRIM_PARAM
CREATE TABLE DISCRIM_PARAM (
    POLYID NUMBER(18),
    AMPCOR_VERID NUMBER(18),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    PARAMSETID NUMBER(18),
    LOWCUTFRAC FLOAT(24),
    MINLOWPASSFREQ FLOAT(24),
    HIGHPASSFRAC FLOAT(24),
    HIGHCUTFRAC FLOAT(24),
    PNGV1 FLOAT(24),
    PNGV2 FLOAT(24),
    PNINT FLOAT(53),
    PGGV1 FLOAT(24),
    PGGV2 FLOAT(24),
    PGINT FLOAT(53),
    SNGV1 FLOAT(24),
    SNGV2 FLOAT(24),
    SNINT FLOAT(53),
    LGGV1 FLOAT(24),
    LGGV2 FLOAT(24),
    LGINT FLOAT(53),
    TFACTOR FLOAT(24),
    TAPERWIDTH FLOAT(24),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT DISCRIM_PARAM_PK PRIMARY KEY (STA),
    ,CONSTRAINT DISCRIM_PARAM__AMPCOR_VID__CK CHECK (ampcor_verid > 0),
    ,CONSTRAINT DISCRIM_PARAM__HIGHCUTFRAC__CK CHECK (( highcutfrac >= 0 AND highcutfrac <=1 ) OR highcutfrac = -1),
    ,CONSTRAINT DISCRIM_PARAM__HPF__CK CHECK (( highpassfrac >= 0 AND highpassfrac <=1 ) OR highpassfrac = -1),
    ,CONSTRAINT DISCRIM_PARAM__LGGV1__CK CHECK (lggv1 >=0),
    ,CONSTRAINT DISCRIM_PARAM__LGGV2__CK CHECK (lggv2 >=0),
    ,CONSTRAINT DISCRIM_PARAM__LGINT__CK CHECK (lgint >=0),
    ,CONSTRAINT DISCRIM_PARAM__LOWCUTFRAC__CK CHECK (( lowcutfrac >= 0 AND lowcutfrac <=1 ) OR lowcutfrac = -1),
    ,CONSTRAINT DISCRIM_PARAM__MLPF__CK CHECK (minlowpassfreq >=0),
    ,CONSTRAINT DISCRIM_PARAM__PARAMSETID__CK CHECK (paramsetid >= 0 or paramsetid = -1),
    ,CONSTRAINT DISCRIM_PARAM__PGGV1__CK CHECK (pggv1 >=0),
    ,CONSTRAINT DISCRIM_PARAM__PGGV2__CK CHECK (pggv2 >=0),
    ,CONSTRAINT DISCRIM_PARAM__PGINT__CK CHECK (pgint >=0),
    ,CONSTRAINT DISCRIM_PARAM__PNGV1__CK CHECK (pngv1 >=0),
    ,CONSTRAINT DISCRIM_PARAM__PNGV2__CK CHECK (pngv2 >=0),
    ,CONSTRAINT DISCRIM_PARAM__PNINT__CK CHECK (pnint >=0),
    ,CONSTRAINT DISCRIM_PARAM__POLYID__CK CHECK (polyid >0),
    ,CONSTRAINT DISCRIM_PARAM__SNGV1__CK CHECK (sngv1 >=0),
    ,CONSTRAINT DISCRIM_PARAM__SNGV2__CK CHECK (sngv2 >=0),
    ,CONSTRAINT DISCRIM_PARAM__SNINT__CK CHECK (snint >=0),
    ,CONSTRAINT DISCRIM_PARAM__TAPERWIDTH__CK CHECK (( taperwidth >= 0 AND taperwidth <=1 ) OR taperwidth = -1),
    ,CONSTRAINT DISCRIM_PARAM__TFACTOR__CK CHECK (tfactor >0.5)
);
COMMENT ON TABLE DISCRIM_PARAM IS 'The discrim_param table contains group velocities for each p olyid and station.';
COMMENT ON COLUMN DISCRIM_PARAM.POLYID IS 'Polygon Identifier';
COMMENT ON COLUMN DISCRIM_PARAM.AMPCOR_VERID IS 'amplitude correction version identifier';
COMMENT ON COLUMN DISCRIM_PARAM.STA IS 'Station name';
COMMENT ON COLUMN DISCRIM_PARAM.CHAN IS 'Channel where waveform was recorded';
COMMENT ON COLUMN DISCRIM_PARAM.PARAMSETID IS 'id of parameter set';
COMMENT ON COLUMN DISCRIM_PARAM.LOWCUTFRAC IS 'low frequency cut for instrument correction in Hertz';
COMMENT ON COLUMN DISCRIM_PARAM.MINLOWPASSFREQ IS 'low frequency pass for instrument correction in Hertz';
COMMENT ON COLUMN DISCRIM_PARAM.HIGHPASSFRAC IS 'high frequency pass for instrument correction in Hertz';
COMMENT ON COLUMN DISCRIM_PARAM.HIGHCUTFRAC IS 'high frequency cut for instrument correction in Hertz';
COMMENT ON COLUMN DISCRIM_PARAM.PNGV1 IS 'beginning group velocity in km/s for Pn phase';
COMMENT ON COLUMN DISCRIM_PARAM.PNGV2 IS 'ending group velocity in km/s for Pn phase';
COMMENT ON COLUMN DISCRIM_PARAM.PNINT IS 'intercept time in seconds for Pg phase';
COMMENT ON COLUMN DISCRIM_PARAM.PGGV1 IS 'beginning group velocity in km/s for Pg phase';
COMMENT ON COLUMN DISCRIM_PARAM.PGGV2 IS 'ending group velocity in km/s for Pg phase';
COMMENT ON COLUMN DISCRIM_PARAM.PGINT IS 'intercept time in seconds for Pg phase';
COMMENT ON COLUMN DISCRIM_PARAM.SNGV1 IS 'beginning group velocity in km/s for Sn phase';
COMMENT ON COLUMN DISCRIM_PARAM.SNGV2 IS 'ending group velocity in km/s for Sn phase';
COMMENT ON COLUMN DISCRIM_PARAM.SNINT IS 'intercept time in seconds for Sn phase';
COMMENT ON COLUMN DISCRIM_PARAM.LGGV1 IS 'beginning group velocity in km/s for Lg phase';
COMMENT ON COLUMN DISCRIM_PARAM.LGGV2 IS 'ending group velocity in km/s for Lg phase';
COMMENT ON COLUMN DISCRIM_PARAM.LGINT IS 'intercept time in seconds for Lg phase';
COMMENT ON COLUMN DISCRIM_PARAM.TFACTOR IS 'minimum number of cycles in the window needed to calculate an amplitude';
COMMENT ON COLUMN DISCRIM_PARAM.TAPERWIDTH IS 'fraction of waveform to taper at each end';
COMMENT ON COLUMN DISCRIM_PARAM.AUTH IS 'Author';
COMMENT ON COLUMN DISCRIM_PARAM.LDDATE IS 'Load date';

-- Table: DISCRIMUSE
CREATE TABLE DISCRIMUSE (
    ORID NUMBER(18),
    DISCRIMTYPE VARCHAR2(10),
    STA VARCHAR2(6),
    DISCRIM_FLAG VARCHAR2(1),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT DISCRIMUSE_PK PRIMARY KEY (STA),
    ,CONSTRAINT DISCRIMUSE__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT DISCRIMUSE__DISCRIMTYPE__CK CHECK (discrimtype IN ('CF','FM','LP','PP','SP','TT','BUB','DEEP','HF','HT','LO','MINE','SEIS','VOL','DU','FR',' NA','RTRMS','RESULT','-')),
    ,CONSTRAINT DISCRIMUSE__DISCRIM_FLAG__CK CHECK (discrim_flag IN ('T','F','-')),
    ,CONSTRAINT DISCRIMUSE__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT DISCRIMUSE__STA__CK CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE DISCRIMUSE IS 'The discrimuse table contains the use/nonuse of station data in discriminant voting. It identifies, for each station ass ociated to the origin, the use or non-use of that station''s data in the discriminant vote for six different discriminant s. The votes are then combined to determine the overall even t classification (see the discrimvote table).';
COMMENT ON COLUMN DISCRIMUSE.ORID IS 'Origin identifier';
COMMENT ON COLUMN DISCRIMUSE.DISCRIMTYPE IS 'Discriminant type';
COMMENT ON COLUMN DISCRIMUSE.STA IS 'Station';
COMMENT ON COLUMN DISCRIMUSE.DISCRIM_FLAG IS 'Discriminant is used in event classification for the origin and station (T,F)';
COMMENT ON COLUMN DISCRIMUSE.COMMID IS 'Comment identifier';
COMMENT ON COLUMN DISCRIMUSE.LDDATE IS 'Load date';

-- Table: DISCRIMVOTE
CREATE TABLE DISCRIMVOTE (
    ORID NUMBER(18),
    DISCRIMTYPE VARCHAR2(10),
    STA VARCHAR2(6),
    VOTE VARCHAR2(1),
    COMMID NUMBER(18),
    OVERRIDE NUMBER(8),
    EVAL_COMMENT VARCHAR2(22),
    LDDATE DATE,
    ,CONSTRAINT DISCRIMVOTE_PK PRIMARY KEY (DISCRIMTYPE),
    ,CONSTRAINT DISCRIMVOTE__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT DISCRIMVOTE__DISCRIMTYPE__CK CHECK (discrimtype IN ('CF','FM','LP','PP','SP','TT','BUB','DEEP','HF','HT','LO','MINE','SEIS','VOL','DU','FR',' NA','RTRMS','RESULT','HYD_CLASS','-')),
    ,CONSTRAINT DISCRIMVOTE__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT DISCRIMVOTE__OVERRIDE__CK CHECK (override >= 0 OR override = -1),
    ,CONSTRAINT DISCRIMVOTE__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT DISCRIMVOTE__VOTE__CK CHECK (vote IN ('1','2','3','4','5','6','7','A','B','C','D','-'))
);
COMMENT ON TABLE DISCRIMVOTE IS 'The discrimvote table identifies the vote value for each of six discriminants (discrimtypes). These votes are combined t o determine the overall event classification. When the vote is overridden, it includes evaluator''s comments.';
COMMENT ON COLUMN DISCRIMVOTE.ORID IS 'Origin identifier';
COMMENT ON COLUMN DISCRIMVOTE.DISCRIMTYPE IS 'Discriminant type';
COMMENT ON COLUMN DISCRIMVOTE.STA IS 'Station';
COMMENT ON COLUMN DISCRIMVOTE.VOTE IS 'Overall vote for the discriminant factor';
COMMENT ON COLUMN DISCRIMVOTE.COMMID IS 'Comment identifier';
COMMENT ON COLUMN DISCRIMVOTE.OVERRIDE IS 'Evaluator override vote';
COMMENT ON COLUMN DISCRIMVOTE.EVAL_COMMENT IS 'Evaluator comments on override';
COMMENT ON COLUMN DISCRIMVOTE.LDDATE IS 'Load date';

-- Table: DLMAN
CREATE TABLE DLMAN (
    DLID NUMBER(18),
    MACHINE VARCHAR2(32),
    RUNNING VARCHAR2(1),
    CONNMANPORT NUMBER(6),
    CONTROLPORT NUMBER(6),
    ARCHIVEPORT NUMBER(6),
    FORWARDPORT NUMBER(6),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT DLMAN_PK PRIMARY KEY (DLID),
    ,CONSTRAINT DLMAN__ARCHIVEPORT__CK CHECK ((archiveport >= 0 AND archiveport <= 16383) OR archiveport = -1),
    ,CONSTRAINT DLMAN__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT DLMAN__CONNMANPORT__CK CHECK ((connmanport >= 0 AND connmanport <= 16383) OR connmanport = -1),
    ,CONSTRAINT DLMAN__CONTROLPORT__CK CHECK ((controlport >= 0 AND controlport <= 16383) OR controlport = -1),
    ,CONSTRAINT DLMAN__DLID__CK CHECK (dlid >= 0),
    ,CONSTRAINT DLMAN__FORWARDPORT__CK CHECK ((forwardport >= 0 AND forwardport <= 16383) OR forwardport = -1),
    ,CONSTRAINT DLMAN__RUNNING__CK CHECK (running IN ('y', 'n', '-'))
);
COMMENT ON TABLE DLMAN IS 'The dlman table keeps track of currently running DLMan insta nces. The column machine is the host on which this dlid runs (it may not run elsewhere). The column running indicates wh ether that DLMan is currently operational. The table also pr ovides the ports that this dlid is currently using to listen to other processes.';
COMMENT ON COLUMN DLMAN.DLID IS 'Diskloop manager identifier';
COMMENT ON COLUMN DLMAN.MACHINE IS 'Machine name';
COMMENT ON COLUMN DLMAN.RUNNING IS 'Dlman running = y/n';
COMMENT ON COLUMN DLMAN.CONNMANPORT IS 'Connman port';
COMMENT ON COLUMN DLMAN.CONTROLPORT IS 'Datacontrol port';
COMMENT ON COLUMN DLMAN.ARCHIVEPORT IS 'Archiver port';
COMMENT ON COLUMN DLMAN.FORWARDPORT IS 'Forwarder port';
COMMENT ON COLUMN DLMAN.COMMID IS 'Comment identifier';
COMMENT ON COLUMN DLMAN.LDDATE IS 'Load date';

-- Table: DOPPLER_DETECTION
CREATE TABLE DOPPLER_DETECTION (
    DOPPLERID NUMBER(18),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    EVENT_TIME FLOAT(53),
    DURATION FLOAT(24),
    SNR FLOAT(24),
    AZIMUTH FLOAT(24),
    ETYPE VARCHAR2(7),
    CFREQ FLOAT(24),
    RANGE_MINFREQ FLOAT(24),
    RANGE_MAXFREQ FLOAT(24),
    TRACE_MINFREQ FLOAT(24),
    TRACE_MAXFREQ FLOAT(24),
    USE_AS_REFERENCE_EVENT VARCHAR2(1),
    FILTER_STRING VARCHAR2(2000),
    CONF FLOAT(24),
    COMMENTS VARCHAR2(4000),
    INTERNAL_COMMENTS VARCHAR2(4000),
    ANALYST VARCHAR2(32),
    TIMESENT FLOAT(53),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT DOPPLER_DETECTION_PK PRIMARY KEY (STA),
    ,CONSTRAINT DOPPLER_DETECTION_UK UNIQUE (DOPPLERID),
    ,CONSTRAINT DOPPLER_DET__AZIMUTH__CK CHECK ((azimuth >= 0.0 AND azimuth <= 360.0) OR azimuth = -1.0),
    ,CONSTRAINT DOPPLER_DET__CFREQ__CK CHECK (cfreq > 0.0 OR cfreq = -1.0),
    ,CONSTRAINT DOPPLER_DET__CHAN__CK CHECK (chan = UPPER(chan)),
    ,CONSTRAINT DOPPLER_DET__CONF__CK CHECK ((conf IN(1.0,50.0,100.0)) OR conf = 0.0),
    ,CONSTRAINT DOPPLER_DET__DOPPLERID__CK CHECK (dopplerid > 0),
    ,CONSTRAINT DOPPLER_DET__DURATION__CK CHECK (duration > 0.0 OR duration = -999.0),
    ,CONSTRAINT DOPPLER_DET__ETYPE__CK CHECK (etype = UPPER(etype)),
    ,CONSTRAINT DOPPLER_DET__EVENT_TIME__CK CHECK (event_time >= -9999999999.999),
    ,CONSTRAINT DOPPLER_DET__RANGE_MAXFREQ CHECK (range_maxfreq > 0.0 OR range_maxfreq = -999.0),
    ,CONSTRAINT DOPPLER_DET__RANGE_MINFREQ CHECK (range_minfreq >= 0.0 OR range_minfreq = -999.0),
    ,CONSTRAINT DOPPLER_DET__SNR__CK CHECK (snr > 0 OR snr = -1),
    ,CONSTRAINT DOPPLER_DET__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT DOPPLER_DET__TIMESENT__CK CHECK (timesent > 0.0 OR timesent = -9999999999.999),
    ,CONSTRAINT DOPPLER_DET__TRACE_MAXFREQ CHECK (trace_maxfreq > 0.0 OR trace_maxfreq = -999.0),
    ,CONSTRAINT DOPPLER_DET__TRACE_MINFREQ CHECK (trace_minfreq >= 0.0 OR trace_minfreq = -999.0),
    ,CONSTRAINT DOPPLER_DET__USE_AS_REF_EVENT CHECK (use_as_reference_event IN('y','n','-'))
);
COMMENT ON TABLE DOPPLER_DETECTION IS 'The doppler_detection table contains summary information abo ut waveforms.';
COMMENT ON COLUMN DOPPLER_DETECTION.DOPPLERID IS 'Doppler identifier';
COMMENT ON COLUMN DOPPLER_DETECTION.STA IS 'Station code';
COMMENT ON COLUMN DOPPLER_DETECTION.CHAN IS 'Channel code';
COMMENT ON COLUMN DOPPLER_DETECTION.EVENT_TIME IS 'Epoch time';
COMMENT ON COLUMN DOPPLER_DETECTION.DURATION IS 'Duration of doppler shift window';
COMMENT ON COLUMN DOPPLER_DETECTION.SNR IS 'Signal-to-noise ratio';
COMMENT ON COLUMN DOPPLER_DETECTION.AZIMUTH IS 'Observed azimuth';
COMMENT ON COLUMN DOPPLER_DETECTION.ETYPE IS 'Event type';
COMMENT ON COLUMN DOPPLER_DETECTION.CFREQ IS 'Center frequency';
COMMENT ON COLUMN DOPPLER_DETECTION.RANGE_MINFREQ IS 'Detection range minimum frequency.';
COMMENT ON COLUMN DOPPLER_DETECTION.RANGE_MAXFREQ IS 'Detection range maximum frequency.';
COMMENT ON COLUMN DOPPLER_DETECTION.TRACE_MINFREQ IS 'Detection trace minimum frequency.';
COMMENT ON COLUMN DOPPLER_DETECTION.TRACE_MAXFREQ IS 'Detection trace maximum frequency.';
COMMENT ON COLUMN DOPPLER_DETECTION.USE_AS_REFERENCE_EVENT IS 'When set to "y", use this event as a reference event for internal AFTAC station tuning process.';
COMMENT ON COLUMN DOPPLER_DETECTION.FILTER_STRING IS 'Compact filter representation.';
COMMENT ON COLUMN DOPPLER_DETECTION.CONF IS 'Confidence';
COMMENT ON COLUMN DOPPLER_DETECTION.COMMENTS IS 'Comment text';
COMMENT ON COLUMN DOPPLER_DETECTION.INTERNAL_COMMENTS IS 'Comment made by an analyst to leave feedback/questions/observations and tie it to the event without it affecting the Doppler report.';
COMMENT ON COLUMN DOPPLER_DETECTION.ANALYST IS 'The analyst that created the event report';
COMMENT ON COLUMN DOPPLER_DETECTION.TIMESENT IS 'Time at which the event report was released';
COMMENT ON COLUMN DOPPLER_DETECTION.AUTHOR IS 'Author';
COMMENT ON COLUMN DOPPLER_DETECTION.MODDATE IS 'Modification date';
COMMENT ON COLUMN DOPPLER_DETECTION.LDDATE IS 'Time at which the detector generated the event';

-- Table: ECM_CHAN_AMPLITUDE
CREATE TABLE ECM_CHAN_AMPLITUDE (
    ORID NUMBER(18),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    PHASE VARCHAR2(8),
    LFREQ FLOAT(53),
    HFREQ FLOAT(53),
    AMPCOR_VERID NUMBER(18),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    AMPRAW FLOAT(53),
    AMPMDAC FLOAT(53),
    AMPDAC FLOAT(53),
    AMPMAC FLOAT(53),
    NTIME FLOAT(53),
    NENDTIME FLOAT(53),
    SNR FLOAT(53),
    AMPDEF VARCHAR2(1),
    AUTH VARCHAR2(15),
    COMMENTS VARCHAR2(4000),
    LDDATE DATE,
    ,CONSTRAINT ECM_CHAN_AMPLITUDE_PK PRIMARY KEY (HFREQ),
    ,CONSTRAINT ECM_CHAN_AMPLITUDE__HFREQ__CK CHECK (hfreq >0),
    ,CONSTRAINT ECM_CHAN_AMPLITUDE__LFREQ__CK CHECK (lfreq >=0),
    ,CONSTRAINT ECM_CHAN_AMPLITUDE__NTIME__CK CHECK (ntime >= -9999999999.999),
    ,CONSTRAINT ECM_CHAN_AMPLITUDE__ORID__CK CHECK (orid >0),
    ,CONSTRAINT ECM_CHAN_AMPLITUDE__SNR__CK CHECK (snr > 0 OR snr = -1),
    ,CONSTRAINT ECM_CHAN_AMPLITUDE__TIME__CK CHECK (time >= -9999999999.999),
    ,CONSTRAINT ECM_CHAN_AMP__AMPCOR_VERID__CK CHECK (( ampcor_verid >0) OR ampcor_verid = -1),
    ,CONSTRAINT ECM_CHAN_AMP__AMPDEF__CK CHECK (ampdef in('n', 'N', 'd', 'D')),
    ,CONSTRAINT ECM_CHAN_AMP__ENDTIME__CK CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT ECM_CHAN_AMP__NENDTIME__CK CHECK (nendtime < 9999999999.999 OR nendtime = 9999999999.999)
);
COMMENT ON TABLE ECM_CHAN_AMPLITUDE IS 'The ecm_chan_amplitude table contains time windows (start an d end times), raw amplitude, and MDAC for each orid, station , channel, phase and frequency bin. These measurements are c ombined according to the parameters of the discriminant bein g calculated.';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.ORID IS 'Origin identifier';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.STA IS 'Station name';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.CHAN IS 'Channel name';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.PHASE IS 'phase of interest';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.LFREQ IS 'low end of frequency bin used to filter measurement';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.HFREQ IS 'high end of frequency bin used to filter measurement';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.AMPCOR_VERID IS 'AmpCor version Identifier used in ECM Versioning';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.TIME IS 'time of reference event';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.ENDTIME IS 'end time of measurement window';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.AMPRAW IS 'actual amplitude measured';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.AMPMDAC IS 'Magnitude and Distance Amplitude Correction';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.AMPDAC IS 'Distance amplitude correction';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.AMPMAC IS 'Magnitude amplitude correction';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.NTIME IS 'start time of the noise window';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.NENDTIME IS 'end time of the noise window';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.SNR IS 'Signal-to-noise ratio';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.AMPDEF IS 'Defining flag for element amplitude measurement to be used for station/network average';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.AUTH IS 'Author';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.COMMENTS IS 'comment text';
COMMENT ON COLUMN ECM_CHAN_AMPLITUDE.LDDATE IS 'Load date';

-- Table: ECM_CONSTANT
CREATE TABLE ECM_CONSTANT (
    NAME VARCHAR2(30),
    VALUE FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT ECM_CONSTANT_PK PRIMARY KEY (NAME)
);
COMMENT ON TABLE ECM_CONSTANT IS 'The ecm_constant table contains calibration constants for EC M. This table is for lone constants that are not dependant on which channel, phase, station, or polyid being looked at.';
COMMENT ON COLUMN ECM_CONSTANT.NAME IS 'Name of constant of interest';
COMMENT ON COLUMN ECM_CONSTANT.VALUE IS 'Value of this constant';
COMMENT ON COLUMN ECM_CONSTANT.LDDATE IS 'Load date';

-- Table: ECM_COV
CREATE TABLE ECM_COV (
    POLYID NUMBER(18),
    COV_VERID NUMBER(18),
    SOURCE_TYPE VARCHAR2(15),
    DISCRIM_NAME_1 VARCHAR2(10),
    DISCRIM_NAME_2 VARCHAR2(10),
    COVARIANCE FLOAT(53),
    MEAN_1 FLOAT(53),
    AUTH VARCHAR2(15),
    COMMENTS VARCHAR2(4000),
    LDDATE DATE,
    ,CONSTRAINT ECM_COV_PK PRIMARY KEY (POLYID),
    ,CONSTRAINT ECM_COV__COVARIANCE__CK CHECK (covariance >= -1 and covariance <=1),
    ,CONSTRAINT ECM_COV__COV_VERID__CK CHECK (cov_verid >0),
    ,CONSTRAINT ECM_COV__MEAN_1__CK CHECK (( mean_1 >= 0 AND mean_1 <=1 ) OR mean_1 = -1),
    ,CONSTRAINT ECM_COV__POLYID__CK CHECK (polyid >0)
);
COMMENT ON TABLE ECM_COV IS 'The ecm_cov table contains a covariance for each polyid, sou rce type, and pair of discriminants. All records with the s ame polyid and source type will combine to define a single c ovariance matrix used for combining discriminants.';
COMMENT ON COLUMN ECM_COV.POLYID IS 'Polygon Identifier';
COMMENT ON COLUMN ECM_COV.COV_VERID IS 'version identifier of the covariance matrix';
COMMENT ON COLUMN ECM_COV.SOURCE_TYPE IS 'source type of interest';
COMMENT ON COLUMN ECM_COV.DISCRIM_NAME_1 IS 'first discriminant of interest';
COMMENT ON COLUMN ECM_COV.DISCRIM_NAME_2 IS 'second discriminant of interest';
COMMENT ON COLUMN ECM_COV.COVARIANCE IS 'covariance of these two discriminants for this source type within this region of interest';
COMMENT ON COLUMN ECM_COV.MEAN_1 IS 'mean value of the first discriminant';
COMMENT ON COLUMN ECM_COV.AUTH IS 'Author';
COMMENT ON COLUMN ECM_COV.COMMENTS IS 'comment text';
COMMENT ON COLUMN ECM_COV.LDDATE IS 'Load date';

-- Table: ECM_DISCRIMINANTS
CREATE TABLE ECM_DISCRIMINANTS (
    ORID NUMBER(18),
    DISCRIM_NAME VARCHAR2(15),
    COV_VERID NUMBER(18),
    DISCRIM_P_VALUE FLOAT(53),
    DISCRIM_DEF VARCHAR2(1),
    EXPLANATION VARCHAR2(4000),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT ECM_DISCRIMINANTS_PK PRIMARY KEY (ORID),
    ,CONSTRAINT ECM_DISCRIM__COV_VERID__CK CHECK (( cov_verid >0) OR cov_verid = -1),
    ,CONSTRAINT ECM_DISCRIM__DISCRIM_DEF__CK CHECK (discrim_def in('n', 'N', 'd', 'D', '-')),
    ,CONSTRAINT ECM_DISCRIM__DISCRIM_P_VAL__CK CHECK (( discrim_p_value >= 0 AND discrim_p_value <=1 ) OR discrim_p_value = -1),
    ,CONSTRAINT ECM_DISCRIM__ORID__CK CHECK (orid >0)
);
COMMENT ON TABLE ECM_DISCRIMINANTS IS 'The ecm_discriminants table contains p-values for each evid and discriminant name.';
COMMENT ON COLUMN ECM_DISCRIMINANTS.ORID IS 'id of the origin';
COMMENT ON COLUMN ECM_DISCRIMINANTS.DISCRIM_NAME IS 'discriminant of interest';
COMMENT ON COLUMN ECM_DISCRIMINANTS.COV_VERID IS 'version identifier of the covariance matrix';
COMMENT ON COLUMN ECM_DISCRIMINANTS.DISCRIM_P_VALUE IS 'p-value of this discriminant for this reference event';
COMMENT ON COLUMN ECM_DISCRIMINANTS.DISCRIM_DEF IS 'defining flag for this discriminant';
COMMENT ON COLUMN ECM_DISCRIMINANTS.EXPLANATION IS 'text explanation of how this discriminant was calculated';
COMMENT ON COLUMN ECM_DISCRIMINANTS.AUTH IS 'Author';
COMMENT ON COLUMN ECM_DISCRIMINANTS.LDDATE IS 'Load date';

-- Table: ECM_EVENT_RESULTS
CREATE TABLE ECM_EVENT_RESULTS (
    ORID NUMBER(18),
    EVID NUMBER(18),
    COV_VERID NUMBER(18),
    RDA_VERID NUMBER(18),
    CLASS_TYPE VARCHAR2(15),
    CLASS_TYPE_OVRD VARCHAR2(15),
    COMMENTS VARCHAR2(4000),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT ECM_EVENT_RESULTS_PK PRIMARY KEY (ORID),
    ,CONSTRAINT ECM_EVENT_RESULTS__EVID__CK CHECK (evid >0),
    ,CONSTRAINT ECM_EVENT_RESULTS__ORID__CK CHECK (orid >0),
    ,CONSTRAINT ECM_EVT_RESULTS__COV_VERID__CK CHECK (( cov_verid >0 ) OR cov_verid = -1),
    ,CONSTRAINT ECM_EVT_RESULTS__RDA_VERID__CK CHECK (( rda_verid >0 ) OR rda_verid = -1)
);
COMMENT ON TABLE ECM_EVENT_RESULTS IS 'The ecm_event_results table contains the classification for each event.';
COMMENT ON COLUMN ECM_EVENT_RESULTS.ORID IS 'id of the origin';
COMMENT ON COLUMN ECM_EVENT_RESULTS.EVID IS 'id of the event of interest';
COMMENT ON COLUMN ECM_EVENT_RESULTS.COV_VERID IS 'version identifier of the covariance matrix';
COMMENT ON COLUMN ECM_EVENT_RESULTS.RDA_VERID IS 'version identifier of the RDA';
COMMENT ON COLUMN ECM_EVENT_RESULTS.CLASS_TYPE IS 'source type as determined by ECM';
COMMENT ON COLUMN ECM_EVENT_RESULTS.CLASS_TYPE_OVRD IS 'source type as overridden by an analyst';
COMMENT ON COLUMN ECM_EVENT_RESULTS.COMMENTS IS 'comment text';
COMMENT ON COLUMN ECM_EVENT_RESULTS.AUTH IS 'Author';
COMMENT ON COLUMN ECM_EVENT_RESULTS.LDDATE IS 'Load date';

-- Table: ECM_REF_CHAN_AMPLITUDE
CREATE TABLE ECM_REF_CHAN_AMPLITUDE (
    EVID NUMBER(18),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    PHASE VARCHAR2(8),
    LFREQ FLOAT(53),
    HFREQ FLOAT(53),
    AMPCOR_VERID NUMBER(18),
    POLYID NUMBER(18),
    DELTA FLOAT(24),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    AMPRAW FLOAT(53),
    AMPMDAC FLOAT(53),
    AMPDAC FLOAT(53),
    AMPMAC FLOAT(53),
    NTIME FLOAT(53),
    NENDTIME FLOAT(53),
    SNR FLOAT(53),
    AMPDEF VARCHAR2(1),
    AUTH VARCHAR2(15),
    COMMENTS VARCHAR2(4000),
    LDDATE DATE,
    ,CONSTRAINT ECM_REF_CHAN_AMPLITUDE_PK PRIMARY KEY (LFREQ),
    ,CONSTRAINT ECM_RCA__AMPCOR_VERID__CK CHECK (( ampcor_verid >0) OR ampcor_verid = -1),
    ,CONSTRAINT ECM_RCA__AMPDEF__CK CHECK (ampdef in('n', 'N', 'd', 'D')),
    ,CONSTRAINT ECM_RCA__DELTA__CK CHECK (delta >=0),
    ,CONSTRAINT ECM_RCA__ENDTIME__CK CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT ECM_RCA__EVID__CK CHECK (evid >0),
    ,CONSTRAINT ECM_RCA__HFREQ__CK CHECK (hfreq >0),
    ,CONSTRAINT ECM_RCA__LFREQ__CK CHECK (lfreq >=0),
    ,CONSTRAINT ECM_RCA__NENDTIME__CK CHECK (nendtime < 9999999999.999 OR nendtime = 9999999999.999),
    ,CONSTRAINT ECM_RCA__NTIME__CK CHECK (ntime >= -9999999999.999),
    ,CONSTRAINT ECM_RCA__POLYID__CK CHECK (polyid >0),
    ,CONSTRAINT ECM_RCA__SNR__CK CHECK (snr > 0 OR snr = -1),
    ,CONSTRAINT ECM_RCA__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE ECM_REF_CHAN_AMPLITUDE IS 'The ecm_ref_chan_amplitude table contains reference time win dows (start and end times), raw amplitude, and MDAC for each evid, station, channel, phase and frequency bin. These meas urements were combined according to the parameters of the di scriminant that was calculated.';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.EVID IS 'Event identifier';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.STA IS 'Station name';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.CHAN IS 'Channel name';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.PHASE IS 'phase of interest';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.LFREQ IS 'low end of frequency bin used to filter measurement';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.HFREQ IS 'high end of frequency bin used to filter measurement';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.AMPCOR_VERID IS 'AmpCor version Identifier used in ECM Versioning';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.POLYID IS 'Polygon Identifier';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.DELTA IS 'Source-receiver distance';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.TIME IS 'time of reference event';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.ENDTIME IS 'end time of measurement window';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.AMPRAW IS 'actual amplitude measured';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.AMPMDAC IS 'Magnitude and Distance Amplitude Correction';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.AMPDAC IS 'Distance amplitude correction';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.AMPMAC IS 'Magnitude amplitude correction';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.NTIME IS 'start time of the noise window';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.NENDTIME IS 'end time of the noise window';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.SNR IS 'Signal-to-noise ratio';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.AMPDEF IS 'Defining flag for element amplitude measurement to be used for station/network average';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.AUTH IS 'Author';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.COMMENTS IS 'comment text';
COMMENT ON COLUMN ECM_REF_CHAN_AMPLITUDE.LDDATE IS 'Load date';

-- Table: ECM_REF_DISCRIM
CREATE TABLE ECM_REF_DISCRIM (
    EVID NUMBER(18),
    COV_VERID NUMBER(18),
    DISCRIM_NAME VARCHAR2(15),
    DISCRIM_P_VALUE FLOAT(53),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT ECM_REF_DISCRIM_PK PRIMARY KEY (COV_VERID),
    ,CONSTRAINT ECM_REF_DISCRIM__COV_VERID__CK CHECK (cov_verid >0),
    ,CONSTRAINT ECM_REF_DISCRIM__EVID__CK CHECK (evid >0),
    ,CONSTRAINT ECM_REF_DSCR__DISCRM_P_VAL__CK CHECK (( discrim_p_value >= 0 AND discrim_p_value <=1 ) OR discrim_p_value = -1)
);
COMMENT ON TABLE ECM_REF_DISCRIM IS 'The ecm_ref_discrim table contains a p-value for each refid and discriminant. The refid relates to a specific reference event in the ecm_ref_event.';
COMMENT ON COLUMN ECM_REF_DISCRIM.EVID IS 'Event Identifier';
COMMENT ON COLUMN ECM_REF_DISCRIM.COV_VERID IS 'version identifier of the covariance matrix';
COMMENT ON COLUMN ECM_REF_DISCRIM.DISCRIM_NAME IS 'discriminant of interest';
COMMENT ON COLUMN ECM_REF_DISCRIM.DISCRIM_P_VALUE IS 'p-value of this discriminant for this reference event';
COMMENT ON COLUMN ECM_REF_DISCRIM.AUTH IS 'Author';
COMMENT ON COLUMN ECM_REF_DISCRIM.LDDATE IS 'Load date';

-- Table: ECM_REF_EVENT
CREATE TABLE ECM_REF_EVENT (
    EVID NUMBER(18),
    TIME FLOAT(53),
    LAT FLOAT(53),
    LON FLOAT(53),
    DEPTH FLOAT(24),
    MB FLOAT(24),
    MS FLOAT(24),
    MW FLOAT(24),
    SOURCE_TYPE VARCHAR2(7),
    SUB_TYPE VARCHAR2(10),
    POLYID NUMBER(18),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT ECM_REF_EVENT_PK PRIMARY KEY (EVID),
    ,CONSTRAINT ECM_REF_EVENT__DEPTH__CK CHECK (( depth >= -100 AND depth <=1000 ) OR depth = -999),
    ,CONSTRAINT ECM_REF_EVENT__EVID__CK CHECK (evid >0),
    ,CONSTRAINT ECM_REF_EVENT__LAT__CK CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT ECM_REF_EVENT__LON__CK CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT ECM_REF_EVENT__MB__CK CHECK (( mb >= -9.99 AND mb <=50 ) OR mb = -999),
    ,CONSTRAINT ECM_REF_EVENT__MS__CK CHECK (( ms >= -9.99 AND ms <=50 ) OR ms = -999),
    ,CONSTRAINT ECM_REF_EVENT__MW__CK CHECK (( mw >= -9.99 AND mw <=50 ) OR mw = -999),
    ,CONSTRAINT ECM_REF_EVENT__POLYID__CK CHECK (polyid >0),
    ,CONSTRAINT ECM_REF_EVENT__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE ECM_REF_EVENT IS 'The ecm_ref_event table contains event data for each event u sed to calibrate the ECM.';
COMMENT ON COLUMN ECM_REF_EVENT.EVID IS 'Event Identifier';
COMMENT ON COLUMN ECM_REF_EVENT.TIME IS 'time of reference event';
COMMENT ON COLUMN ECM_REF_EVENT.LAT IS 'Latitude';
COMMENT ON COLUMN ECM_REF_EVENT.LON IS 'Longitude';
COMMENT ON COLUMN ECM_REF_EVENT.DEPTH IS 'depth of reference event';
COMMENT ON COLUMN ECM_REF_EVENT.MB IS 'body wave magnitude of reference event';
COMMENT ON COLUMN ECM_REF_EVENT.MS IS 'surface wave magnitude of reference event';
COMMENT ON COLUMN ECM_REF_EVENT.MW IS 'moment magnitude of reference event';
COMMENT ON COLUMN ECM_REF_EVENT.SOURCE_TYPE IS 'source type of interest';
COMMENT ON COLUMN ECM_REF_EVENT.SUB_TYPE IS 'source sub-type of reference event';
COMMENT ON COLUMN ECM_REF_EVENT.POLYID IS 'Polygon Identifier';
COMMENT ON COLUMN ECM_REF_EVENT.AUTH IS 'Author';
COMMENT ON COLUMN ECM_REF_EVENT.LDDATE IS 'Load date';

-- Table: ECM_REGION_PREF_VERSION
CREATE TABLE ECM_REGION_PREF_VERSION (
    POLYID NUMBER(18),
    COV_VERID NUMBER(18),
    RDA_VERID NUMBER(18),
    AUTH VARCHAR2(15),
    COMMENTS VARCHAR2(4000),
    LDDATE DATE,
    ,CONSTRAINT ECM_REGION_PREF_VERSION_PK PRIMARY KEY (POLYID),
    ,CONSTRAINT ECM_REG_PREF_VER__COV_VID__CK CHECK (cov_verid >0),
    ,CONSTRAINT ECM_REG_PREF_VER__POLYID__CK CHECK (polyid >0),
    ,CONSTRAINT ECM_REG_PREF_VER__RDA_VID__CK CHECK (rda_verid >0)
);
COMMENT ON TABLE ECM_REGION_PREF_VERSION IS 'The ecm_region_pref_version table contains _________________ _______';
COMMENT ON COLUMN ECM_REGION_PREF_VERSION.POLYID IS 'Polygon Identifier';
COMMENT ON COLUMN ECM_REGION_PREF_VERSION.COV_VERID IS 'version identifier of the covariance matrix';
COMMENT ON COLUMN ECM_REGION_PREF_VERSION.RDA_VERID IS 'version identifier of the RDA';
COMMENT ON COLUMN ECM_REGION_PREF_VERSION.AUTH IS 'Author';
COMMENT ON COLUMN ECM_REGION_PREF_VERSION.COMMENTS IS 'comment text';
COMMENT ON COLUMN ECM_REGION_PREF_VERSION.LDDATE IS 'Load date';

-- Table: ECM_SOURCES
CREATE TABLE ECM_SOURCES (
    ORID NUMBER(18),
    SOURCE_TYPE VARCHAR2(15),
    COV_VERID NUMBER(18),
    RDA_VERID NUMBER(18),
    POP_MEM FLOAT(53),
    CON_PROB FLOAT(53),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT ECM_SOURCES_PK PRIMARY KEY (SOURCE_TYPE),
    ,CONSTRAINT ECM_SOURCES__CON_PROB__CK CHECK (( con_prob >= 0 AND con_prob <=1 ) OR con_prob = -1),
    ,CONSTRAINT ECM_SOURCES__COV_VERID__CK CHECK (( cov_verid >0 ) OR cov_verid = -1),
    ,CONSTRAINT ECM_SOURCES__ORID__CK CHECK (orid >0),
    ,CONSTRAINT ECM_SOURCES__POP_MEM__CK CHECK (( pop_mem >= 0 AND pop_mem <=1 ) OR pop_mem = -1),
    ,CONSTRAINT ECM_SOURCES__RDA_VERID__CK CHECK (( rda_verid >0 ) OR rda_verid = -1)
);
COMMENT ON TABLE ECM_SOURCES IS 'The ecm_sources table contains aggregate p-values and poster iori probabilities for each evid and source type.';
COMMENT ON COLUMN ECM_SOURCES.ORID IS 'id of the origin';
COMMENT ON COLUMN ECM_SOURCES.SOURCE_TYPE IS 'source type of interest';
COMMENT ON COLUMN ECM_SOURCES.COV_VERID IS 'version identifier of the covariance matrix';
COMMENT ON COLUMN ECM_SOURCES.RDA_VERID IS 'rda version identifier';
COMMENT ON COLUMN ECM_SOURCES.POP_MEM IS 'p-value for this source type';
COMMENT ON COLUMN ECM_SOURCES.CON_PROB IS 'posteriori probability';
COMMENT ON COLUMN ECM_SOURCES.AUTH IS 'Author';
COMMENT ON COLUMN ECM_SOURCES.LDDATE IS 'Load date';

-- Table: ECM_STA_PREF_VERSION
CREATE TABLE ECM_STA_PREF_VERSION (
    POLYID NUMBER(18),
    STA VARCHAR2(6),
    AMPCOR_VERID NUMBER(18),
    AUTH VARCHAR2(15),
    COMMENTS VARCHAR2(4000),
    LDDATE DATE,
    ,CONSTRAINT ECM_STA_PREF_VERSION_PK PRIMARY KEY (POLYID),
    ,CONSTRAINT ECM_STA_PREF_VER__AC_VID__CK CHECK (ampcor_verid >0 OR ampcor_verid = -1),
    ,CONSTRAINT ECM_STA_PREF_VER__POLYID__CK CHECK (polyid >0),
    ,CONSTRAINT ECM_STA_PREF_VER__STA__CK CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE ECM_STA_PREF_VERSION IS 'The ecm_sta_pref_version table contains ____________________ ____';
COMMENT ON COLUMN ECM_STA_PREF_VERSION.POLYID IS 'Polygon Identifier';
COMMENT ON COLUMN ECM_STA_PREF_VERSION.STA IS 'Station Code';
COMMENT ON COLUMN ECM_STA_PREF_VERSION.AMPCOR_VERID IS 'amplitude correction version identifier';
COMMENT ON COLUMN ECM_STA_PREF_VERSION.AUTH IS 'Author';
COMMENT ON COLUMN ECM_STA_PREF_VERSION.COMMENTS IS 'comment text';
COMMENT ON COLUMN ECM_STA_PREF_VERSION.LDDATE IS 'Load date';

-- Table: ENVELOPE_CONTRIBUTION
CREATE TABLE ENVELOPE_CONTRIBUTION (
    FLO FLOAT(24),
    FHI FLOAT(24),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    ORID NUMBER(18),
    ARID NUMBER(18),
    AMPDEF VARCHAR2(1),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT ENVELOPE_CONTRIBUTION_PK PRIMARY KEY (FLO),
    ,CONSTRAINT ENVELOPE_CONTRIB__AMPDEF__CK CHECK (ampdef IN ( 'd','n','D','N' )),
    ,CONSTRAINT ENVELOPE_CONTRIB__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT ENVELOPE_CONTRIB__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT ENVELOPE_CONTRIB__STA__CK CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE ENVELOPE_CONTRIBUTION IS 'The envelope_contribution table contains information as to w hich frequency bands are defining or nondefining for coda ma gnitude calculation. Bands may be set defining or nondefinin g either automatically by DFX or manually by an analyst.';
COMMENT ON COLUMN ENVELOPE_CONTRIBUTION.FLO IS 'Low corner freq for filter';
COMMENT ON COLUMN ENVELOPE_CONTRIBUTION.FHI IS 'High corner freq for filter';
COMMENT ON COLUMN ENVELOPE_CONTRIBUTION.STA IS 'Station code';
COMMENT ON COLUMN ENVELOPE_CONTRIBUTION.CHAN IS 'Channel code';
COMMENT ON COLUMN ENVELOPE_CONTRIBUTION.ORID IS 'Origin identifier';
COMMENT ON COLUMN ENVELOPE_CONTRIBUTION.ARID IS 'Arrival identifier';
COMMENT ON COLUMN ENVELOPE_CONTRIBUTION.AMPDEF IS 'd or n flag indicating if station/element is included (d,D) or excluded (n,N) from coda magnitude processing';
COMMENT ON COLUMN ENVELOPE_CONTRIBUTION.AUTH IS 'Author';
COMMENT ON COLUMN ENVELOPE_CONTRIBUTION.LDDATE IS 'Load date';

-- Table: EVENT
CREATE TABLE EVENT (
    EVID NUMBER(18),
    EVNAME VARCHAR2(32),
    PREFOR NUMBER(18),
    AUTH VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT EVENT_PK PRIMARY KEY (EVID),
    ,CONSTRAINT EVENT__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT EVENT__EVID__CK CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT EVENT__PREFOR__CK CHECK (prefor > 0)
);
COMMENT ON TABLE EVENT IS 'The event table contains a list of events. Multiple origins may be defined for any one event. The column prefor points t o the preferred origin.';
COMMENT ON COLUMN EVENT.EVID IS 'Event identifier';
COMMENT ON COLUMN EVENT.EVNAME IS 'Event name';
COMMENT ON COLUMN EVENT.PREFOR IS 'Preferred origin';
COMMENT ON COLUMN EVENT.AUTH IS 'Source/originator';
COMMENT ON COLUMN EVENT.COMMID IS 'Comment identifier';
COMMENT ON COLUMN EVENT.LDDATE IS 'Load date';

-- Table: EVENT_CONTROL
CREATE TABLE EVENT_CONTROL (
    ORID NUMBER(18),
    EVID NUMBER(18),
    PREFER_LOC VARCHAR2(1),
    CONSTRAIN_OT NUMBER(1),
    CONSTRAIN_LATLON NUMBER(1),
    CONSTRAIN_DEPTH NUMBER(1),
    SRC_DPNT_CORR NUMBER(2),
    LOC_SRC_DPNT_REG VARCHAR2(15),
    LOC_SDV_SCREEN NUMBER(1),
    LOC_SDV_MULT FLOAT(24),
    LOC_ALPHA_ONLY NUMBER(1),
    LOC_ALL_STAS NUMBER(1),
    LOC_DIST_VARWGT NUMBER(1),
    LOC_USER_VARWGT FLOAT(24),
    MAG_SRC_DPNT_REG VARCHAR2(15),
    MAG_SDV_SCREEN NUMBER(1),
    MAG_SDV_MULT FLOAT(24),
    MAG_ALPHA_ONLY NUMBER(1),
    MAG_ALL_STAS NUMBER(1),
    MB_MIN_DIST FLOAT(24),
    MB_MAX_DIST FLOAT(24),
    MMODEL VARCHAR2(15),
    COV_SM_AXES FLOAT(24),
    COV_DEPTH_TIME FLOAT(24),
    OBS_CORR_METHOD NUMBER(1),
    LDDATE DATE,
    ,CONSTRAINT EVENT_CONTROL_PK PRIMARY KEY (ORID),
    ,CONSTRAINT EVENT_CTRL__CONSTR_DEPTH__CK CHECK (constrain_depth IN (0,1)),
    ,CONSTRAINT EVENT_CTRL__CONSTR_LATLON__CK CHECK (constrain_latlon IN (0,1)),
    ,CONSTRAINT EVENT_CTRL__CONSTR_OT__CK CHECK (constrain_ot IN (0,1)),
    ,CONSTRAINT EVENT_CTRL__COV_DEPTH_TIME__CK CHECK (cov_depth_time > 0.0 OR cov_depth_time = -999.0),
    ,CONSTRAINT EVENT_CTRL__COV_SM_AXES__CK CHECK (cov_sm_axes > 0.0 OR cov_sm_axes = -999.0),
    ,CONSTRAINT EVENT_CTRL__EVID___CK CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT EVENT_CTRL__LOC_ALL_STAS__CK CHECK (loc_all_stas IN (0, 1)),
    ,CONSTRAINT EVENT_CTRL__LOC_ALPHA_ONLY__CK CHECK (loc_alpha_only IN (0, 1)),
    ,CONSTRAINT EVENT_CTRL__LOC_DISTVARWGT__CK CHECK (loc_dist_varwgt IN (0, 1)),
    ,CONSTRAINT EVENT_CTRL__LOC_SDV_MULT__CK CHECK (loc_sdv_mult > 0.0),
    ,CONSTRAINT EVENT_CTRL__LOC_SDV_SCREEN__CK CHECK (loc_sdv_screen IN (0,1)),
    ,CONSTRAINT EVENT_CTRL__LOC_USERVARWGT__CK CHECK (loc_user_varwgt > 0.0 OR loc_user_varwgt = -1.0),
    ,CONSTRAINT EVENT_CTRL__MAG_ALL_STAS__CK CHECK (mag_all_stas IN (0,1)),
    ,CONSTRAINT EVENT_CTRL__MAG_ALPHA_ONLY__CK CHECK (mag_alpha_only IN (0,1)),
    ,CONSTRAINT EVENT_CTRL__MAG_SDV_MULT__CK CHECK (mag_sdv_mult > 0.0),
    ,CONSTRAINT EVENT_CTRL__MAG_SDV_SCREEN__CK CHECK (mag_sdv_screen IN (0,1)),
    ,CONSTRAINT EVENT_CTRL__MB_MAX_DIST__CK CHECK ((mb_max_dist >= 0.0 AND mb_max_dist <= 180.0) OR mb_max_dist = -999.0),
    ,CONSTRAINT EVENT_CTRL__MB_MIN_DIST__CK CHECK ((mb_min_dist >= 0.0 AND mb_min_dist <= 180.0) OR mb_min_dist = -999.0),
    ,CONSTRAINT EVENT_CTRL__OBS_CORR_METH__CK CHECK (obs_corr_method >= 0),
    ,CONSTRAINT EVENT_CTRL__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT EVENT_CTRL__PREFER_LOC__CK CHECK (prefer_loc IN ('F', 'S', 'R')),
    ,CONSTRAINT EVENT_CTRL__SRC_DPNT_CORR__CK CHECK (src_dpnt_corr IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13))
);
COMMENT ON TABLE EVENT_CONTROL IS 'The event_control table contains event location and magnitud e control parameters. This information acts as an archive of the specific user-defined controls that were used to determ ine the location and magnitude of a given orid. The table al so includes two measurement columns (cov_sm_axes and cov_dep th_time) that allow the coverage ellipse to be determined fr om the confidence ellipse axes.';
COMMENT ON COLUMN EVENT_CONTROL.ORID IS 'Origin identification';
COMMENT ON COLUMN EVENT_CONTROL.EVID IS 'Event identification';
COMMENT ON COLUMN EVENT_CONTROL.PREFER_LOC IS 'Preferred location identifier (S, F, R)';
COMMENT ON COLUMN EVENT_CONTROL.CONSTRAIN_OT IS 'Flag to constrain origin time';
COMMENT ON COLUMN EVENT_CONTROL.CONSTRAIN_LATLON IS 'Flag to constrain latitude/longitude';
COMMENT ON COLUMN EVENT_CONTROL.CONSTRAIN_DEPTH IS 'Flag to constrain depth';
COMMENT ON COLUMN EVENT_CONTROL.SRC_DPNT_CORR IS 'Source-dependent correction code';
COMMENT ON COLUMN EVENT_CONTROL.LOC_SRC_DPNT_REG IS 'Region name of source-dependent location correction';
COMMENT ON COLUMN EVENT_CONTROL.LOC_SDV_SCREEN IS 'Flag to ignore large data residuals in location';
COMMENT ON COLUMN EVENT_CONTROL.LOC_SDV_MULT IS 'Location large residual multiplier factor';
COMMENT ON COLUMN EVENT_CONTROL.LOC_ALPHA_ONLY IS 'Flag to use only primary stations in location';
COMMENT ON COLUMN EVENT_CONTROL.LOC_ALL_STAS IS 'Flag to use only stations with src_dpnt_corr';
COMMENT ON COLUMN EVENT_CONTROL.LOC_DIST_VARWGT IS 'Flag to use distance variance weighting';
COMMENT ON COLUMN EVENT_CONTROL.LOC_USER_VARWGT IS 'User-defined variance weighting';
COMMENT ON COLUMN EVENT_CONTROL.MAG_SRC_DPNT_REG IS 'Region name of source-dependent magnitude correction';
COMMENT ON COLUMN EVENT_CONTROL.MAG_SDV_SCREEN IS 'Flag to ignore large magnitude data residuals';
COMMENT ON COLUMN EVENT_CONTROL.MAG_SDV_MULT IS 'Magnitude large residual multiplier factor';
COMMENT ON COLUMN EVENT_CONTROL.MAG_ALPHA_ONLY IS 'Flag to limit station net used in magnitude';
COMMENT ON COLUMN EVENT_CONTROL.MAG_ALL_STAS IS 'Flag to use only primary stations in magnitude';
COMMENT ON COLUMN EVENT_CONTROL.MB_MIN_DIST IS 'Minimum distance (degrees) for mb';
COMMENT ON COLUMN EVENT_CONTROL.MB_MAX_DIST IS 'Maximum distance (degrees) for mb';
COMMENT ON COLUMN EVENT_CONTROL.MMODEL IS 'Network magnitude model';
COMMENT ON COLUMN EVENT_CONTROL.COV_SM_AXES IS 'Coverage ellipse semi-axes conversion factor';
COMMENT ON COLUMN EVENT_CONTROL.COV_DEPTH_TIME IS 'Coverage ellipse depth/time conversion factor';
COMMENT ON COLUMN EVENT_CONTROL.OBS_CORR_METHOD IS 'Observed Correlation Method';
COMMENT ON COLUMN EVENT_CONTROL.LDDATE IS 'Load date';

-- Table: EVENT_CORRELATION
CREATE TABLE EVENT_CORRELATION (
    CORR_ID NUMBER(18),
    SOURCE_ORID NUMBER(18),
    SOURCE_EVID NUMBER(18),
    SOURCE_STARTTIME FLOAT(53),
    SOURCE_SECS FLOAT(53),
    REFERENCE_ORID NUMBER(18),
    REFERENCE_EVID NUMBER(18),
    REFERENCE_STARTTIME FLOAT(53),
    REFERENCE_SECS FLOAT(53),
    STA VARCHAR2(6),
    FILTER_STRING VARCHAR2(2000),
    NUM_CHAN NUMBER(9),
    CHAN_LIST VARCHAR2(2000),
    CORR_COEF FLOAT(53),
    CORR_TIME FLOAT(53),
    SCAN_TYPE VARCHAR2(32),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT EVENT_CORRELATION_PK PRIMARY KEY (CORR_ID),
    ,CONSTRAINT EVENT_CORR__CORR_ID__CK CHECK (corr_id > 0),
    ,CONSTRAINT EVENT_CORR__REF_EVID__CK CHECK (reference_evid > 0),
    ,CONSTRAINT EVENT_CORR__REF_ORID__CK CHECK (reference_orid > 0),
    ,CONSTRAINT EVENT_CORR__SOURCE_EVID__CK CHECK (source_evid > 0 OR source_evid = -1),
    ,CONSTRAINT EVENT_CORR__SOURCE_ORID__CK CHECK (source_orid > 0)
);
COMMENT ON TABLE EVENT_CORRELATION IS 'The event_Correlation table containts correlations between s ource events in the NDC operational database to reference ev ents in the NDC archive databases for time periods as great as 15 years.';
COMMENT ON COLUMN EVENT_CORRELATION.CORR_ID IS 'Correlation Identifier';
COMMENT ON COLUMN EVENT_CORRELATION.SOURCE_ORID IS 'The source origin used in the event correlation.';
COMMENT ON COLUMN EVENT_CORRELATION.SOURCE_EVID IS 'The source event used in the event correlation.';
COMMENT ON COLUMN EVENT_CORRELATION.SOURCE_STARTTIME IS 'The start time of the source waveform segment used for correlation.';
COMMENT ON COLUMN EVENT_CORRELATION.SOURCE_SECS IS 'The length of the source waveform in seconds used for correlation.';
COMMENT ON COLUMN EVENT_CORRELATION.REFERENCE_ORID IS 'The reference origin for this correlation from the archive database.';
COMMENT ON COLUMN EVENT_CORRELATION.REFERENCE_EVID IS 'The reference event for this correlation from the archive database.';
COMMENT ON COLUMN EVENT_CORRELATION.REFERENCE_STARTTIME IS 'The start time of the reference waveform segment used for correlation.';
COMMENT ON COLUMN EVENT_CORRELATION.REFERENCE_SECS IS 'The length of the reference waveform in seconds used for correlation.';
COMMENT ON COLUMN EVENT_CORRELATION.STA IS 'Station identifier';
COMMENT ON COLUMN EVENT_CORRELATION.FILTER_STRING IS 'Compact filter representation used as parameter to filter_data_by_string module.';
COMMENT ON COLUMN EVENT_CORRELATION.NUM_CHAN IS 'Number of channels in CHAN_LIST';
COMMENT ON COLUMN EVENT_CORRELATION.CHAN_LIST IS 'List of channels used for array correlation';
COMMENT ON COLUMN EVENT_CORRELATION.CORR_COEF IS 'Correlation coefficient used in this correlation calculation.';
COMMENT ON COLUMN EVENT_CORRELATION.CORR_TIME IS 'Correlation time of event.';
COMMENT ON COLUMN EVENT_CORRELATION.SCAN_TYPE IS 'Correlation Scan type: AUTO, USER, or REF.';
COMMENT ON COLUMN EVENT_CORRELATION.AUTHOR IS 'Author of this correlation.';
COMMENT ON COLUMN EVENT_CORRELATION.MODDATE IS 'Modification Date.';
COMMENT ON COLUMN EVENT_CORRELATION.LDDATE IS 'Load Date.';

-- Table: EVENT_QUALITY
CREATE TABLE EVENT_QUALITY (
    EQID NUMBER(18),
    ORID NUMBER(18),
    EVQUAL FLOAT(24),
    NETPROB FLOAT(24),
    DETPROB FLOAT(24),
    HISTPROB FLOAT(24),
    NNDEF FLOAT(24),
    NSMAJAX FLOAT(24),
    NDELTA_STA FLOAT(24),
    NTIMERES FLOAT(24),
    NAZRES FLOAT(24),
    NSLORES FLOAT(24),
    NAMPRES FLOAT(24),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT EVENT_QUALITY_PK PRIMARY KEY (EQID),
    ,CONSTRAINT EVENT_QUALITY__DETPROB__CK CHECK ((detprob >= 0.0 AND detprob <= 1.0) OR detprob = -999),
    ,CONSTRAINT EVENT_QUALITY__EQID__CK CHECK (eqid > 0),
    ,CONSTRAINT EVENT_QUALITY__EVQUAL__CK CHECK (evqual >= 0.0 AND evqual <= 1.0),
    ,CONSTRAINT EVENT_QUALITY__HISTPROB__CK CHECK ((histprob >= 0.0 AND histprob <= 1.0) OR histprob = -999),
    ,CONSTRAINT EVENT_QUALITY__NAMPRES__CK CHECK (( nampres >= 0.0 AND nampres <= 1.0 ) OR nampres = -999),
    ,CONSTRAINT EVENT_QUALITY__NAZRES__CK CHECK (( nazres >= 0.0 AND nazres <= 1.0 ) OR nazres = -999),
    ,CONSTRAINT EVENT_QUALITY__NDELTA_STA__CK CHECK (ndelta_sta >= 0.0 AND ndelta_sta <= 1.0),
    ,CONSTRAINT EVENT_QUALITY__NETPROB__CK CHECK ((netprob >= 0.0 AND netprob <= 1.0) OR netprob = -999),
    ,CONSTRAINT EVENT_QUALITY__NNDEF__CK CHECK (nndef >= 0.0 AND nndef <= 1.0),
    ,CONSTRAINT EVENT_QUALITY__NSLORES__CK CHECK (( nslores >= 0.0 AND nslores <= 1.0 ) OR nslores = -999),
    ,CONSTRAINT EVENT_QUALITY__NSMAJAX__CK CHECK (nsmajax >= 0.0 AND nsmajax <= 1.0),
    ,CONSTRAINT EVENT_QUALITY__NTIMERES__CK CHECK (ntimeres >= 0.0 AND ntimeres <= 1.0),
    ,CONSTRAINT EVENT_QUALITY__ORID__CK CHECK (orid > 0)
);
COMMENT ON TABLE EVENT_QUALITY IS 'The event_quality table holds the event quality attributes t hat are calculated by various processes such as EvLoc, ARS, and GAConflict using the Event Quality Generator.';
COMMENT ON COLUMN EVENT_QUALITY.EQID IS 'Event quality identifier';
COMMENT ON COLUMN EVENT_QUALITY.ORID IS 'Origin identifier';
COMMENT ON COLUMN EVENT_QUALITY.EVQUAL IS 'Event quality';
COMMENT ON COLUMN EVENT_QUALITY.NETPROB IS 'Network probability';
COMMENT ON COLUMN EVENT_QUALITY.DETPROB IS 'Detection probability';
COMMENT ON COLUMN EVENT_QUALITY.HISTPROB IS 'Historic probability';
COMMENT ON COLUMN EVENT_QUALITY.NNDEF IS 'Normalized number of defining phases';
COMMENT ON COLUMN EVENT_QUALITY.NSMAJAX IS 'Normalized semi-major axis of error ellipse';
COMMENT ON COLUMN EVENT_QUALITY.NDELTA_STA IS 'Normalized distance to the closest station';
COMMENT ON COLUMN EVENT_QUALITY.NTIMERES IS 'Normalized time residual';
COMMENT ON COLUMN EVENT_QUALITY.NAZRES IS 'Normalized azimuth residual';
COMMENT ON COLUMN EVENT_QUALITY.NSLORES IS 'Normalized slowness residual';
COMMENT ON COLUMN EVENT_QUALITY.NAMPRES IS 'Normalized amplitude residual';
COMMENT ON COLUMN EVENT_QUALITY.AUTH IS 'Author';
COMMENT ON COLUMN EVENT_QUALITY.LDDATE IS 'Load date';

-- Table: FEEDBACK
CREATE TABLE FEEDBACK (
    FEEDBACK_ID NUMBER(18),
    EVID NUMBER(18),
    ORID NUMBER(18),
    EVENT_TIME FLOAT(53),
    TITLE VARCHAR2(64),
    ANALYST VARCHAR2(32),
    ACCOUNT VARCHAR2(15),
    FEEDBACK_ANALYST VARCHAR2(32),
    FEEDBACK_ACCOUNT VARCHAR2(15),
    DESCRIPTION ,
    RESPONSE VARCHAR2(4000),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT FEEDBACK_PK PRIMARY KEY (FEEDBACK_ID),
    ,CONSTRAINT FEEDBACK__EVENT_TIME__CK CHECK (event_time >= -9999999999.999),
    ,CONSTRAINT FEEDBACK__EVID__CK CHECK (evid > 0),
    ,CONSTRAINT FEEDBACK__FEEDBACK_ID__CK CHECK (feedback_id > 0),
    ,CONSTRAINT FEEDBACK__ORID__CK CHECK (orid > 0)
);
COMMENT ON TABLE FEEDBACK IS 'The feedback table contains analyst feedback from one analys t regarding a discrepancy made by another analyst'' work in t he Analyst Review System (ARS).';
COMMENT ON COLUMN FEEDBACK.FEEDBACK_ID IS 'Feedback Identifier';
COMMENT ON COLUMN FEEDBACK.EVID IS 'Event Identifier';
COMMENT ON COLUMN FEEDBACK.ORID IS 'Origin Identifier';
COMMENT ON COLUMN FEEDBACK.EVENT_TIME IS 'Epoch time that the event occurred.';
COMMENT ON COLUMN FEEDBACK.TITLE IS 'Feedback title';
COMMENT ON COLUMN FEEDBACK.ANALYST IS 'The targeted analyst the feedback pertains to.';
COMMENT ON COLUMN FEEDBACK.ACCOUNT IS 'Pipeline account that the analyst is receiving feedback for.';
COMMENT ON COLUMN FEEDBACK.FEEDBACK_ANALYST IS 'The original analyst of the event being reviewed.';
COMMENT ON COLUMN FEEDBACK.FEEDBACK_ACCOUNT IS 'Pipeline account from which the analyst is receiving feedback.';
COMMENT ON COLUMN FEEDBACK.DESCRIPTION IS 'A detailed description of the feedback to the analyst. This is the primary description of the problem from the author to the analyst.';
COMMENT ON COLUMN FEEDBACK.RESPONSE IS 'This is the response by the analyst to the given feedback. If the feedback is rejected, this is where the reason for rejection should be documented. Rejection is used to allow accurate trending of fe edback';
COMMENT ON COLUMN FEEDBACK.AUTHOR IS 'The analyst creating the feedback';
COMMENT ON COLUMN FEEDBACK.MODDATE IS 'Modification date';
COMMENT ON COLUMN FEEDBACK.LDDATE IS 'Load date';

-- Table: FEEDBACK_CATAFFILIATION
CREATE TABLE FEEDBACK_CATAFFILIATION (
    FBAFFILIATION_ID NUMBER(18),
    FEEDBACK_ID NUMBER(18),
    FBCATEGORY_ID NUMBER(18),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT FEEDBACK_CATAFFILIATION_PK PRIMARY KEY (FBAFFILIATION_ID),
    ,CONSTRAINT FB_CATAFF__FBAFFIL_ID__CK CHECK (fbaffiliation_id > 0),
    ,CONSTRAINT FB_CATAFF__FBCATEGORY_ID__CK CHECK (fbcategory_id > 0),
    ,CONSTRAINT FB_CATAFF__FEEDBACK_ID__CK CHECK (feedback_id > 0)
);
COMMENT ON TABLE FEEDBACK_CATAFFILIATION IS 'The feedback_cataffiliation contains foregin keys to the fee dback table and feedback_categories table to assign categori cal affiliation(s) to each feedback.';
COMMENT ON COLUMN FEEDBACK_CATAFFILIATION.FBAFFILIATION_ID IS 'Feedback Affiliation Identifier.';
COMMENT ON COLUMN FEEDBACK_CATAFFILIATION.FEEDBACK_ID IS 'Feedback Identifier';
COMMENT ON COLUMN FEEDBACK_CATAFFILIATION.FBCATEGORY_ID IS 'Feedback Category Identifier';
COMMENT ON COLUMN FEEDBACK_CATAFFILIATION.AUTHOR IS 'The analyst creating the feedback.';
COMMENT ON COLUMN FEEDBACK_CATAFFILIATION.MODDATE IS 'Modification date';
COMMENT ON COLUMN FEEDBACK_CATAFFILIATION.LDDATE IS 'Load date';

-- Table: FEEDBACK_CATEGORIES
CREATE TABLE FEEDBACK_CATEGORIES (
    FBCATEGORY_ID NUMBER(18),
    TITLE VARCHAR2(64),
    DESCRIPTION VARCHAR2(4000),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT FEEDBACK_CATEGORIES_PK PRIMARY KEY (FBCATEGORY_ID),
    ,CONSTRAINT FB_CATEGORIES__FBCAT_ID__CK CHECK (fbcategory_id > 0)
);
COMMENT ON TABLE FEEDBACK_CATEGORIES IS 'The feedback_categories table contains descriptions of each feedback category referenced by the feedback_cataffiliation table.';
COMMENT ON COLUMN FEEDBACK_CATEGORIES.FBCATEGORY_ID IS 'Feedback Category Identifier';
COMMENT ON COLUMN FEEDBACK_CATEGORIES.TITLE IS 'Short description/title of the feedback category';
COMMENT ON COLUMN FEEDBACK_CATEGORIES.DESCRIPTION IS 'Detailed description of the feedback category';
COMMENT ON COLUMN FEEDBACK_CATEGORIES.AUTHOR IS 'The analyst creating the feedback.';
COMMENT ON COLUMN FEEDBACK_CATEGORIES.MODDATE IS 'Modification date';
COMMENT ON COLUMN FEEDBACK_CATEGORIES.LDDATE IS 'Load date';

-- Table: FEEDBACK_SCREENSHOTS
CREATE TABLE FEEDBACK_SCREENSHOTS (
    FBSCREENSHOT_ID NUMBER(18),
    FEEDBACK_ID NUMBER(18),
    TITLE VARCHAR2(64),
    DESCRIPTION VARCHAR2(4000),
    SCREENSHOT ,
    TYPE VARCHAR2(10),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT FEEDBACK_SCREENSHOTS_PK PRIMARY KEY (FBSCREENSHOT_ID),
    ,CONSTRAINT FEEDBACK_SS__FBSS_ID__CK CHECK (fbscreenshot_id > 0),
    ,CONSTRAINT FEEDBACK_SS__FEEDBACK_ID__CK CHECK (feedback_id > 0),
    ,CONSTRAINT FEEDBACK_SS__TYPE__CK CHECK (type IN ('png', 'PNG'))
);
COMMENT ON TABLE FEEDBACK_SCREENSHOTS IS 'The feedback_screenshots table contains image files related to feedback entries.';
COMMENT ON COLUMN FEEDBACK_SCREENSHOTS.FBSCREENSHOT_ID IS 'Feedback Screenshot Identifier';
COMMENT ON COLUMN FEEDBACK_SCREENSHOTS.FEEDBACK_ID IS 'Feedback Identifier';
COMMENT ON COLUMN FEEDBACK_SCREENSHOTS.TITLE IS 'Short description/title of the screenshot';
COMMENT ON COLUMN FEEDBACK_SCREENSHOTS.DESCRIPTION IS 'Detailed description of the screenshot';
COMMENT ON COLUMN FEEDBACK_SCREENSHOTS.SCREENSHOT IS 'A binary storage for an image file';
COMMENT ON COLUMN FEEDBACK_SCREENSHOTS.TYPE IS 'Screenshot image file type (Initial allowable types (jpg, jpeg, png))';
COMMENT ON COLUMN FEEDBACK_SCREENSHOTS.AUTHOR IS 'The analyst creating the feedback.';
COMMENT ON COLUMN FEEDBACK_SCREENSHOTS.MODDATE IS 'Modification date';
COMMENT ON COLUMN FEEDBACK_SCREENSHOTS.LDDATE IS 'Load date';

-- Table: FEEDBACK_STATE
CREATE TABLE FEEDBACK_STATE (
    FBSTATE_ID NUMBER(18),
    FEEDBACK_ID NUMBER(18),
    FBSTATECATEGORY_ID NUMBER(18),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT FEEDBACK_STATE_PK PRIMARY KEY (FBSTATE_ID),
    ,CONSTRAINT FB_STATE__FBSTATECAT_ID__CK CHECK (fbstatecategory_id > 0),
    ,CONSTRAINT FB_STATE__FBSTATE_ID__CK CHECK (fbstate_id > 0),
    ,CONSTRAINT FB_STATE__FEEDBACK_ID__CK CHECK (feedback_id > 0)
);
COMMENT ON TABLE FEEDBACK_STATE IS 'The feedback_state table contains one or more states a feedb ack is currently in or has formerly been in. A Feedback entr y can only be in one state at a time, such as saved or rejec ted. As a feedback progresses through its lifecycle, it will have more than one state per feedback entry, and the latest one entered in this table will always be the current state.';
COMMENT ON COLUMN FEEDBACK_STATE.FBSTATE_ID IS 'Feedback State Identifier';
COMMENT ON COLUMN FEEDBACK_STATE.FEEDBACK_ID IS 'Feedback Identifier';
COMMENT ON COLUMN FEEDBACK_STATE.FBSTATECATEGORY_ID IS 'Feedback State Category Identifier';
COMMENT ON COLUMN FEEDBACK_STATE.AUTHOR IS 'The analyst creating the feedback.';
COMMENT ON COLUMN FEEDBACK_STATE.MODDATE IS 'Modification date';
COMMENT ON COLUMN FEEDBACK_STATE.LDDATE IS 'Load date';

-- Table: FEEDBACK_STATE_CATEGORIES
CREATE TABLE FEEDBACK_STATE_CATEGORIES (
    FBSTATECATEGORY_ID NUMBER(18),
    TITLE VARCHAR2(64),
    DESCRIPTION VARCHAR2(4000),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT FEEDBACK_STATE_CATEGORIES_PK PRIMARY KEY (FBSTATECATEGORY_ID),
    ,CONSTRAINT FB_STATE_CAT__FBSTCAT_ID__CK CHECK (fbstatecategory_id > 0)
);
COMMENT ON TABLE FEEDBACK_STATE_CATEGORIES IS 'The feedback_state_category contains descriptions of the var ious states a feedback record can be in such as saved or rej ected.';
COMMENT ON COLUMN FEEDBACK_STATE_CATEGORIES.FBSTATECATEGORY_ID IS 'Feedback State Category Identifier';
COMMENT ON COLUMN FEEDBACK_STATE_CATEGORIES.TITLE IS 'Short description/title of the feedback state category';
COMMENT ON COLUMN FEEDBACK_STATE_CATEGORIES.DESCRIPTION IS 'Detailed description of the feedback state category';
COMMENT ON COLUMN FEEDBACK_STATE_CATEGORIES.AUTHOR IS 'The analyst creating the feedback state category.';
COMMENT ON COLUMN FEEDBACK_STATE_CATEGORIES.MODDATE IS 'Modification date';
COMMENT ON COLUMN FEEDBACK_STATE_CATEGORIES.LDDATE IS 'Load date';

-- Table: FILTER
CREATE TABLE FILTER (
    FILTERID NUMBER(18),
    COMPOUND_FILTER ,
    FILTER_METHOD VARCHAR2(2),
    FILTER_STRING VARCHAR2(2000),
    FILTER_HASH VARCHAR2(2000),
    LDDATE DATE,
    ,CONSTRAINT FILTER_PK PRIMARY KEY (FILTERID),
    ,CONSTRAINT FILTER__COMPOUND_FILTER__CK CHECK (compound_filter IN ('y','n')),
    ,CONSTRAINT FILTER__FILTERID__CK CHECK (filterid > 0),
    ,CONSTRAINT FILTER__FILT_METH__CK CHECK (filter_method IN ('A','B','C','F','G','N','O','U','W'))
);
COMMENT ON TABLE FILTER IS 'The filter table will contain the core information needed to identify filters. The attributes in this table will be high ly indexed for fast searching. The attributes will allow app lication to quickly access enough information to 1) determin e the type of filter so that an application can branch accor dingly to efficiently handle loading or 2) determine uniquen ess when assessing if a filter does or does not exist.';
COMMENT ON COLUMN FILTER.FILTERID IS 'Identifier for a filter or filter collection.';
COMMENT ON COLUMN FILTER.COMPOUND_FILTER IS 'Flag to indicate parent. [Y,N]';
COMMENT ON COLUMN FILTER.FILTER_METHOD IS 'Filter algorithm family. [Cascade, AR, Butterworth, Phase_Matched, Digital, Dynamic, etc.]';
COMMENT ON COLUMN FILTER.FILTER_STRING IS 'Compact filter representation used as parameter to filter_data_by_string module.';
COMMENT ON COLUMN FILTER.FILTER_HASH IS 'Standardized filter specification, formatted for uniqueness checking and fast access.';
COMMENT ON COLUMN FILTER.LDDATE IS 'Load Date.';

-- Table: FILTER_COEFFICIENTS
CREATE TABLE FILTER_COEFFICIENTS (
    FILTERID NUMBER(18),
    VALUE_NAME VARCHAR2(48),
    COL_SEQ NUMBER(9),
    D_VALUE FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT FILTER_COEFFICIENTS_PK PRIMARY KEY (VALUE_NAME),
    ,CONSTRAINT FILTER_COEFF__COL_SEQ__CK CHECK (col_seq > 0),
    ,CONSTRAINT FILTER_COEFF__D_VALUE_CK CHECK (D_VALUE >= -9999999999.999),
    ,CONSTRAINT FILTER_COEFF__FILTERID__CK CHECK (filterid > 0)
);
COMMENT ON TABLE FILTER_COEFFICIENTS IS 'The filter_coefficients table contains a collection of doubl e precision coefficients for a filter. For the persistent pa rameters bundle, the filter_coefficients table will be used to store numerator and denominator coefficients for a coeffi cient configured filter, identified by a parent record in th e filter table.';
COMMENT ON COLUMN FILTER_COEFFICIENTS.FILTERID IS 'Filter identifier';
COMMENT ON COLUMN FILTER_COEFFICIENTS.VALUE_NAME IS 'Attribute name (e.g. numerator_coeff)';
COMMENT ON COLUMN FILTER_COEFFICIENTS.COL_SEQ IS 'collection sequence/order';
COMMENT ON COLUMN FILTER_COEFFICIENTS.D_VALUE IS 'Double precision coefficient value';
COMMENT ON COLUMN FILTER_COEFFICIENTS.LDDATE IS 'Load date';

-- Table: FILTER_GROUP
CREATE TABLE FILTER_GROUP (
    PARENT_FILTERID NUMBER(18),
    CHILD_FILTERID NUMBER(18),
    CHILD_SEQUENCE NUMBER(9),
    CHILD_FUNCTION ,
    LDDATE DATE,
    ,CONSTRAINT FILTER_GROUP_PK PRIMARY KEY (CHILD_FILTERID),
    ,CONSTRAINT FILTER_GROUP__CHILD_FUNCT__CK CHECK (child_function IN ('f','c')),
    ,CONSTRAINT FILTER_GROUP__CHILD_SEQ__CK CHECK (child_sequence > 0),
    ,CONSTRAINT FILTER_GROUP__CHI_FILTERID__CK CHECK (child_filterid > 0),
    ,CONSTRAINT FILTER_GROUP__PAR_FILTERID__CK CHECK (parent_filterid > 0)
);
COMMENT ON TABLE FILTER_GROUP IS 'The filter_group table is used to link together the individu al filters of a compound filter. The parent filter record of a compound filter will have a compound_filter indicator val ue of ''Y'' and may have a filter method of ''Cascade'' or ''AR''. The filter_group table will contain one record for each fil ter in the compound filter group, all sharing a common paren t filter record. For Flexibility, the key to the record is p arent_filterid-child_filterid-child_sequence, to allow compl ex compound filters to use a filter more than once.';
COMMENT ON COLUMN FILTER_GROUP.PARENT_FILTERID IS 'Identifier for a collection or group of filters.';
COMMENT ON COLUMN FILTER_GROUP.CHILD_FILTERID IS 'Identifier for a simple / single filter.';
COMMENT ON COLUMN FILTER_GROUP.CHILD_SEQUENCE IS 'Order that the child filter should be applied.';
COMMENT ON COLUMN FILTER_GROUP.CHILD_FUNCTION IS 'Designation of the child filter role in the collection, either as a standard filter or as a conditioning filter. [F,C]';
COMMENT ON COLUMN FILTER_GROUP.LDDATE IS 'Load Date';

-- Table: FILTER_VALUES_DOUBLE
CREATE TABLE FILTER_VALUES_DOUBLE (
    FILTERID NUMBER(18),
    VALUE_NAME VARCHAR2(48),
    D_VALUE FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT FILTER_VALUES_DOUBLE_PK PRIMARY KEY (VALUE_NAME),
    ,CONSTRAINT FILTER_VAL_DBL__D_VALUE__CK CHECK (D_VALUE >= -9999999999.999),
    ,CONSTRAINT FILTER_VAL_DBL__FILTERID__CK CHECK (filterid > 0)
);
COMMENT ON TABLE FILTER_VALUES_DOUBLE IS 'The filter_values_double table will store filter parameters and metadata (float values). Each record will contain only o ne piece of information. Each filter type will store only th ose pieces of information that are pertinent to that filter type. A butterworth filter will have fhi and flo attribute r ecords while digital filters may have num_numerator_coeffs o r compute_time_shift attributes.';
COMMENT ON COLUMN FILTER_VALUES_DOUBLE.FILTERID IS 'Filter identifier';
COMMENT ON COLUMN FILTER_VALUES_DOUBLE.VALUE_NAME IS 'Attribute name, (e.g. fhi, flo)';
COMMENT ON COLUMN FILTER_VALUES_DOUBLE.D_VALUE IS 'Double precision value';
COMMENT ON COLUMN FILTER_VALUES_DOUBLE.LDDATE IS 'Load date';

-- Table: FILTER_VALUES_INTEGER
CREATE TABLE FILTER_VALUES_INTEGER (
    FILTERID NUMBER(18),
    VALUE_NAME VARCHAR2(48),
    I_VALUE NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT FILTER_VALUES_INTEGER_PK PRIMARY KEY (FILTERID),
    ,CONSTRAINT FILTER_VAL_INT__FILTERID__CK CHECK (filterid > 0)
);
COMMENT ON TABLE FILTER_VALUES_INTEGER IS 'The filter_values_double table will store filter parameters and metadata (integer values). Each record will contain only one piece of information. Each filter type will store only those pieces of information that are pertinent to that filte r type. A butterworth filter will have fhi and flo attribute records while digital filters may have num_numerator_coeffs or compute_time_shift attributes.';
COMMENT ON COLUMN FILTER_VALUES_INTEGER.FILTERID IS 'Filter identifier';
COMMENT ON COLUMN FILTER_VALUES_INTEGER.VALUE_NAME IS 'Attribute name, (e.g. fhi, flo)';
COMMENT ON COLUMN FILTER_VALUES_INTEGER.I_VALUE IS 'Integer value.';
COMMENT ON COLUMN FILTER_VALUES_INTEGER.LDDATE IS 'Load date';

-- Table: FILTER_VALUES_STRING
CREATE TABLE FILTER_VALUES_STRING (
    FILTERID NUMBER(18),
    VALUE_NAME VARCHAR2(48),
    S_VALUE VARCHAR2(1024),
    LDDATE DATE,
    ,CONSTRAINT FILTER_VALUES_STRING_PK PRIMARY KEY (FILTERID),
    ,CONSTRAINT FILTER_VAL_STR__FILTERID__CK CHECK (filterid > 0)
);
COMMENT ON TABLE FILTER_VALUES_STRING IS 'The filter_values_string table will store filter parameters and metadata (string values). Each record will contain only one piece of information. Each filter type will store only those pieces of information that are pertinent to that filte r type. A butterworth filter will have fhi and flo attribute records while digital filters may have num_numerator_coeffs or compute_time_shift attributes.';
COMMENT ON COLUMN FILTER_VALUES_STRING.FILTERID IS 'Filter identifier';
COMMENT ON COLUMN FILTER_VALUES_STRING.VALUE_NAME IS 'Attribute name, (e.g. fhi, flo)';
COMMENT ON COLUMN FILTER_VALUES_STRING.S_VALUE IS 'String value';
COMMENT ON COLUMN FILTER_VALUES_STRING.LDDATE IS 'Load date';

-- Table: FK_PROCESSING
CREATE TABLE FK_PROCESSING (
    ARID NUMBER(18),
    PROCID NUMBER(18),
    LEAD FLOAT(24),
    LAG FLOAT(24),
    FKFHI FLOAT(24),
    FKFLO FLOAT(24),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT FK_PROCESSING_PK PRIMARY KEY (PROCID),
    ,CONSTRAINT FK_PROCESSING__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT FK_PROCESSING__FKFHI__CK CHECK (fkfhi > 0 OR fkfhi = -1),
    ,CONSTRAINT FK_PROCESSING__FKFLO__CK CHECK (fkflo > 0 OR fkflo = -1),
    ,CONSTRAINT FK_PROCESSING__LAG__CK CHECK (lag > 0 OR lag = -1),
    ,CONSTRAINT FK_PROCESSING__LEAD__CK CHECK (lead > 0 OR lead = -1),
    ,CONSTRAINT FK_PROCESSING__PROCID__CK CHECK (procid > 0)
);
COMMENT ON TABLE FK_PROCESSING IS 'The fk_processing table contains identifiers to link paramet ers for fk processing. It provides an override of the defaul t processing for a station and phase. This override is speci fied on a per arrival basis.';
COMMENT ON COLUMN FK_PROCESSING.ARID IS 'Arrival identifier';
COMMENT ON COLUMN FK_PROCESSING.PROCID IS 'ID number of a set of waveform processing parameters';
COMMENT ON COLUMN FK_PROCESSING.LEAD IS 'Number of seconds before phase to include in processing';
COMMENT ON COLUMN FK_PROCESSING.LAG IS 'Number of seconds after phase to include in processing';
COMMENT ON COLUMN FK_PROCESSING.FKFHI IS 'FK fhi value';
COMMENT ON COLUMN FK_PROCESSING.FKFLO IS 'FK flo value';
COMMENT ON COLUMN FK_PROCESSING.AUTH IS 'Author';
COMMENT ON COLUMN FK_PROCESSING.LDDATE IS 'Load date';

-- Table: FTPFAILED
CREATE TABLE FTPFAILED (
    MSGID NUMBER(18),
    FTP_ADDRESS VARCHAR2(64),
    NUMFAILEDATTEMPT NUMBER(2),
    LASTFAILEDTIME FLOAT(53),
    FTPSTATUS VARCHAR2(8),
    LDDATE DATE,
    ,CONSTRAINT FTPFAILED_PK PRIMARY KEY (MSGID),
    ,CONSTRAINT FTPFAILED__FTPSTATUS__CK CHECK (ftpstatus IN ('retry','failed','-')),
    ,CONSTRAINT FTPFAILED__LASTFAILEDTIME__CK CHECK (lastfailedtime > -9999999999.999),
    ,CONSTRAINT FTPFAILED__MSGID__CK CHECK (msgid > 0 OR msgid = -1),
    ,CONSTRAINT FTPFAILED__NUMFAILEDATTEMPT_CK CHECK (numfailedattempt > 0 OR numfailedattempt = 0)
);
COMMENT ON TABLE FTPFAILED IS 'The ftpfailed table facilitates ftp retrieval and the placem ent of data messages between contributing systems.';
COMMENT ON COLUMN FTPFAILED.MSGID IS 'Message identifier';
COMMENT ON COLUMN FTPFAILED.FTP_ADDRESS IS 'ftp address for auxilary data';
COMMENT ON COLUMN FTPFAILED.NUMFAILEDATTEMPT IS 'Number of failed attempts';
COMMENT ON COLUMN FTPFAILED.LASTFAILEDTIME IS 'Time of most recent attempt';
COMMENT ON COLUMN FTPFAILED.FTPSTATUS IS 'Status of ftp attempt (retry or failed)';
COMMENT ON COLUMN FTPFAILED.LDDATE IS 'Load date';

-- Table: FTPLOGIN
CREATE TABLE FTPLOGIN (
    FTP_ADDRESS VARCHAR2(64),
    USERNAME VARCHAR2(24),
    PASSWORD VARCHAR2(16),
    LDDATE DATE,
    ,CONSTRAINT FTPLOGIN_PK PRIMARY KEY (FTP_ADDRESS)
);
COMMENT ON TABLE FTPLOGIN IS 'The ftplogin table is used by the auxiliary data retrieval s ystem to obtain data via ftp from auxiliary stations.';
COMMENT ON COLUMN FTPLOGIN.FTP_ADDRESS IS 'ftp address for auxiliary data';
COMMENT ON COLUMN FTPLOGIN.USERNAME IS 'User name for ftp access';
COMMENT ON COLUMN FTPLOGIN.PASSWORD IS 'User password for ftp access';
COMMENT ON COLUMN FTPLOGIN.LDDATE IS 'Load date';

-- Table: GA_TAG
CREATE TABLE GA_TAG (
    OBJTYPE VARCHAR2(1),
    ID NUMBER(18),
    PROCESS_STATE VARCHAR2(20),
    LAT FLOAT(24),
    LON FLOAT(24),
    TIME FLOAT(53),
    EVID_REJECT NUMBER(18),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT GA_TAG_PK PRIMARY KEY (ID),
    ,CONSTRAINT GA_TAG CHECK (time >= -9999999999.999),
    ,CONSTRAINT GA_TAG__EVID_REJECT__CK CHECK (evid_reject > 0 OR evid_reject = -1),
    ,CONSTRAINT GA_TAG__ID__CK CHECK (id > 0),
    ,CONSTRAINT GA_TAG__LAT__CK CHECK ((lat >= -90.0 AND lat <= 90.0) OR lat = -999.0),
    ,CONSTRAINT GA_TAG__LON__CK CHECK ((lon >= -180.0 AND lon <= 180.0) OR lon = -999.0),
    ,CONSTRAINT GA_TAG__OBJTYPE__CK CHECK (objtype IN ('a', 'o'))
);
COMMENT ON TABLE GA_TAG IS 'The ga_tag table contains information on the use of arrivals and origins in the GA application.';
COMMENT ON COLUMN GA_TAG.OBJTYPE IS 'Type of identifier (a for arrival, o for origin)';
COMMENT ON COLUMN GA_TAG.ID IS 'Identification number (arid or orid)';
COMMENT ON COLUMN GA_TAG.PROCESS_STATE IS 'Use of arid or orid';
COMMENT ON COLUMN GA_TAG.LAT IS 'Latitude of origin';
COMMENT ON COLUMN GA_TAG.LON IS 'Longitude of origin';
COMMENT ON COLUMN GA_TAG.TIME IS 'Time of origin';
COMMENT ON COLUMN GA_TAG.EVID_REJECT IS 'Evid of origin arrival was rejected from';
COMMENT ON COLUMN GA_TAG.AUTH IS 'Author';
COMMENT ON COLUMN GA_TAG.LDDATE IS 'Load date';

-- Table: GREGION
CREATE TABLE GREGION (
    GRN NUMBER(8),
    GRNAME VARCHAR2(40),
    LDDATE DATE,
    ,CONSTRAINT GREGION_PK PRIMARY KEY (GRN),
    ,CONSTRAINT GREGION__GRN__CK CHECK ((grn >= 1 AND grn <= 729) OR grn = -1)
);
COMMENT ON TABLE GREGION IS 'The gregion table contains geographic region numbers and the ir equivalent descriptions.';
COMMENT ON COLUMN GREGION.GRN IS 'Geographic region number';
COMMENT ON COLUMN GREGION.GRNAME IS 'Geographic region name';
COMMENT ON COLUMN GREGION.LDDATE IS 'Load date';

-- Table: HISTORIC_INFO_CYLINDER
CREATE TABLE HISTORIC_INFO_CYLINDER (
    HISTORIC_INFO_CYLINDER_ID NUMBER(18),
    LAT FLOAT(53),
    LON FLOAT(53),
    RADIUS FLOAT(24),
    DEPTH FLOAT(24),
    LOWER_DEPTH FLOAT(24),
    UPPER_DEPTH FLOAT(24),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT HISTORIC_INFO_CYLINDER_PK PRIMARY KEY (HISTORIC_INFO_CYLINDER_ID),
    ,CONSTRAINT HIST_CYLINDER__CYLINDER_ID__CK CHECK (historic_info_cylinder_id > 0),
    ,CONSTRAINT HIST_CYLINDER__DEPTH__CK CHECK (depth >= -100 AND depth <= 1000),
    ,CONSTRAINT HIST_CYLINDER__LAT__CK CHECK (lat >= -90 AND lat <= 90),
    ,CONSTRAINT HIST_CYLINDER__LON__CK CHECK (lon >= -180 AND lat <= 180),
    ,CONSTRAINT HIST_CYLINDER__LOWER_DEPTH__CK CHECK (lower_depth >= -100 AND lower_depth <= 1000),
    ,CONSTRAINT HIST_CYLINDER__RADIUS__CK CHECK (radius > 0),
    ,CONSTRAINT HIST_CYLINDER__UPPER_DEPTH__CK CHECK (upper_depth >= -100 AND upper_depth <= 1000)
);
COMMENT ON TABLE HISTORIC_INFO_CYLINDER IS 'The historic_info_cylinder table is used to describe the cyl inder (ga_grid) in a shell.';
COMMENT ON COLUMN HISTORIC_INFO_CYLINDER.HISTORIC_INFO_CYLINDER_ID IS 'Historic information cylinder identifier';
COMMENT ON COLUMN HISTORIC_INFO_CYLINDER.LAT IS 'Estimated latitude of cylinder';
COMMENT ON COLUMN HISTORIC_INFO_CYLINDER.LON IS 'Estimated longitude of cylinder';
COMMENT ON COLUMN HISTORIC_INFO_CYLINDER.RADIUS IS 'Radius of cylinder';
COMMENT ON COLUMN HISTORIC_INFO_CYLINDER.DEPTH IS 'Estimated depth of the cylinder';
COMMENT ON COLUMN HISTORIC_INFO_CYLINDER.LOWER_DEPTH IS 'Lower depth of cylinder';
COMMENT ON COLUMN HISTORIC_INFO_CYLINDER.UPPER_DEPTH IS 'Upper depth of cylinder';
COMMENT ON COLUMN HISTORIC_INFO_CYLINDER.AUTHOR IS 'Author';
COMMENT ON COLUMN HISTORIC_INFO_CYLINDER.MODDATE IS 'Modification date';
COMMENT ON COLUMN HISTORIC_INFO_CYLINDER.LDDATE IS 'Load date';

-- Table: HISTORIC_INFO_SHELL
CREATE TABLE HISTORIC_INFO_SHELL (
    HISTORIC_INFO_SHELL_ID NUMBER(18),
    ALGORITHM_ID NUMBER(18),
    LAT FLOAT(53),
    LON FLOAT(53),
    INNER_RADIUS FLOAT(24),
    OUTER_RADIUS FLOAT(24),
    DEPTH FLOAT(24),
    LOWER_DEPTH FLOAT(24),
    UPPER_DEPTH FLOAT(24),
    MIN_AZIMUTH FLOAT(24),
    MAX_AZIMUTH FLOAT(24),
    REFSTA VARCHAR2(6),
    PHASE VARCHAR2(8),
    THRESHOLD FLOAT(24),
    UNCERTAINTY FLOAT(24),
    RELIABILITY FLOAT(24),
    NUM_OBSERVATIONS NUMBER(9),
    PROCESSING_MODE NUMBER(2),
    ON_DATE DATE,
    OFF_DATE DATE,
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT HISTORIC_INFO_SHELL_PK PRIMARY KEY (HISTORIC_INFO_SHELL_ID),
    ,CONSTRAINT HIST_SHELL__ALGORITHM_ID__CK CHECK (algorithm_id > 0),
    ,CONSTRAINT HIST_SHELL__DEPTH__CK CHECK (depth >= -100 AND depth <= 1000),
    ,CONSTRAINT HIST_SHELL__INNER_RADIUS__CK CHECK (inner_radius >= 0 AND inner_radius < 180),
    ,CONSTRAINT HIST_SHELL__LAT__CK CHECK (lat >= -90 AND lat <= 90),
    ,CONSTRAINT HIST_SHELL__LON__CK CHECK (lon >= -180 AND lat <= 180),
    ,CONSTRAINT HIST_SHELL__LOWER_DEPTH__CK CHECK (lower_depth >= -100 AND lower_depth <= 1000),
    ,CONSTRAINT HIST_SHELL__MAX_AZIMUTH__CK CHECK ((max_azimuth >= 0.0 AND max_azimuth <= 360) OR max_azimuth = -1.0),
    ,CONSTRAINT HIST_SHELL__MIN_AZIMUTH__CK CHECK ((min_azimuth >= 0.0 AND min_azimuth <= 360) OR min_azimuth = -1.0),
    ,CONSTRAINT HIST_SHELL__OUTER_RADIUS__CK CHECK (outer_radius > 0 AND outer_radius <= 180),
    ,CONSTRAINT HIST_SHELL__SHELL_ID__CK CHECK (historic_info_shell_id > 0),
    ,CONSTRAINT HIST_SHELL__THRESHOLD__CK CHECK ((threshold > -9.99 AND threshold < 50.0) OR threshold = -1.0),
    ,CONSTRAINT HIST_SHELL__UNCERTAINTY__CK CHECK (uncertainty > 0.0 OR uncertainty = -1.0),
    ,CONSTRAINT HIST_SHELL__UPPER_DEPTH__CK CHECK (upper_depth >= -100 AND upper_depth <= 1000)
);
COMMENT ON TABLE HISTORIC_INFO_SHELL IS 'The historic_info_shell table is used to describe the shell containing cylinders for specific station and phase.';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.HISTORIC_INFO_SHELL_ID IS 'Historic information shell identifier';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.ALGORITHM_ID IS 'Algorithm identifier';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.LAT IS 'Estimated latitude of the shell';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.LON IS 'Estimated longitude of the shell';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.INNER_RADIUS IS 'Radius of inner shell';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.OUTER_RADIUS IS 'Radius of outer shell';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.DEPTH IS 'Estimated depth';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.LOWER_DEPTH IS 'Lower depth of shell';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.UPPER_DEPTH IS 'Upper depth of shell';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.MIN_AZIMUTH IS 'Minimum observed azimuth';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.MAX_AZIMUTH IS 'Maximum observed azimuth';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.REFSTA IS 'Reference station';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.PHASE IS 'Phase';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.THRESHOLD IS 'Magnitude detection threshold';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.UNCERTAINTY IS 'Uncertainty estimate of magnitude threshold';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.RELIABILITY IS 'Estimate based on percent of events observed';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.NUM_OBSERVATIONS IS 'Number of observations';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.PROCESSING_MODE IS 'Defines the type of processing used to determine the shell';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.ON_DATE IS 'The date the historic information shell first became active or was created';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.OFF_DATE IS 'The date the historic information shell was removed from the system or made obsolete';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.AUTHOR IS 'Author';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.MODDATE IS 'Modification date';
COMMENT ON COLUMN HISTORIC_INFO_SHELL.LDDATE IS 'Load date';

-- Table: HISTORIC_INFO_STA_PHASE
CREATE TABLE HISTORIC_INFO_STA_PHASE (
    HISTORIC_INFO_STA_PHASE_ID NUMBER(18),
    HISTORIC_INFO_CYLINDER_ID NUMBER(18),
    ALGORITHM_ID NUMBER(18),
    REFSTA VARCHAR2(6),
    PHASE VARCHAR2(8),
    THRESHOLD FLOAT(24),
    UNCERTAINTY FLOAT(24),
    RELIABILITY FLOAT(24),
    NUM_OBSERVATIONS NUMBER(9),
    PROCESSING_MODE NUMBER(2),
    ON_DATE DATE,
    OFF_DATE DATE,
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT HISTORIC_INFO_STA_PHASE_PK PRIMARY KEY (HISTORIC_INFO_STA_PHASE_ID),
    ,CONSTRAINT HIST_ST_PHSE__ALGORITHM_ID__CK CHECK (algorithm_id > 0),
    ,CONSTRAINT HIST_ST_PHSE__CYLINDER_ID__CK CHECK (historic_info_cylinder_id > 0),
    ,CONSTRAINT HIST_ST_PHSE__NUM_OBS__CK CHECK (num_observations > 0 OR num_observations = -1),
    ,CONSTRAINT HIST_ST_PHSE__PROC_MODE__CK CHECK ((processing_mode > 0 AND processing_mode < 100) OR processing_mode = -1),
    ,CONSTRAINT HIST_ST_PHSE__RELIABILITY__CK CHECK ((reliability >= 0 AND reliability <= 1.0) OR reliability = -1.0),
    ,CONSTRAINT HIST_ST_PHSE__STA_PHASE_ID__CK CHECK (historic_info_sta_phase_id > 0),
    ,CONSTRAINT HIST_ST_PHSE__THRESHOLD__CK CHECK ((threshold > -9.99 AND threshold < 50.0) OR threshold = -999.0),
    ,CONSTRAINT HIST_ST_PHSE__UNCERTAINTY__CK CHECK (uncertainty > 0.0 OR uncertainty = -1.0)
);
COMMENT ON TABLE HISTORIC_INFO_STA_PHASE IS 'The historic_info_sta_phase table describes the station and phase information for a given time used to compute the histo ric cylinders and shells.';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.HISTORIC_INFO_STA_PHASE_ID IS 'Historic information for stations and phases identifier';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.HISTORIC_INFO_CYLINDER_ID IS 'Historic information cylinder identifier';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.ALGORITHM_ID IS 'Algorithm identifier';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.REFSTA IS 'Reference station';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.PHASE IS 'Phase';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.THRESHOLD IS 'Magnitude detection threshold';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.UNCERTAINTY IS 'Uncertainty estimate of magnitude threshold';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.RELIABILITY IS 'Estimate based on percent of events observed';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.NUM_OBSERVATIONS IS 'Number of observations';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.PROCESSING_MODE IS 'Defines the type of processing used for the station/phase pair';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.ON_DATE IS 'The date the historic information station and phase first became active or was created';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.OFF_DATE IS 'The date the historic information station and phase was removed from the sysem or made obsolete';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.AUTHOR IS 'Author';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.MODDATE IS 'Modification date';
COMMENT ON COLUMN HISTORIC_INFO_STA_PHASE.LDDATE IS 'Load date';

-- Table: HYDRO_ARR_GROUP
CREATE TABLE HYDRO_ARR_GROUP (
    HYDRO_ID NUMBER(18),
    AZ1 FLOAT(24),
    AZ2 FLOAT(24),
    SLOW FLOAT(24),
    DELAZ FLOAT(24),
    NHYDARR NUMBER(4),
    NET VARCHAR2(8),
    HYD_GRP_PHASE VARCHAR2(8),
    LDDATE DATE,
    ,CONSTRAINT HYDRO_ARR_GROUP_PK PRIMARY KEY (HYDRO_ID),
    ,CONSTRAINT HYDRO_ARR_GROUP__AZ1__CK CHECK ((az1 >= 0.0 AND az1 <= 360.0) OR az1 = -1.0),
    ,CONSTRAINT HYDRO_ARR_GROUP__AZ2__CK CHECK ((az2 >= 0.0 AND az2 <= 360.0) OR az2 = -1.0),
    ,CONSTRAINT HYDRO_ARR_GROUP__DELAZ__CK CHECK (delaz > 0.0 OR delaz = -1.0),
    ,CONSTRAINT HYDRO_ARR_GROUP__HYDRO_ID__CK CHECK (hydro_id > 0),
    ,CONSTRAINT HYDRO_ARR_GROUP__SLOW__CK CHECK (slow >= 0.0 OR slow = -1.0)
);
COMMENT ON TABLE HYDRO_ARR_GROUP IS 'The hydro_arr_group table contains hydroacoustic arrival-bas ed estimates of slowness and azimuth.';
COMMENT ON COLUMN HYDRO_ARR_GROUP.HYDRO_ID IS 'Hydro-arrival-group identifier';
COMMENT ON COLUMN HYDRO_ARR_GROUP.AZ1 IS 'Azimuth estimated from lag times';
COMMENT ON COLUMN HYDRO_ARR_GROUP.AZ2 IS 'Second possible azimuth (2 arrivals)';
COMMENT ON COLUMN HYDRO_ARR_GROUP.SLOW IS 'Slowness (s/km)';
COMMENT ON COLUMN HYDRO_ARR_GROUP.DELAZ IS 'Azimuth uncertainty';
COMMENT ON COLUMN HYDRO_ARR_GROUP.NHYDARR IS 'Number of arrivals in hydro-arrival-group';
COMMENT ON COLUMN HYDRO_ARR_GROUP.NET IS 'Hydro network name';
COMMENT ON COLUMN HYDRO_ARR_GROUP.HYD_GRP_PHASE IS 'Hydro-arrival-group phase';
COMMENT ON COLUMN HYDRO_ARR_GROUP.LDDATE IS 'Load date';

-- Table: HYDRO_ARRIVAL
CREATE TABLE HYDRO_ARRIVAL (
    ARID NUMBER(18),
    STA VARCHAR2(6),
    DURONSET FLOAT(53),
    DUREND FLOAT(53),
    ONSET_TIME FLOAT(53),
    TERMINATION_TIME FLOAT(53),
    CPLAG FLOAT(24),
    BPFRQAC FLOAT(24),
    RT FLOAT(24),
    BPFRQCEP FLOAT(24),
    RMS FLOAT(24),
    FLT_RTO FLOAT(24),
    NORMAMP FLOAT(24),
    AMPCORCLIP FLOAT(24),
    AMPCORDIST FLOAT(24),
    AMPCORDEPTH FLOAT(24),
    YIELD FLOAT(24),
    YLDERR FLOAT(24),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT HYDRO_ARRIVAL_PK PRIMARY KEY (ARID),
    ,CONSTRAINT HYDRO_ARRIV__AMPCORCLIP__CK CHECK (ampcorclip >= 0.0 OR ampcorclip = -1.0),
    ,CONSTRAINT HYDRO_ARRIV__AMPCORDEPTH__CK CHECK (ampcordepth >= 0.0 OR ampcordepth = -1.0),
    ,CONSTRAINT HYDRO_ARRIV__AMPCORDIST__CK CHECK ((ampcordist >= -180.0 AND ampcordist <= 180.0)OR ampcordist = -999.0),
    ,CONSTRAINT HYDRO_ARRIV__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT HYDRO_ARRIV__BPFRQAC__CK CHECK (bpfrqac >= 0.0 OR bpfrqac = -1.0),
    ,CONSTRAINT HYDRO_ARRIV__BPFRQCEP__CK CHECK (bpfrqcep >= 0.0 OR bpfrqcep = -1.0),
    ,CONSTRAINT HYDRO_ARRIV__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT HYDRO_ARRIV__CPLAG__CK CHECK (cplag > 0.0 OR cplag = -1.0),
    ,CONSTRAINT HYDRO_ARRIV__DUREND__CK CHECK (durend > -9999999999.999),
    ,CONSTRAINT HYDRO_ARRIV__DURONSET__CK CHECK (duronset > -9999999999.999),
    ,CONSTRAINT HYDRO_ARRIV__FLT_RTO__CK CHECK (flt_rto > 0.0 OR flt_rto = -1.0),
    ,CONSTRAINT HYDRO_ARRIV__NORMAMP__CK CHECK (normamp > 0.0 OR normamp = -1.0),
    ,CONSTRAINT HYDRO_ARRIV__ONSET_TIME__CK CHECK (onset_time > -9999999999.999),
    ,CONSTRAINT HYDRO_ARRIV__RMS__CK CHECK (rms > 0.0 OR rms = -1.0),
    ,CONSTRAINT HYDRO_ARRIV__RT__CK CHECK ((rt > 0.0 AND rt < 1.0) OR rt = -1.0),
    ,CONSTRAINT HYDRO_ARRIV__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT HYDRO_ARRIV__TERMIN_TIME__CK CHECK (termination_time >= -9999999999.999),
    ,CONSTRAINT HYDRO_ARRIV__YIELD__CK CHECK (yield >= 0.0 OR yield = -1.0),
    ,CONSTRAINT HYDRO_ARRIV__YLDERR__CK CHECK (ylderr >= 0.0 OR ylderr = -1.0)
);
COMMENT ON TABLE HYDRO_ARRIVAL IS 'The hydro_arrival table contains hydroacoustic arrival infor mation such as duration and the crossing point lag of the si gnal, autocorrelation bubble pulse frequency, autocovariance peak ratio (rt), cepstrum bubble pulse, bubble pulse amplit ude versus root mean square (rms), filter ratio, normalized amplitude, sensor yield, and sensor yield error.';
COMMENT ON COLUMN HYDRO_ARRIVAL.ARID IS 'Arrival identifier';
COMMENT ON COLUMN HYDRO_ARRIVAL.STA IS 'Station';
COMMENT ON COLUMN HYDRO_ARRIVAL.DURONSET IS 'Duration onset time';
COMMENT ON COLUMN HYDRO_ARRIVAL.DUREND IS 'Duration end time';
COMMENT ON COLUMN HYDRO_ARRIVAL.ONSET_TIME IS 'Estimated onset time of signal';
COMMENT ON COLUMN HYDRO_ARRIVAL.TERMINATION_TIME IS 'Estimated termination time of signal';
COMMENT ON COLUMN HYDRO_ARRIVAL.CPLAG IS 'Crossing point lag of the signal';
COMMENT ON COLUMN HYDRO_ARRIVAL.BPFRQAC IS 'Autocorrelation bubble pulse';
COMMENT ON COLUMN HYDRO_ARRIVAL.RT IS 'Autocovariance peak value';
COMMENT ON COLUMN HYDRO_ARRIVAL.BPFRQCEP IS 'Cepstrum bubble pulse';
COMMENT ON COLUMN HYDRO_ARRIVAL.RMS IS 'The rms amplitude from autocorrelation';
COMMENT ON COLUMN HYDRO_ARRIVAL.FLT_RTO IS 'Filter ratio';
COMMENT ON COLUMN HYDRO_ARRIVAL.NORMAMP IS 'Normalized amplitude';
COMMENT ON COLUMN HYDRO_ARRIVAL.AMPCORCLIP IS 'Correction to raw amplitude for clipping';
COMMENT ON COLUMN HYDRO_ARRIVAL.AMPCORDIST IS 'Correction to raw amplitude for distance';
COMMENT ON COLUMN HYDRO_ARRIVAL.AMPCORDEPTH IS 'Correction to raw amp for depth';
COMMENT ON COLUMN HYDRO_ARRIVAL.YIELD IS 'Sensor yield';
COMMENT ON COLUMN HYDRO_ARRIVAL.YLDERR IS 'Sensor yield error';
COMMENT ON COLUMN HYDRO_ARRIVAL.COMMID IS 'Comment identifier';
COMMENT ON COLUMN HYDRO_ARRIVAL.LDDATE IS 'Load date';

-- Table: HYDRO_ASSOC
CREATE TABLE HYDRO_ASSOC (
    ARID NUMBER(18),
    HYDRO_ID NUMBER(18),
    AZCONTRIB VARCHAR2(1),
    LDDATE DATE,
    ,CONSTRAINT HYDRO_ASSOC_PK PRIMARY KEY (ARID),
    ,CONSTRAINT HYDRO_ASSOC__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT HYDRO_ASSOC__AZCONTRIB__CK CHECK (azcontrib IN ('y', 'n', '-')),
    ,CONSTRAINT HYDRO_ASSOC__HYDRO_ID__CK CHECK (hydro_id > 0)
);
COMMENT ON TABLE HYDRO_ASSOC IS 'The hydro_assoc table contains the azimuth contribution info rmation for an arrival that is connected to a particular hyd ro arrival group.';
COMMENT ON COLUMN HYDRO_ASSOC.ARID IS 'Arrival identifier';
COMMENT ON COLUMN HYDRO_ASSOC.HYDRO_ID IS 'Hydro-arrival-group identifier';
COMMENT ON COLUMN HYDRO_ASSOC.AZCONTRIB IS 'Azimuth contribution flag (y or n)';
COMMENT ON COLUMN HYDRO_ASSOC.LDDATE IS 'Load date';

-- Table: HYDRO_ORIGIN
CREATE TABLE HYDRO_ORIGIN (
    ORID NUMBER(18),
    HYDROLOC_CODE NUMBER(8),
    HYDROYIELD FLOAT(24),
    HYDROYLDERR FLOAT(24),
    NUM_IN_SERIES NUMBER(8),
    SERID NUMBER(18),
    HYD_CLASS_CODE NUMBER(8),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT HYDRO_ORIGIN_PK PRIMARY KEY (ORID),
    ,CONSTRAINT HYDRO_ORG__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT HYDRO_ORG__HYDROLOC_CODE__CK CHECK (hydroloc_code >= 0 OR hydroloc_code = -1),
    ,CONSTRAINT HYDRO_ORG__HYDROYIELD__CK CHECK (hydroyield > 0.0 OR hydroyield = 0.0),
    ,CONSTRAINT HYDRO_ORG__HYDROYLDERR__CK CHECK (hydroylderr > 0.0 OR hydroylderr = 0.0),
    ,CONSTRAINT HYDRO_ORG__HYD_CLASS_CODE__CK CHECK (hyd_class_code IN (1,2,3,4,5,6,-999 )),
    ,CONSTRAINT HYDRO_ORG__NUM_IN_SERIES__CK CHECK (num_in_series > 0 OR num_in_series = -1),
    ,CONSTRAINT HYDRO_ORG__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT HYDRO_ORG__SERID__CK CHECK (serid > 0 OR serid = -1)
);
COMMENT ON TABLE HYDRO_ORIGIN IS 'The hydro_origin table contains a summary of AFTAC-specific hydroacoustic origin information such as Type of origin loca tion, determined from: Seismic system. Various unique hydroa coustic signal types, volcanic underwater, or undetermined. Bubble pulse frequency used to calculate the yield value and that yield value error. This table also identifies if this origin is part of a series and the unique identifier for tha t series.';
COMMENT ON COLUMN HYDRO_ORIGIN.ORID IS 'Origin identifier';
COMMENT ON COLUMN HYDRO_ORIGIN.HYDROLOC_CODE IS 'Hydroacoustic origin location';
COMMENT ON COLUMN HYDRO_ORIGIN.HYDROYIELD IS 'Hydroacoustic event yield';
COMMENT ON COLUMN HYDRO_ORIGIN.HYDROYLDERR IS 'Hydroacoustic event yield error';
COMMENT ON COLUMN HYDRO_ORIGIN.NUM_IN_SERIES IS 'Number of event in series';
COMMENT ON COLUMN HYDRO_ORIGIN.SERID IS 'Series identifier';
COMMENT ON COLUMN HYDRO_ORIGIN.HYD_CLASS_CODE IS 'Hydroacoustic event classification';
COMMENT ON COLUMN HYDRO_ORIGIN.COMMID IS 'Comment identifier';
COMMENT ON COLUMN HYDRO_ORIGIN.LDDATE IS 'Load date';

-- Table: INSTRUMENT
CREATE TABLE INSTRUMENT (
    INID NUMBER(18),
    INSNAME VARCHAR2(50),
    INSTYPE VARCHAR2(6),
    BAND VARCHAR2(1),
    DIGITAL VARCHAR2(1),
    SAMPRATE FLOAT(24),
    NCALIB FLOAT(24),
    NCALPER FLOAT(24),
    DIR VARCHAR2(64),
    DFILE VARCHAR2(32),
    RSPTYPE VARCHAR2(6),
    LDDATE DATE,
    ,CONSTRAINT INSTRUMENT_PK PRIMARY KEY (INID),
    ,CONSTRAINT INSTRUMENT__BAND__CK CHECK (band IN ('s','m','i','l','b','h','v','e','r','w','a','f','c','g','-')),
    ,CONSTRAINT INSTRUMENT__DIGITAL__CK CHECK (digital IN ('d','a','-')),
    ,CONSTRAINT INSTRUMENT__INID__CK CHECK (inid > 0),
    ,CONSTRAINT INSTRUMENT__NCALIB__CK CHECK (ncalib != 0.0),
    ,CONSTRAINT INSTRUMENT__NCALPER__CK CHECK (ncalper > 0.0),
    ,CONSTRAINT INSTRUMENT__RSPTYPE__CK CHECK (rsptype = LOWER(rsptype)),
    ,CONSTRAINT INSTRUMENT__SAMPRATE__CK CHECK (samprate > 0.0)
);
COMMENT ON TABLE INSTRUMENT IS 'The instrument table contains ancillary calibration informat ion. It holds nominal one-frequency calibration factors for each instrument and pointers to nominal frequency-dependent calibration for an instrument. This table also holds pointer s to the exact calibrations obtained by direct measurement o n a particular instrument (see sensor).';
COMMENT ON COLUMN INSTRUMENT.INID IS 'Instrument identifier';
COMMENT ON COLUMN INSTRUMENT.INSNAME IS 'Instrument name';
COMMENT ON COLUMN INSTRUMENT.INSTYPE IS 'Instrument type';
COMMENT ON COLUMN INSTRUMENT.BAND IS 'Frequency band';
COMMENT ON COLUMN INSTRUMENT.DIGITAL IS 'Data type, digital (d), or analog (a)';
COMMENT ON COLUMN INSTRUMENT.SAMPRATE IS 'Sampling rate in samples/second';
COMMENT ON COLUMN INSTRUMENT.NCALIB IS 'Nominal calibration (nanometers/digital count)';
COMMENT ON COLUMN INSTRUMENT.NCALPER IS 'Nominal calibration period (seconds)';
COMMENT ON COLUMN INSTRUMENT.DIR IS 'Directory';
COMMENT ON COLUMN INSTRUMENT.DFILE IS 'Data file';
COMMENT ON COLUMN INSTRUMENT.RSPTYPE IS 'Response type';
COMMENT ON COLUMN INSTRUMENT.LDDATE IS 'Load date';

-- Table: INTERVAL
CREATE TABLE INTERVAL (
    INTVLID NUMBER(18),
    CLASS VARCHAR2(16),
    NAME VARCHAR2(20),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    STATE VARCHAR2(16),
    AUTH VARCHAR2(15),
    PERCENT_AVAILABLE FLOAT(53),
    PROC_START_DATE DATE,
    PROC_END_DATE DATE,
    MODDATE DATE,
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT INTERVAL_PK PRIMARY KEY (CLASS),
    ,CONSTRAINT INTERVAL_UK UNIQUE (INTVLID),
    ,CONSTRAINT INTERVAL__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT INTERVAL__ENDTIME__CK CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT INTERVAL__INTVLID__CK CHECK (intvlid > 0),
    ,CONSTRAINT INTERVAL__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE INTERVAL IS 'The interval table defines units of processing. The time, en dtime, and name types indicate processing times for a named object. The class type allows a single interval table to be used for different classes of objects.';
COMMENT ON COLUMN INTERVAL.INTVLID IS 'Interval identifier';
COMMENT ON COLUMN INTERVAL.CLASS IS 'Type of interval';
COMMENT ON COLUMN INTERVAL.NAME IS 'Name of interval';
COMMENT ON COLUMN INTERVAL.TIME IS 'Starting time of data';
COMMENT ON COLUMN INTERVAL.ENDTIME IS 'Ending time of data';
COMMENT ON COLUMN INTERVAL.STATE IS 'Current processing state';
COMMENT ON COLUMN INTERVAL.AUTH IS 'Author of interval';
COMMENT ON COLUMN INTERVAL.PERCENT_AVAILABLE IS 'Percent of data available in interval';
COMMENT ON COLUMN INTERVAL.PROC_START_DATE IS 'Processing start date';
COMMENT ON COLUMN INTERVAL.PROC_END_DATE IS 'Processing stop date';
COMMENT ON COLUMN INTERVAL.MODDATE IS 'Time of last processing state change';
COMMENT ON COLUMN INTERVAL.COMMID IS 'Comment identifier';
COMMENT ON COLUMN INTERVAL.LDDATE IS 'Load date';

-- Table: MDAC_FD
CREATE TABLE MDAC_FD (
    FDID NUMBER(18),
    AMPCOR_VERID NUMBER(18),
    CORRID NUMBER(18),
    LFREQ FLOAT(24),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    TOMOID NUMBER(18),
    POLYID NUMBER(18),
    A FLOAT(53),
    B FLOAT(53),
    C FLOAT(53),
    SITEFACT FLOAT(53),
    ALGOID NUMBER(18),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT MDAC_FD_PK PRIMARY KEY (FDID),
    ,CONSTRAINT MDAC_FD__ALGOID__CK CHECK (algoid >=0 OR algoid = -1),
    ,CONSTRAINT MDAC_FD__AMPCOR_VERID__CK CHECK (ampcor_verid >0),
    ,CONSTRAINT MDAC_FD__A__CK CHECK (a >-100 OR a = -999),
    ,CONSTRAINT MDAC_FD__B__CK CHECK (b >-100 OR b = -999),
    ,CONSTRAINT MDAC_FD__CORRID__CK CHECK (corrid >0),
    ,CONSTRAINT MDAC_FD__C__CK CHECK (c >-100 OR c = -999),
    ,CONSTRAINT MDAC_FD__FDID__CK CHECK (fdid >0),
    ,CONSTRAINT MDAC_FD__LFREQ__CK CHECK (lfreq >=0),
    ,CONSTRAINT MDAC_FD__POLYID__CK CHECK (polyid >=0 OR polyid = -1),
    ,CONSTRAINT MDAC_FD__SITEFACT__CK CHECK (sitefact >-100 OR sitefact = -999),
    ,CONSTRAINT MDAC_FD__TOMOID__CK CHECK (tomoid >=0 OR tomoid = -1)
);
COMMENT ON TABLE MDAC_FD IS 'The mdac_fd table contains frequency dependent MDAC paramete rs for each corrid, frequency, and channel. (corrid is an in ternal id that relates to an mdac_fi record which is depende nt on polyid, phase, and station.)';
COMMENT ON COLUMN MDAC_FD.FDID IS 'Frequency dependent correction identifier';
COMMENT ON COLUMN MDAC_FD.AMPCOR_VERID IS 'amplitude correction version identifier';
COMMENT ON COLUMN MDAC_FD.CORRID IS 'Correction identifier';
COMMENT ON COLUMN MDAC_FD.LFREQ IS 'Low frequency of amplitude measurement';
COMMENT ON COLUMN MDAC_FD.STA IS 'Station name';
COMMENT ON COLUMN MDAC_FD.CHAN IS 'Channel name';
COMMENT ON COLUMN MDAC_FD.TOMOID IS 'Tomographic identifier';
COMMENT ON COLUMN MDAC_FD.POLYID IS 'Polygon Identifier';
COMMENT ON COLUMN MDAC_FD.A IS 'First surface fit coefficient';
COMMENT ON COLUMN MDAC_FD.B IS 'Second surface fit coefficient';
COMMENT ON COLUMN MDAC_FD.C IS 'Third surface fit coefficient';
COMMENT ON COLUMN MDAC_FD.SITEFACT IS 'Site effect factor';
COMMENT ON COLUMN MDAC_FD.ALGOID IS 'Algorithm identifier';
COMMENT ON COLUMN MDAC_FD.AUTH IS 'Author, source of data';
COMMENT ON COLUMN MDAC_FD.LDDATE IS 'Load date (format YY//MM/DD HH24:MI:SS)';

-- Table: MDAC_FI
CREATE TABLE MDAC_FI (
    CORRID NUMBER(18),
    AMPCOR_VERID NUMBER(18),
    POLYID NUMBER(18),
    STA VARCHAR2(6),
    PHASE VARCHAR2(8),
    CHAN VARCHAR2(8),
    CORRNAME VARCHAR2(32),
    SIGMA FLOAT(53),
    DELSIGMA FLOAT(53),
    PSI FLOAT(24),
    DELPSI FLOAT(24),
    Q0 FLOAT(53),
    DELQ0 FLOAT(53),
    GAMMA FLOAT(24),
    DELGAMMA FLOAT(24),
    ZETA FLOAT(24),
    M0_REF FLOAT(53),
    U0 FLOAT(24),
    ETA FLOAT(24),
    DELETA FLOAT(24),
    DISTCRIT FLOAT(53),
    ALPHAS FLOAT(24),
    BETAS FLOAT(24),
    RHOS FLOAT(53),
    ALPHAR FLOAT(24),
    BETAR FLOAT(24),
    RHOR FLOAT(53),
    RADPATP FLOAT(24),
    RADPATS FLOAT(24),
    SNR1 FLOAT(53),
    SNR2 FLOAT(53),
    NOISETYPE VARCHAR2(15),
    MAGID NUMBER(18),
    MAGTYPE VARCHAR2(6),
    ALGOID NUMBER(18),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT MDAC_FI_PK PRIMARY KEY (AMPCOR_VERID),
    ,CONSTRAINT MDAC_FI__ALGOID__CK CHECK (algoid >= 0 or algoid = -1),
    ,CONSTRAINT MDAC_FI__ALPHAR__CK CHECK (alphar > 0 or alphar = -1),
    ,CONSTRAINT MDAC_FI__ALPHAS__CK CHECK (alphas > 0 or alphas = -1),
    ,CONSTRAINT MDAC_FI__AMPCOR_VERID__CK CHECK (ampcor_verid >0),
    ,CONSTRAINT MDAC_FI__BETAR__CK CHECK (betar > 0 or betar = -1),
    ,CONSTRAINT MDAC_FI__BETAS__CK CHECK (betas > 0 or betas = -1),
    ,CONSTRAINT MDAC_FI__CORRID__CK CHECK (corrid >0),
    ,CONSTRAINT MDAC_FI__DELETA__CK CHECK (deleta >= 0 or deleta = -1),
    ,CONSTRAINT MDAC_FI__DELGAMMA__CK CHECK (delgamma >= 0 or delgamma = -1),
    ,CONSTRAINT MDAC_FI__DELPSI__CK CHECK (delpsi >= 0 or delpsi = -1),
    ,CONSTRAINT MDAC_FI__DELQ0__CK CHECK (delq0 >= 0 or delq0 = -1),
    ,CONSTRAINT MDAC_FI__DELSIGMA__CK CHECK (delsigma >= 0 or delsigma = -1),
    ,CONSTRAINT MDAC_FI__DISTCRIT__CK CHECK (distcrit >0),
    ,CONSTRAINT MDAC_FI__ETA__CK CHECK (eta >0),
    ,CONSTRAINT MDAC_FI__GAMMA__CK CHECK (gamma > 0 or gamma = -1),
    ,CONSTRAINT MDAC_FI__M0_REF__CK CHECK (m0_ref >0),
    ,CONSTRAINT MDAC_FI__MAGID__CK CHECK (magid >= 0 or magid = -1),
    ,CONSTRAINT MDAC_FI__POLYID__CK CHECK (polyid >0),
    ,CONSTRAINT MDAC_FI__PSI__CK CHECK (psi >= 0 and psi <=1),
    ,CONSTRAINT MDAC_FI__Q0__CK CHECK (q0 > 0 or q0 = -1),
    ,CONSTRAINT MDAC_FI__RADPATP__CK CHECK (( radpatp >= 0 AND radpatp <=1 ) OR radpatp = -1),
    ,CONSTRAINT MDAC_FI__RADPATS__CK CHECK (( radpats >= 0 AND radpats <=1 ) OR radpats = -1),
    ,CONSTRAINT MDAC_FI__RHOR__CK CHECK (rhor >0),
    ,CONSTRAINT MDAC_FI__RHOS__CK CHECK (rhos >0),
    ,CONSTRAINT MDAC_FI__SIGMA__CK CHECK (sigma >0),
    ,CONSTRAINT MDAC_FI__SNR1__CK CHECK (snr1 > 0 or snr1 = -1),
    ,CONSTRAINT MDAC_FI__SNR2__CK CHECK (snr2 > 0 or snr2 = -1),
    ,CONSTRAINT MDAC_FI__U0__CK CHECK (u0 >0),
    ,CONSTRAINT MDAC_FI__ZETA__CK CHECK (zeta >=1)
);
COMMENT ON TABLE MDAC_FI IS 'The mdac_fi table contains frequency independent MDAC parame ters for each polyid, phase, and station.';
COMMENT ON COLUMN MDAC_FI.CORRID IS 'Correction identifier';
COMMENT ON COLUMN MDAC_FI.AMPCOR_VERID IS 'amplitude correction version identifier';
COMMENT ON COLUMN MDAC_FI.POLYID IS 'Polygon identifier';
COMMENT ON COLUMN MDAC_FI.STA IS 'Station name';
COMMENT ON COLUMN MDAC_FI.PHASE IS 'Phase of interest';
COMMENT ON COLUMN MDAC_FI.CHAN IS 'Channel name';
COMMENT ON COLUMN MDAC_FI.CORRNAME IS 'Name of correction parameter set';
COMMENT ON COLUMN MDAC_FI.SIGMA IS 'Stress-drop in pascals';
COMMENT ON COLUMN MDAC_FI.DELSIGMA IS 'Stress-drop in pascals uncertainty';
COMMENT ON COLUMN MDAC_FI.PSI IS 'Exponent controlling moment-corner frequency scaling';
COMMENT ON COLUMN MDAC_FI.DELPSI IS 'Uncertainty of psi';
COMMENT ON COLUMN MDAC_FI.Q0 IS 'Attenuation at 1 Hz';
COMMENT ON COLUMN MDAC_FI.DELQ0 IS 'Uncertainty of q0';
COMMENT ON COLUMN MDAC_FI.GAMMA IS 'Frequency exponent of attenuation';
COMMENT ON COLUMN MDAC_FI.DELGAMMA IS 'Frequency exponent of attenuation uncertainty';
COMMENT ON COLUMN MDAC_FI.ZETA IS 'Ratio of P and S wave corner frequencies';
COMMENT ON COLUMN MDAC_FI.M0_REF IS 'Reference seismic moment used with psi in Nm';
COMMENT ON COLUMN MDAC_FI.U0 IS 'Velocity of phase in m/s';
COMMENT ON COLUMN MDAC_FI.ETA IS 'Geometric spreading exponent';
COMMENT ON COLUMN MDAC_FI.DELETA IS 'Geometric spreading exponent uncertainty';
COMMENT ON COLUMN MDAC_FI.DISTCRIT IS 'Critical distance for geometric spreading function in meters';
COMMENT ON COLUMN MDAC_FI.ALPHAS IS 'P velocity at the source in m/s';
COMMENT ON COLUMN MDAC_FI.BETAS IS 'S velocity at the source in m/s';
COMMENT ON COLUMN MDAC_FI.RHOS IS 'Density at the source in kg/m3';
COMMENT ON COLUMN MDAC_FI.ALPHAR IS 'P velocity at the receiver in m/s';
COMMENT ON COLUMN MDAC_FI.BETAR IS 'S velocity at the receiver in m/s';
COMMENT ON COLUMN MDAC_FI.RHOR IS 'Density at the receiver in kg/m3';
COMMENT ON COLUMN MDAC_FI.RADPATP IS 'Radiation pattern excitation factor for P waves';
COMMENT ON COLUMN MDAC_FI.RADPATS IS 'Radiation pattern excitation factor for S waves';
COMMENT ON COLUMN MDAC_FI.SNR1 IS 'Minimum signal-to-noise ratio used to select spectral amplitudes';
COMMENT ON COLUMN MDAC_FI.SNR2 IS 'Minimum signal-to-noise for applying MDAC parameters';
COMMENT ON COLUMN MDAC_FI.NOISETYPE IS 'Noise identifier e.g. pre-event or pre-phase';
COMMENT ON COLUMN MDAC_FI.MAGID IS 'Magnitude identifier';
COMMENT ON COLUMN MDAC_FI.MAGTYPE IS 'Magnitude type';
COMMENT ON COLUMN MDAC_FI.ALGOID IS 'Algorithm used';
COMMENT ON COLUMN MDAC_FI.AUTH IS 'Author';
COMMENT ON COLUMN MDAC_FI.LDDATE IS 'Load date (format YY/MM/DD HH24:MI:SS';

-- Table: MSGAUX
CREATE TABLE MSGAUX (
    MSGID NUMBER(18),
    MSGROW NUMBER(4),
    STATECOUNT NUMBER(8),
    COMMAND VARCHAR2(24),
    SUB_STATUS VARCHAR2(24),
    LDDATE DATE,
    ,CONSTRAINT MSGAUX_PK PRIMARY KEY (STATECOUNT),
    ,CONSTRAINT MSGAUX__MSGID__CK CHECK (msgid > 0 OR msgid = -1),
    ,CONSTRAINT MSGAUX__MSGROW__CK CHECK (msgrow > 0 OR msgrow = -1),
    ,CONSTRAINT MSGAUX__STATECOUNT__CK CHECK (statecount >= 0)
);
COMMENT ON TABLE MSGAUX IS 'The msgaux table contains records of unsuccessfully processe d Automatic Data Request Manager (AutoDRM) messages.';
COMMENT ON COLUMN MSGAUX.MSGID IS 'Message identifier';
COMMENT ON COLUMN MSGAUX.MSGROW IS 'Line number in message';
COMMENT ON COLUMN MSGAUX.STATECOUNT IS 'Number of failures';
COMMENT ON COLUMN MSGAUX.COMMAND IS 'Command that could not be processed';
COMMENT ON COLUMN MSGAUX.SUB_STATUS IS 'Cause of failure';
COMMENT ON COLUMN MSGAUX.LDDATE IS 'Load date';

-- Table: MSGDATATYPE
CREATE TABLE MSGDATATYPE (
    MSGID NUMBER(18),
    MSGDTYPE VARCHAR2(16),
    MSGDFORMAT VARCHAR2(16),
    MSGSTATUS VARCHAR2(32),
    FOFF NUMBER(10),
    MSIZE NUMBER(8),
    LDDATE DATE,
    ,CONSTRAINT MSGDATATYPE_PK PRIMARY KEY (FOFF),
    ,CONSTRAINT MSGDATATYPE__FOFF__CK CHECK (foff >= 0),
    ,CONSTRAINT MSGDATATYPE__MSGID__CK CHECK (msgid > 0 OR msgid = -1),
    ,CONSTRAINT MSGDATATYPE__MSGSTATUS__CK CHECK (msgstatus IN ('DONE', 'FAILED', '-')),
    ,CONSTRAINT MSGDATATYPE__MSIZE__CK CHECK (msize > 0 OR msize = -1)
);
COMMENT ON TABLE MSGDATATYPE IS 'The msgdatatype table supports data tracking by recording ea ch data section in a message for incoming and outgoing messa ges.';
COMMENT ON COLUMN MSGDATATYPE.MSGID IS 'Message identifier';
COMMENT ON COLUMN MSGDATATYPE.MSGDTYPE IS 'Data type of the data section within the message';
COMMENT ON COLUMN MSGDATATYPE.MSGDFORMAT IS 'General format of data that follows';
COMMENT ON COLUMN MSGDATATYPE.MSGSTATUS IS 'Status of the data section';
COMMENT ON COLUMN MSGDATATYPE.FOFF IS 'File offset to beginning of data section';
COMMENT ON COLUMN MSGDATATYPE.MSIZE IS 'Size of data section';
COMMENT ON COLUMN MSGDATATYPE.LDDATE IS 'Load date';

-- Table: MSGDEST
CREATE TABLE MSGDEST (
    MSGDID NUMBER(18),
    MSGID NUMBER(18),
    TRANSMETH VARCHAR2(16),
    EMAILTO VARCHAR2(64),
    MSGSTATUS VARCHAR2(32),
    ITIME FLOAT(53),
    TIMESENT FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT MSGDEST_PK PRIMARY KEY (MSGDID),
    ,CONSTRAINT MSGDEST__ITIME__CK CHECK (itime > 0.0 OR itime = -999.0),
    ,CONSTRAINT MSGDEST__MSGDID__CK CHECK (msgdid > 0 OR msgdid = -1),
    ,CONSTRAINT MSGDEST__MSGID__CK CHECK (msgid > 0 OR msgid = -1),
    ,CONSTRAINT MSGDEST__MSGSTATUS__CK CHECK (msgstatus IN ('DONE', 'FAILED', '-')),
    ,CONSTRAINT MSGDEST__TIMESENT__CK CHECK (timesent > 0.0 OR timesent = -9999999999.999)
);
COMMENT ON TABLE MSGDEST IS 'The msgdest table contains information about messages sent.';
COMMENT ON COLUMN MSGDEST.MSGDID IS 'Message destination identifier';
COMMENT ON COLUMN MSGDEST.MSGID IS 'Message identifier';
COMMENT ON COLUMN MSGDEST.TRANSMETH IS 'Method by which the response is to be delivered to the requester';
COMMENT ON COLUMN MSGDEST.EMAILTO IS 'E-mail address to send message';
COMMENT ON COLUMN MSGDEST.MSGSTATUS IS 'Current status of the response message';
COMMENT ON COLUMN MSGDEST.ITIME IS 'Time at which table entry was made';
COMMENT ON COLUMN MSGDEST.TIMESENT IS 'Time at which message was sent';
COMMENT ON COLUMN MSGDEST.LDDATE IS 'Load date';

-- Table: MSGDISC
CREATE TABLE MSGDISC (
    MSGID NUMBER(18),
    USERID NUMBER(18),
    MSGVER VARCHAR2(8),
    MSGTYPE VARCHAR2(16),
    SUBTYPE VARCHAR2(20),
    EXTMSGID VARCHAR2(20),
    INTID NUMBER(18),
    INTIDTYPE VARCHAR2(16),
    MSGSRC VARCHAR2(16),
    ITIME FLOAT(53),
    IDATE NUMBER(8),
    IMETHOD VARCHAR2(8),
    ISRC VARCHAR2(64),
    MSIZE NUMBER(8),
    MSGSTATUS VARCHAR2(32),
    SUBJECT VARCHAR2(64),
    DIR VARCHAR2(64),
    DFILE VARCHAR2(32),
    FOFF NUMBER(10),
    MFOFF NUMBER(8),
    FILEOFF NUMBER(8),
    FILESIZE NUMBER(8),
    SIGTYPE VARCHAR2(64),
    VERIFSTATUS VARCHAR2(4),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT MSGDISC_PK PRIMARY KEY (MSGID),
    ,CONSTRAINT MSGDISC__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT MSGDISC__FILEOFF__CK CHECK (fileoff >= 0 OR fileoff = -1),
    ,CONSTRAINT MSGDISC__FILESIZE__CK CHECK (filesize > 0 OR filesize = -1),
    ,CONSTRAINT MSGDISC__FOFF__CK CHECK (foff >= 0),
    ,CONSTRAINT MSGDISC__IDATE__CK CHECK ((idate > 1901348 AND idate < 3001000) OR idate = -1),
    ,CONSTRAINT MSGDISC__IMETHOD__CK CHECK (imethod IN ('email','ftp','-')),
    ,CONSTRAINT MSGDISC__INTID__CK CHECK (intid > 0 OR intid = -1),
    ,CONSTRAINT MSGDISC__ITIME__CK CHECK (itime > 0.0 OR itime = -999.0),
    ,CONSTRAINT MSGDISC__MFOFF__CK CHECK (mfoff > 0 OR mfoff = -1),
    ,CONSTRAINT MSGDISC__MSGID__CK CHECK (msgid > 0 OR msgid = -1),
    ,CONSTRAINT MSGDISC__MSGSTATUS__CK CHECK (msgstatus IN ('DONE', 'FAILED', '-','RECEIVED','QUEUED','RUNNING','DONE-PARTIAL','FAILED','STANDBY','RETR Y','CHILDFAILED','IGNORED','PASS')),
    ,CONSTRAINT MSGDISC__MSIZE__CK CHECK (msize > 0 OR msize = -1),
    ,CONSTRAINT MSGDISC__SUBTYPE__CK CHECK (subtype IN ('V', 'R', 'L', '-')),
    ,CONSTRAINT MSGDISC__USERID__CK CHECK (userid > 0 OR userid = -1)
);
COMMENT ON TABLE MSGDISC IS 'The msgdisc table contains information pertinent to messages including the date and time that the message was sent or re ceived, identification information, and where the message is stored.';
COMMENT ON COLUMN MSGDISC.MSGID IS 'Message identifier';
COMMENT ON COLUMN MSGDISC.USERID IS 'User identifier';
COMMENT ON COLUMN MSGDISC.MSGVER IS 'Message system version number';
COMMENT ON COLUMN MSGDISC.MSGTYPE IS 'Message type';
COMMENT ON COLUMN MSGDISC.SUBTYPE IS 'Message subtype';
COMMENT ON COLUMN MSGDISC.EXTMSGID IS 'Message identification string provided by the sender';
COMMENT ON COLUMN MSGDISC.INTID IS 'Either the locally generated msgid of an earlier table entry that evoked the creation of this table entry or the reqid from the request table of an internally generated request';
COMMENT ON COLUMN MSGDISC.INTIDTYPE IS 'Intid type';
COMMENT ON COLUMN MSGDISC.MSGSRC IS 'Message source code';
COMMENT ON COLUMN MSGDISC.ITIME IS 'Initial time message was received';
COMMENT ON COLUMN MSGDISC.IDATE IS 'Initial date message was received';
COMMENT ON COLUMN MSGDISC.IMETHOD IS 'Input method (e-mail or ftp)';
COMMENT ON COLUMN MSGDISC.ISRC IS 'Initial source of message';
COMMENT ON COLUMN MSGDISC.MSIZE IS 'Message size in bytes';
COMMENT ON COLUMN MSGDISC.MSGSTATUS IS 'Status of message';
COMMENT ON COLUMN MSGDISC.SUBJECT IS 'Subject header from e-mail message';
COMMENT ON COLUMN MSGDISC.DIR IS 'Directory to find file';
COMMENT ON COLUMN MSGDISC.DFILE IS 'Name of data file';
COMMENT ON COLUMN MSGDISC.FOFF IS 'Byte offset of data segment within file';
COMMENT ON COLUMN MSGDISC.MFOFF IS 'Offset in bytes to beginning of message';
COMMENT ON COLUMN MSGDISC.FILEOFF IS 'Number of bytes to the first character of the e-mail file (first character of the e-mail header)';
COMMENT ON COLUMN MSGDISC.FILESIZE IS 'Size of file';
COMMENT ON COLUMN MSGDISC.SIGTYPE IS 'Digital signature type';
COMMENT ON COLUMN MSGDISC.VERIFSTATUS IS 'Status of verification';
COMMENT ON COLUMN MSGDISC.COMMID IS 'Comment identifier';
COMMENT ON COLUMN MSGDISC.LDDATE IS 'Load date';

-- Table: MSVMAX_DESCRIPT
CREATE TABLE MSVMAX_DESCRIPT (
    AMPID NUMBER(18),
    STA VARCHAR2(6),
    ORID NUMBER(18),
    ARID NUMBER(18),
    HIGH_SNR_COUNT NUMBER(2),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT MSVMAX_DESCRIPT_PK PRIMARY KEY (AMPID),
    ,CONSTRAINT MSVMAX_DESCRIPT__AMPID__CK CHECK (ampid > 0),
    ,CONSTRAINT MSVMAX_DESCRIPT__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT MSVMAX_DESCRIPT__HSC__CK CHECK (high_snr_count IN (-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 )),
    ,CONSTRAINT MSVMAX_DESCRIPT__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT MSVMAX_DESCRIPT__STA__CK CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE MSVMAX_DESCRIPT IS 'The msvmax_descript is the child of arrival and amplitude ta bles. It is the parent of the msvmax_results table.';
COMMENT ON COLUMN MSVMAX_DESCRIPT.AMPID IS 'Amplitude identifier';
COMMENT ON COLUMN MSVMAX_DESCRIPT.STA IS 'Station code';
COMMENT ON COLUMN MSVMAX_DESCRIPT.ORID IS 'Origin identifier';
COMMENT ON COLUMN MSVMAX_DESCRIPT.ARID IS 'LR arrival identifier';
COMMENT ON COLUMN MSVMAX_DESCRIPT.HIGH_SNR_COUNT IS 'Count of periods where noise is greater than signal';
COMMENT ON COLUMN MSVMAX_DESCRIPT.AUTH IS 'Author';
COMMENT ON COLUMN MSVMAX_DESCRIPT.LDDATE IS 'Load date';

-- Table: MSVMAX_RESULTS
CREATE TABLE MSVMAX_RESULTS (
    AMPID NUMBER(18),
    PER FLOAT(24),
    MEASTYPE VARCHAR2(1),
    AMP FLOAT(24),
    AMPTIME FLOAT(53),
    INS_RESPONSE FLOAT(24),
    AMPCOR FLOAT(24),
    MAGNITUDE FLOAT(24),
    UNCERTAINTY FLOAT(24),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT MSVMAX_RESULTS_PK PRIMARY KEY (PER),
    ,CONSTRAINT MSVMAX_RESULTS__AMPCOR__CK CHECK (( ampcor > -9.99 AND ampcor < 50.0 ) OR ampcor = -999.0),
    ,CONSTRAINT MSVMAX_RESULTS__AMPID__CK CHECK (ampid > 0),
    ,CONSTRAINT MSVMAX_RESULTS__AMPTIME__CK CHECK (amptime >= -9999999999.999),
    ,CONSTRAINT MSVMAX_RESULTS__AMP__CK CHECK (amp > 0.0 OR amp = -1.0),
    ,CONSTRAINT MSVMAX_RESULTS__ENDTIME__CK CHECK (endtime >= -9999999999.999),
    ,CONSTRAINT MSVMAX_RESULTS__INS_RESP__CK CHECK (( ins_response >= 0 AND ins_response <= 99.9) OR ins_response = -1.0),
    ,CONSTRAINT MSVMAX_RESULTS__MAGNITUDE__CK CHECK (( magnitude > -9.99 AND magnitude < 50.0) OR magnitude = -999.0),
    ,CONSTRAINT MSVMAX_RESULTS__MEASTYPE__CK CHECK (meastype IN ('S','N')),
    ,CONSTRAINT MSVMAX_RESULTS__PER__CK CHECK (per > 0.0 OR per = -1.0),
    ,CONSTRAINT MSVMAX_RESULTS__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE MSVMAX_RESULTS IS 'The msvmax_results table is the child of the msvmax_descript table.';
COMMENT ON COLUMN MSVMAX_RESULTS.AMPID IS 'Amplitude identifier';
COMMENT ON COLUMN MSVMAX_RESULTS.PER IS 'Period (8 - 25 second)';
COMMENT ON COLUMN MSVMAX_RESULTS.MEASTYPE IS 'Measurement type';
COMMENT ON COLUMN MSVMAX_RESULTS.AMP IS 'Amplitude value in nanometers';
COMMENT ON COLUMN MSVMAX_RESULTS.AMPTIME IS 'Time of amplitude measure';
COMMENT ON COLUMN MSVMAX_RESULTS.INS_RESPONSE IS 'Instrument response value';
COMMENT ON COLUMN MSVMAX_RESULTS.AMPCOR IS 'Amplitude value corrected for Airy phase Butterworth filter';
COMMENT ON COLUMN MSVMAX_RESULTS.MAGNITUDE IS 'Magnitude value';
COMMENT ON COLUMN MSVMAX_RESULTS.UNCERTAINTY IS 'Magnitude uncertainty-future use';
COMMENT ON COLUMN MSVMAX_RESULTS.TIME IS 'Epoch start time of signal window';
COMMENT ON COLUMN MSVMAX_RESULTS.ENDTIME IS 'Epoch start time of signal window';
COMMENT ON COLUMN MSVMAX_RESULTS.LDDATE IS 'Load date';

-- Table: NET_CODA_SPECTRUM
CREATE TABLE NET_CODA_SPECTRUM (
    MAGID NUMBER(18),
    FREQ FLOAT(24),
    AMPCOR FLOAT(24),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT NET_CODA_SPECTRUM_PK PRIMARY KEY (MAGID),
    ,CONSTRAINT NET_CODA_SPECTRUM__AMPCOR__CK CHECK (( ampcor > -9.99 AND ampcor < 50.0 ) OR ampcor = -999.0),
    ,CONSTRAINT NET_CODA_SPECTRUM__FREQ__CK CHECK (freq > 0.0 OR freq = -1.0),
    ,CONSTRAINT NET_CODA_SPECTRUM__MAGID__CK CHECK (magid > 0)
);
COMMENT ON TABLE NET_CODA_SPECTRUM IS 'The net_coda_spectrum table contains the theoretical source spectrum for an event, used to obtain the network moment mag nitude values. The theoretical spectrum is fit to the observ ed spectrum in all frequency bands for a station that are se t to defining in the envelope_contribution table.';
COMMENT ON COLUMN NET_CODA_SPECTRUM.MAGID IS 'Magnitude identifier';
COMMENT ON COLUMN NET_CODA_SPECTRUM.FREQ IS 'Frequency';
COMMENT ON COLUMN NET_CODA_SPECTRUM.AMPCOR IS 'Amplitude value corrected for path and site';
COMMENT ON COLUMN NET_CODA_SPECTRUM.AUTH IS 'Author';
COMMENT ON COLUMN NET_CODA_SPECTRUM.LDDATE IS 'Load date';

-- Table: NETMAG
CREATE TABLE NETMAG (
    MAGID NUMBER(18),
    NET VARCHAR2(8),
    ORID NUMBER(18),
    EVID NUMBER(18),
    MAGTYPE VARCHAR2(6),
    NSTA NUMBER(8),
    MAGNITUDE FLOAT(24),
    UNCERTAINTY FLOAT(24),
    AUTH VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT NETMAG_PK PRIMARY KEY (MAGID),
    ,CONSTRAINT NETMAG__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT NETMAG__EVID__CK CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT NETMAG__MAGID__CK CHECK (magid > 0),
    ,CONSTRAINT NETMAG__MAGNITUDE__CK CHECK ((magnitude > -9.99 AND magnitude < 50.0) OR magnitude = -999.0),
    ,CONSTRAINT NETMAG__NSTA__CK CHECK (nsta >= 0 OR nsta = -1),
    ,CONSTRAINT NETMAG__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT NETMAG__UNCERTAINTY__CK CHECK (uncertainty > 0.0 OR uncertainty = -1.0)
);
COMMENT ON TABLE NETMAG IS 'The netmag table contain estimates of network magnitudes of different types for an event. Each network magnitude has a u nique magid. Station magnitudes used to compute the network magnitude are in the stamag table.';
COMMENT ON COLUMN NETMAG.MAGID IS 'Network magnitude identifier';
COMMENT ON COLUMN NETMAG.NET IS 'Unique network identifier';
COMMENT ON COLUMN NETMAG.ORID IS 'Origin identifier';
COMMENT ON COLUMN NETMAG.EVID IS 'Event identifier';
COMMENT ON COLUMN NETMAG.MAGTYPE IS 'Magnitude type (ms, mb, etc.)';
COMMENT ON COLUMN NETMAG.NSTA IS 'Number of stations used';
COMMENT ON COLUMN NETMAG.MAGNITUDE IS 'Magnitude';
COMMENT ON COLUMN NETMAG.UNCERTAINTY IS 'Magnitude uncertainty';
COMMENT ON COLUMN NETMAG.AUTH IS 'Source/originator';
COMMENT ON COLUMN NETMAG.COMMID IS 'Comment identifier';
COMMENT ON COLUMN NETMAG.LDDATE IS 'Load date';

-- Table: NETWORK
CREATE TABLE NETWORK (
    NETWORKID NUMBER(18),
    NET VARCHAR2(8),
    NETWORK_NAME VARCHAR2(32),
    DESCRIPTION VARCHAR2(4000),
    NETWORK_TYPE VARCHAR2(15),
    ON_DATE DATE,
    OFF_DATE DATE,
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT NETWORK_PK PRIMARY KEY (NETWORKID),
    ,CONSTRAINT NETWORK_UK UNIQUE (NET),
    ,CONSTRAINT NETWORK__NETWORK_TYPE__CK CHECK (network_type = LOWER(network_type))
);
COMMENT ON TABLE NETWORK IS 'The network table contains general information about seismic networks (see affiliation).';
COMMENT ON COLUMN NETWORK.NETWORKID IS 'Unique network identifier';
COMMENT ON COLUMN NETWORK.NET IS 'Network name';
COMMENT ON COLUMN NETWORK.NETWORK_NAME IS 'Long network name';
COMMENT ON COLUMN NETWORK.DESCRIPTION IS 'Network description';
COMMENT ON COLUMN NETWORK.NETWORK_TYPE IS 'Network type (array, local, world-wide, etc.)';
COMMENT ON COLUMN NETWORK.ON_DATE IS 'The date the network first became active or was created';
COMMENT ON COLUMN NETWORK.OFF_DATE IS 'The date the network was removed from the system or made obsolete';
COMMENT ON COLUMN NETWORK.AUTHOR IS 'Source/originator';
COMMENT ON COLUMN NETWORK.MODDATE IS 'Modification date';
COMMENT ON COLUMN NETWORK.LDDATE IS 'Load date';

-- Table: NETYIELD
CREATE TABLE NETYIELD (
    YIELDID NUMBER(18),
    NET VARCHAR2(8),
    ORID NUMBER(18),
    EVID NUMBER(18),
    YIELD FLOAT(24),
    NSTA NUMBER(8),
    FFACTOR FLOAT(24),
    WMODEL_NAME VARCHAR2(50),
    AUTH VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT NETYIELD_PK PRIMARY KEY (YIELDID),
    ,CONSTRAINT NETYIELD__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT NETYIELD__EVID__CK CHECK (evid > 0),
    ,CONSTRAINT NETYIELD__FFACTOR__CK CHECK (ffactor > 0.0 OR ffactor = -999.0),
    ,CONSTRAINT NETYIELD__NSTA__CK CHECK (nsta >= 0 OR nsta = -1),
    ,CONSTRAINT NETYIELD__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT NETYIELD__YIELDID__CK CHECK (yieldid > 0),
    ,CONSTRAINT NETYIELD__YIELD__CK CHECK (yield >= 0.0 OR yield = -1.0)
);
COMMENT ON TABLE NETYIELD IS 'The netyield table contains network-wide yield values obtain ed from the yield values at all available stations for an ev ent.';
COMMENT ON COLUMN NETYIELD.YIELDID IS 'Yield identifier';
COMMENT ON COLUMN NETYIELD.NET IS 'Unique network identifier';
COMMENT ON COLUMN NETYIELD.ORID IS 'Origin identifier';
COMMENT ON COLUMN NETYIELD.EVID IS 'Event identifier';
COMMENT ON COLUMN NETYIELD.YIELD IS 'Yield';
COMMENT ON COLUMN NETYIELD.NSTA IS 'Number of stations used';
COMMENT ON COLUMN NETYIELD.FFACTOR IS 'Yield F factor (log 10)';
COMMENT ON COLUMN NETYIELD.WMODEL_NAME IS 'Yield model name';
COMMENT ON COLUMN NETYIELD.AUTH IS 'Author';
COMMENT ON COLUMN NETYIELD.COMMID IS 'Comment identifier';
COMMENT ON COLUMN NETYIELD.LDDATE IS 'Load date';

-- Table: OMITTED_CHANNELS
CREATE TABLE OMITTED_CHANNELS (
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    COMMID NUMBER(18),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT OMITTED_CHANNELS_PK PRIMARY KEY (CHAN),
    ,CONSTRAINT OMITTED_CHANNELS__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT OMITTED_CHANNELS__ENDTIME__CK CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT OMITTED_CHANNELS__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT OMITTED_CHANNELS__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE OMITTED_CHANNELS IS 'The omitted_channels table identifies time intervals for whi ch channel masks exist. Channel masks are used to exclude wa veform data for the specified station, channel, time and end time from interactive and automatic data processing due to d ata quality problems (timing, calibration, etc.).';
COMMENT ON COLUMN OMITTED_CHANNELS.STA IS 'Station code';
COMMENT ON COLUMN OMITTED_CHANNELS.CHAN IS 'Channel code';
COMMENT ON COLUMN OMITTED_CHANNELS.TIME IS 'Epoch time for start of channel omitted';
COMMENT ON COLUMN OMITTED_CHANNELS.ENDTIME IS 'Epoch time for end of channel omitted';
COMMENT ON COLUMN OMITTED_CHANNELS.COMMID IS 'Comment identifier';
COMMENT ON COLUMN OMITTED_CHANNELS.AUTH IS 'Author';
COMMENT ON COLUMN OMITTED_CHANNELS.LDDATE IS 'Load date';

-- Table: ORIGERR
CREATE TABLE ORIGERR (
    ORID NUMBER(18),
    SXX FLOAT(24),
    SYY FLOAT(24),
    SZZ FLOAT(24),
    STT FLOAT(24),
    SXY FLOAT(24),
    SXZ FLOAT(24),
    SYZ FLOAT(24),
    STX FLOAT(24),
    STY FLOAT(24),
    STZ FLOAT(24),
    SDOBS FLOAT(24),
    SMAJAX FLOAT(24),
    SMINAX FLOAT(24),
    STRIKE FLOAT(24),
    SDEPTH FLOAT(24),
    STIME FLOAT(24),
    CONF FLOAT(24),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT ORIGERR_PK PRIMARY KEY (ORID),
    ,CONSTRAINT ORIGERR__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT ORIGERR__CONF__CK CHECK ((conf BETWEEN 0.5 AND 1.0) OR conf = 0.0),
    ,CONSTRAINT ORIGERR__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT ORIGERR__SDEPTH__CK CHECK (sdepth > 0.0 OR sdepth = -1.0),
    ,CONSTRAINT ORIGERR__SDOBS__CK CHECK (sdobs > 0.0 OR sdobs = -1.0),
    ,CONSTRAINT ORIGERR__SMAJAX__CK CHECK (smajax > 0.0 OR smajax = -1.0),
    ,CONSTRAINT ORIGERR__SMINAX__CK CHECK (sminax > 0.0 OR sminax = -1.0),
    ,CONSTRAINT ORIGERR__STIME__CK CHECK (stime >= 0.0 OR stime = -1.0),
    ,CONSTRAINT ORIGERR__STRIKE__CK CHECK ((strike >= 0.0 AND strike <= 360.0) OR strike = -1.0),
    ,CONSTRAINT ORIGERR__STT__CK CHECK (stt > 0.0 OR stt = -1.0),
    ,CONSTRAINT ORIGERR__SXX__CK CHECK (sxx > 0.0 OR sxx = -1.0),
    ,CONSTRAINT ORIGERR__SYY__CK CHECK (syy > 0.0 OR syy = -1.0),
    ,CONSTRAINT ORIGERR__SZZ__CK CHECK (szz > 0.0 OR szz = -1.0)
);
COMMENT ON TABLE ORIGERR IS 'The origerr table contains summaries of confidence bounds in origin estimations. The origerr_ga table is used by the GA application to store temporary origin error information. The measurement types are the elements of the location covarian ce matrix. The descriptive types give the uncertainties in l ocation, depth, and origin time. These quantities are calcul ated from the covariance matrix, assuming gaussian errors an d a confidence level conf.';
COMMENT ON COLUMN ORIGERR.ORID IS 'Origin identifier';
COMMENT ON COLUMN ORIGERR.SXX IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR.SYY IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR.SZZ IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR.STT IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR.SXY IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR.SXZ IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR.SYZ IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR.STX IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR.STY IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR.STZ IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR.SDOBS IS 'Standard error of observations';
COMMENT ON COLUMN ORIGERR.SMAJAX IS 'Semi-major axis of error';
COMMENT ON COLUMN ORIGERR.SMINAX IS 'Semi-minor axis of error';
COMMENT ON COLUMN ORIGERR.STRIKE IS 'Strike of the semi-major axis';
COMMENT ON COLUMN ORIGERR.SDEPTH IS 'Depth error';
COMMENT ON COLUMN ORIGERR.STIME IS 'Origin time error';
COMMENT ON COLUMN ORIGERR.CONF IS 'Confidence';
COMMENT ON COLUMN ORIGERR.COMMID IS 'Comment identifier';
COMMENT ON COLUMN ORIGERR.LDDATE IS 'Load date';

-- Table: ORIGERR_GA
CREATE TABLE ORIGERR_GA (
    ORID NUMBER(18),
    SXX FLOAT(24),
    SYY FLOAT(24),
    SZZ FLOAT(24),
    STT FLOAT(24),
    SXY FLOAT(24),
    SXZ FLOAT(24),
    SYZ FLOAT(24),
    STX FLOAT(24),
    STY FLOAT(24),
    STZ FLOAT(24),
    SDOBS FLOAT(24),
    SMAJAX FLOAT(24),
    SMINAX FLOAT(24),
    STRIKE FLOAT(24),
    SDEPTH FLOAT(24),
    STIME FLOAT(24),
    CONF FLOAT(24),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT ORIGERR_GA_PK PRIMARY KEY (ORID)
);
COMMENT ON TABLE ORIGERR_GA IS 'The origerr table contains summaries of confidence bounds in origin estimations. The origerr_ga table is used by the GA application to store temporary origin error information. The measurement types are the elements of the location covarian ce matrix. The descriptive types give the uncertainties in l ocation, depth, and origin time. These quantities are calcul ated from the covariance matrix, assuming gaussian errors an d a confidence level conf.';
COMMENT ON COLUMN ORIGERR_GA.ORID IS 'Origin identifier';
COMMENT ON COLUMN ORIGERR_GA.SXX IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA.SYY IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA.SZZ IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA.STT IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA.SXY IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA.SXZ IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA.SYZ IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA.STX IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA.STY IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA.STZ IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA.SDOBS IS 'Standard error of observations';
COMMENT ON COLUMN ORIGERR_GA.SMAJAX IS 'Semi-major axis of error';
COMMENT ON COLUMN ORIGERR_GA.SMINAX IS 'Semi-minor axis of error';
COMMENT ON COLUMN ORIGERR_GA.STRIKE IS 'Strike of the semi-major axis';
COMMENT ON COLUMN ORIGERR_GA.SDEPTH IS 'Depth error';
COMMENT ON COLUMN ORIGERR_GA.STIME IS 'Origin time error';
COMMENT ON COLUMN ORIGERR_GA.CONF IS 'Confidence';
COMMENT ON COLUMN ORIGERR_GA.COMMID IS 'Comment identifier';
COMMENT ON COLUMN ORIGERR_GA.LDDATE IS 'Load date';

-- Table: ORIGERR_GA_DEL
CREATE TABLE ORIGERR_GA_DEL (
    ORID NUMBER(18),
    SXX FLOAT(24),
    SYY FLOAT(24),
    SZZ FLOAT(24),
    STT FLOAT(24),
    SXY FLOAT(24),
    SXZ FLOAT(24),
    SYZ FLOAT(24),
    STX FLOAT(24),
    STY FLOAT(24),
    STZ FLOAT(24),
    SDOBS FLOAT(24),
    SMAJAX FLOAT(24),
    SMINAX FLOAT(24),
    STRIKE FLOAT(24),
    SDEPTH FLOAT(24),
    STIME FLOAT(24),
    CONF FLOAT(24),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT ORIGERR_GA_DEL_PK PRIMARY KEY (ORID),
    ,CONSTRAINT ORIGERR_GA_DEL__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT ORIGERR_GA_DEL__CONF__CK CHECK ((conf BETWEEN 0.5 AND 1.0) OR conf = 0.0),
    ,CONSTRAINT ORIGERR_GA_DEL__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT ORIGERR_GA_DEL__SDEPTH__CK CHECK (sdepth > 0.0 OR sdepth = -1.0),
    ,CONSTRAINT ORIGERR_GA_DEL__SDOBS__CK CHECK (sdobs > 0.0 OR sdobs = -1.0),
    ,CONSTRAINT ORIGERR_GA_DEL__SMAJAX__CK CHECK (smajax > 0.0 OR smajax = -1.0),
    ,CONSTRAINT ORIGERR_GA_DEL__SMINAX__CK CHECK (sminax > 0.0 OR sminax = -1.0),
    ,CONSTRAINT ORIGERR_GA_DEL__STIME__CK CHECK (stime >= 0.0 OR stime = -1.0),
    ,CONSTRAINT ORIGERR_GA_DEL__STRIKE__CK CHECK ((strike >= 0.0 AND strike <= 360.0) OR strike = -1.0),
    ,CONSTRAINT ORIGERR_GA_DEL__STT__CK CHECK (stt > 0.0 OR stt = -1.0),
    ,CONSTRAINT ORIGERR_GA_DEL__SXX__CK CHECK (sxx > 0.0 OR sxx = -1.0),
    ,CONSTRAINT ORIGERR_GA_DEL__SYY__CK CHECK (syy > 0.0 OR syy = -1.0),
    ,CONSTRAINT ORIGERR_GA_DEL__SZZ__CK CHECK (szz > 0.0 OR szz = -1.0)
);
COMMENT ON TABLE ORIGERR_GA_DEL IS 'The origerr_ga_del table contains summaries of confidence bo unds in origin estimations.';
COMMENT ON COLUMN ORIGERR_GA_DEL.ORID IS 'Origin identifier';
COMMENT ON COLUMN ORIGERR_GA_DEL.SXX IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA_DEL.SYY IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA_DEL.SZZ IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA_DEL.STT IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA_DEL.SXY IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA_DEL.SXZ IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA_DEL.SYZ IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA_DEL.STX IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA_DEL.STY IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA_DEL.STZ IS 'Covariance matrix element';
COMMENT ON COLUMN ORIGERR_GA_DEL.SDOBS IS 'Standard error of observations';
COMMENT ON COLUMN ORIGERR_GA_DEL.SMAJAX IS 'Semi-major axis of error';
COMMENT ON COLUMN ORIGERR_GA_DEL.SMINAX IS 'Semi-minor axis of error';
COMMENT ON COLUMN ORIGERR_GA_DEL.STRIKE IS 'Strike of the semi-major axis';
COMMENT ON COLUMN ORIGERR_GA_DEL.SDEPTH IS 'Depth error';
COMMENT ON COLUMN ORIGERR_GA_DEL.STIME IS 'Origin time error';
COMMENT ON COLUMN ORIGERR_GA_DEL.CONF IS 'Confidence';
COMMENT ON COLUMN ORIGERR_GA_DEL.COMMID IS 'Comment identifier';
COMMENT ON COLUMN ORIGERR_GA_DEL.LDDATE IS 'Load date';

-- Table: ORIGIN
CREATE TABLE ORIGIN (
    LAT FLOAT(24),
    LON FLOAT(24),
    DEPTH FLOAT(24),
    TIME FLOAT(53),
    ORID NUMBER(18),
    EVID NUMBER(18),
    JDATE NUMBER(8),
    NASS NUMBER(4),
    NDEF NUMBER(4),
    NDP NUMBER(4),
    GRN NUMBER(8),
    SRN NUMBER(8),
    ETYPE VARCHAR2(7),
    DEPDP FLOAT(24),
    DTYPE VARCHAR2(1),
    MB FLOAT(24),
    MBID NUMBER(18),
    MS FLOAT(24),
    MSID NUMBER(18),
    ML FLOAT(24),
    MLID NUMBER(18),
    ALGORITHM VARCHAR2(15),
    AUTH VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT ORIGIN_PK PRIMARY KEY (TIME),
    ,CONSTRAINT ORIGIN_UK UNIQUE (ORID),
    ,CONSTRAINT ORIGIN__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT ORIGIN__DEPDP__CK CHECK ((depdp >= 0.0 AND depdp < 1000.0) OR depdp = -999.0),
    ,CONSTRAINT ORIGIN__DEPTH__CK CHECK ((depth >= -100.0 AND depth < 1000.0) OR depth = -999.0),
    ,CONSTRAINT ORIGIN__DTYPE__CK CHECK (dtype IN ('a','f','d','r','g','-')),
    ,CONSTRAINT ORIGIN__ETYPE__CK CHECK (etype = LOWER(etype)),
    ,CONSTRAINT ORIGIN__EVID__CK CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT ORIGIN__GRN__CK CHECK ((grn >= 1 AND grn <= 729) OR grn = -1),
    ,CONSTRAINT ORIGIN__JDATE__CK CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT ORIGIN__LON__CK CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT ORIGIN__MBID__CK CHECK (mbid > 0 OR mbid = -1),
    ,CONSTRAINT ORIGIN__MB__CK CHECK ((mb > -9.99 AND mb < 50.0) OR mb = -999.0),
    ,CONSTRAINT ORIGIN__MLID__CK CHECK (mlid > 0 OR mlid = -1),
    ,CONSTRAINT ORIGIN__ML__CK CHECK ((ml > -9.99 AND ml < 50.0) OR ml = -999.0),
    ,CONSTRAINT ORIGIN__MSID__CK CHECK (msid > 0 OR msid = -1),
    ,CONSTRAINT ORIGIN__MS__CK CHECK ((ms > -9.99 AND ms < 50.0) OR ms = -999.0),
    ,CONSTRAINT ORIGIN__NASS__CK CHECK (nass > 0 OR nass = -1),
    ,CONSTRAINT ORIGIN__NDEF__CK CHECK ((ndef > 0 AND ndef <= nass) OR ndef = -1),
    ,CONSTRAINT ORIGIN__NDP__CK CHECK (ndp >= 0 OR ndp = -1),
    ,CONSTRAINT ORIGIN__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT ORIGIN__ORIGIN_LAT__CK CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT ORIGIN__SRN__CK CHECK ((srn >= 1 AND srn <= 50) OR srn = -1),
    ,CONSTRAINT ORIGIN__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE ORIGIN IS 'The origin tables contain information describing a derived o r reported origin for a particular event.';
COMMENT ON COLUMN ORIGIN.LAT IS 'Estimated latitude';
COMMENT ON COLUMN ORIGIN.LON IS 'Estimated longitude';
COMMENT ON COLUMN ORIGIN.DEPTH IS 'Estimated depth';
COMMENT ON COLUMN ORIGIN.TIME IS 'Epoch time';
COMMENT ON COLUMN ORIGIN.ORID IS 'Origin identifier';
COMMENT ON COLUMN ORIGIN.EVID IS 'Event identifier';
COMMENT ON COLUMN ORIGIN.JDATE IS 'Julian date';
COMMENT ON COLUMN ORIGIN.NASS IS 'Number of associated phases';
COMMENT ON COLUMN ORIGIN.NDEF IS 'Number of locating phases';
COMMENT ON COLUMN ORIGIN.NDP IS 'Number of depth phases';
COMMENT ON COLUMN ORIGIN.GRN IS 'Geographic region number';
COMMENT ON COLUMN ORIGIN.SRN IS 'Seismic region number';
COMMENT ON COLUMN ORIGIN.ETYPE IS 'Event type';
COMMENT ON COLUMN ORIGIN.DEPDP IS 'Estimated depth from depth phases';
COMMENT ON COLUMN ORIGIN.DTYPE IS 'Depth method used';
COMMENT ON COLUMN ORIGIN.MB IS 'Body wave magnitude';
COMMENT ON COLUMN ORIGIN.MBID IS 'Mb magnitude identifier';
COMMENT ON COLUMN ORIGIN.MS IS 'Surface wave magnitude';
COMMENT ON COLUMN ORIGIN.MSID IS 'Ms magnitude identifier';
COMMENT ON COLUMN ORIGIN.ML IS 'Local magnitude';
COMMENT ON COLUMN ORIGIN.MLID IS 'ML magnitude identifier';
COMMENT ON COLUMN ORIGIN.ALGORITHM IS 'Location algorithm used';
COMMENT ON COLUMN ORIGIN.AUTH IS 'Source/originator';
COMMENT ON COLUMN ORIGIN.COMMID IS 'Comment identifier';
COMMENT ON COLUMN ORIGIN.LDDATE IS 'Load date';

-- Table: ORIGIN_GA
CREATE TABLE ORIGIN_GA (
    LAT FLOAT(24),
    LON FLOAT(24),
    DEPTH FLOAT(24),
    TIME FLOAT(53),
    ORID NUMBER(18),
    EVID NUMBER(18),
    JDATE NUMBER(8),
    NASS NUMBER(4),
    NDEF NUMBER(4),
    NDP NUMBER(4),
    GRN NUMBER(8),
    SRN NUMBER(8),
    ETYPE VARCHAR2(7),
    DEPDP FLOAT(24),
    DTYPE VARCHAR2(1),
    MB FLOAT(24),
    MBID NUMBER(18),
    MS FLOAT(24),
    MSID NUMBER(18),
    ML FLOAT(24),
    MLID NUMBER(18),
    ALGORITHM VARCHAR2(15),
    AUTH VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT ORIGIN_GA_PK PRIMARY KEY (ORID)
);
COMMENT ON TABLE ORIGIN_GA IS 'The origin and origin_ga tables contain information describi ng a derived or reported origin for a particular event.';
COMMENT ON COLUMN ORIGIN_GA.LAT IS 'Estimated latitude';
COMMENT ON COLUMN ORIGIN_GA.LON IS 'Estimated longitude';
COMMENT ON COLUMN ORIGIN_GA.DEPTH IS 'Estimated depth';
COMMENT ON COLUMN ORIGIN_GA.TIME IS 'Epoch time';
COMMENT ON COLUMN ORIGIN_GA.ORID IS 'Origin identifier';
COMMENT ON COLUMN ORIGIN_GA.EVID IS 'Event identifier';
COMMENT ON COLUMN ORIGIN_GA.JDATE IS 'Julian date';
COMMENT ON COLUMN ORIGIN_GA.NASS IS 'Number of associated phases';
COMMENT ON COLUMN ORIGIN_GA.NDEF IS 'Number of locating phases';
COMMENT ON COLUMN ORIGIN_GA.NDP IS 'Number of depth phases';
COMMENT ON COLUMN ORIGIN_GA.GRN IS 'Geographic region number';
COMMENT ON COLUMN ORIGIN_GA.SRN IS 'Seismic region number';
COMMENT ON COLUMN ORIGIN_GA.ETYPE IS 'Event type';
COMMENT ON COLUMN ORIGIN_GA.DEPDP IS 'Estimated depth from depth phases';
COMMENT ON COLUMN ORIGIN_GA.DTYPE IS 'Depth method used';
COMMENT ON COLUMN ORIGIN_GA.MB IS 'Body wave magnitude';
COMMENT ON COLUMN ORIGIN_GA.MBID IS 'Mb magnitude identifier';
COMMENT ON COLUMN ORIGIN_GA.MS IS 'Surface wave magnitude';
COMMENT ON COLUMN ORIGIN_GA.MSID IS 'Ms magnitude identifier';
COMMENT ON COLUMN ORIGIN_GA.ML IS 'Local magnitude';
COMMENT ON COLUMN ORIGIN_GA.MLID IS 'ML magnitude identifier';
COMMENT ON COLUMN ORIGIN_GA.ALGORITHM IS 'Location algorithm used';
COMMENT ON COLUMN ORIGIN_GA.AUTH IS 'Source/originator';
COMMENT ON COLUMN ORIGIN_GA.COMMID IS 'Comment identifier';
COMMENT ON COLUMN ORIGIN_GA.LDDATE IS 'Load date';

-- Table: ORIGIN_GA_DEL
CREATE TABLE ORIGIN_GA_DEL (
    LAT FLOAT(24),
    LON FLOAT(24),
    DEPTH FLOAT(24),
    TIME FLOAT(53),
    ORID NUMBER(18),
    EVID NUMBER(18),
    JDATE NUMBER(8),
    NASS NUMBER(4),
    NDEF NUMBER(4),
    NDP NUMBER(4),
    GRN NUMBER(8),
    SRN NUMBER(8),
    ETYPE VARCHAR2(7),
    DEPDP FLOAT(24),
    DTYPE VARCHAR2(1),
    MB FLOAT(24),
    MBID NUMBER(18),
    MS FLOAT(24),
    MSID NUMBER(18),
    ML FLOAT(24),
    MLID NUMBER(18),
    ALGORITHM VARCHAR2(15),
    AUTH VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT ORIGIN_GA_DEL_PK PRIMARY KEY (ORID),
    ,CONSTRAINT ORIGIN_GA_DEL__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT ORIGIN_GA_DEL__DEPDP__CK CHECK ((depdp >= 0.0 AND depdp < 1000.0) OR depdp = -999.0),
    ,CONSTRAINT ORIGIN_GA_DEL__DEPTH__CK CHECK ((depth >= -100.0 AND depth < 1000.0) OR depth = -999.0),
    ,CONSTRAINT ORIGIN_GA_DEL__DTYPE__CK CHECK (dtype IN ('f','d','r','g','-')),
    ,CONSTRAINT ORIGIN_GA_DEL__ETYPE__CK CHECK (etype = LOWER(etype)),
    ,CONSTRAINT ORIGIN_GA_DEL__EVID__CK CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT ORIGIN_GA_DEL__GRN__CK CHECK ((grn >= 1 AND grn <= 729) OR grn = -1),
    ,CONSTRAINT ORIGIN_GA_DEL__JDATE__CK CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT ORIGIN_GA_DEL__LON__CK CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT ORIGIN_GA_DEL__MBID__CK CHECK (mbid > 0 OR mbid = -1),
    ,CONSTRAINT ORIGIN_GA_DEL__MB__CK CHECK ((mb > -9.99 AND mb < 50.0) OR mb = -999.0),
    ,CONSTRAINT ORIGIN_GA_DEL__MLID__CK CHECK (mlid > 0 OR mlid = -1),
    ,CONSTRAINT ORIGIN_GA_DEL__ML__CK CHECK ((ml > -9.99 AND ml < 50.0) OR ml = -999.0),
    ,CONSTRAINT ORIGIN_GA_DEL__MSID__CK CHECK (msid > 0 OR msid = -1),
    ,CONSTRAINT ORIGIN_GA_DEL__MS__CK CHECK ((ms > -9.99 AND ms < 50.0) OR ms = -999.0),
    ,CONSTRAINT ORIGIN_GA_DEL__NASS__CK CHECK (nass > 0 OR nass = -1),
    ,CONSTRAINT ORIGIN_GA_DEL__NDEF__CK CHECK ((ndef > 0 AND ndef <= nass) OR ndef = -1),
    ,CONSTRAINT ORIGIN_GA_DEL__NDP__CK CHECK (ndp >= 0 OR ndp = -1),
    ,CONSTRAINT ORIGIN_GA_DEL__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT ORIGIN_GA_DEL__ORIGIN_LAT__CK CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT ORIGIN_GA_DEL__SRN__CK CHECK ((srn >= 1 AND srn <= 50) OR srn = -1),
    ,CONSTRAINT ORIGIN_GA_DEL__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE ORIGIN_GA_DEL IS 'The origin_ga_del table contains information describing a de rived or reported origin for a particular event that was del eted and may be needed for later reference.';
COMMENT ON COLUMN ORIGIN_GA_DEL.LAT IS 'Estimated latitude';
COMMENT ON COLUMN ORIGIN_GA_DEL.LON IS 'Estimated longitude';
COMMENT ON COLUMN ORIGIN_GA_DEL.DEPTH IS 'Estimated depth';
COMMENT ON COLUMN ORIGIN_GA_DEL.TIME IS 'Epoch time';
COMMENT ON COLUMN ORIGIN_GA_DEL.ORID IS 'Origin identifier';
COMMENT ON COLUMN ORIGIN_GA_DEL.EVID IS 'Event identifier';
COMMENT ON COLUMN ORIGIN_GA_DEL.JDATE IS 'Julian date';
COMMENT ON COLUMN ORIGIN_GA_DEL.NASS IS 'Number of associated phases';
COMMENT ON COLUMN ORIGIN_GA_DEL.NDEF IS 'Number of locating phases';
COMMENT ON COLUMN ORIGIN_GA_DEL.NDP IS 'Number of depth phases';
COMMENT ON COLUMN ORIGIN_GA_DEL.GRN IS 'Geographic region number';
COMMENT ON COLUMN ORIGIN_GA_DEL.SRN IS 'Seismic region number';
COMMENT ON COLUMN ORIGIN_GA_DEL.ETYPE IS 'Event type';
COMMENT ON COLUMN ORIGIN_GA_DEL.DEPDP IS 'Estimated depth from depth phases';
COMMENT ON COLUMN ORIGIN_GA_DEL.DTYPE IS 'Depth method used';
COMMENT ON COLUMN ORIGIN_GA_DEL.MB IS 'Body wave magnitude';
COMMENT ON COLUMN ORIGIN_GA_DEL.MBID IS 'Mb magnitude identifier';
COMMENT ON COLUMN ORIGIN_GA_DEL.MS IS 'Surface wave magnitude';
COMMENT ON COLUMN ORIGIN_GA_DEL.MSID IS 'Ms magnitude identifier';
COMMENT ON COLUMN ORIGIN_GA_DEL.ML IS 'Local magnitude';
COMMENT ON COLUMN ORIGIN_GA_DEL.MLID IS 'ML magnitude identifier';
COMMENT ON COLUMN ORIGIN_GA_DEL.ALGORITHM IS 'Location algorithm used';
COMMENT ON COLUMN ORIGIN_GA_DEL.AUTH IS 'Source/originator';
COMMENT ON COLUMN ORIGIN_GA_DEL.COMMID IS 'Comment identifier';
COMMENT ON COLUMN ORIGIN_GA_DEL.LDDATE IS 'Load date';

-- Table: ORIGIN_MEA_TRACE
CREATE TABLE ORIGIN_MEA_TRACE (
    ORID NUMBER(18),
    CLUSTAID NUMBER(18),
    ACTIVETIME_LOOKUP FLOAT(53),
    BEST_REF_MATCH_ORID NUMBER(18),
    APPLIED_THRESHOLD FLOAT(24),
    LDDATE DATE,
    ,CONSTRAINT ORIGIN_MEA_TRACE_PK PRIMARY KEY (CLUSTAID),
    ,CONSTRAINT ORIGIN_MEA_TRACE__ATL__CK CHECK (activetime_lookup > 0 OR activetime_lookup = -999.0),
    ,CONSTRAINT ORIGIN_MEA_TRACE__AT__CK CHECK (applied_threshold >= 0.0 AND applied_threshold <= 1.0),
    ,CONSTRAINT ORIGIN_MEA_TRACE__BRMO__CK CHECK (best_ref_match_orid > 0 OR best_ref_match_orid = -1),
    ,CONSTRAINT ORIGIN_MEA_TRACE__CA__CK CHECK (clustaid > 0),
    ,CONSTRAINT ORIGIN_MEA_TRACE__ORID__CK CHECK (orid > 0)
);
COMMENT ON TABLE ORIGIN_MEA_TRACE IS 'The origin_mea_trace table contains important information ne cessary to trace the subspace detection.';
COMMENT ON COLUMN ORIGIN_MEA_TRACE.ORID IS 'Origin identifier';
COMMENT ON COLUMN ORIGIN_MEA_TRACE.CLUSTAID IS 'Cluster Station identifier';
COMMENT ON COLUMN ORIGIN_MEA_TRACE.ACTIVETIME_LOOKUP IS 'The time used to lookup the epoch time a cluster was activated. This value is either the application data start time or set to the value of ''cluster-active-time-override'' parameter.';
COMMENT ON COLUMN ORIGIN_MEA_TRACE.BEST_REF_MATCH_ORID IS 'Best reference event';
COMMENT ON COLUMN ORIGIN_MEA_TRACE.APPLIED_THRESHOLD IS 'Threshold used for this detection';
COMMENT ON COLUMN ORIGIN_MEA_TRACE.LDDATE IS 'Load date';

-- Table: ORIGIN_SDO
CREATE TABLE ORIGIN_SDO (
    ORID NUMBER(18),
    LATLON_GEOM ,
    COV_ELLIPSE_GEOM ,
    CONF_ELLIPSE_GEOM ,
    ,CONSTRAINT ORIGIN_SDO_PK PRIMARY KEY (ORID),
    ,CONSTRAINT ORIGIN_SDO__ORID__CK CHECK (orid > 0)
);
COMMENT ON TABLE ORIGIN_SDO IS 'The origin_sdo table contains the point geometry, coverage e llipse polygon, confidence ellipse polygon for an origin.';
COMMENT ON COLUMN ORIGIN_SDO.ORID IS 'Origin identifier';
COMMENT ON COLUMN ORIGIN_SDO.LATLON_GEOM IS 'Point geometry representing origin location';
COMMENT ON COLUMN ORIGIN_SDO.COV_ELLIPSE_GEOM IS 'Polygon geometry representing coverage ellipse';
COMMENT ON COLUMN ORIGIN_SDO.CONF_ELLIPSE_GEOM IS 'Polygon geometry representing confidence ellipse';

-- Table: ORIGIN_TAG
CREATE TABLE ORIGIN_TAG (
    ORID NUMBER(18),
    PROCESS_MODE VARCHAR2(32),
    PROCESS_ATTRIBUTE VARCHAR2(32),
    NDEF NUMBER(4),
    LDDATE DATE,
    ,CONSTRAINT ORIGIN_TAG_PK PRIMARY KEY (PROCESS_MODE),
    ,CONSTRAINT ORIGIN_TAG_NDEF__CK CHECK ((ndef > 0 ) OR ndef = -1),
    ,CONSTRAINT ORIGIN_TAG_PROCESS_MODE_CK CHECK (process_mode IN ('GL', 'SL', 'LF', 'MEA', 'SL-reviewed', 'GL-reviewed', 'SL-only, GL-mod', 'GL-only, SL-m od', 'ANALYST', '-')),
    ,CONSTRAINT ORIGIN_TAG_PROCESS_MODE__CK CHECK (process_mode IN ('GL', 'SL', 'LF', 'MEA','SL-reviewed', 'GL-reviewed', 'SL-only, GL-mod', 'GL-only, SL-mo d', '-'))
);
COMMENT ON TABLE ORIGIN_TAG IS 'The origin_tag table contains information to indicate which mode was used to generate the origin (i.e. automated process ing mode of defining arrivals for an automated event or anal ysis mode for a reviewed event).';
COMMENT ON COLUMN ORIGIN_TAG.ORID IS 'Origin identifier';
COMMENT ON COLUMN ORIGIN_TAG.PROCESS_MODE IS 'Automated processing mode of defining arrivals or analysis mode';
COMMENT ON COLUMN ORIGIN_TAG.PROCESS_ATTRIBUTE IS 'Additional information to augment the process_mode (e.g. specific spotlight)';
COMMENT ON COLUMN ORIGIN_TAG.NDEF IS 'Number of defining arrivals for automated processing mode';
COMMENT ON COLUMN ORIGIN_TAG.LDDATE IS 'Load date';

-- Table: OUTAGE_STATION_DATA
CREATE TABLE OUTAGE_STATION_DATA (
    OUTAGE_ID NUMBER(18),
    STA VARCHAR2(6),
    START_DATE DATE,
    END_DATE DATE,
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT OUTAGE_STATION_DATA_PK PRIMARY KEY (OUTAGE_ID),
    ,CONSTRAINT OUTAGE_STA_DATA__OUTAGE_ID__CK CHECK (outage_id > 0)
);
COMMENT ON TABLE OUTAGE_STATION_DATA IS 'The outage_station_data table provides tracking of station a vailability.';
COMMENT ON COLUMN OUTAGE_STATION_DATA.OUTAGE_ID IS 'Outage identifier';
COMMENT ON COLUMN OUTAGE_STATION_DATA.STA IS 'Station name';
COMMENT ON COLUMN OUTAGE_STATION_DATA.START_DATE IS 'Process Start date/time';
COMMENT ON COLUMN OUTAGE_STATION_DATA.END_DATE IS 'Last time the process ran';
COMMENT ON COLUMN OUTAGE_STATION_DATA.AUTHOR IS 'Author';
COMMENT ON COLUMN OUTAGE_STATION_DATA.MODDATE IS 'Modification date';
COMMENT ON COLUMN OUTAGE_STATION_DATA.LDDATE IS 'Load date';

-- Table: OUTAGE_STATION_RECEIVE
CREATE TABLE OUTAGE_STATION_RECEIVE (
    OUTAGE_ID NUMBER(18),
    STA VARCHAR2(6),
    START_DATE DATE,
    END_DATE DATE,
    ENDTIME FLOAT(53),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT OUTAGE_STATION_RECEIVE_PK PRIMARY KEY (OUTAGE_ID),
    ,CONSTRAINT OUTAGE_STA_REC__ENDTIME__CK CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT OUTAGE_STA_REC__OUTAGE_ID__CK CHECK (outage_id > 0)
);
COMMENT ON TABLE OUTAGE_STATION_RECEIVE IS 'The outage_station_receive table provides tracking of pipeli ne availability for both the operational and alternate US ND C systems.';
COMMENT ON COLUMN OUTAGE_STATION_RECEIVE.OUTAGE_ID IS 'Outage identifier';
COMMENT ON COLUMN OUTAGE_STATION_RECEIVE.STA IS 'Station name';
COMMENT ON COLUMN OUTAGE_STATION_RECEIVE.START_DATE IS 'Process Start date/time.';
COMMENT ON COLUMN OUTAGE_STATION_RECEIVE.END_DATE IS 'Last time the process ran';
COMMENT ON COLUMN OUTAGE_STATION_RECEIVE.ENDTIME IS 'Station outage ending time.';
COMMENT ON COLUMN OUTAGE_STATION_RECEIVE.AUTHOR IS 'Author';
COMMENT ON COLUMN OUTAGE_STATION_RECEIVE.MODDATE IS 'Modification date';
COMMENT ON COLUMN OUTAGE_STATION_RECEIVE.LDDATE IS 'Load date';

-- Table: POLYGON
CREATE TABLE POLYGON (
    POLYID NUMBER(18),
    REGION_NAME VARCHAR2(30),
    PERIMETERTYPE VARCHAR2(8),
    INSIDEFLAG VARCHAR2(1),
    OUTSIDEFLAG VARCHAR2(1),
    EDGEFLAG VARCHAR2(1),
    AUTH VARCHAR2(15),
    COMMENTS VARCHAR2(4000),
    LDDATE DATE,
    ,CONSTRAINT POLYGON_PK PRIMARY KEY (POLYID),
    ,CONSTRAINT POLYGON__EDGEFLAG__CK CHECK (edgeflag in('n', 'N', 'y', 'Y', '-')),
    ,CONSTRAINT POLYGON__INSIDEFLAG__CK CHECK (insideflag in('n', 'N', 'y', 'Y', '-')),
    ,CONSTRAINT POLYGON__OUTSIDEFLAG__CK CHECK (outsideflag in('n', 'N', 'y', 'Y', '-')),
    ,CONSTRAINT POLYGON__POLYID__CK CHECK (polyid >0)
);
COMMENT ON TABLE POLYGON IS 'The polygon table contains the name for each polyid.';
COMMENT ON COLUMN POLYGON.POLYID IS 'Polygon Identifier';
COMMENT ON COLUMN POLYGON.REGION_NAME IS 'name of region';
COMMENT ON COLUMN POLYGON.PERIMETERTYPE IS 'type of perimeter (unused)';
COMMENT ON COLUMN POLYGON.INSIDEFLAG IS 'inside flag (unused)';
COMMENT ON COLUMN POLYGON.OUTSIDEFLAG IS 'outage flag (unused)';
COMMENT ON COLUMN POLYGON.EDGEFLAG IS 'edge flag (unused)';
COMMENT ON COLUMN POLYGON.AUTH IS 'Author';
COMMENT ON COLUMN POLYGON.COMMENTS IS 'comment text';
COMMENT ON COLUMN POLYGON.LDDATE IS 'Load date';

-- Table: POLYPOINT
CREATE TABLE POLYPOINT (
    POLYID NUMBER(18),
    SEQUENCE NUMBER(18),
    LAT FLOAT(53),
    LON FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT POLYPOINT_PK PRIMARY KEY (SEQUENCE),
    ,CONSTRAINT POLYPOINT__LAT__CK CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT POLYPOINT__LON__CK CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT POLYPOINT__POLYID__CK CHECK (polyid >0),
    ,CONSTRAINT POLYPOINT__SEQUENCE__CK CHECK (sequence >0)
);
COMMENT ON TABLE POLYPOINT IS 'The polypoint table contains a polyid, sequence number, lati tude, and longitude for each point of a polygon. All record s with the same polyid will combine to define a single polyg on.';
COMMENT ON COLUMN POLYPOINT.POLYID IS 'Polygon Identifier';
COMMENT ON COLUMN POLYPOINT.SEQUENCE IS 'point of interest';
COMMENT ON COLUMN POLYPOINT.LAT IS 'Latitude';
COMMENT ON COLUMN POLYPOINT.LON IS 'Longitude';
COMMENT ON COLUMN POLYPOINT.LDDATE IS 'Load date';

-- Table: PROCESS_TRACKING
CREATE TABLE PROCESS_TRACKING (
    TRACKINGID NUMBER(18),
    PROCESS VARCHAR2(256),
    MACHINE VARCHAR2(128),
    SYS_AREA VARCHAR2(128),
    SYS_SITE VARCHAR2(128),
    PROC_START_DATE DATE,
    PROC_END_DATE DATE,
    STATE VARCHAR2(16),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT PROCESS_TRACKING_PK PRIMARY KEY (TRACKINGID),
    ,CONSTRAINT PROCESS_TRCKG__TRACKINGID__CK CHECK (trackingid > 0)
);
COMMENT ON TABLE PROCESS_TRACKING IS 'The process_tracking table provides tracking of pipeline ava ilability for both the operational and alternate systems.';
COMMENT ON COLUMN PROCESS_TRACKING.TRACKINGID IS 'Process Tracking Identifier';
COMMENT ON COLUMN PROCESS_TRACKING.PROCESS IS 'Process name (Ex: pipeline_daemon, interactive_daemon)';
COMMENT ON COLUMN PROCESS_TRACKING.MACHINE IS 'Machine name';
COMMENT ON COLUMN PROCESS_TRACKING.SYS_AREA IS 'System Area';
COMMENT ON COLUMN PROCESS_TRACKING.SYS_SITE IS 'Where the process was started.';
COMMENT ON COLUMN PROCESS_TRACKING.PROC_START_DATE IS 'Process start date.';
COMMENT ON COLUMN PROCESS_TRACKING.PROC_END_DATE IS 'Process end date';
COMMENT ON COLUMN PROCESS_TRACKING.STATE IS 'Current processing state';
COMMENT ON COLUMN PROCESS_TRACKING.AUTHOR IS 'Author';
COMMENT ON COLUMN PROCESS_TRACKING.MODDATE IS 'Modification date.';
COMMENT ON COLUMN PROCESS_TRACKING.LDDATE IS 'Load date';

-- Table: PROCESSING_RECIPE
CREATE TABLE PROCESSING_RECIPE (
    PROCID NUMBER(18),
    PROCMETHOD VARCHAR2(20),
    IDNAME VARCHAR2(15),
    IDVALUE NUMBER(18),
    PROCORDER NUMBER(6),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT PROCESSING_RECIPE_PK PRIMARY KEY (PROCID),
    ,CONSTRAINT PROCESSING_RECIPE__IDVALUE__CK CHECK (idvalue > 0),
    ,CONSTRAINT PROCESSING_RECIPE__PROCID__CK CHECK (procid > 0),
    ,CONSTRAINT PROCESSING_RECIPE__PROCORD__CK CHECK (procorder >= -1)
);
COMMENT ON TABLE PROCESSING_RECIPE IS 'The processing_recipe table provides the types of waveform p rocessing and the order in which they should be applied. Thi s table allows each cluster station to be processed in diffe rent ways for different proctypes (SVD, CORR, and AMP).';
COMMENT ON COLUMN PROCESSING_RECIPE.PROCID IS 'ID of the processing recipe. This ID and the procorder form the primary key';
COMMENT ON COLUMN PROCESSING_RECIPE.PROCMETHOD IS 'Method of processing (taper, deconvolution, butterworth_filter, etc)';
COMMENT ON COLUMN PROCESSING_RECIPE.IDNAME IS 'The name of the id field (taperid, filterid, etc)';
COMMENT ON COLUMN PROCESSING_RECIPE.IDVALUE IS 'The value of the id field';
COMMENT ON COLUMN PROCESSING_RECIPE.PROCORDER IS 'The value of the id field';
COMMENT ON COLUMN PROCESSING_RECIPE.AUTH IS 'Author';
COMMENT ON COLUMN PROCESSING_RECIPE.LDDATE IS 'Load date';

-- Table: QCMASKDEF
CREATE TABLE QCMASKDEF (
    QCDEFID NUMBER(18),
    FIX NUMBER(1),
    NTAPER NUMBER(8),
    DROP_THR NUMBER(8),
    SINGLE_TRACE_SPIKE_THR FLOAT(53),
    NITER NUMBER(8),
    NSAMP NUMBER(8),
    NOVER NUMBER(8),
    SPIKE_THR FLOAT(53),
    SPIKE_STAT NUMBER(8),
    SPIKE_VAL FLOAT(53),
    SPIKE_NPWIN NUMBER(8),
    SPIKE_DSET NUMBER(8),
    NOISE_THRESH FLOAT(53),
    SPIKE_WINLEN NUMBER(8),
    INTERQUAR_COEF FLOAT(53),
    NOISE_NSAMP NUMBER(8),
    NOISE_NOVERLAP NUMBER(8),
    ALGORITHM_LIST VARCHAR2(100),
    ONDATE NUMBER(8),
    OFFDATE NUMBER(8),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT QCMASKDEF_PK PRIMARY KEY (QCDEFID),
    ,CONSTRAINT QCMASKDEF__DROPTH__CK CHECK (drop_thr >= 0),
    ,CONSTRAINT QCMASKDEF__FIX__CK CHECK (fix = 0 or fix = 1),
    ,CONSTRAINT QCMASKDEF__INTQUARCOEF__CK CHECK (interquar_coef >= 0),
    ,CONSTRAINT QCMASKDEF__NITER__CK CHECK (niter >= 0),
    ,CONSTRAINT QCMASKDEF__NOISE_NOVER__CK CHECK (noise_noverlap >= 0 or noise_noverlap = -1),
    ,CONSTRAINT QCMASKDEF__NOISE_NSAMP__CK CHECK (noise_nsamp >= 0 or noise_nsamp = -1),
    ,CONSTRAINT QCMASKDEF__NOVER__CK CHECK (nover >= 0),
    ,CONSTRAINT QCMASKDEF__NSAMP__CK CHECK (nsamp >= 0),
    ,CONSTRAINT QCMASKDEF__NTAPER__CK CHECK (ntaper >= 0),
    ,CONSTRAINT QCMASKDEF__QCDEFID__CK CHECK (qcdefid > 0),
    ,CONSTRAINT QCMASKDEF__SPIKEDSET__CK CHECK (spike_dset in ( 0,1,2)),
    ,CONSTRAINT QCMASKDEF__SPIKENPWIN__CK CHECK (spike_npwin >= 0),
    ,CONSTRAINT QCMASKDEF__SPIKESTAT__CK CHECK (spike_stat in ( 0,1)),
    ,CONSTRAINT QCMASKDEF__SPIKETH__CK CHECK (spike_thr >= 0),
    ,CONSTRAINT QCMASKDEF__SPIKEVAL__CK CHECK (spike_val >= 0 AND spike_val <=100),
    ,CONSTRAINT QCMASKDEF__SPIKEWINLEN__CK CHECK (spike_winlen >= 0),
    ,CONSTRAINT QCMASKDEF__STSPIKETHR__CK CHECK (single_trace_spike_thr >= 0)
);
COMMENT ON TABLE QCMASKDEF IS 'The qcmaskdef table contains information defining the parame ters that went into the calculation of the QC mask.';
COMMENT ON COLUMN QCMASKDEF.QCDEFID IS 'Definition identifier';
COMMENT ON COLUMN QCMASKDEF.FIX IS 'Flag indicating how to fix the bad segment';
COMMENT ON COLUMN QCMASKDEF.NTAPER IS 'Number of points to taper outside segment of length >=drop_thr';
COMMENT ON COLUMN QCMASKDEF.DROP_THR IS 'Number of consecutive equal-valued samples to call a bad segment';
COMMENT ON COLUMN QCMASKDEF.SINGLE_TRACE_SPIKE_THR IS 'Amplitude ratio threshold for single-point spikes';
COMMENT ON COLUMN QCMASKDEF.NITER IS 'Number of iterations to perform extended QC';
COMMENT ON COLUMN QCMASKDEF.NSAMP IS 'Number of samples in a time interval for extended QC';
COMMENT ON COLUMN QCMASKDEF.NOVER IS 'Number of overlap samples for extended QC';
COMMENT ON COLUMN QCMASKDEF.SPIKE_THR IS 'Amplitude ratio threshold for extended QC spikes';
COMMENT ON COLUMN QCMASKDEF.SPIKE_STAT IS 'Flag for statistic to use for spike detection across multiple data vectors';
COMMENT ON COLUMN QCMASKDEF.SPIKE_VAL IS 'Value to use for spike_stat';
COMMENT ON COLUMN QCMASKDEF.SPIKE_NPWIN IS 'Number of points to use for single vector extended QC spike detection';
COMMENT ON COLUMN QCMASKDEF.SPIKE_DSET IS 'Flag for data set to use for extended QC across multiple data vectors';
COMMENT ON COLUMN QCMASKDEF.NOISE_THRESH IS 'Noisy channel threshold value';
COMMENT ON COLUMN QCMASKDEF.SPIKE_WINLEN IS 'Number of samples used in single-trace QC';
COMMENT ON COLUMN QCMASKDEF.INTERQUAR_COEF IS 'Inter-quartile range multiplier for single-trace QC';
COMMENT ON COLUMN QCMASKDEF.NOISE_NSAMP IS 'Number of samples in averaging window for noisy channel processing';
COMMENT ON COLUMN QCMASKDEF.NOISE_NOVERLAP IS 'Number of samples windows overlap for noisy channel processing';
COMMENT ON COLUMN QCMASKDEF.ALGORITHM_LIST IS 'List of algorithms applied during QC processing';
COMMENT ON COLUMN QCMASKDEF.ONDATE IS 'The date this record starts to be used';
COMMENT ON COLUMN QCMASKDEF.OFFDATE IS 'The date this record is no longer used';
COMMENT ON COLUMN QCMASKDEF.AUTH IS 'Author';
COMMENT ON COLUMN QCMASKDEF.LDDATE IS 'Load date';

-- Table: QCMASKINFO
CREATE TABLE QCMASKINFO (
    QCMASKID NUMBER(18),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    SAMPRATE FLOAT(24),
    NSEG NUMBER(8),
    QCDEFID NUMBER(18),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT QCMASKINFO_PK PRIMARY KEY (QCMASKID),
    ,CONSTRAINT QCMASKINFO_UK UNIQUE (CHAN),
    ,CONSTRAINT QCMASKINFO__ENDTIME__CK CHECK (endtime <= 9999999999.999 AND endtime > time),
    ,CONSTRAINT QCMASKINFO__NSEG__CK CHECK (nseg >= 0 OR nseg = -1),
    ,CONSTRAINT QCMASKINFO__QCDEFID__CK CHECK (qcdefid > 0),
    ,CONSTRAINT QCMASKINFO__QCMASKID__CK CHECK (qcmaskid > 0),
    ,CONSTRAINT QCMASKINFO__SAMPRATE__CK CHECK (samprate > 0.0),
    ,CONSTRAINT QCMASKINFO__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT QCMASKINFO__TIME__CK CHECK (time > -9999999999.999)
);
COMMENT ON TABLE QCMASKINFO IS 'The qcmaskinfo table contains QC mask data information about a channel and time interval for which QC processing was per formed.';
COMMENT ON COLUMN QCMASKINFO.QCMASKID IS 'QC mask identifier';
COMMENT ON COLUMN QCMASKINFO.STA IS 'Station name';
COMMENT ON COLUMN QCMASKINFO.CHAN IS 'Channel name';
COMMENT ON COLUMN QCMASKINFO.TIME IS 'Start time of Mask';
COMMENT ON COLUMN QCMASKINFO.ENDTIME IS 'End time of Mask';
COMMENT ON COLUMN QCMASKINFO.SAMPRATE IS 'Sample rate in samples/sec';
COMMENT ON COLUMN QCMASKINFO.NSEG IS 'The number of segments for this mask ( see qcmaskseg table )';
COMMENT ON COLUMN QCMASKINFO.QCDEFID IS 'QC definition ientifier';
COMMENT ON COLUMN QCMASKINFO.AUTH IS 'Author';
COMMENT ON COLUMN QCMASKINFO.LDDATE IS 'Load date';

-- Table: QCMASKSEG
CREATE TABLE QCMASKSEG (
    QCMASKID NUMBER(18),
    STARTSAMPLE NUMBER(8),
    ENDSAMPLE NUMBER(8),
    MASKTYPE NUMBER(5),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT QCMASKSEG_PK PRIMARY KEY (QCMASKID),
    ,CONSTRAINT QCMASKSEG__ENDSAMPLE__CK CHECK (endsample >= startsample),
    ,CONSTRAINT QCMASKSEG__MASKTYPE__CK CHECK (masktype > 0 OR masktype = 0),
    ,CONSTRAINT QCMASKSEG__QCMASKID__CK CHECK (qcmaskid > 0),
    ,CONSTRAINT QCMASKSEG__STARTSAMPLE__CK CHECK (startsample >= 0)
);
COMMENT ON TABLE QCMASKSEG IS 'The qcmaskseg table contains information about masked data s egments resulting from QC processing.';
COMMENT ON COLUMN QCMASKSEG.QCMASKID IS 'QC mask identifier';
COMMENT ON COLUMN QCMASKSEG.STARTSAMPLE IS 'Number of the starting sample';
COMMENT ON COLUMN QCMASKSEG.ENDSAMPLE IS 'Number of the ending sample';
COMMENT ON COLUMN QCMASKSEG.MASKTYPE IS 'Flag indicating type of mask for a given segment';
COMMENT ON COLUMN QCMASKSEG.AUTH IS 'Author';
COMMENT ON COLUMN QCMASKSEG.LDDATE IS 'Load date';

-- Table: QSHELL_INTERVAL
CREATE TABLE QSHELL_INTERVAL (
    QSHELL_INTVLID NUMBER(18),
    INTVLID NUMBER(18),
    CLASS VARCHAR2(16),
    NAME VARCHAR2(20),
    PROC_START_DATE DATE,
    PROC_END_DATE DATE,
    STATE VARCHAR2(16),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT QSHELL_INTERVAL_PK PRIMARY KEY (QSHELL_INTVLID),
    ,CONSTRAINT QSHELL_INTVL__INTVLID__CK CHECK (intvlid > 0),
    ,CONSTRAINT QSHELL_INTVL__QSH_INTVLID__CK CHECK (qshell_intvlid > 0)
);
COMMENT ON TABLE QSHELL_INTERVAL IS 'The qshell_interval table records processing that was perfor med against interval table rows. It records the start and e nd dates of execution of each process name in the processing sequence for the interval class.';
COMMENT ON COLUMN QSHELL_INTERVAL.QSHELL_INTVLID IS 'QShell Interval identifier';
COMMENT ON COLUMN QSHELL_INTERVAL.INTVLID IS 'Interval identifier';
COMMENT ON COLUMN QSHELL_INTERVAL.CLASS IS 'Type of interval';
COMMENT ON COLUMN QSHELL_INTERVAL.NAME IS 'Name of interval';
COMMENT ON COLUMN QSHELL_INTERVAL.PROC_START_DATE IS 'Processing start date';
COMMENT ON COLUMN QSHELL_INTERVAL.PROC_END_DATE IS 'Processing stop date';
COMMENT ON COLUMN QSHELL_INTERVAL.STATE IS 'Current processing state';
COMMENT ON COLUMN QSHELL_INTERVAL.AUTHOR IS 'Author of interval';
COMMENT ON COLUMN QSHELL_INTERVAL.MODDATE IS 'Time of last processing state change';
COMMENT ON COLUMN QSHELL_INTERVAL.LDDATE IS 'Load date';

-- Table: RDA_PARAM
CREATE TABLE RDA_PARAM (
    POLYID NUMBER(18),
    RDA_VERID NUMBER(18),
    GAMMA FLOAT(53),
    LAMBDA FLOAT(53),
    CLASS_DECISION_THRESH FLOAT(53),
    AUTH VARCHAR2(15),
    COMMENTS VARCHAR2(4000),
    LDDATE DATE,
    ,CONSTRAINT RDA_PARAM_PK PRIMARY KEY (RDA_VERID),
    ,CONSTRAINT RDA_PARAM__CDT__CK CHECK (( class_decision_thresh >= 0 AND class_decision_thresh <=1 ) OR class_decision_thresh = -1),
    ,CONSTRAINT RDA_PARAM__GAMMA__CK CHECK (( gamma >= 0 AND gamma <=1 ) OR gamma = -1),
    ,CONSTRAINT RDA_PARAM__LAMBDA__CK CHECK (( lambda >= 0 AND lambda <=1 ) OR lambda = -1),
    ,CONSTRAINT RDA_PARAM__POLYID__CK CHECK (polyid >0),
    ,CONSTRAINT RDA_PARAM__RDA_VID__CK CHECK (rda_verid >0)
);
COMMENT ON TABLE RDA_PARAM IS 'The rda_param table contains the Regularized Discrimination Analysis (RDA) parameters for each polyid.';
COMMENT ON COLUMN RDA_PARAM.POLYID IS 'Polygon Identifier';
COMMENT ON COLUMN RDA_PARAM.RDA_VERID IS 'version identifier of the RDA';
COMMENT ON COLUMN RDA_PARAM.GAMMA IS 'Frequency exponent of attenuation';
COMMENT ON COLUMN RDA_PARAM.LAMBDA IS 'Smoothing parameter';
COMMENT ON COLUMN RDA_PARAM.CLASS_DECISION_THRESH IS 'Decision threshold';
COMMENT ON COLUMN RDA_PARAM.AUTH IS 'Author';
COMMENT ON COLUMN RDA_PARAM.COMMENTS IS 'comment text';
COMMENT ON COLUMN RDA_PARAM.LDDATE IS 'Load date';

-- Table: REG_RATIO_DISCRIM
CREATE TABLE REG_RATIO_DISCRIM (
    POLYID NUMBER(18),
    COV_VERID NUMBER(18),
    NUMERATOR_PHASE VARCHAR2(8),
    DENOMINATOR_PHASE VARCHAR2(8),
    NUM_LOW_FREQ FLOAT(53),
    NUM_HI_FREQ FLOAT(53),
    DEN_LOW_FREQ FLOAT(53),
    DEN_HI_FREQ FLOAT(53),
    MEAN_EX_VAL FLOAT(53),
    NUM_STATION_VAR FLOAT(53),
    DEN_STATION_VAR FLOAT(53),
    NUM_EVENT_VAR FLOAT(53),
    DEN_EVENT_VAR FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT REG_RATIO_DISCRIM_PK PRIMARY KEY (DENOMINATOR_PHASE),
    ,CONSTRAINT REG_RATIO_DISCR__COV_VID__CK CHECK (cov_verid >0),
    ,CONSTRAINT REG_RATIO_DISCR__DHF__CK CHECK (den_hi_freq >=0),
    ,CONSTRAINT REG_RATIO_DISCR__DLF__CK CHECK (den_low_freq >=0),
    ,CONSTRAINT REG_RATIO_DISCR__NHF__CK CHECK (num_hi_freq >=0),
    ,CONSTRAINT REG_RATIO_DISCR__NLF__CK CHECK (num_low_freq >=0),
    ,CONSTRAINT REG_RATIO_DISCR__POLYID__CK CHECK (polyid >0)
);
COMMENT ON TABLE REG_RATIO_DISCRIM IS 'The reg_ratio_discrim table contains variances and means for each polyid, numerator phase and frequency, and denominator phase and frequency. These parameters are used for discrim inants which are ratios of two phases.';
COMMENT ON COLUMN REG_RATIO_DISCRIM.POLYID IS 'Polygon Identifier';
COMMENT ON COLUMN REG_RATIO_DISCRIM.COV_VERID IS 'version identifier of the covariance matrix';
COMMENT ON COLUMN REG_RATIO_DISCRIM.NUMERATOR_PHASE IS 'Numerator phase of interest';
COMMENT ON COLUMN REG_RATIO_DISCRIM.DENOMINATOR_PHASE IS 'Denominator phase of interest';
COMMENT ON COLUMN REG_RATIO_DISCRIM.NUM_LOW_FREQ IS 'Low end of frequency band used to filter numerator measurement';
COMMENT ON COLUMN REG_RATIO_DISCRIM.NUM_HI_FREQ IS 'High end of frequency band used to filter numerator measurement';
COMMENT ON COLUMN REG_RATIO_DISCRIM.DEN_LOW_FREQ IS 'Low end of frequency band used to filter denominator measurement';
COMMENT ON COLUMN REG_RATIO_DISCRIM.DEN_HI_FREQ IS 'High end of frequency band used to filter denominator measurement';
COMMENT ON COLUMN REG_RATIO_DISCRIM.MEAN_EX_VAL IS 'Mean p-value for explosions for this discriminant within this region';
COMMENT ON COLUMN REG_RATIO_DISCRIM.NUM_STATION_VAR IS 'Variability due to station in the numerator phase';
COMMENT ON COLUMN REG_RATIO_DISCRIM.DEN_STATION_VAR IS 'Variability due to station in the denominator phase';
COMMENT ON COLUMN REG_RATIO_DISCRIM.NUM_EVENT_VAR IS 'Variability due to event in the numerator phase';
COMMENT ON COLUMN REG_RATIO_DISCRIM.DEN_EVENT_VAR IS 'Variability due to event in the denominator phase';
COMMENT ON COLUMN REG_RATIO_DISCRIM.LDDATE IS 'Date this parameter set was loaded';

-- Table: REMAP
CREATE TABLE REMAP (
    SOURCE VARCHAR2(512),
    ID_NAME VARCHAR2(12),
    ORIGINAL_ID NUMBER(18),
    CURRENT_ID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT REMAP_CURRENT_ID_NN CHECK ("CURRENT_ID" IS NOT NULL),
    ,CONSTRAINT REMAP_ID_NAME_NN CHECK ("ID_NAME" IS NOT NULL),
    ,CONSTRAINT REMAP_ORIGINAL_ID_NN CHECK ("ORIGINAL_ID" IS NOT NULL),
    ,CONSTRAINT REMAP_SOURCE_NN CHECK ("SOURCE" IS NOT NULL)
);

-- Table: REMARK
CREATE TABLE REMARK (
    COMMID NUMBER(18),
    LINENO NUMBER(8),
    REMARK VARCHAR2(160),
    LDDATE DATE,
    ,CONSTRAINT REMARK_PK PRIMARY KEY (LINENO),
    ,CONSTRAINT REMARK__COMMID__CK CHECK (commid > 0),
    ,CONSTRAINT REMARK__LINENO__CK CHECK (lineno > 0)
);
COMMENT ON TABLE REMARK IS 'The remark table contains comments. This table may be used t o store free-form comments that embellish records of other t ables. The commid type in many tables refers to a record in the remark table. If commid is NA (1) in a record of any oth er table, no comments are stored for that record.';
COMMENT ON COLUMN REMARK.COMMID IS 'Comment identifier';
COMMENT ON COLUMN REMARK.LINENO IS 'Comment line number';
COMMENT ON COLUMN REMARK.REMARK IS 'Free-format comment';
COMMENT ON COLUMN REMARK.LDDATE IS 'Load date';

-- Table: REMOVED_BEAM_DFILE
CREATE TABLE REMOVED_BEAM_DFILE (
    DFILE VARCHAR2(32),
    LDDATE DATE,
    ,CONSTRAINT REMOVED_BEAM_DFILE_PK PRIMARY KEY (LDDATE)
);
COMMENT ON TABLE REMOVED_BEAM_DFILE IS 'This table contains a list of beam files that have been remo ved from the USNDC. It is used to clean up orphaned beam fil es on the non-mission system side since they are only remove d on the mission side.';
COMMENT ON COLUMN REMOVED_BEAM_DFILE.DFILE IS 'Beam file name';
COMMENT ON COLUMN REMOVED_BEAM_DFILE.LDDATE IS 'Load date';

-- Table: REQUEST
CREATE TABLE REQUEST (
    REQID NUMBER(18),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    ARRAY VARCHAR2(8),
    ORID NUMBER(18),
    EVID NUMBER(18),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    CLASS VARCHAR2(16),
    REQ_STATE VARCHAR2(16),
    STATECOUNT NUMBER(8),
    COMPLETE NUMBER(8),
    REQUESTOR VARCHAR2(15),
    MODTIME FLOAT(53),
    MODAUTHOR VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT REQUEST_PK PRIMARY KEY (REQID),
    ,CONSTRAINT REQUEST_UK UNIQUE (TIME),
    ,CONSTRAINT REQUEST__COMPLETE__CK CHECK (complete >= 0 AND complete <= 100),
    ,CONSTRAINT REQUEST__ENDTIME__CK CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT REQUEST__EVID__CK CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT REQUEST__MODTIME__CK CHECK (modtime > -9999999999.999),
    ,CONSTRAINT REQUEST__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT REQUEST__REQID__CK CHECK (reqid > 0),
    ,CONSTRAINT REQUEST__STATECOUNT__CK CHECK (statecount >= 0),
    ,CONSTRAINT REQUEST__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT REQUEST__TIME__CK CHECK (time > -9999999999.999)
);
COMMENT ON TABLE REQUEST IS 'The request table defines segments of auxiliary waveform dat a to be acquired. The time, endtime, sta, and chan types def ine a single unit of data. Data import programs must succeed in acquiring all the data for a time interval before changi ng the state to indicate success.';
COMMENT ON COLUMN REQUEST.REQID IS 'Request identifier';
COMMENT ON COLUMN REQUEST.STA IS 'Station code';
COMMENT ON COLUMN REQUEST.CHAN IS 'Channel code';
COMMENT ON COLUMN REQUEST.ARRAY IS 'Array code';
COMMENT ON COLUMN REQUEST.ORID IS 'Origin identifier';
COMMENT ON COLUMN REQUEST.EVID IS 'Event identifier';
COMMENT ON COLUMN REQUEST.TIME IS 'Starting time of requested waveform data';
COMMENT ON COLUMN REQUEST.ENDTIME IS 'Ending time of requested waveform data';
COMMENT ON COLUMN REQUEST.CLASS IS 'Type of request';
COMMENT ON COLUMN REQUEST.REQ_STATE IS 'Current request state';
COMMENT ON COLUMN REQUEST.STATECOUNT IS 'Number of failed attempts (when state = failed)';
COMMENT ON COLUMN REQUEST.COMPLETE IS 'Percentage of data acquired';
COMMENT ON COLUMN REQUEST.REQUESTOR IS 'Original author of record';
COMMENT ON COLUMN REQUEST.MODTIME IS 'Time of last state change (epoch time)';
COMMENT ON COLUMN REQUEST.MODAUTHOR IS 'Author of last state change';
COMMENT ON COLUMN REQUEST.LDDATE IS 'Load date';

-- Table: SADO_EMAIL_HISTORY
CREATE TABLE SADO_EMAIL_HISTORY (
    SADO_EMAIL_ID NUMBER(18),
    REPORT_ID NUMBER(18),
    SUBJECT VARCHAR2(1000),
    RECIPIENTS VARCHAR2(4000),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT SADO_EMAIL_HISTORY_PK PRIMARY KEY (SADO_EMAIL_ID),
    ,CONSTRAINT SADO_E_HIST__REPORT_ID__CK CHECK (report_id > 0),
    ,CONSTRAINT SADO_E_HIST__SADO_EMAIL_ID__CK CHECK (sado_email_id > 0)
);
COMMENT ON TABLE SADO_EMAIL_HISTORY IS 'The SADO table contains the email history of reports sent by users using the SADO Tool.';
COMMENT ON COLUMN SADO_EMAIL_HISTORY.SADO_EMAIL_ID IS 'SADO Email History Identifier.';
COMMENT ON COLUMN SADO_EMAIL_HISTORY.REPORT_ID IS 'Report Identifier.';
COMMENT ON COLUMN SADO_EMAIL_HISTORY.SUBJECT IS 'SADO Email Subject Text';
COMMENT ON COLUMN SADO_EMAIL_HISTORY.RECIPIENTS IS 'SADO Email recipients';
COMMENT ON COLUMN SADO_EMAIL_HISTORY.AUTHOR IS 'Author of the SADO Email';
COMMENT ON COLUMN SADO_EMAIL_HISTORY.MODDATE IS 'Modification date';
COMMENT ON COLUMN SADO_EMAIL_HISTORY.LDDATE IS 'Load Date';

-- Table: SADO_PDF_REPORTS
CREATE TABLE SADO_PDF_REPORTS (
    SADO_PDF_REPORT_ID NUMBER(18),
    REPORT_ID NUMBER(18),
    REPORT ,
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT SADO_PDF_REPORTS_PK PRIMARY KEY (SADO_PDF_REPORT_ID),
    ,CONSTRAINT SADO_PDF_RPTS__REPORT_ID__CK CHECK (report_id > 0),
    ,CONSTRAINT SADO_PDF_RPTS__SPR_ID__CK CHECK (sado_pdf_report_id > 0)
);
COMMENT ON TABLE SADO_PDF_REPORTS IS 'The SADO table contains the binary stored pdf reports and as sociated id numbers.';
COMMENT ON COLUMN SADO_PDF_REPORTS.SADO_PDF_REPORT_ID IS 'SADO PDF Report Identifier';
COMMENT ON COLUMN SADO_PDF_REPORTS.REPORT_ID IS 'SADO Report Identifier';
COMMENT ON COLUMN SADO_PDF_REPORTS.REPORT IS 'Binary format for saving the SADO pdf report';
COMMENT ON COLUMN SADO_PDF_REPORTS.AUTHOR IS 'Author of the SADO PDF Report.';
COMMENT ON COLUMN SADO_PDF_REPORTS.MODDATE IS 'Modification date';
COMMENT ON COLUMN SADO_PDF_REPORTS.LDDATE IS 'Load Date';

-- Table: SADO_REPORT
CREATE TABLE SADO_REPORT (
    REPORT_ID NUMBER(18),
    EVID NUMBER(18),
    ORID NUMBER(18),
    GRN NUMBER(8),
    EVENT_TIME FLOAT(53),
    TITLE VARCHAR2(64),
    ANALYST VARCHAR2(32),
    ACCOUNT VARCHAR2(15),
    DESCRIPTION ,
    CLASSIFICATION VARCHAR2(256),
    TTGE VARCHAR2(1),
    SADO_RELEASED VARCHAR2(1),
    ALERT_MANAGER_CALLED VARCHAR2(1),
    EXERCISE VARCHAR2(1),
    EMAIL_TYPE VARCHAR2(32),
    ALERT_MANAGER VARCHAR2(64),
    YIELD_CALCULATOR_REGION_SELECT VARCHAR2(64),
    FINAL_DETERMINATION VARCHAR2(32),
    MAG_MAGTYPE VARCHAR2(32),
    OVERBURDEN_SET VARCHAR2(1),
    OVERBURDEN FLOAT(24),
    COMMENTS VARCHAR2(4000),
    ECM_DETERMINATION VARCHAR2(32),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT SADO_REPORT_PK PRIMARY KEY (REPORT_ID),
    ,CONSTRAINT SADO_REPORT__ALRT_MGR_CALL__CK CHECK (alert_manager_called IN('N','Y','-')),
    ,CONSTRAINT SADO_REPORT__EMAIL_TYPE__CK CHECK (email_type IN ( 'Code 0', 'Code 1', 'Code 2' )),
    ,CONSTRAINT SADO_REPORT__EVENT_TIME__CK CHECK (event_time >= -9999999999.999),
    ,CONSTRAINT SADO_REPORT__EVID__CK CHECK (evid > 0),
    ,CONSTRAINT SADO_REPORT__EXERCISE__CK CHECK (exercise IN('N','Y','-')),
    ,CONSTRAINT SADO_REPORT__FINAL_DETERM__CK CHECK (final_determination IN('Indeterminate','Earthquake','Explosion','Not Applicable' )),
    ,CONSTRAINT SADO_REPORT__GRN__CK CHECK ((grn >= 1 AND grn <= 729) OR grn = -1),
    ,CONSTRAINT SADO_REPORT__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT SADO_REPORT__OVERBURDEN__CK CHECK ((overburden >= 20.0 AND overburden <= 1000.0) OR overburden = -1.0),
    ,CONSTRAINT SADO_REPORT__OVERBURDN_SET__CK CHECK (overburden_set IN('N','Y')),
    ,CONSTRAINT SADO_REPORT__REPORT_ID__CK CHECK (report_id > 0),
    ,CONSTRAINT SADO_REPORT__SADO_RELEASED__CK CHECK (sado_released IN('N','Y','-')),
    ,CONSTRAINT SADO_REPORT__TTGE__CK CHECK (ttge IN('N','Y','-'))
);
COMMENT ON TABLE SADO_REPORT IS 'The SADO table contains data about the SADO report and the e vent for the report.';
COMMENT ON COLUMN SADO_REPORT.REPORT_ID IS 'Report Identifier';
COMMENT ON COLUMN SADO_REPORT.EVID IS 'Event Identifier';
COMMENT ON COLUMN SADO_REPORT.ORID IS 'Origin Identifier';
COMMENT ON COLUMN SADO_REPORT.GRN IS 'Geographic region number';
COMMENT ON COLUMN SADO_REPORT.EVENT_TIME IS 'Epoch time of an Event';
COMMENT ON COLUMN SADO_REPORT.TITLE IS 'Title of the report. Combination of the evid number and date and timestamp of the report';
COMMENT ON COLUMN SADO_REPORT.ANALYST IS 'The analyst that created the event of the report';
COMMENT ON COLUMN SADO_REPORT.ACCOUNT IS 'Pipeline account the report is being written from';
COMMENT ON COLUMN SADO_REPORT.DESCRIPTION IS 'SADO Report Descriptive text.';
COMMENT ON COLUMN SADO_REPORT.CLASSIFICATION IS 'The classification of the report material';
COMMENT ON COLUMN SADO_REPORT.TTGE IS 'Boolean indicating the Alert Manager sent an email for this report';
COMMENT ON COLUMN SADO_REPORT.SADO_RELEASED IS 'Boolean indicating the SADO report has been released to the AFTAC website';
COMMENT ON COLUMN SADO_REPORT.ALERT_MANAGER_CALLED IS 'Boolean indicating if the user called the alert manager';
COMMENT ON COLUMN SADO_REPORT.EXERCISE IS 'Boolean indicating if the report is an exercise report';
COMMENT ON COLUMN SADO_REPORT.EMAIL_TYPE IS 'Indicates the report type of type 0, 1, or 2';
COMMENT ON COLUMN SADO_REPORT.ALERT_MANAGER IS 'Indicates which alert manager was called if an alert manager was called';
COMMENT ON COLUMN SADO_REPORT.YIELD_CALCULATOR_REGION_SELECT IS 'Region selected for chemical and yield calculator.';
COMMENT ON COLUMN SADO_REPORT.FINAL_DETERMINATION IS 'SADO final determination of the event';
COMMENT ON COLUMN SADO_REPORT.MAG_MAGTYPE IS 'String variable of magnitude + magtype used for magtypes selection in SADO tool.';
COMMENT ON COLUMN SADO_REPORT.OVERBURDEN_SET IS 'Boolean value indicating if the user set the depth of burial manually.';
COMMENT ON COLUMN SADO_REPORT.OVERBURDEN IS 'Manually set Depth of Burial in meters.';
COMMENT ON COLUMN SADO_REPORT.COMMENTS IS 'Commentary section for the SADO to write any extra information they would like to include in report.';
COMMENT ON COLUMN SADO_REPORT.ECM_DETERMINATION IS 'ECM determination selected by the user';
COMMENT ON COLUMN SADO_REPORT.AUTHOR IS 'Author of the SADO Report.';
COMMENT ON COLUMN SADO_REPORT.MODDATE IS 'Modification date';
COMMENT ON COLUMN SADO_REPORT.LDDATE IS 'Load Date';

-- Table: SADO_REPORT_LANDMARKS
CREATE TABLE SADO_REPORT_LANDMARKS (
    REPORT_LANDMARKS_ID NUMBER(18),
    REPORT_ID NUMBER(18),
    LOCATION_ID NUMBER(18),
    TESTSITE VARCHAR2(1),
    NAME VARCHAR2(64),
    LAT FLOAT(24),
    LON FLOAT(24),
    DISTANCE FLOAT(24),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT SADO_REPORT_LANDMARKS_PK PRIMARY KEY (REPORT_LANDMARKS_ID),
    ,CONSTRAINT SADO_REP_LM__DISTANCE__CK CHECK (distance >= 0),
    ,CONSTRAINT SADO_REP_LM__LAT__CK CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT SADO_REP_LM__LOCATION_ID__CK CHECK (location_id > 0 OR location_id = -1),
    ,CONSTRAINT SADO_REP_LM__LON__CK CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT SADO_REP_LM__REPORT_ID__CK CHECK (report_id > 0),
    ,CONSTRAINT SADO_REP_LM__REPORT_LM_ID__CK CHECK (report_landmarks_id > 0),
    ,CONSTRAINT SADO_REP_LM__TESTSITE__CK CHECK (testsite IN('N','Y','-'))
);
COMMENT ON TABLE SADO_REPORT_LANDMARKS IS 'The SADO table contains landmarks and information about land marks related to the event';
COMMENT ON COLUMN SADO_REPORT_LANDMARKS.REPORT_LANDMARKS_ID IS 'Report Landmarks Identifier';
COMMENT ON COLUMN SADO_REPORT_LANDMARKS.REPORT_ID IS 'Report Identifier';
COMMENT ON COLUMN SADO_REPORT_LANDMARKS.LOCATION_ID IS 'Location Identifier';
COMMENT ON COLUMN SADO_REPORT_LANDMARKS.TESTSITE IS 'Boolean indicating if the landmark is a testsite from the testsite table';
COMMENT ON COLUMN SADO_REPORT_LANDMARKS.NAME IS 'Name for the landmark. If it is a testsite, it is the testsite name. If it is user added, it is the name provided by the user.';
COMMENT ON COLUMN SADO_REPORT_LANDMARKS.LAT IS 'Estimated latitude';
COMMENT ON COLUMN SADO_REPORT_LANDMARKS.LON IS 'Estimated longitude';
COMMENT ON COLUMN SADO_REPORT_LANDMARKS.DISTANCE IS 'Distance of landmark from event location in degrees.';
COMMENT ON COLUMN SADO_REPORT_LANDMARKS.AUTHOR IS 'Author of this SADO Report Landmark';
COMMENT ON COLUMN SADO_REPORT_LANDMARKS.MODDATE IS 'Modification date';
COMMENT ON COLUMN SADO_REPORT_LANDMARKS.LDDATE IS 'Load Date';

-- Table: SADO_SCREENSHOTS
CREATE TABLE SADO_SCREENSHOTS (
    SADO_SCREENSHOT_ID NUMBER(18),
    REPORT_ID NUMBER(18),
    SCREENSHOT ,
    TYPE VARCHAR2(10),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT SADO_SCREENSHOTS_PK PRIMARY KEY (SADO_SCREENSHOT_ID),
    ,CONSTRAINT SADO_SS__REPORT_ID__CK CHECK (report_id > 0),
    ,CONSTRAINT SADO_SS__SADO_SS_ID__CK CHECK (sado_screenshot_id > 0),
    ,CONSTRAINT SADO_SS__TYPE__CK CHECK (type IN ('png', 'PNG'))
);
COMMENT ON TABLE SADO_SCREENSHOTS IS 'The SADO table contains image files related to SADO reports';
COMMENT ON COLUMN SADO_SCREENSHOTS.SADO_SCREENSHOT_ID IS 'SADO Screenshot Identifier';
COMMENT ON COLUMN SADO_SCREENSHOTS.REPORT_ID IS 'Report Identifier';
COMMENT ON COLUMN SADO_SCREENSHOTS.SCREENSHOT IS 'Binary storage for an image file';
COMMENT ON COLUMN SADO_SCREENSHOTS.TYPE IS 'Screenshot image file types (Initial allowable types (jpg, jpeg, png))';
COMMENT ON COLUMN SADO_SCREENSHOTS.AUTHOR IS 'Author of this SADO Screenshot';
COMMENT ON COLUMN SADO_SCREENSHOTS.MODDATE IS 'Modification date';
COMMENT ON COLUMN SADO_SCREENSHOTS.LDDATE IS 'Load Date';

-- Table: SADO_STATE
CREATE TABLE SADO_STATE (
    SADO_STATE_ID NUMBER(18),
    REPORT_ID NUMBER(18),
    SADO_STATE_CATEGORY_ID NUMBER(18),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT SADO_STATE_PK PRIMARY KEY (SADO_STATE_ID),
    ,CONSTRAINT SADO_STATE__REPORT_ID__CK CHECK (report_id > 0),
    ,CONSTRAINT SADO_STATE__SADO_ST_CAT_ID__CK CHECK (sado_state_category_id > 0),
    ,CONSTRAINT SADO_STATE__SADO_ST_ID__CK CHECK (sado_state_id > 0)
);
COMMENT ON TABLE SADO_STATE IS 'The SADO table contains the current state of the reports. T he reports can be new, saved, submitted, or modified.';
COMMENT ON COLUMN SADO_STATE.SADO_STATE_ID IS 'SADO State Identifier';
COMMENT ON COLUMN SADO_STATE.REPORT_ID IS 'Report Identifier';
COMMENT ON COLUMN SADO_STATE.SADO_STATE_CATEGORY_ID IS 'SADO State Category Identifier';
COMMENT ON COLUMN SADO_STATE.AUTHOR IS 'Author of this SADO State';
COMMENT ON COLUMN SADO_STATE.MODDATE IS 'Modification date';
COMMENT ON COLUMN SADO_STATE.LDDATE IS 'Load Date';

-- Table: SADO_STATE_CATEGORIES
CREATE TABLE SADO_STATE_CATEGORIES (
    SADO_STATE_CATEGORY_ID NUMBER(18),
    TITLE VARCHAR2(64),
    DESCRIPTION ,
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT SADO_STATE_CATEGORIES_PK PRIMARY KEY (SADO_STATE_CATEGORY_ID),
    ,CONSTRAINT SADO_ST_CAT__SSC_ID__CK CHECK (sado_state_category_id > 0)
);
COMMENT ON TABLE SADO_STATE_CATEGORIES IS 'The SADO table contains descriptions of the various states a report can be in.';
COMMENT ON COLUMN SADO_STATE_CATEGORIES.SADO_STATE_CATEGORY_ID IS 'SADO State Category Identifier';
COMMENT ON COLUMN SADO_STATE_CATEGORIES.TITLE IS 'Short description/title of the sado report category';
COMMENT ON COLUMN SADO_STATE_CATEGORIES.DESCRIPTION IS 'Detailed description of the sado report category';
COMMENT ON COLUMN SADO_STATE_CATEGORIES.AUTHOR IS 'Author of this SADO State Category';
COMMENT ON COLUMN SADO_STATE_CATEGORIES.MODDATE IS 'Modification date';
COMMENT ON COLUMN SADO_STATE_CATEGORIES.LDDATE IS 'Load Date';

-- Table: SADO_USERS
CREATE TABLE SADO_USERS (
    SADO_USERS_ID NUMBER(18),
    SADO_NAME VARCHAR2(64),
    OFFICE_SYMBOL VARCHAR2(64),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT SADO_USERS_PK PRIMARY KEY (SADO_USERS_ID)
);
COMMENT ON TABLE SADO_USERS IS 'The SADO_USERS table contains the first and last name of the SADO to be used for and appear in SADO reports.';
COMMENT ON COLUMN SADO_USERS.SADO_USERS_ID IS 'SADO Users Identifier';
COMMENT ON COLUMN SADO_USERS.SADO_NAME IS 'First and last name of the SADO.';
COMMENT ON COLUMN SADO_USERS.AUTHOR IS 'SADO OS User.';
COMMENT ON COLUMN SADO_USERS.MODDATE IS 'Modification date';
COMMENT ON COLUMN SADO_USERS.LDDATE IS 'Load Date';

-- Table: SENSOR
CREATE TABLE SENSOR (
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    INID NUMBER(18),
    CHANID NUMBER(18),
    JDATE NUMBER(8),
    CALRATIO FLOAT(24),
    CALPER FLOAT(24),
    TSHIFT FLOAT(24),
    INSTANT VARCHAR2(1),
    LDDATE DATE,
    ,CONSTRAINT SENSOR_PK PRIMARY KEY (STA),
    ,CONSTRAINT SENSOR__CALPER__CK CHECK (calper > 0.0),
    ,CONSTRAINT SENSOR__CALRATIO__CK CHECK (calratio > 0.0),
    ,CONSTRAINT SENSOR__CHANID__CK CHECK (chanid > 0 OR chanid = -1),
    ,CONSTRAINT SENSOR__ENDTIME__CK CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT SENSOR__INID__CK CHECK (inid > 0 OR inid = -1),
    ,CONSTRAINT SENSOR__INSTANT__CK CHECK (instant IN ('y','n')),
    ,CONSTRAINT SENSOR__JDATE__CK CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT SENSOR__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT SENSOR__TIME__CK CHECK (time >= -9999999999.999),
    ,CONSTRAINT SENSOR__TSHIFT__CK CHECK (tshift > -9999999999.999)
);
COMMENT ON TABLE SENSOR IS 'The sensor table contains calibration information for specif ic sensor channels. This table provides a record of updates in the calibration factor or clock error of each instrument and links a sta/chan/time to a complete instrument response in the instrument table. Waveform data are converted into ph ysical units through multiplication by the calib type locate d in wfdisc. The correct value of calib may not be accuratel y known when the wfdisc record is entered into the database. The sensor table provides the mechanism (calratio and calpe r) to update calib, without requiring possibly hundreds of w fdisc records to be updated. Through the foreign key inid, t his table is linked to instrument, which has types pointing to flat files holding detailed calibration information in a variety of formats (see instrument).';
COMMENT ON COLUMN SENSOR.STA IS 'Station code';
COMMENT ON COLUMN SENSOR.CHAN IS 'Channel code';
COMMENT ON COLUMN SENSOR.TIME IS 'Epoch time of start of recording period';
COMMENT ON COLUMN SENSOR.ENDTIME IS 'Epoch time of end of recording period';
COMMENT ON COLUMN SENSOR.INID IS 'Instrument identifier';
COMMENT ON COLUMN SENSOR.CHANID IS 'Channel identifier';
COMMENT ON COLUMN SENSOR.JDATE IS 'Julian date';
COMMENT ON COLUMN SENSOR.CALRATIO IS 'Calibration';
COMMENT ON COLUMN SENSOR.CALPER IS 'Calibration period';
COMMENT ON COLUMN SENSOR.TSHIFT IS 'Correction of data processing time';
COMMENT ON COLUMN SENSOR.INSTANT IS 'Discrete/continuing (y, n) snapshot';
COMMENT ON COLUMN SENSOR.LDDATE IS 'Load date';

-- Table: SITE
CREATE TABLE SITE (
    STA VARCHAR2(6),
    ONDATE NUMBER(8),
    OFFDATE NUMBER(8),
    LAT FLOAT(53),
    LON FLOAT(53),
    ELEV FLOAT(24),
    STANAME VARCHAR2(50),
    STATYPE VARCHAR2(4),
    REFSTA VARCHAR2(6),
    DNORTH FLOAT(24),
    DEAST FLOAT(24),
    LDDATE DATE,
    ,CONSTRAINT SITE_PK PRIMARY KEY (STA),
    ,CONSTRAINT SITE__DEAST__CK CHECK (deast >= -20000.0 AND deast <= 20000.0),
    ,CONSTRAINT SITE__DNORTH__CK CHECK (dnorth >= -20000.0 AND dnorth <= 20000.0),
    ,CONSTRAINT SITE__ELEV__CK CHECK ((elev >= -10.0 AND elev <= 10.0) OR (elev = -999.0)),
    ,CONSTRAINT SITE__LON__CK CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT SITE__OFFDATE__CK CHECK ((offdate > 1901348 AND offdate < 3001000) OR offdate = -1),
    ,CONSTRAINT SITE__ONDATE__CK CHECK (ondate > 1800001 AND ondate < 3001000),
    ,CONSTRAINT SITE__SITE_LAT__CK CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT SITE__STATYPE__CK CHECK (statype IN ('ss', 'ar', '-')),
    ,CONSTRAINT SITE__STA__CK CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE SITE IS 'The site table contains station location information. It nam es and describes a point on the earth where measurements are made (e.g., the location of an instrument or array of instr uments). This table contains information that normally chang es infrequently, such as location. In addition, the site tab le contains types that describe the offset of a station rela tive to an array reference location. Global data integrity i mplies that the sta/ondate in site be consistent with the st a/chan/ondate in the sitechan table.';
COMMENT ON COLUMN SITE.STA IS 'Station identifier';
COMMENT ON COLUMN SITE.ONDATE IS 'Julian start date';
COMMENT ON COLUMN SITE.OFFDATE IS 'Julian off date';
COMMENT ON COLUMN SITE.LAT IS 'Latitude';
COMMENT ON COLUMN SITE.LON IS 'Longitude';
COMMENT ON COLUMN SITE.ELEV IS 'Elevation';
COMMENT ON COLUMN SITE.STANAME IS 'Station description';
COMMENT ON COLUMN SITE.STATYPE IS 'Station type (single station, array)';
COMMENT ON COLUMN SITE.REFSTA IS 'Reference station for array members';
COMMENT ON COLUMN SITE.DNORTH IS 'Offset from array reference (km)';
COMMENT ON COLUMN SITE.DEAST IS 'Offset from array reference (km)';
COMMENT ON COLUMN SITE.LDDATE IS 'Load date';

-- Table: SITEAUX
CREATE TABLE SITEAUX (
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    TIME FLOAT(53),
    NOIS FLOAT(24),
    NOISSD FLOAT(24),
    AMCOR FLOAT(24),
    AMCORSD FLOAT(24),
    SNTHRSH FLOAT(24),
    RELY FLOAT(24),
    PTMCOR FLOAT(24),
    STMCOR FLOAT(24),
    STAPER FLOAT(24),
    DELK FLOAT(24),
    DELS FLOAT(24),
    AUTH VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT SITEAUX_PK PRIMARY KEY (CHAN),
    ,CONSTRAINT SITEAUX__AMCORSD__CK CHECK (amcorsd > 0.0 OR amcorsd = -1.0),
    ,CONSTRAINT SITEAUX__AMCOR__CK CHECK (amcor > -999.0 OR amcor = -999.0),
    ,CONSTRAINT SITEAUX__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT SITEAUX__DELK__CK CHECK (delk > 0.0 or delk = -1.0),
    ,CONSTRAINT SITEAUX__DELS__CK CHECK (dels > 0.0 or dels = -1.0),
    ,CONSTRAINT SITEAUX__NOISSD__CK CHECK (noissd > 0.0 OR noissd = -1.0),
    ,CONSTRAINT SITEAUX__NOIS__CK CHECK (nois >= 0.0 OR nois = -1.0),
    ,CONSTRAINT SITEAUX__PTMCOR__CK CHECK (ptmcor > -999.0 OR ptmcor = -999.0),
    ,CONSTRAINT SITEAUX__RELY__CK CHECK ((rely >= 0.0 AND rely <= 1.0) OR rely = -1.0),
    ,CONSTRAINT SITEAUX__SNTHRSH__CK CHECK (snthrsh > 1.0 OR snthrsh = -1.0),
    ,CONSTRAINT SITEAUX__STAPER__CK CHECK (staper > 0.0 OR staper = -1.0),
    ,CONSTRAINT SITEAUX__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT SITEAUX__STMCOR__CK CHECK (stmcor > -999.0 OR stmcor = -999.0),
    ,CONSTRAINT SITEAUX__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE SITEAUX IS 'The siteaux table contains additional site-dependent paramet ers that are not included in the site table.';
COMMENT ON COLUMN SITEAUX.STA IS 'Station code';
COMMENT ON COLUMN SITEAUX.CHAN IS 'Channel code';
COMMENT ON COLUMN SITEAUX.TIME IS 'Epoch time';
COMMENT ON COLUMN SITEAUX.NOIS IS 'Noise amplitude';
COMMENT ON COLUMN SITEAUX.NOISSD IS 'Standard deviation of log noise';
COMMENT ON COLUMN SITEAUX.AMCOR IS 'Amplitude correction';
COMMENT ON COLUMN SITEAUX.AMCORSD IS 'Correction standard deviation';
COMMENT ON COLUMN SITEAUX.SNTHRSH IS 'Signal/noise detection threshold';
COMMENT ON COLUMN SITEAUX.RELY IS 'Station reliability';
COMMENT ON COLUMN SITEAUX.PTMCOR IS 'P arrival time correction';
COMMENT ON COLUMN SITEAUX.STMCOR IS 'S arrival time correction';
COMMENT ON COLUMN SITEAUX.STAPER IS 'Period for measurements';
COMMENT ON COLUMN SITEAUX.DELK IS 'Estimate of slowness model uncertainty';
COMMENT ON COLUMN SITEAUX.DELS IS 'Estimate of slowness measurement uncertainty';
COMMENT ON COLUMN SITEAUX.AUTH IS 'Author';
COMMENT ON COLUMN SITEAUX.COMMID IS 'Comment identifier';
COMMENT ON COLUMN SITEAUX.LDDATE IS 'Load date';

-- Table: SITECHAN
CREATE TABLE SITECHAN (
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    ONDATE NUMBER(8),
    CHANID NUMBER(18),
    OFFDATE NUMBER(8),
    CTYPE VARCHAR2(4),
    EDEPTH FLOAT(24),
    HANG FLOAT(24),
    VANG FLOAT(24),
    DESCRIP VARCHAR2(50),
    LDDATE DATE,
    ,CONSTRAINT SITECHAN_PK PRIMARY KEY (CHAN),
    ,CONSTRAINT SITECHAN__CHANID__CK CHECK (chanid > 0 OR chanid = -1),
    ,CONSTRAINT SITECHAN__CTYPE__CK CHECK (ctype IN ('n', 'b', 'i', '-')),
    ,CONSTRAINT SITECHAN__EDEPTH__CK CHECK (edepth >= -10.0),
    ,CONSTRAINT SITECHAN__HANG__CK CHECK ((hang >= 0.0 AND hang <= 360.0) OR hang = -1.0),
    ,CONSTRAINT SITECHAN__OFFDATE__CK CHECK ((offdate > 1901348 AND offdate < 3001000) OR offdate = -1),
    ,CONSTRAINT SITECHAN__ONDATE__CK CHECK (ondate > 1901348 AND ondate < 3001000),
    ,CONSTRAINT SITECHAN__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT SITECHAN__VANG__CK CHECK ((vang >= 0.0 AND vang <= 90.0) OR vang = -1.0)
);
COMMENT ON TABLE SITECHAN IS 'The sitechan table contains station-channel information. It describes the orientation of a recording channel at the site referenced by sta. The table provides information about the various channels that are available at a station and mainta ins a record of the physical channel configuration at a site .';
COMMENT ON COLUMN SITECHAN.STA IS 'Station identifier';
COMMENT ON COLUMN SITECHAN.CHAN IS 'Channel code';
COMMENT ON COLUMN SITECHAN.ONDATE IS 'Julian start date';
COMMENT ON COLUMN SITECHAN.CHANID IS 'Channel identifier';
COMMENT ON COLUMN SITECHAN.OFFDATE IS 'Julian off date';
COMMENT ON COLUMN SITECHAN.CTYPE IS 'Channel type';
COMMENT ON COLUMN SITECHAN.EDEPTH IS 'Emplacement depth';
COMMENT ON COLUMN SITECHAN.HANG IS 'Horizontal angle';
COMMENT ON COLUMN SITECHAN.VANG IS 'Vertical angle';
COMMENT ON COLUMN SITECHAN.DESCRIP IS 'Channel description';
COMMENT ON COLUMN SITECHAN.LDDATE IS 'Load date';

-- Table: SNR_PHASE
CREATE TABLE SNR_PHASE (
    POLYID NUMBER(18),
    AMPCOR_VERID NUMBER(18),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    PHASE VARCHAR2(8),
    MIN_NUM_ELEM NUMBER(3),
    SNR_THRESH FLOAT(53),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT SNR_PHASE_PK PRIMARY KEY (POLYID),
    ,CONSTRAINT SNR_PHASE__AMPCOR_VERID__CK CHECK (ampcor_verid >0),
    ,CONSTRAINT SNR_PHASE__MIN_NUM_ELEM__CK CHECK (min_num_elem >0),
    ,CONSTRAINT SNR_PHASE__POLYID__CK CHECK (polyid >0),
    ,CONSTRAINT SNR_PHASE__SNR_THRESH__CK CHECK (snr_thresh >= 1 or snr_thresh = -1)
);
COMMENT ON TABLE SNR_PHASE IS 'The snr_phase table contains the minimum number of stations and signal-to-noise ratio needed to measure each phase in ea ch region for each station and channel. These parameters ar e used for discriminants which are ratios of two phases.';
COMMENT ON COLUMN SNR_PHASE.POLYID IS 'Polygon Identifier';
COMMENT ON COLUMN SNR_PHASE.AMPCOR_VERID IS 'amplitude correction version identifier';
COMMENT ON COLUMN SNR_PHASE.STA IS 'Station name';
COMMENT ON COLUMN SNR_PHASE.CHAN IS 'Channel name';
COMMENT ON COLUMN SNR_PHASE.PHASE IS 'phase of interest';
COMMENT ON COLUMN SNR_PHASE.MIN_NUM_ELEM IS 'Minimum number of elements needed';
COMMENT ON COLUMN SNR_PHASE.SNR_THRESH IS 'Minimum signal-to-noise ratio needed';
COMMENT ON COLUMN SNR_PHASE.AUTH IS 'Author';
COMMENT ON COLUMN SNR_PHASE.LDDATE IS 'Load date';

-- Table: SREGION
CREATE TABLE SREGION (
    SRN NUMBER(8),
    SRNAME VARCHAR2(40),
    LDDATE DATE,
    ,CONSTRAINT SREGION_PK PRIMARY KEY (SRN),
    ,CONSTRAINT SREGION__SRNAME__CK CHECK (srname = UPPER(srname)),
    ,CONSTRAINT SREGION__SRN__CK CHECK ((srn >= 1 AND srn <= 50) OR srn = -1)
);
COMMENT ON TABLE SREGION IS 'The sregion table contains seismic region numbers and their equivalent descriptions.';
COMMENT ON COLUMN SREGION.SRN IS 'Seismic region number';
COMMENT ON COLUMN SREGION.SRNAME IS 'Seismic region name';
COMMENT ON COLUMN SREGION.LDDATE IS 'Load date';

-- Table: STA_CODA_SPECTRUM
CREATE TABLE STA_CODA_SPECTRUM (
    AMPID NUMBER(18),
    FREQ FLOAT(24),
    AMPCOR FLOAT(24),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT STA_CODA_SPECTRUM_PK PRIMARY KEY (AMPID),
    ,CONSTRAINT STA_CODA_SPECTRUM__AMPCOR__CK CHECK (( ampcor > -9.99 AND ampcor < 50.0 ) OR ampcor = -999.0),
    ,CONSTRAINT STA_CODA_SPECTRUM__AMPID__CK CHECK (ampid > 0),
    ,CONSTRAINT STA_CODA_SPECTRUM__FREQ__CK CHECK (freq > 0.0 OR freq = -1.0)
);
COMMENT ON TABLE STA_CODA_SPECTRUM IS 'The sta_coda_spectrum table contains the theoretical source spectrum for an event, used to obtain the station moment mag nitude values. The theoretical spectrum is fit to the observ ed spectrum in all frequency bands for a station that are se t to defining in the envelope_contribution table.';
COMMENT ON COLUMN STA_CODA_SPECTRUM.AMPID IS 'Amplitude identifier';
COMMENT ON COLUMN STA_CODA_SPECTRUM.FREQ IS 'Frequency';
COMMENT ON COLUMN STA_CODA_SPECTRUM.AMPCOR IS 'Amplitude value corrected for path and site';
COMMENT ON COLUMN STA_CODA_SPECTRUM.AUTH IS 'Author';
COMMENT ON COLUMN STA_CODA_SPECTRUM.LDDATE IS 'Load date';

-- Table: STAMAG
CREATE TABLE STAMAG (
    MAGID NUMBER(18),
    AMPID NUMBER(18),
    STA VARCHAR2(6),
    ARID NUMBER(18),
    ORID NUMBER(18),
    EVID NUMBER(18),
    PHASE VARCHAR2(8),
    DELTA FLOAT(24),
    MAGTYPE VARCHAR2(6),
    MAGNITUDE FLOAT(24),
    UNCERTAINTY FLOAT(24),
    MAGRES FLOAT(24),
    MAGDEF VARCHAR2(1),
    MMODEL VARCHAR2(15),
    AUTH VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT STAMAG_PK PRIMARY KEY (AMPID),
    ,CONSTRAINT STAMAG__AMPID__CK CHECK (ampid > 0 OR ampid = -1),
    ,CONSTRAINT STAMAG__ARID__CK CHECK (arid > 0 OR arid = -1),
    ,CONSTRAINT STAMAG__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT STAMAG__DELTA__CK CHECK (delta >= 0.0 OR delta = -1.0),
    ,CONSTRAINT STAMAG__EVID__CK CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT STAMAG__MAGDEF__CK CHECK (magdef IN ('d','D', 'n','N', 'X', 'x', '-')),
    ,CONSTRAINT STAMAG__MAGID__CK CHECK (magid > 0),
    ,CONSTRAINT STAMAG__MAGNITUDE__CK CHECK ((magnitude > -9.99 AND magnitude < 50.0) OR magnitude = -999.0),
    ,CONSTRAINT STAMAG__MAGRES__CK CHECK ((magres > -50.0 AND magres < 50.0) OR magres = -999.0),
    ,CONSTRAINT STAMAG__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT STAMAG__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT STAMAG__UNCERTAINTY__CK CHECK (uncertainty > 0.0 OR uncertainty = -1.0)
);
COMMENT ON TABLE STAMAG IS 'The stamag table contains station magnitude estimates based upon measurements made on specific seismic phases. Values in the stamag table are used to calculate network magnitudes s tored in the netmag table.';
COMMENT ON COLUMN STAMAG.MAGID IS 'Magnitude identifier';
COMMENT ON COLUMN STAMAG.AMPID IS 'Amplitude identifier';
COMMENT ON COLUMN STAMAG.STA IS 'Station code';
COMMENT ON COLUMN STAMAG.ARID IS 'Arrival identifier';
COMMENT ON COLUMN STAMAG.ORID IS 'Origin identifier';
COMMENT ON COLUMN STAMAG.EVID IS 'Event identifier';
COMMENT ON COLUMN STAMAG.PHASE IS 'Associated phase';
COMMENT ON COLUMN STAMAG.DELTA IS 'Station-to-event distance';
COMMENT ON COLUMN STAMAG.MAGTYPE IS 'Magnitude type (ml, ms, mb, etc.)';
COMMENT ON COLUMN STAMAG.MAGNITUDE IS 'Magnitude';
COMMENT ON COLUMN STAMAG.UNCERTAINTY IS 'Magnitude uncertainty';
COMMENT ON COLUMN STAMAG.MAGRES IS 'Magnitude residual';
COMMENT ON COLUMN STAMAG.MAGDEF IS 'flag indicating if magnitude is defining (d,D) or nondefining (n,N,x,X)';
COMMENT ON COLUMN STAMAG.MMODEL IS 'Magnitude model';
COMMENT ON COLUMN STAMAG.AUTH IS 'Author';
COMMENT ON COLUMN STAMAG.COMMID IS 'Comment identifier';
COMMENT ON COLUMN STAMAG.LDDATE IS 'Load date';

-- Table: STANET
CREATE TABLE STANET (
    NET VARCHAR2(8),
    STA VARCHAR2(6),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT STANET_PK PRIMARY KEY (NET),
    ,CONSTRAINT STANET__STA__CK CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE STANET IS 'The stanet table is used for Distributed Processing. It cont ains station to array mapping.';
COMMENT ON COLUMN STANET.NET IS 'Unique network identifier';
COMMENT ON COLUMN STANET.STA IS 'Station identifier';
COMMENT ON COLUMN STANET.TIME IS 'Starting time for station in network';
COMMENT ON COLUMN STANET.ENDTIME IS 'endtime for station in network';
COMMENT ON COLUMN STANET.LDDATE IS 'Load date';

-- Table: STAQUAL_DNAMES
CREATE TABLE STAQUAL_DNAMES (
    ID NUMBER(18),
    STA VARCHAR2(6),
    DNAME VARCHAR2(8),
    ON_TIME FLOAT(53),
    OFF_TIME FLOAT(53),
    AUTHOR VARCHAR2(64),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT STAQUAL_DNAMES_PK PRIMARY KEY (ID)
);
COMMENT ON TABLE STAQUAL_DNAMES IS 'The staqual_dnames table contains reference data of the Stat ion and the associated detection beam for use with staqual_d aily_summary table to determine which dname is used for a pa rticular station quality measurement.';
COMMENT ON COLUMN STAQUAL_DNAMES.ID IS 'Station Quality Dname Unique identifier';
COMMENT ON COLUMN STAQUAL_DNAMES.STA IS 'Station name';
COMMENT ON COLUMN STAQUAL_DNAMES.DNAME IS 'Detection beam or channel name';
COMMENT ON COLUMN STAQUAL_DNAMES.ON_TIME IS 'Epoch time when a station was turned on';
COMMENT ON COLUMN STAQUAL_DNAMES.OFF_TIME IS 'Epoch time when a station was or will be turned off';
COMMENT ON COLUMN STAQUAL_DNAMES.AUTHOR IS 'Author';
COMMENT ON COLUMN STAQUAL_DNAMES.MODDATE IS 'Modification date';
COMMENT ON COLUMN STAQUAL_DNAMES.LDDATE IS 'Load date';

-- Table: STATION_PROCESSING
CREATE TABLE STATION_PROCESSING (
    CLUSTAID NUMBER(18),
    ACTIVETIME FLOAT(53),
    PROCID NUMBER(18),
    PROCTYPE VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT STATION_PROCESSING_PK PRIMARY KEY (CLUSTAID),
    ,CONSTRAINT STATION_PROCESSING__CA__CK CHECK (clustaid > 0)
);
COMMENT ON TABLE STATION_PROCESSING IS 'The station_processing table provides a link between the sta tion and the cluster and the processing recipe for that proc essing type.';
COMMENT ON COLUMN STATION_PROCESSING.CLUSTAID IS 'ID number of a cluster and refsta combination';
COMMENT ON COLUMN STATION_PROCESSING.ACTIVETIME IS 'The epochtime a cluster was activated';
COMMENT ON COLUMN STATION_PROCESSING.PROCID IS 'procid of the processing recipe';
COMMENT ON COLUMN STATION_PROCESSING.PROCTYPE IS 'The type of processing (ex: SVD, AMP, Corr)';
COMMENT ON COLUMN STATION_PROCESSING.LDDATE IS 'Load date';

-- Table: STATION_QUALITY
CREATE TABLE STATION_QUALITY (
    SQID NUMBER(18),
    STA VARCHAR2(6),
    DNAME VARCHAR2(8),
    TIME FLOAT(53),
    ENDTIME FLOAT(53),
    JDATE NUMBER(8),
    AVGCHANS FLOAT(24),
    EXPECTED FLOAT(53),
    RETRIEVED FLOAT(53),
    MASKED FLOAT(53),
    MASKS NUMBER(8),
    NDET_THRES FLOAT(24),
    AZIMUTH FLOAT(24),
    SLOW FLOAT(24),
    NOISE FLOAT(24),
    NOISEDEV FLOAT(24),
    NOISETYPE VARCHAR2(10),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT STATION_QUALITY_PK PRIMARY KEY (SQID),
    ,CONSTRAINT STATION_QUAL__AVGCHANS__CK CHECK (avgchans >= 0.0 OR avgchans = -1.0),
    ,CONSTRAINT STATION_QUAL__AZIMUTH__CK CHECK ((azimuth >= 0.0 AND azimuth <= 360.0) OR azimuth = -1.0),
    ,CONSTRAINT STATION_QUAL__ENDTIME__CK CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT STATION_QUAL__EXPECTED__CK CHECK (expected > 0.0),
    ,CONSTRAINT STATION_QUAL__JDATE__CK CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT STATION_QUAL__MASKED__CK CHECK (masked >= 0.0 OR masked = -999.0),
    ,CONSTRAINT STATION_QUAL__MASKS__CK CHECK (masks >= 0 OR masks = -1),
    ,CONSTRAINT STATION_QUAL__NDET_THRES__CK CHECK (ndet_thres >= 0.0 AND ndet_thres < 1000),
    ,CONSTRAINT STATION_QUAL__NOISEDEV__CK CHECK (noisedev > -999.0 OR noisedev = -999.0),
    ,CONSTRAINT STATION_QUAL__NOISE__CK CHECK (noise > -999.0 OR noise = -999.0),
    ,CONSTRAINT STATION_QUAL__RETRIEVED__CK CHECK (retrieved >= 0.0),
    ,CONSTRAINT STATION_QUAL__SLOW__CK CHECK (slow >= 0.0 OR slow = -1.0),
    ,CONSTRAINT STATION_QUAL__SQID__CK CHECK (sqid > 0),
    ,CONSTRAINT STATION_QUAL__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT STATION_QUAL__TIME__CK CHECK (time > -9999999999.999)
);
COMMENT ON TABLE STATION_QUALITY IS 'The station_quality table holds station quality attributes c alculated and stored by DFX.';
COMMENT ON COLUMN STATION_QUALITY.SQID IS 'Station quality identifier';
COMMENT ON COLUMN STATION_QUALITY.STA IS 'Station name';
COMMENT ON COLUMN STATION_QUALITY.DNAME IS 'Detection beam or channel name';
COMMENT ON COLUMN STATION_QUALITY.TIME IS 'Epoch start time of segment';
COMMENT ON COLUMN STATION_QUALITY.ENDTIME IS 'Epoch end time of segment';
COMMENT ON COLUMN STATION_QUALITY.JDATE IS 'Julian date of start time';
COMMENT ON COLUMN STATION_QUALITY.AVGCHANS IS 'Average number of active channels';
COMMENT ON COLUMN STATION_QUALITY.EXPECTED IS 'Expected number of seconds of data for segment';
COMMENT ON COLUMN STATION_QUALITY.RETRIEVED IS 'Actual number of seconds of data for a segment';
COMMENT ON COLUMN STATION_QUALITY.MASKED IS 'Number of seconds masked in segment';
COMMENT ON COLUMN STATION_QUALITY.MASKS IS 'Number of masks in segment';
COMMENT ON COLUMN STATION_QUALITY.NDET_THRES IS 'Normalized detection threshold';
COMMENT ON COLUMN STATION_QUALITY.AZIMUTH IS 'Beam azimuth';
COMMENT ON COLUMN STATION_QUALITY.SLOW IS 'Beam slowness';
COMMENT ON COLUMN STATION_QUALITY.NOISE IS 'Noise level for segment';
COMMENT ON COLUMN STATION_QUALITY.NOISEDEV IS 'Estimate of variability in noise level for the segment';
COMMENT ON COLUMN STATION_QUALITY.NOISETYPE IS 'mean-sd; noise=power beam mean; noisedev=standard deviation; med-mad; noise=power beam median; noisedev=median absolute deviation';
COMMENT ON COLUMN STATION_QUALITY.AUTH IS 'Author';
COMMENT ON COLUMN STATION_QUALITY.LDDATE IS 'Load date';

-- Table: STAYIELD
CREATE TABLE STAYIELD (
    YIELDID NUMBER(18),
    AMPID NUMBER(18),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    ORID NUMBER(18),
    ARID NUMBER(18),
    YIELD FLOAT(24),
    FFACTOR FLOAT(24),
    WMODEL_NAME VARCHAR2(50),
    AUTH VARCHAR2(15),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT STAYIELD_PK PRIMARY KEY (AMPID),
    ,CONSTRAINT STAYIELD__AMPID__CK CHECK (ampid > 0),
    ,CONSTRAINT STAYIELD__ARID__CK CHECK (arid > 0),
    ,CONSTRAINT STAYIELD__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT STAYIELD__FFACTOR__CK CHECK (ffactor > 0.0 OR ffactor = -999.0),
    ,CONSTRAINT STAYIELD__ORID__CK CHECK (orid > 0),
    ,CONSTRAINT STAYIELD__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT STAYIELD__YIELDID__CK CHECK (yieldid > 0),
    ,CONSTRAINT STAYIELD__YIELD__CK CHECK (yield >= 0.0 OR yield = -1.0)
);
COMMENT ON TABLE STAYIELD IS 'The stayield table contains yield values calculated from cod a amplitudes obtained for a single station.';
COMMENT ON COLUMN STAYIELD.YIELDID IS 'Yield identifier';
COMMENT ON COLUMN STAYIELD.AMPID IS 'Amplitude identifier';
COMMENT ON COLUMN STAYIELD.STA IS 'Station identifier';
COMMENT ON COLUMN STAYIELD.CHAN IS 'Channel code';
COMMENT ON COLUMN STAYIELD.ORID IS 'Origin identifier';
COMMENT ON COLUMN STAYIELD.ARID IS 'Arrival identifier';
COMMENT ON COLUMN STAYIELD.YIELD IS 'Yield';
COMMENT ON COLUMN STAYIELD.FFACTOR IS 'Yield F factor (log 10)';
COMMENT ON COLUMN STAYIELD.WMODEL_NAME IS 'Yield model name';
COMMENT ON COLUMN STAYIELD.AUTH IS 'Author';
COMMENT ON COLUMN STAYIELD.COMMID IS 'Comment identifier';
COMMENT ON COLUMN STAYIELD.LDDATE IS 'Load date';

-- Table: SVDDISC
CREATE TABLE SVDDISC (
    LSVID NUMBER(18),
    CLUSTAID NUMBER(18),
    ACTIVETIME FLOAT(53),
    STA VARCHAR2(6),
    NSAMP NUMBER(8),
    SAMPRATE FLOAT(24),
    SINGULAR_VALUE FLOAT(24),
    UNITS VARCHAR2(1),
    DIR VARCHAR2(64),
    DFILE VARCHAR2(32),
    FOFF NUMBER(10),
    COMMID NUMBER(18),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT SVDDISC_PK PRIMARY KEY (LSVID),
    ,CONSTRAINT SVDDISC_LSVID_NN CHECK ("LSVID" IS NOT NULL),
    ,CONSTRAINT SVDDISC__CA__CK CHECK (clustaid > 0),
    ,CONSTRAINT SVDDISC__LSVID__CK CHECK (lsvid > 0)
);
COMMENT ON TABLE SVDDISC IS 'The svddisc table contains a left singular vector (LSV) head er file and descriptive information. This table provides a p ointer (or index) to singular value decompositions stored on disk. The LSVs are stored in ordinary disk files called svd disc or ''.lsv'' files as a sequence of binary four byte float values.';
COMMENT ON COLUMN SVDDISC.LSVID IS 'Left Singular Vector identifier';
COMMENT ON COLUMN SVDDISC.CLUSTAID IS 'Detector identifier';
COMMENT ON COLUMN SVDDISC.ACTIVETIME IS 'The epochtime a cluster was activated';
COMMENT ON COLUMN SVDDISC.STA IS 'Station code (Ref Sta)';
COMMENT ON COLUMN SVDDISC.NSAMP IS 'Number of samples';
COMMENT ON COLUMN SVDDISC.SAMPRATE IS 'Sampling rate in samples/sec';
COMMENT ON COLUMN SVDDISC.SINGULAR_VALUE IS 'Singular value';
COMMENT ON COLUMN SVDDISC.UNITS IS 'Units of waveform used to create LSV';
COMMENT ON COLUMN SVDDISC.DIR IS 'Directory';
COMMENT ON COLUMN SVDDISC.DFILE IS 'Data file';
COMMENT ON COLUMN SVDDISC.FOFF IS 'Byte offset of data segment within file';
COMMENT ON COLUMN SVDDISC.COMMID IS 'Comment identifier';
COMMENT ON COLUMN SVDDISC.AUTH IS 'Author';
COMMENT ON COLUMN SVDDISC.LDDATE IS 'Load date';

-- Table: SVDDISC_CHAN_ORDER
CREATE TABLE SVDDISC_CHAN_ORDER (
    CLUSTAID NUMBER(18),
    STA VARCHAR2(6),
    CHAN VARCHAR2(6),
    ACTIVETIME FLOAT(53),
    SORT_ORDER NUMBER(6),
    ,CONSTRAINT SVDDISC_CHAN_ORDER_PK PRIMARY KEY (CHAN),
    ,CONSTRAINT SVDDISC_CHAN_ORDER_CHAN_NN CHECK ("CHAN" IS NOT NULL),
    ,CONSTRAINT SVDDISC_CHAN_ORDER_CLUSTAID_NN CHECK ("CLUSTAID" IS NOT NULL),
    ,CONSTRAINT SVDDISC_CHAN_ORDER_STA_NN CHECK ("STA" IS NOT NULL),
    ,CONSTRAINT SVDDISC_CHAN_ORDER__CA__CK CHECK (clustaid > 0),
    ,CONSTRAINT SVDDISC_CHAN_ORDER__STA__CK CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE SVDDISC_CHAN_ORDER IS 'The svddisc_chan_order table contains the order in which the sta and chans were combined together to form the input sent to the SVD. This is the order in which the sta and chans ar e passed to the SVD must be the same as the order of the sta and chans of the observed data passed to the SVD.';
COMMENT ON COLUMN SVDDISC_CHAN_ORDER.CLUSTAID IS 'ID of the Cluster and Station';
COMMENT ON COLUMN SVDDISC_CHAN_ORDER.STA IS 'Station code';
COMMENT ON COLUMN SVDDISC_CHAN_ORDER.CHAN IS 'Channel code';
COMMENT ON COLUMN SVDDISC_CHAN_ORDER.ACTIVETIME IS 'The epochtime a cluster was activated';
COMMENT ON COLUMN SVDDISC_CHAN_ORDER.SORT_ORDER IS 'Sort order';

-- Table: TAPER
CREATE TABLE TAPER (
    TAPERID NUMBER(18),
    TAPER_TYPE VARCHAR2(16),
    TAPER_PERCT FLOAT(24),
    TAPER_MAXPTS NUMBER(8),
    TAPER_MINPTS NUMBER(8),
    AUTH VARCHAR2(15),
    LDDATE DATE,
    ,CONSTRAINT TAPER_PK PRIMARY KEY (TAPERID),
    ,CONSTRAINT TAPER__TAPERID__CK CHECK (taperid > 0),
    ,CONSTRAINT TAPER__TAPER_MAXPTS__CK CHECK (taper_maxpts >= 0 OR taper_maxpts = -1),
    ,CONSTRAINT TAPER__TAPER_MINPTS__CK CHECK (taper_minpts >= 0 OR taper_minpts = -1),
    ,CONSTRAINT TAPER__TAPER_PERCT__CK CHECK (( taper_perct >= 0 AND taper_perct <= 1 ) OR taper_perct = -1),
    ,CONSTRAINT TAPER__TAPER_TYPE__CK CHECK (taper_type in('welch','blackman','hamming','cosine','hanning','parzen'))
);
COMMENT ON TABLE TAPER IS 'The taper table contains processing parameter.';
COMMENT ON COLUMN TAPER.TAPERID IS 'ID number of a taper processing parameter';
COMMENT ON COLUMN TAPER.TAPER_TYPE IS 'Type of tapering to be applied during filtering';
COMMENT ON COLUMN TAPER.TAPER_PERCT IS 'Percent of points to be tapered';
COMMENT ON COLUMN TAPER.TAPER_MAXPTS IS 'Max allowed taper points';
COMMENT ON COLUMN TAPER.TAPER_MINPTS IS 'Min allowed taper points';
COMMENT ON COLUMN TAPER.AUTH IS 'Author';
COMMENT ON COLUMN TAPER.LDDATE IS 'Load date';

-- Table: TIMESTAMP
CREATE TABLE TIMESTAMP (
    PROCCLASS VARCHAR2(16),
    PROCNAME VARCHAR2(16),
    TIME FLOAT(53),
    LDDATE DATE,
    ,CONSTRAINT TIMESTAMP_PK PRIMARY KEY (PROCCLASS),
    ,CONSTRAINT TIMESTAMP__TIME__CK CHECK (time > -9999999999.999)
);
COMMENT ON TABLE TIMESTAMP IS 'The timestamp table is used by automated processing to recor d time milestones associated with time-series data.';
COMMENT ON COLUMN TIMESTAMP.PROCCLASS IS 'Process class';
COMMENT ON COLUMN TIMESTAMP.PROCNAME IS 'Process name';
COMMENT ON COLUMN TIMESTAMP.TIME IS 'Last epoch time';
COMMENT ON COLUMN TIMESTAMP.LDDATE IS 'Load date';

-- Table: TOMO_INFO
CREATE TABLE TOMO_INFO (
    TOMOID NUMBER(18),
    MINLAT FLOAT(24),
    MAXLAT FLOAT(24),
    DLAT FLOAT(24),
    MINLON FLOAT(24),
    MAXLON FLOAT(24),
    DLON FLOAT(24),
    DIR VARCHAR2(64),
    DFILE VARCHAR2(32),
    AUTH VARCHAR2(15),
    DESCRIP VARCHAR2(50),
    LDDATE DATE,
    ,CONSTRAINT TOMO_INFO_PK PRIMARY KEY (DFILE),
    ,CONSTRAINT TOMO_INFO_UK UNIQUE (TOMOID),
    ,CONSTRAINT TOMO_INFO__DLAT__CK CHECK (dlat > 0.0),
    ,CONSTRAINT TOMO_INFO__DLON__CK CHECK (dlon > 0.0),
    ,CONSTRAINT TOMO_INFO__MAXLAT__CK CHECK (maxlat >= -90.0 AND maxlat <= 90.0),
    ,CONSTRAINT TOMO_INFO__MAXLON__CK CHECK (maxlon >= -180.0 AND maxlon <= 180.0),
    ,CONSTRAINT TOMO_INFO__MINLAT__CK CHECK (minlat >= -90.0 AND minlat <= 90.0),
    ,CONSTRAINT TOMO_INFO__MINLON__CK CHECK (minlon >= -180.0 AND minlon <= 180.0),
    ,CONSTRAINT TOMO_INFO__TOMOID__CK CHECK (tomoid > 0)
);
COMMENT ON TABLE TOMO_INFO IS 'The tomo_info table contains pointers to the storage locatio n of the tomography grids used by coda magnitude processing to obtain the path correction values.';
COMMENT ON COLUMN TOMO_INFO.TOMOID IS 'Tomography identifier';
COMMENT ON COLUMN TOMO_INFO.MINLAT IS 'Minimum latitude';
COMMENT ON COLUMN TOMO_INFO.MAXLAT IS 'Maximum latitude';
COMMENT ON COLUMN TOMO_INFO.DLAT IS 'Latitude grid spacing (latitude interval)';
COMMENT ON COLUMN TOMO_INFO.MINLON IS 'Minimum longitude';
COMMENT ON COLUMN TOMO_INFO.MAXLON IS 'Maximum longitude';
COMMENT ON COLUMN TOMO_INFO.DLON IS 'Longitude grid spacing (longitude interval)';
COMMENT ON COLUMN TOMO_INFO.DIR IS 'Directory';
COMMENT ON COLUMN TOMO_INFO.DFILE IS 'Data file';
COMMENT ON COLUMN TOMO_INFO.AUTH IS 'Author';
COMMENT ON COLUMN TOMO_INFO.DESCRIP IS 'Description';
COMMENT ON COLUMN TOMO_INFO.LDDATE IS 'Load date';

-- Table: USER_FILTER
CREATE TABLE USER_FILTER (
    OSUSER VARCHAR2(30),
    SEQ NUMBER(9),
    FILTER_STRING VARCHAR2(1024),
    FILTERID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT USER_FILTER_PK PRIMARY KEY (SEQ),
    ,CONSTRAINT USERFILTER__FILTERID__CK CHECK (filterid > 0 OR filterid = -1.0),
    ,CONSTRAINT USERFILTER__SEQ__CK CHECK (seq >= 0)
);
COMMENT ON TABLE USER_FILTER IS 'The user_filter table is used to store the list of filters d esignated by a user to be their filter selection list option s.';
COMMENT ON COLUMN USER_FILTER.OSUSER IS 'System user identifier';
COMMENT ON COLUMN USER_FILTER.SEQ IS 'Order that the filter will be displayed in the list.';
COMMENT ON COLUMN USER_FILTER.FILTER_STRING IS 'Compact filter representation used as parameter to filter_data_by_string module.';
COMMENT ON COLUMN USER_FILTER.FILTERID IS 'Filter pointer to desired filter.';
COMMENT ON COLUMN USER_FILTER.LDDATE IS 'Load date';

-- Table: USER_PRIVILEGES
CREATE TABLE USER_PRIVILEGES (
    AUTH VARCHAR2(15),
    MAX_DURATION NUMBER(9),
    APP_TABLE VARCHAR2(32),
    LDDATE DATE,
    ,CONSTRAINT USER_PRIVILEGES_PK PRIMARY KEY (AUTH),
    ,CONSTRAINT USER_PRIVS__MAX_DUR__CK CHECK (max_duration > 0 OR max_duration = 0)
);
COMMENT ON TABLE USER_PRIVILEGES IS 'This table lists the users who are allowed to apply channel masks to waveform data and the maximum time duration each us er can apply a channel mask (applies to omitted_channels tab le). This table also lists the users who are allowed to appl y nondefining location and magnitude indicators (timedef, az def, slodef and magdef) without respect to time duration (ap plies to nondefining table).';
COMMENT ON COLUMN USER_PRIVILEGES.AUTH IS 'Author (authorized user)';
COMMENT ON COLUMN USER_PRIVILEGES.MAX_DURATION IS 'Maximum length of channel masking';
COMMENT ON COLUMN USER_PRIVILEGES.APP_TABLE IS 'Table that this authorization applies to';
COMMENT ON COLUMN USER_PRIVILEGES.LDDATE IS 'Load date';

-- Table: WFACTIVITY
CREATE TABLE WFACTIVITY (
    CLASS VARCHAR2(16),
    NAME VARCHAR2(20),
    TIME FLOAT(53),
    DURATION FLOAT(24),
    MIN_TIME FLOAT(53),
    MAX_ENDTIME NUMBER(),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT WFACTIVITY_PK PRIMARY KEY (TIME),
    ,CONSTRAINT WFACTIVITY__DURATION__CK CHECK (duration > 0.0 OR duration = -1.0),
    ,CONSTRAINT WFACTIVITY__MAX_ENDTIME__CK CHECK (max_endtime > -9999999999.999),
    ,CONSTRAINT WFACTIVITY__MIN_TIME__CK CHECK (min_time > -9999999999.999),
    ,CONSTRAINT WFACTIVITY__TIME__CK CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE WFACTIVITY IS 'The wfactivity table describes activity in the wfdisc table for a channel group and time region.';
COMMENT ON COLUMN WFACTIVITY.CLASS IS 'Type of interval';
COMMENT ON COLUMN WFACTIVITY.NAME IS 'Name of interval';
COMMENT ON COLUMN WFACTIVITY.TIME IS 'Last epoch time';
COMMENT ON COLUMN WFACTIVITY.DURATION IS 'Duration in seconds of the time region';
COMMENT ON COLUMN WFACTIVITY.MIN_TIME IS 'Minimum time found in wfdisc for the time period';
COMMENT ON COLUMN WFACTIVITY.MAX_ENDTIME IS 'Maximum endtime found in wfdisc for the time period';
COMMENT ON COLUMN WFACTIVITY.MODDATE IS 'Time of last processing state change';
COMMENT ON COLUMN WFACTIVITY.LDDATE IS 'Load date';

-- Table: WFAUDIT
CREATE TABLE WFAUDIT (
    WFAUDITID NUMBER(18),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    OLD_TIME FLOAT(53),
    NEW_TIME FLOAT(53),
    OLD_ENDTIME FLOAT(53),
    NEW_ENDTIME FLOAT(53),
    MODDATE DATE,
    ,CONSTRAINT WFAUDIT_PK PRIMARY KEY (WFAUDITID),
    ,CONSTRAINT WFAUDIT__NEW_ENDTIME__CK CHECK (new_endtime > -9999999999.999),
    ,CONSTRAINT WFAUDIT__NEW_TIME__CK CHECK (new_time > -9999999999.999),
    ,CONSTRAINT WFAUDIT__OLD_ENDTIME__CK CHECK (old_endtime > -9999999999.999),
    ,CONSTRAINT WFAUDIT__OLD_TIME__CK CHECK (old_time > -9999999999.999),
    ,CONSTRAINT WFAUDIT__WFAUDITID__CK CHECK (wfauditid > 0)
);
COMMENT ON TABLE WFAUDIT IS 'The wfaudit table contains records describing the sequences of changes made to rows in the wfdisc table for continuous ( raw) waveform data';
COMMENT ON COLUMN WFAUDIT.WFAUDITID IS 'Wfaudit unique identifier';
COMMENT ON COLUMN WFAUDIT.STA IS 'Station code.';
COMMENT ON COLUMN WFAUDIT.CHAN IS 'Channel code.';
COMMENT ON COLUMN WFAUDIT.OLD_TIME IS ':old.time value provided to the wfdisc trigger';
COMMENT ON COLUMN WFAUDIT.NEW_TIME IS ':new.time value provided to the wfdisc trigger';
COMMENT ON COLUMN WFAUDIT.OLD_ENDTIME IS ':old.endtime provided to the wfdisc trigger';
COMMENT ON COLUMN WFAUDIT.NEW_ENDTIME IS ':new.endtime provided to the wfdisc trigger';
COMMENT ON COLUMN WFAUDIT.MODDATE IS 'Time of last processing state change';

-- Table: WFCONV
CREATE TABLE WFCONV (
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    CHANID NUMBER(18),
    INAUTH VARCHAR2(1),
    INCOMP VARCHAR2(2),
    INTYPE VARCHAR2(2),
    INSAMP NUMBER(8),
    OUTAUTH VARCHAR2(1),
    OUTCOMP VARCHAR2(2),
    OUTTYPE VARCHAR2(2),
    OUTSAMP NUMBER(8),
    STRIP VARCHAR2(1),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT WFCONV_PK PRIMARY KEY (CHAN),
    ,CONSTRAINT WFCONV_UK UNIQUE (CHANID),
    ,CONSTRAINT WFCONV__CHANID__CK CHECK (chanid > 0 OR chanid = -1),
    ,CONSTRAINT WFCONV__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT WFCONV__INAUTH__CK CHECK (inauth IN ('y','n','-')),
    ,CONSTRAINT WFCONV__INCOMP__CK CHECK (incomp IN ('CA','-')),
    ,CONSTRAINT WFCONV__INSAMP__CK CHECK (insamp >= 0 OR insamp = -20),
    ,CONSTRAINT WFCONV__INTYPE__CK CHECK (intype IN ('t4', 's4', 's3', 's2', 'g2', 'i4', '-' )),
    ,CONSTRAINT WFCONV__OUTAUTH__CK CHECK (outauth IN ('y', 'n', '-')),
    ,CONSTRAINT WFCONV__OUTCOMP__CK CHECK (outcomp IN ('-')),
    ,CONSTRAINT WFCONV__OUTSAMP__CK CHECK (outsamp >= 0 OR outsamp = -20),
    ,CONSTRAINT WFCONV__OUTTYPE__CK CHECK (outtype IN ('t4', 's4', 's3', 's2', 'g2', 'i4' )),
    ,CONSTRAINT WFCONV__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT WFCONV__STRIP__CK CHECK (strip IN ('y', 'n', '-'))
);
COMMENT ON TABLE WFCONV IS 'The wfconv table contains data translations that are to be p erformed on incoming data before they are written to disk by the DLMan application. Data compression types include "-" i f the data is not compressed or "CA" for Canadian compressio n. "Type" in columns intype and outtype is the fixed-width d ata type (e.g., "s4") or - if not applicable (i.e., if the d ata is compressed). An insamp value of zero (0) indicates th at the number of samples varies. Values less than zero in co lumns insamp and outsamp indicate that the total number of s amples must be evenly divisible by insamp. Strip indicates w hether to strip the authentication headers from the data; "y " means strip them and n means do not strip them.';
COMMENT ON COLUMN WFCONV.STA IS 'Station code';
COMMENT ON COLUMN WFCONV.CHAN IS 'Channel code';
COMMENT ON COLUMN WFCONV.CHANID IS 'Channel identifier';
COMMENT ON COLUMN WFCONV.INAUTH IS 'Input authenticated (y or n)';
COMMENT ON COLUMN WFCONV.INCOMP IS 'Input compression type';
COMMENT ON COLUMN WFCONV.INTYPE IS 'Input fixed-width datatype';
COMMENT ON COLUMN WFCONV.INSAMP IS 'Input samples per packet';
COMMENT ON COLUMN WFCONV.OUTAUTH IS 'Output authenticated (y or n)';
COMMENT ON COLUMN WFCONV.OUTCOMP IS 'Output compression type';
COMMENT ON COLUMN WFCONV.OUTTYPE IS 'Output fixed-width datatype';
COMMENT ON COLUMN WFCONV.OUTSAMP IS 'Output samples per packet';
COMMENT ON COLUMN WFCONV.STRIP IS 'Data stripped of headers';
COMMENT ON COLUMN WFCONV.COMMID IS 'Comment identifier';
COMMENT ON COLUMN WFCONV.LDDATE IS 'Load date';

-- Table: WFDISC
CREATE TABLE WFDISC (
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    TIME FLOAT(53),
    WFID NUMBER(18),
    CHANID NUMBER(18),
    JDATE NUMBER(8),
    ENDTIME FLOAT(53),
    NSAMP NUMBER(8),
    SAMPRATE FLOAT(24),
    CALIB FLOAT(24),
    CALPER FLOAT(24),
    INSTYPE VARCHAR2(6),
    SEGTYPE VARCHAR2(1),
    DATATYPE VARCHAR2(2),
    CLIP VARCHAR2(1),
    DIR VARCHAR2(64),
    DFILE VARCHAR2(32),
    FOFF NUMBER(10),
    COMMID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT WFDISC_UK UNIQUE (WFID),
    ,CONSTRAINT WFDISC__CALIB__CK CHECK (calib != 0.0),
    ,CONSTRAINT WFDISC__CALPER__CK CHECK (calper > 0.0),
    ,CONSTRAINT WFDISC__CHANID__CK CHECK (chanid > 0 OR chanid = -1),
    ,CONSTRAINT WFDISC__CLIP__CK CHECK (clip IN ('c','n','-')),
    ,CONSTRAINT WFDISC__COMMID__CK CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT WFDISC__DATATYPE__CK CHECK (datatype in ('t4', 'e1', 's4', 's3', 's2', 'g2', 'i4', '-' )),
    ,CONSTRAINT WFDISC__ENDTIME__CK CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT WFDISC__FOFF__CK CHECK (foff >= 0),
    ,CONSTRAINT WFDISC__JDATE__CK CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT WFDISC__NSAMP__CK CHECK (nsamp > 0),
    ,CONSTRAINT WFDISC__SAMPRATE__CK CHECK (samprate > 0.0),
    ,CONSTRAINT WFDISC__SEGTYPE__CK CHECK (segtype IN ('o', 'v', 's', 'd', '-')),
    ,CONSTRAINT WFDISC__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT WFDISC__TIME__CK CHECK (time >= -9999999999.999),
    ,CONSTRAINT WFDISC__WFID__CK CHECK (wfid > 0)
);
COMMENT ON TABLE WFDISC IS 'The wfdisc table contains a waveform header file and descrip tive information. This table provides a pointer (or index) t o waveforms stored on disk. The waveforms themselves are sto red in ordinary disk files called wfdisc or ''.w'' files as a sequence of sample values (usually in binary representation) .';
COMMENT ON COLUMN WFDISC.STA IS 'Station code';
COMMENT ON COLUMN WFDISC.CHAN IS 'Channel code';
COMMENT ON COLUMN WFDISC.TIME IS 'Epoch time of first sample in file';
COMMENT ON COLUMN WFDISC.WFID IS 'Waveform identifier';
COMMENT ON COLUMN WFDISC.CHANID IS 'Channel identifier';
COMMENT ON COLUMN WFDISC.JDATE IS 'Julian date';
COMMENT ON COLUMN WFDISC.ENDTIME IS 'Time + (nsamp-1)/ samprate';
COMMENT ON COLUMN WFDISC.NSAMP IS 'Number of samples';
COMMENT ON COLUMN WFDISC.SAMPRATE IS 'Sampling rate in samples/sec';
COMMENT ON COLUMN WFDISC.CALIB IS 'Nominal calibration';
COMMENT ON COLUMN WFDISC.CALPER IS 'Nominal calibration period';
COMMENT ON COLUMN WFDISC.INSTYPE IS 'Instrument code';
COMMENT ON COLUMN WFDISC.SEGTYPE IS 'Indexing method';
COMMENT ON COLUMN WFDISC.DATATYPE IS 'Numeric storage';
COMMENT ON COLUMN WFDISC.CLIP IS 'Clipped flag';
COMMENT ON COLUMN WFDISC.DIR IS 'Directory';
COMMENT ON COLUMN WFDISC.DFILE IS 'Data file';
COMMENT ON COLUMN WFDISC.FOFF IS 'Byte offset of data segment within file';
COMMENT ON COLUMN WFDISC.COMMID IS 'Comment identifier';
COMMENT ON COLUMN WFDISC.LDDATE IS 'Load date';

-- Table: WFFILE
CREATE TABLE WFFILE (
    WFFID NUMBER(18),
    DIR VARCHAR2(64),
    DFILE VARCHAR2(32),
    MACHINE VARCHAR2(32),
    LOCAL_DIR VARCHAR2(64),
    TLEN FLOAT(24),
    TIME FLOAT(53),
    REAPTIME FLOAT(53),
    STA VARCHAR2(6),
    CHAN VARCHAR2(8),
    SAMPRATE FLOAT(24),
    CHANID NUMBER(18),
    WFMID NUMBER(18),
    MODDATE DATE,
    LDDATE DATE,
    ,CONSTRAINT WFFILE_PK PRIMARY KEY (DFILE),
    ,CONSTRAINT WFFILE_UK UNIQUE (WFFID),
    ,CONSTRAINT WFFILE__CHANID__CK CHECK (chanid > 0 OR chanid = -1),
    ,CONSTRAINT WFFILE__REAPTIME__CK CHECK (reaptime > 0.0 OR reaptime = 0.0),
    ,CONSTRAINT WFFILE__SAMPRATE__CK CHECK (samprate > 0.0),
    ,CONSTRAINT WFFILE__STA__CK CHECK (sta = UPPER(sta)),
    ,CONSTRAINT WFFILE__TIME__CK CHECK (time > -9999999999.999),
    ,CONSTRAINT WFFILE__TLEN__CK CHECK (tlen > 0.0 OR tlen = -1.0),
    ,CONSTRAINT WFFILE__WFFID__CK CHECK (wffid > 0),
    ,CONSTRAINT WFFILE__WFMID__CK CHECK (wfmid >= 0)
);
COMMENT ON TABLE WFFILE IS 'The wffile table describes the files used in the Wave Form F iles managed by the Continuous Data Services Subsystem.';
COMMENT ON COLUMN WFFILE.WFFID IS 'Wave Form File identifier';
COMMENT ON COLUMN WFFILE.DIR IS 'Directory name';
COMMENT ON COLUMN WFFILE.DFILE IS 'Filename';
COMMENT ON COLUMN WFFILE.MACHINE IS 'Machine name';
COMMENT ON COLUMN WFFILE.LOCAL_DIR IS 'Local directory';
COMMENT ON COLUMN WFFILE.TLEN IS 'Length of file, in seconds';
COMMENT ON COLUMN WFFILE.TIME IS 'Start time';
COMMENT ON COLUMN WFFILE.REAPTIME IS 'Clock time for expiration';
COMMENT ON COLUMN WFFILE.STA IS 'Station name';
COMMENT ON COLUMN WFFILE.CHAN IS 'Channel code';
COMMENT ON COLUMN WFFILE.SAMPRATE IS 'Sampling Rate in samples per second';
COMMENT ON COLUMN WFFILE.CHANID IS 'Channel identifier';
COMMENT ON COLUMN WFFILE.WFMID IS 'Wave Form Manager identifier';

-- Table: WFTAG
CREATE TABLE WFTAG (
    TAGNAME VARCHAR2(8),
    TAGID NUMBER(18),
    WFID NUMBER(18),
    LDDATE DATE,
    ,CONSTRAINT WFTAG_PK PRIMARY KEY (TAGID),
    ,CONSTRAINT WFTAG__TAGID__CK CHECK (tagid > 0),
    ,CONSTRAINT WFTAG__TAGNAME__CK CHECK (tagname IN ('arid', 'evid', 'orid', 'stassid', 'msgid', 'clustaid', '-')),
    ,CONSTRAINT WFTAG__WFID__CK CHECK (wfid > 0)
);
COMMENT ON TABLE WFTAG IS 'The wftag table links various identifiers (e.g., orid, arid, and stassid to wfid). Linkages can also be determined indir ectly using sta/chan/time; however, it is more efficient to use the wftag table.';
COMMENT ON COLUMN WFTAG.TAGNAME IS 'Key (arid, orid, evid, etc.)';
COMMENT ON COLUMN WFTAG.TAGID IS 'Tagname value';
COMMENT ON COLUMN WFTAG.WFID IS 'Waveform identifier';
COMMENT ON COLUMN WFTAG.LDDATE IS 'Load date';

-- Table: XTAG
CREATE TABLE XTAG (
    THISID NUMBER(18),
    THATID NUMBER(18),
    THISNAME VARCHAR2(8),
    THATNAME VARCHAR2(8),
    THISDB VARCHAR2(32),
    THATDB VARCHAR2(32),
    LDDATE DATE,
    ,CONSTRAINT XTAG_PK PRIMARY KEY (THISNAME),
    ,CONSTRAINT XTAG__THATID__CK CHECK (thatid > 0),
    ,CONSTRAINT XTAG__THISID__CK CHECK (thisid > 0)
);
COMMENT ON TABLE XTAG IS 'The xtag table links various identifiers (e.g., orid, arid, stassid, and wfid) to other identifiers. This table is a gen eralization of the wftag table, which is limited to linking exclusively to the wfdisc table. The thisdb column describes the database account for the record specified by thisid and thisname; thatdb describes the database account for the rec ord specified by thatid and thatname. When a parent/child ta ble exists between the records thisid should designate the p arent and thatid should designate the child.';
COMMENT ON COLUMN XTAG.THISID IS 'thisname identifier';
COMMENT ON COLUMN XTAG.THATID IS 'thatname identifier';
COMMENT ON COLUMN XTAG.THISNAME IS 'Key for thisid (grid, orid, ntid, and so on)';
COMMENT ON COLUMN XTAG.THATNAME IS 'Key for thatid (arid, orid, nfid, and so on)';
COMMENT ON COLUMN XTAG.THISDB IS 'Database account for the records specified by thisid and thisname';
COMMENT ON COLUMN XTAG.THATDB IS 'Database account for the records specified by thatid and thatname';
COMMENT ON COLUMN XTAG.LDDATE IS 'Load date';

-- Foreign Keys
ALTER TABLE AMP3C ADD CONSTRAINT AMP3C_ARRIVAL_ARID_FK FOREIGN KEY (ARID) REFERENCES ARRIVAL (ARID);
ALTER TABLE AMPLITUDE ADD CONSTRAINT AMPLITUDE_ARRIVAL_ARID_FK FOREIGN KEY (ARID) REFERENCES ARRIVAL (ARID);
ALTER TABLE AMPLITUDE_DYN_PARS_DBL ADD CONSTRAINT AMPDYNPAR_DBL_AMPID_FK FOREIGN KEY (AMPID) REFERENCES AMPLITUDE (AMPID);
ALTER TABLE AMPLITUDE_DYN_PARS_INT ADD CONSTRAINT AMPDYNPAR_INT_AMPID_FK FOREIGN KEY (AMPID) REFERENCES AMPLITUDE (AMPID);
ALTER TABLE AMPLITUDE_DYN_PARS_STR ADD CONSTRAINT AMPDYNPAR_STR_AMPID_FK FOREIGN KEY (AMPID) REFERENCES AMPLITUDE (AMPID);
ALTER TABLE APMA ADD CONSTRAINT APMA_ARRIVAL_ARID_FK FOREIGN KEY (ARID) REFERENCES ARRIVAL (ARID);
ALTER TABLE AR_INFO ADD CONSTRAINT AR_INFO_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE ARRIVAL_DYN_PARS_DBL ADD CONSTRAINT ARRDYNPAR_DBL_ARID_FK FOREIGN KEY (ARID) REFERENCES ARRIVAL (ARID);
ALTER TABLE ARRIVAL_DYN_PARS_INT ADD CONSTRAINT ARRDYNPAR_INT_ARID_FK FOREIGN KEY (ARID) REFERENCES ARRIVAL (ARID);
ALTER TABLE ARRIVAL_DYN_PARS_STR ADD CONSTRAINT ARRDYNPAR_STR_ARID_FK FOREIGN KEY (ARID) REFERENCES ARRIVAL (ARID);
ALTER TABLE ARRIVAL_TAG ADD CONSTRAINT ARRIVAL_TAG_ARRIVAL_ARID_FK FOREIGN KEY (ARID) REFERENCES ARRIVAL (ARID);
ALTER TABLE ASSOC ADD CONSTRAINT ASSOC_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE ASSOC ADD CONSTRAINT ASSOC_ARRIVAL_ARID_FK FOREIGN KEY (ARID) REFERENCES ARRIVAL (ARID);
ALTER TABLE ASSOC_GA_DEL ADD CONSTRAINT ASS_GA_DEL_ORIG_GA_DEL_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN_GA_DEL (ORID);
ALTER TABLE BEAM ADD CONSTRAINT BEAM_WFDISC_WFID_FK FOREIGN KEY (WFID) REFERENCES WFDISC (WFID);
ALTER TABLE CLASSIFICATION ADD CONSTRAINT CLASS_CLASS_OPR_CLASSOPRID_FK FOREIGN KEY (CLASS_OPR_ID) REFERENCES CLASSIFICATION_OPR (CLASS_OPR_ID);
ALTER TABLE CLUSTER_MAGREF ADD CONSTRAINT CLU_MAGREF_CLU_STA_CA_AT_FK FOREIGN KEY (CLUSTAID) REFERENCES CLUSTER_STATION (CLUSTAI D);
ALTER TABLE CLUSTER_MAGREF ADD CONSTRAINT  FOREIGN KEY (ACTIVETIME) REFERENCES CLUSTER_STATION (ACTIV ETIME);
ALTER TABLE CLUSTER_MEC ADD CONSTRAINT CLU_MEC_CLU_STA_CA_AT_FK FOREIGN KEY (CLUSTAID) REFERENCES CLUSTER_STATION (CLUSTAID);
ALTER TABLE CLUSTER_MEC ADD CONSTRAINT  FOREIGN KEY (ACTIVETIME) REFERENCES CLUSTER_STATION (ACTIVETI ME);
ALTER TABLE CLUSTER_ORID ADD CONSTRAINT CLU_ORID_CLU_STA_CA_AT_FK FOREIGN KEY (CLUSTAID) REFERENCES CLUSTER_STATION (CLUSTAID);
ALTER TABLE CLUSTER_ORID ADD CONSTRAINT  FOREIGN KEY (ACTIVETIME) REFERENCES CLUSTER_STATION (ACTIVET IME);
ALTER TABLE CLUSTER_OVERRIDE ADD CONSTRAINT CLU_OVRD_CLU_STA_CA_AT_FK FOREIGN KEY (CLUSTAID) REFERENCES CLUSTER_STATION (CLUST AID);
ALTER TABLE CLUSTER_OVERRIDE ADD CONSTRAINT  FOREIGN KEY (ACTIVETIME) REFERENCES CLUSTER_STATION (ACT IVETIME);
ALTER TABLE CLUSTER_STATION ADD CONSTRAINT CLU_STA_CLUSTER_INFO_CLUID_FK FOREIGN KEY (CLUID) REFERENCES CLUSTER_INFO (CLUID);
ALTER TABLE CLUSTER_THRESHOLD ADD CONSTRAINT CLU_THRESH_CLU_STA_CA_AT_FK FOREIGN KEY (CLUSTAID) REFERENCES CLUSTER_STATION (CLUS TAID);
ALTER TABLE CLUSTER_THRESHOLD ADD CONSTRAINT  FOREIGN KEY (ACTIVETIME) REFERENCES CLUSTER_STATION (AC TIVETIME);
ALTER TABLE CODAMAG_INPUT ADD CONSTRAINT CODAMAGIN_AMPLITUDE_AMPID_FK FOREIGN KEY (AMPID) REFERENCES AMPLITUDE (AMPID);
ALTER TABLE CODAMAG_OUTPUT ADD CONSTRAINT CODAMAGOUT_CODAMAGIN_AMPID_FK FOREIGN KEY (AMPID) REFERENCES CODAMAG_INPUT (AMPID);
ALTER TABLE CODAMAG_OUTPUT ADD CONSTRAINT  FOREIGN KEY (FLO) REFERENCES CODAMAG_INPUT (FLO);
ALTER TABLE CODAMAG_OUTPUT ADD CONSTRAINT  FOREIGN KEY (FHI) REFERENCES CODAMAG_INPUT (FHI);
ALTER TABLE DEFINING_RULES ADD CONSTRAINT DEF_RULES_DEF_OBS_OBS_ID_FK FOREIGN KEY (OBSTYPE_ID) REFERENCES DEFINING_OBSTYPES (OBS TYPE_ID);
ALTER TABLE DEFINING_RULES ADD CONSTRAINT DEF_RULES_DEF_VALS_VAL_ID_FK FOREIGN KEY (VALUE_ID) REFERENCES DEFINING_VALUES (VALUE_I D);
ALTER TABLE DETECTION ADD CONSTRAINT DETECTION_ARRIVAL_ARID_FK FOREIGN KEY (ARID) REFERENCES ARRIVAL (ARID);
ALTER TABLE DISCRIM_PARAM ADD CONSTRAINT DISCRIM_PAR_POLYGON_POLYID_FK FOREIGN KEY (POLYID) REFERENCES POLYGON (POLYID);
ALTER TABLE DISCRIMUSE ADD CONSTRAINT DISCRIMUSE_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE DISCRIMVOTE ADD CONSTRAINT DISCRIMVOTE_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE ECM_CHAN_AMPLITUDE ADD CONSTRAINT ECM_CHAN_AMP_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE ECM_COV ADD CONSTRAINT ECM_COV_POLYGON_POLYID_FK FOREIGN KEY (POLYID) REFERENCES POLYGON (POLYID);
ALTER TABLE ECM_DISCRIMINANTS ADD CONSTRAINT ECM_DISCRIM_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE ECM_EVENT_RESULTS ADD CONSTRAINT ECM_EVENT_RES_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE ECM_REF_CHAN_AMPLITUDE ADD CONSTRAINT ECM_RCA_POLYGON_POLYID_FK FOREIGN KEY (POLYID) REFERENCES POLYGON (POLYID);
ALTER TABLE ECM_REF_CHAN_AMPLITUDE ADD CONSTRAINT ECM_RCA_ECM_REF_EVENT_EVID_FK FOREIGN KEY (EVID) REFERENCES ECM_REF_EVENT (EVID);
ALTER TABLE ECM_REF_DISCRIM ADD CONSTRAINT ECM_REF_D_ECM_REF_E_EVID_FK FOREIGN KEY (EVID) REFERENCES ECM_REF_EVENT (EVID);
ALTER TABLE ECM_REGION_PREF_VERSION ADD CONSTRAINT ECM_REG_PV_POLYGON_POLYID_FK FOREIGN KEY (POLYID) REFERENCES POLYGON (POLYID);
ALTER TABLE ECM_SOURCES ADD CONSTRAINT ECM_SOURCES_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE ECM_STA_PREF_VERSION ADD CONSTRAINT ECM_STA_PV_POLYGON_POLYID_FK FOREIGN KEY (POLYID) REFERENCES POLYGON (POLYID);
ALTER TABLE ENVELOPE_CONTRIBUTION ADD CONSTRAINT ENVELOPE_CONT_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE EVENT_CONTROL ADD CONSTRAINT EVENT_CONTROL_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE EVENT_CORRELATION ADD CONSTRAINT EVT_CORR_EVT_SRC_EVID_EVID_FK FOREIGN KEY (SOURCE_EVID) REFERENCES EVENT (SOURCE_EVID);
ALTER TABLE EVENT_CORRELATION ADD CONSTRAINT EVT_CORR_ORIG_SRC_ORID_ORID_FK FOREIGN KEY (SOURCE_ORID) REFERENCES ORIGIN (SOURCE_ORI D);
ALTER TABLE EVENT_QUALITY ADD CONSTRAINT EVENT_QUALITY_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE FEEDBACK_CATAFFILIATION ADD CONSTRAINT FBCATAFFIL_FB_FEEDBACK_ID_FK FOREIGN KEY (FEEDBACK_ID) REFERENCES FEEDBACK (FE EDBACK_ID);
ALTER TABLE FEEDBACK_SCREENSHOTS ADD CONSTRAINT FBSCRNSHOTS_FB_FEEDBACK_ID_FK FOREIGN KEY (FEEDBACK_ID) REFERENCES FEEDBACK (FEEDB ACK_ID);
ALTER TABLE FEEDBACK_STATE ADD CONSTRAINT FBSTATE_FB_FEEDBACK_ID_FK FOREIGN KEY (FEEDBACK_ID) REFERENCES FEEDBACK (FEEDBACK_ID);
ALTER TABLE FILTER_COEFFICIENTS ADD CONSTRAINT FILTER_COEF_FILTER_FILTERID_FK FOREIGN KEY (FILTERID) REFERENCES FILTER (FILTERID);
ALTER TABLE FILTER_GROUP ADD CONSTRAINT FILTER_GRP_FILT_C_FILTERID_FK FOREIGN KEY (CHILD_FILTERID) REFERENCES FILTER (CHILD_FILTER ID);
ALTER TABLE FILTER_GROUP ADD CONSTRAINT FILTER_GRP_FILT_P_FILTERID_FK FOREIGN KEY (PARENT_FILTERID) REFERENCES FILTER (PARENT_FILT ERID);
ALTER TABLE FILTER_VALUES_DOUBLE ADD CONSTRAINT FILT_VAL_DB_FILTER_FILTERID_FK FOREIGN KEY (FILTERID) REFERENCES FILTER (FILTERID);
ALTER TABLE FILTER_VALUES_INTEGER ADD CONSTRAINT FILT_VAL_IN_FILTER_FILTERID_FK FOREIGN KEY (FILTERID) REFERENCES FILTER (FILTERID);
ALTER TABLE FILTER_VALUES_STRING ADD CONSTRAINT FILT_VAL_ST_FILTER_FILTERID_FK FOREIGN KEY (FILTERID) REFERENCES FILTER (FILTERID);
ALTER TABLE FK_PROCESSING ADD CONSTRAINT FK_PROC_ARRIVAL_ARID_FK FOREIGN KEY (ARID) REFERENCES ARRIVAL (ARID);
ALTER TABLE FTPFAILED ADD CONSTRAINT FTPFAILED_MSGDISC_MSGID_FK FOREIGN KEY (MSGID) REFERENCES MSGDISC (MSGID);
ALTER TABLE HISTORIC_INFO_SHELL ADD CONSTRAINT HIST_SHELL_ALGORITHM_ID_FK FOREIGN KEY (ALGORITHM_ID) REFERENCES ALGORITHM (ALGO RITHM_ID);
ALTER TABLE HISTORIC_INFO_STA_PHASE ADD CONSTRAINT HIST_STA_PHASE_ALGORITHM_ID_FK FOREIGN KEY (ALGORITHM_ID) REFERENCES ALGORITHM (ALGORITHM_ID);
ALTER TABLE HISTORIC_INFO_STA_PHASE ADD CONSTRAINT HIST_INFO_STA_PHS_CYL_ID_FK FOREIGN KEY (HISTORIC_INFO_CYLINDER_ID) REFERENCES HISTORIC_INFO_CYLINDER (HISTORIC_INFO_CYLINDER_I D);
ALTER TABLE MDAC_FD ADD CONSTRAINT MDAC_FD_MDAC_FI_CORRID_FK FOREIGN KEY (CORRID) REFERENCES MDAC_FI (CORRID);
ALTER TABLE MDAC_FD ADD CONSTRAINT  FOREIGN KEY (AMPCOR_VERID) REFERENCES MDAC_FI (AMPCOR_VERID);
ALTER TABLE MDAC_FI ADD CONSTRAINT MDAC_FI_POLYGON_POLYID_FK FOREIGN KEY (POLYID) REFERENCES POLYGON (POLYID);
ALTER TABLE MSGAUX ADD CONSTRAINT MSGAUX_MSGDISC_MSGID_FK FOREIGN KEY (MSGID) REFERENCES MSGDISC (MSGID);
ALTER TABLE MSGDEST ADD CONSTRAINT MSGDEST_MSGDISC_MSGID_FK FOREIGN KEY (MSGID) REFERENCES MSGDISC (MSGID);
ALTER TABLE MSGDISC ADD CONSTRAINT MSGDISC_DATAUSER_USERID_FK FOREIGN KEY (USERID) REFERENCES DATAUSER (USERID);
ALTER TABLE MSVMAX_DESCRIPT ADD CONSTRAINT MSVMAX_DESCRIPT_AMP_AMPID_FK FOREIGN KEY (AMPID) REFERENCES AMPLITUDE (AMPID);
ALTER TABLE MSVMAX_RESULTS ADD CONSTRAINT MSVMAX_RESULTS_DESC_AMPID_FK FOREIGN KEY (AMPID) REFERENCES MSVMAX_DESCRIPT (AMPID);
ALTER TABLE NET_CODA_SPECTRUM ADD CONSTRAINT NETCODASPEC_NETMAG_MAGID_FK FOREIGN KEY (MAGID) REFERENCES NETMAG (MAGID);
ALTER TABLE NETMAG ADD CONSTRAINT NETMAG_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE NETYIELD ADD CONSTRAINT NETYIELD_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE ORIGERR ADD CONSTRAINT ORIGERR_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE ORIGERR_GA_DEL ADD CONSTRAINT OE_GA_DEL_ORIG_GA_DEL_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN_GA_DEL (ORID);
ALTER TABLE ORIGIN_MEA_TRACE ADD CONSTRAINT OMT_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE ORIGIN_TAG ADD CONSTRAINT ORIGIN_TAG_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE POLYPOINT ADD CONSTRAINT POLYPOINT_POLYGON_POLYID_FK FOREIGN KEY (POLYID) REFERENCES POLYGON (POLYID);
ALTER TABLE QCMASKINFO ADD CONSTRAINT QCMSKINFO_QCMSKDEF_QCDEFID_FK FOREIGN KEY (QCDEFID) REFERENCES QCMASKDEF (QCDEFID);
ALTER TABLE QCMASKSEG ADD CONSTRAINT QCMSKSEG_QCMSKINFO_QCMASKID_FK FOREIGN KEY (QCMASKID) REFERENCES QCMASKINFO (QCMASKID);
ALTER TABLE QSHELL_INTERVAL ADD CONSTRAINT QSHELL_INTVL_INTVLID_INTVL_FK FOREIGN KEY (INTVLID) REFERENCES INTERVAL (INTVLID);
ALTER TABLE RDA_PARAM ADD CONSTRAINT RDA_PARAM_POLYGON_POLYID_FK FOREIGN KEY (POLYID) REFERENCES POLYGON (POLYID);
ALTER TABLE REG_RATIO_DISCRIM ADD CONSTRAINT REG_RAT_DISC_POLYGON_POLYID_FK FOREIGN KEY (POLYID) REFERENCES POLYGON (POLYID);
ALTER TABLE SADO_EMAIL_HISTORY ADD CONSTRAINT SADO_EH_SADO_REP_REPORT_ID_FK FOREIGN KEY (REPORT_ID) REFERENCES SADO_REPORT (REPORT _ID);
ALTER TABLE SADO_PDF_REPORTS ADD CONSTRAINT SADO_PR_SADO_REP_REPORT_ID_FK FOREIGN KEY (REPORT_ID) REFERENCES SADO_REPORT (REPORT_I D);
ALTER TABLE SADO_REPORT_LANDMARKS ADD CONSTRAINT SADO_RL_SADO_REP_REPORT_ID_FK FOREIGN KEY (REPORT_ID) REFERENCES SADO_REPORT (REP ORT_ID);
ALTER TABLE SADO_SCREENSHOTS ADD CONSTRAINT SADO_SS_SADO_REP_REPORT_ID_FK FOREIGN KEY (REPORT_ID) REFERENCES SADO_REPORT (REPORT_I D);
ALTER TABLE SADO_STATE ADD CONSTRAINT SADO_ST_SADO_REP_REPORT_ID_FK FOREIGN KEY (REPORT_ID) REFERENCES SADO_REPORT (REPORT_ID);
ALTER TABLE SENSOR ADD CONSTRAINT SENSOR_INSTRUMENT_INID_FK FOREIGN KEY (INID) REFERENCES INSTRUMENT (INID);
ALTER TABLE SNR_PHASE ADD CONSTRAINT SNR_PHASE_POLYGON_POLYID_FK FOREIGN KEY (POLYID) REFERENCES POLYGON (POLYID);
ALTER TABLE STA_CODA_SPECTRUM ADD CONSTRAINT STACODASPEC_AMPLITUDE_AMPID_FK FOREIGN KEY (AMPID) REFERENCES AMPLITUDE (AMPID);
ALTER TABLE STAMAG ADD CONSTRAINT STAMAG_ORIGIN_ORID_FK FOREIGN KEY (ORID) REFERENCES ORIGIN (ORID);
ALTER TABLE STAMAG ADD CONSTRAINT STAMAG_AMPLITUDE_AMPID_FK FOREIGN KEY (AMPID) REFERENCES AMPLITUDE (AMPID);
ALTER TABLE STATION_PROCESSING ADD CONSTRAINT STA_PROC_CLUST_STA_CA_AT_FK FOREIGN KEY (CLUSTAID) REFERENCES CLUSTER_STATION (CLU STAID);
ALTER TABLE STATION_PROCESSING ADD CONSTRAINT  FOREIGN KEY (ACTIVETIME) REFERENCES CLUSTER_STATION (A CTIVETIME);
ALTER TABLE STAYIELD ADD CONSTRAINT STAYIELD_AMPLITUDE_AMPID_FK FOREIGN KEY (AMPID) REFERENCES AMPLITUDE (AMPID);
ALTER TABLE SVDDISC ADD CONSTRAINT SVDDISC_CLU_STA_CA_AT_FK FOREIGN KEY (CLUSTAID) REFERENCES CLUSTER_STATION (CLUSTAID);
ALTER TABLE SVDDISC ADD CONSTRAINT  FOREIGN KEY (ACTIVETIME) REFERENCES CLUSTER_STATION (ACTIVETIME);
ALTER TABLE SVDDISC_CHAN_ORDER ADD CONSTRAINT SVD_CH_ORD_CLU_STA_CA_AT_FK FOREIGN KEY (CLUSTAID) REFERENCES CLUSTER_STATION (CLU STAID);
ALTER TABLE SVDDISC_CHAN_ORDER ADD CONSTRAINT  FOREIGN KEY (ACTIVETIME) REFERENCES CLUSTER_STATION (A CTIVETIME);
ALTER TABLE WFTAG ADD CONSTRAINT WFTAG_WFDISC_WFID_FK FOREIGN KEY (WFID) REFERENCES WFDISC (WFID);