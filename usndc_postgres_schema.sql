-- Generated PostgreSQL DDL from USNDC_Tables_A_to_Z.html
-- NOTE: Requires PostGIS if geometry columns are present.
CREATE EXTENSION IF NOT EXISTS postgis;

-- Table: ACTIVE_ID
CREATE TABLE IF NOT EXISTS active_id (
    tagname VARCHAR(8),
    tagid BIGINT,
    client_info VARCHAR(64),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (tagid),
    ,CONSTRAINT active_id__tagid__ck CHECK (tagid > 0),
    ,CONSTRAINT active_id__tagname__ck CHECK (tagname IN ('arid', 'evid', 'intvlid', '-'))
);
COMMENT ON TABLE active_id IS $$ The active_id table is used to track events or arrivals bein g actively worked interactively to prevent the same event/ar rival from being worked by more than one individual. $$;
COMMENT ON COLUMN active_id.tagname IS $$ The key name (arid or evid) $$;
COMMENT ON COLUMN active_id.tagid IS $$ Tag identifier value (arid or evid) $$;
COMMENT ON COLUMN active_id.client_info IS $$ Client information $$;
COMMENT ON COLUMN active_id.author IS $$ Author $$;
COMMENT ON COLUMN active_id.moddate IS $$ Modification date $$;
COMMENT ON COLUMN active_id.lddate IS $$ Load date $$;

-- Table: AFFILIATION
CREATE TABLE IF NOT EXISTS affiliation (
    net VARCHAR(8),
    sta VARCHAR(6),
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (time),
    ,CONSTRAINT affiliation__endtime__ck CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT affiliation__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT affiliation__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE affiliation IS $$ The affiliation table groups stations into networks. $$;
COMMENT ON COLUMN affiliation.net IS $$ Unique network identifier $$;
COMMENT ON COLUMN affiliation.sta IS $$ Station identifier $$;
COMMENT ON COLUMN affiliation.time IS $$ Starting time for station in network $$;
COMMENT ON COLUMN affiliation.endtime IS $$ endtime for station in network $$;
COMMENT ON COLUMN affiliation.lddate IS $$ Load date $$;

-- Table: ALGORITHM
CREATE TABLE IF NOT EXISTS algorithm (
    algorithm_id BIGINT,
    algorithm_name VARCHAR(64),
    description VARCHAR(4000),
    on_date TIMESTAMP,
    off_date TIMESTAMP,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (algorithm_id),
    ,CONSTRAINT algorithm__algorithm_id__ck CHECK (algorithm_id > 0)
);
COMMENT ON TABLE algorithm IS $$ The algorithm table describes the algorithm and valid time p eriod $$;
COMMENT ON COLUMN algorithm.algorithm_id IS $$ Algorithm identifier $$;
COMMENT ON COLUMN algorithm.algorithm_name IS $$ Algorithm name $$;
COMMENT ON COLUMN algorithm.description IS $$ Description of algorithm $$;
COMMENT ON COLUMN algorithm.on_date IS $$ The date the algorithm first became active or was created $$;
COMMENT ON COLUMN algorithm.off_date IS $$ The date the algorithm was removed from the system or made obsolete $$;
COMMENT ON COLUMN algorithm.author IS $$ Author $$;
COMMENT ON COLUMN algorithm.moddate IS $$ Modification date $$;
COMMENT ON COLUMN algorithm.lddate IS $$ Load date $$;

-- Table: ALPHASITE
CREATE TABLE IF NOT EXISTS alphasite (
    sta VARCHAR(6),
    address VARCHAR(16),
    prefdlid BIGINT,
    prefport INTEGER,
    con_allowed VARCHAR(1),
    dlid BIGINT,
    time DOUBLE PRECISION,
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (sta),
    ,CONSTRAINT alphasite__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT alphasite__con_allowed__ck CHECK (con_allowed IN ('y', 'n', '-')),
    ,CONSTRAINT alphasite__dlid__ck CHECK (dlid >= 0),
    ,CONSTRAINT alphasite__prefdlid__ck CHECK (prefdlid > 0),
    ,CONSTRAINT alphasite__prefport__ck CHECK ((prefport >= 0 AND prefport <= 16383) OR prefport = -1),
    ,CONSTRAINT alphasite__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT alphasite__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE alphasite IS $$ The alphasite table is used for tracking continuous data con nections by the DLMan application. For a given station, ther e must be a row in the table for each address from which the station may send continuous data. The columns prefdlid and prefport describe the preferred DLMan connection for the sta tion. DLMan fills in dlid and time while a station is active ly connected. The column dlid indicates to which dlid the st ation is currently connected (may be different from prefdlid ) and the column time is the system time for the last activi ty on the station's connection (not the time of any data rec eived). For stations that are not connected, time and dlid a re zero. $$;
COMMENT ON COLUMN alphasite.sta IS $$ Station code $$;
COMMENT ON COLUMN alphasite.address IS $$ Source internet address $$;
COMMENT ON COLUMN alphasite.prefdlid IS $$ dlid for preferred DLMan $$;
COMMENT ON COLUMN alphasite.prefport IS $$ Preferred network port $$;
COMMENT ON COLUMN alphasite.con_allowed IS $$ Status on whether DLMAN is allowed to connect to this channel or not $$;
COMMENT ON COLUMN alphasite.dlid IS $$ dlid handling station $$;
COMMENT ON COLUMN alphasite.time IS $$ Clock time of most recent activity $$;
COMMENT ON COLUMN alphasite.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN alphasite.lddate IS $$ Load date $$;

-- Table: AMP3C
CREATE TABLE IF NOT EXISTS amp3c (
    arid BIGINT,
    cfreq DOUBLE PRECISION,
    vamp DOUBLE PRECISION,
    vsnr DOUBLE PRECISION,
    hamp DOUBLE PRECISION,
    hsnr DOUBLE PRECISION,
    htov DOUBLE PRECISION,
    rid VARCHAR(8),
    lddate TIMESTAMP,
    ,PRIMARY KEY (cfreq),
    ,CONSTRAINT amp3c__arid__ck CHECK (arid > 0),
    ,CONSTRAINT amp3c__cfreq__ck CHECK (cfreq > 0.0 OR cfreq = -1.0),
    ,CONSTRAINT amp3c__hamp__ck CHECK (hamp >= 0.0 OR hamp = -999.0),
    ,CONSTRAINT amp3c__hsnr__ck CHECK (hsnr >= 0.0 OR hsnr = -999.0),
    ,CONSTRAINT amp3c__htov__ck CHECK (htov >= 0.0 OR htov = -999.0),
    ,CONSTRAINT amp3c__vamp__ck CHECK (vamp >= 0.0 OR vamp = -999.0),
    ,CONSTRAINT amp3c__vsnr__ck CHECK (vsnr >= 0.0 OR vsnr = -999.0)
);
COMMENT ON TABLE amp3c IS $$ The amp3c table contains amplitude measurements made on thre e-component data for a specific detection. $$;
COMMENT ON COLUMN amp3c.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN amp3c.cfreq IS $$ Center frequency of filter band amplitude is measured on $$;
COMMENT ON COLUMN amp3c.vamp IS $$ Vertical amplitude $$;
COMMENT ON COLUMN amp3c.vsnr IS $$ Vertical signal-to-noise ratio $$;
COMMENT ON COLUMN amp3c.hamp IS $$ Horizontal amplitude $$;
COMMENT ON COLUMN amp3c.hsnr IS $$ Horizontal signal-to-noise ratio $$;
COMMENT ON COLUMN amp3c.htov IS $$ Horizontal-to-vertical amplitude ratio $$;
COMMENT ON COLUMN amp3c.rid IS $$ Recipe identifier $$;
COMMENT ON COLUMN amp3c.lddate IS $$ Load date $$;

-- Table: AMPDESCRIPT
CREATE TABLE IF NOT EXISTS ampdescript (
    amptype VARCHAR(8),
    toff DOUBLE PRECISION,
    tlen DOUBLE PRECISION,
    gvlo DOUBLE PRECISION,
    gvhi DOUBLE PRECISION,
    mtype VARCHAR(8),
    ampdescr VARCHAR(255),
    lddate TIMESTAMP,
    ,PRIMARY KEY (amptype),
    ,CONSTRAINT ampdescript__gvhi__ck CHECK (gvhi > gvlo OR gvhi = -999.0),
    ,CONSTRAINT ampdescript__gvlo__ck CHECK (gvlo > 0.0 OR gvlo = -999.0),
    ,CONSTRAINT ampdescript__tlen__ck CHECK (tlen > 0.0 OR tlen = -1.0),
    ,CONSTRAINT ampdescript__toff__ck CHECK (toff >= 0.0 OR toff = -999.0)
);
COMMENT ON TABLE ampdescript IS $$ The ampdescript table contains descriptions of how amplitude measurements in amplitude were made. $$;
COMMENT ON COLUMN ampdescript.amptype IS $$ Amplitude measure descriptor $$;
COMMENT ON COLUMN ampdescript.toff IS $$ Offset from theoretical or observed arrival time $$;
COMMENT ON COLUMN ampdescript.tlen IS $$ Duration of measurement window $$;
COMMENT ON COLUMN ampdescript.gvlo IS $$ Low group velocity for measurement window (km/sec) $$;
COMMENT ON COLUMN ampdescript.gvhi IS $$ High group velocity for measurement window kilometers per second (km/sec) $$;
COMMENT ON COLUMN ampdescript.mtype IS $$ Measurement type $$;
COMMENT ON COLUMN ampdescript.ampdescr IS $$ Description $$;
COMMENT ON COLUMN ampdescript.lddate IS $$ Load date $$;

-- Table: AMPLITUDE
CREATE TABLE IF NOT EXISTS amplitude (
    ampid BIGINT,
    arid BIGINT,
    parid BIGINT,
    chan VARCHAR(8),
    amp DOUBLE PRECISION,
    per DOUBLE PRECISION,
    snr DOUBLE PRECISION,
    amptime DOUBLE PRECISION,
    time DOUBLE PRECISION,
    duration DOUBLE PRECISION,
    deltaf DOUBLE PRECISION,
    amptype VARCHAR(8),
    units VARCHAR(15),
    clip VARCHAR(1),
    inarrival VARCHAR(1),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (ampid),
    ,CONSTRAINT amplitude__ampid__ck CHECK (ampid > 0),
    ,CONSTRAINT amplitude__amptime__ck CHECK (amptime >= -9999999999.999),
    ,CONSTRAINT amplitude__amp__ck CHECK (amp > 0.0 OR amp = -1.0),
    ,CONSTRAINT amplitude__arid__ck CHECK (arid > 0),
    ,CONSTRAINT amplitude__clip__ck CHECK (clip IN ('c','n','-')),
    ,CONSTRAINT amplitude__deltaf__ck CHECK (deltaf >= 0.0 OR deltaf = -1.0),
    ,CONSTRAINT amplitude__duration__ck CHECK (duration >= 0.0 OR duration = -999.0),
    ,CONSTRAINT amplitude__inarrival__ck CHECK (inarrival IN ('y','n')),
    ,CONSTRAINT amplitude__per__ck CHECK (per > 0.0 OR per = -1.0),
    ,CONSTRAINT amplitude__snr__ck CHECK (snr > 0.0 OR snr = -1.0),
    ,CONSTRAINT amplitude__time__ck CHECK (time >= -9999999999.999),
    ,CONSTRAINT amplitude__units__ck CHECK (units IN ('nm', 'log10Nm', 'Pa', 'uPa', 'Hz', '-'))
);
COMMENT ON TABLE amplitude IS $$ The amplitude table contains arrival-based and origin-based amplitude measurements. The amplitude measurement is describ ed in ampdescript. $$;
COMMENT ON COLUMN amplitude.ampid IS $$ Amplitude identifier $$;
COMMENT ON COLUMN amplitude.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN amplitude.parid IS $$ Predicted arrival identifier $$;
COMMENT ON COLUMN amplitude.chan IS $$ Channel code $$;
COMMENT ON COLUMN amplitude.amp IS $$ Amplitude $$;
COMMENT ON COLUMN amplitude.per IS $$ Period(s) $$;
COMMENT ON COLUMN amplitude.snr IS $$ Signal-to-noise ratio $$;
COMMENT ON COLUMN amplitude.amptime IS $$ Time of amplitude measure $$;
COMMENT ON COLUMN amplitude.time IS $$ Start time of measurement window $$;
COMMENT ON COLUMN amplitude.duration IS $$ Duration of measurement window $$;
COMMENT ON COLUMN amplitude.deltaf IS $$ Sample interval width $$;
COMMENT ON COLUMN amplitude.amptype IS $$ Amplitude measure descriptor $$;
COMMENT ON COLUMN amplitude.units IS $$ Units $$;
COMMENT ON COLUMN amplitude.clip IS $$ Clipped flag $$;
COMMENT ON COLUMN amplitude.inarrival IS $$ y or n flag indicating if amplitude (amp) is the same as the amp in the arrival table $$;
COMMENT ON COLUMN amplitude.auth IS $$ Author $$;
COMMENT ON COLUMN amplitude.lddate IS $$ Load date $$;

-- Table: AMPLITUDE_DYN_PARS_DBL
CREATE TABLE IF NOT EXISTS amplitude_dyn_pars_dbl (
    ampid BIGINT,
    group_name VARCHAR(48),
    param_name VARCHAR(48),
    d_value DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (group_name),
    ,CONSTRAINT amp_dynpars_dbl_ampid_ck CHECK (AMPID > 0),
    ,CONSTRAINT amp_dynpars_dbl_d_value_ck CHECK (D_VALUE >= -9999999999.999),
    ,CONSTRAINT amp_dynpars_dbl_group_name_ck CHECK (GROUP_NAME IN('DETECT','FK','MEASURE','ONSET')),
    ,CONSTRAINT amp_dynpars_dbl_param_name_ck CHECK (PARAM_NAME IN('FILTERID','LEAD','LAG'))
);
COMMENT ON TABLE amplitude_dyn_pars_dbl IS $$ The amplitude_dyn_pars_dbl table will store amplitude parame ters and metadata (float values). Each record will contain o nly one piece of information. $$;
COMMENT ON COLUMN amplitude_dyn_pars_dbl.ampid IS $$ Unique amplitude identifier $$;
COMMENT ON COLUMN amplitude_dyn_pars_dbl.group_name IS $$ General function or purpose where attribute is used (e.g. FK) $$;
COMMENT ON COLUMN amplitude_dyn_pars_dbl.param_name IS $$ Attribute name (e.g. LEAD, LAG) $$;
COMMENT ON COLUMN amplitude_dyn_pars_dbl.d_value IS $$ Double precision value $$;
COMMENT ON COLUMN amplitude_dyn_pars_dbl.lddate IS $$ Load date $$;

-- Table: AMPLITUDE_DYN_PARS_INT
CREATE TABLE IF NOT EXISTS amplitude_dyn_pars_int (
    ampid BIGINT,
    group_name VARCHAR(48),
    param_name VARCHAR(48),
    i_value BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (param_name),
    ,CONSTRAINT amp_dynpars_int_ampid_ck CHECK (AMPID > 0),
    ,CONSTRAINT amp_dynpars_int_group_name_ck CHECK (GROUP_NAME IN('DETECT','FK','MEASURE','ONSET')),
    ,CONSTRAINT amp_dynpars_int_param_name_ck CHECK (PARAM_NAME IN('FILTERID','LEAD','LAG'))
);
COMMENT ON TABLE amplitude_dyn_pars_int IS $$ The amplitude_dyn_pars_int table will store amplitude parame ters and metadata (integer values). Each record will contain only one piece of information. $$;
COMMENT ON COLUMN amplitude_dyn_pars_int.ampid IS $$ Unique amplitude identifier $$;
COMMENT ON COLUMN amplitude_dyn_pars_int.group_name IS $$ General function or purpose where attribute is used (e.g. FK) $$;
COMMENT ON COLUMN amplitude_dyn_pars_int.param_name IS $$ Attribute name (e.g. LEAD, LAG) $$;
COMMENT ON COLUMN amplitude_dyn_pars_int.i_value IS $$ Integer value $$;
COMMENT ON COLUMN amplitude_dyn_pars_int.lddate IS $$ Load date $$;

-- Table: AMPLITUDE_DYN_PARS_STR
CREATE TABLE IF NOT EXISTS amplitude_dyn_pars_str (
    ampid BIGINT,
    group_name VARCHAR(48),
    param_name VARCHAR(48),
    s_value VARCHAR(1024),
    lddate TIMESTAMP,
    ,PRIMARY KEY (param_name),
    ,CONSTRAINT amp_dynpars_str_ampid_ck CHECK (AMPID > 0),
    ,CONSTRAINT amp_dynpars_str_group_name_ck CHECK (GROUP_NAME IN('DETECT','FK','MEASURE','ONSET')),
    ,CONSTRAINT amp_dynpars_str_param_name_ck CHECK (PARAM_NAME IN('FILTERID','LEAD','LAG'))
);
COMMENT ON TABLE amplitude_dyn_pars_str IS $$ The amplitude_dyn_pars_str table will store amplitude parame ters and metadata (string values). Each record will contain only one piece of information. $$;
COMMENT ON COLUMN amplitude_dyn_pars_str.ampid IS $$ Unique amplitude identifier $$;
COMMENT ON COLUMN amplitude_dyn_pars_str.group_name IS $$ General function or purpose where attribute is used (e.g. FK) $$;
COMMENT ON COLUMN amplitude_dyn_pars_str.param_name IS $$ Attribute name (e.g. LEAD, LAG) $$;
COMMENT ON COLUMN amplitude_dyn_pars_str.s_value IS $$ String value $$;
COMMENT ON COLUMN amplitude_dyn_pars_str.lddate IS $$ Load date $$;

-- Table: AOI
CREATE TABLE IF NOT EXISTS aoi (
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    aoi_geochar VARCHAR(1),
    lfaoi_geochar VARCHAR(1),
    depth_geochar VARCHAR(1),
    seismic_geochar VARCHAR(1),
    terrain_geochar VARCHAR(1),
    ondate INTEGER,
    offdate INTEGER,
    lddate TIMESTAMP,
    ,PRIMARY KEY (lon),
    ,CONSTRAINT aoi__depth_geochar__ck CHECK (depth_geochar IN ('S', 'D')),
    ,CONSTRAINT aoi__geochar__ck CHECK (aoi_geochar IN ('A', 'O' )),
    ,CONSTRAINT aoi__lat__ck CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT aoi__lon__ck CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT aoi__seismic_geochar__ck CHECK (seismic_geochar IN ('A', 'S')),
    ,CONSTRAINT aoi__terrain_geochar__ck CHECK (terrain_geochar IN ('L', 'O')),
    ,CONSTRAINT lfaoi__geochar__ck CHECK (lfaoi_geochar IN ('A', 'O' ))
);
COMMENT ON TABLE aoi IS $$ The aoi table contains geographic characteristics of a parti cluar region of the Earth, based on five criteria: aoi_geoch ar, depth_geochar, lfaoi_geochar, seismic_geochar, and terra in_geochar. The entire content of this table is classified S ECRET. $$;
COMMENT ON COLUMN aoi.lat IS $$ Latitude $$;
COMMENT ON COLUMN aoi.lon IS $$ Longitude $$;
COMMENT ON COLUMN aoi.aoi_geochar IS $$ Area of interest geographic region characteristic $$;
COMMENT ON COLUMN aoi.lfaoi_geochar IS $$ Look Forward Area of interest geographic region characteristic $$;
COMMENT ON COLUMN aoi.depth_geochar IS $$ Depth geographic region characteristic $$;
COMMENT ON COLUMN aoi.seismic_geochar IS $$ Seismic geographic region characteristic $$;
COMMENT ON COLUMN aoi.terrain_geochar IS $$ Terrain geographic region characteristic $$;
COMMENT ON COLUMN aoi.ondate IS $$ Julian on date $$;
COMMENT ON COLUMN aoi.offdate IS $$ Julian off date $$;
COMMENT ON COLUMN aoi.lddate IS $$ Load date $$;

-- Table: APMA
CREATE TABLE IF NOT EXISTS apma (
    phase VARCHAR(8),
    arid BIGINT,
    freq DOUBLE PRECISION,
    snr DOUBLE PRECISION,
    ampp DOUBLE PRECISION,
    amps DOUBLE PRECISION,
    amplr DOUBLE PRECISION,
    rect DOUBLE PRECISION,
    plans DOUBLE PRECISION,
    planlr DOUBLE PRECISION,
    hvratp DOUBLE PRECISION,
    hvrat DOUBLE PRECISION,
    hmxmn DOUBLE PRECISION,
    inang3 DOUBLE PRECISION,
    seazp DOUBLE PRECISION,
    seazs DOUBLE PRECISION,
    seazlr DOUBLE PRECISION,
    inang1 DOUBLE PRECISION,
    pphasetime DOUBLE PRECISION,
    sphasetime DOUBLE PRECISION,
    auth VARCHAR(15),
    apmarid BIGINT,
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (arid),
    ,CONSTRAINT apma__amplr__ck CHECK (amplr > 0.0 OR amplr = -1.0),
    ,CONSTRAINT apma__ampp__ck CHECK (ampp > 0.0 OR ampp = -1.0),
    ,CONSTRAINT apma__amps__ck CHECK (amps > 0.0 OR amps = -1.0),
    ,CONSTRAINT apma__apmarid__ck CHECK (apmarid > 0 OR apmarid = -1),
    ,CONSTRAINT apma__arid__ck CHECK (arid > 0),
    ,CONSTRAINT apma__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT apma__freq__ck CHECK (freq > 0.0 OR freq = -1.0),
    ,CONSTRAINT apma__hmxmn__ck CHECK (hmxmn >= 0.0 OR hmxmn = -1.0),
    ,CONSTRAINT apma__hvratp__ck CHECK (hvratp >= 0.0 OR hvratp = -1.0),
    ,CONSTRAINT apma__hvrat__ck CHECK (hvrat >= 0.0 OR hvrat = -1.0),
    ,CONSTRAINT apma__inang1__ck CHECK ((inang1 >= 0.0 AND inang1 < 90.0) OR inang1 = -1.0),
    ,CONSTRAINT apma__inang3__ck CHECK ((inang3 >= 0.0 AND inang3 < 90.0) OR inang3 = -1.0),
    ,CONSTRAINT apma__planlr__ck CHECK ((planlr >= 0.0 AND planlr <= 1.0) OR planlr = -1.0),
    ,CONSTRAINT apma__plans__ck CHECK ((plans >= 0.0 AND plans <= 1.0) OR plans = -1.0),
    ,CONSTRAINT apma__pphasetime__ck CHECK (pphasetime > 0.0 OR pphasetime = -9999999999.999),
    ,CONSTRAINT apma__rect__ck CHECK ((rect >= 0.0 AND rect <= 1.0) OR rect = -1.0),
    ,CONSTRAINT apma__seazlr__ck CHECK ((seazlr >= 0.0 AND seazlr <= 360.0) OR seazlr = -999.0),
    ,CONSTRAINT apma__seazp__ck CHECK ((seazp >= 0.0 AND seazp <= 360.0) OR seazp = -999.0),
    ,CONSTRAINT apma__seazs__ck CHECK ((seazs >= 0.0 AND seazs <= 360.0) OR seazs = -999.0),
    ,CONSTRAINT apma__snr__ck CHECK (snr > 0.0 OR snr = -1.0),
    ,CONSTRAINT apma__sphasetime__ck CHECK (sphasetime > 0.0 OR sphasetime = -9999999999.999)
);
COMMENT ON TABLE apma IS $$ The apma table contains results of particle motion analysis for a specific detection. $$;
COMMENT ON COLUMN apma.phase IS $$ Phase $$;
COMMENT ON COLUMN apma.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN apma.freq IS $$ Frequency $$;
COMMENT ON COLUMN apma.snr IS $$ Signal-to-noise ratio $$;
COMMENT ON COLUMN apma.ampp IS $$ P-phase amplitude $$;
COMMENT ON COLUMN apma.amps IS $$ S-phase amplitude $$;
COMMENT ON COLUMN apma.amplr IS $$ Rayleigh-phase amplitude $$;
COMMENT ON COLUMN apma.rect IS $$ Rectilinearity $$;
COMMENT ON COLUMN apma.plans IS $$ S-phase planarity $$;
COMMENT ON COLUMN apma.planlr IS $$ Rayleigh-phase planarity $$;
COMMENT ON COLUMN apma.hvratp IS $$ P-phase horizontal-to-vertical ratio $$;
COMMENT ON COLUMN apma.hvrat IS $$ S-phase horizontal-to-vertical ratio $$;
COMMENT ON COLUMN apma.hmxmn IS $$ Maximum-to-minimum horizontal ratio $$;
COMMENT ON COLUMN apma.inang3 IS $$ Short-axis incidence angle $$;
COMMENT ON COLUMN apma.seazp IS $$ P-phase observed azimuth $$;
COMMENT ON COLUMN apma.seazs IS $$ S-phase observed azimuth $$;
COMMENT ON COLUMN apma.seazlr IS $$ Rayleigh-phase observed azimuth $$;
COMMENT ON COLUMN apma.inang1 IS $$ Long-axis incidence angle $$;
COMMENT ON COLUMN apma.pphasetime IS $$ P-phase extraction time $$;
COMMENT ON COLUMN apma.sphasetime IS $$ S-phase extraction time $$;
COMMENT ON COLUMN apma.auth IS $$ Author $$;
COMMENT ON COLUMN apma.apmarid IS $$ apma recipe identifier $$;
COMMENT ON COLUMN apma.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN apma.lddate IS $$ Load date $$;

-- Table: AR_INFO
CREATE TABLE IF NOT EXISTS ar_info (
    orid BIGINT,
    arid BIGINT,
    time_error_code INTEGER,
    az_error_code INTEGER,
    slow_error_code INTEGER,
    src_dpnt_corr_type INTEGER,
    vmodel VARCHAR(16),
    total_travel_time DOUBLE PRECISION,
    tt_table_value DOUBLE PRECISION,
    ellip_corr DOUBLE PRECISION,
    elev_corr DOUBLE PRECISION,
    bulk_static_sta_corr DOUBLE PRECISION,
    tt_src_dpnt_corr DOUBLE PRECISION,
    tt_model_error DOUBLE PRECISION,
    tt_meas_error DOUBLE PRECISION,
    tt_model_plus_meas_error DOUBLE PRECISION,
    az_src_dpnt_corr DOUBLE PRECISION,
    az_model_error DOUBLE PRECISION,
    az_meas_error DOUBLE PRECISION,
    az_model_plus_meas_error DOUBLE PRECISION,
    sl_src_dpnt_corr DOUBLE PRECISION,
    sl_model_error DOUBLE PRECISION,
    sl_meas_error DOUBLE PRECISION,
    sl_model_plus_meas_error DOUBLE PRECISION,
    time_import DOUBLE PRECISION,
    az_import DOUBLE PRECISION,
    slow_import DOUBLE PRECISION,
    slow_vec_res DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (arid),
    ,CONSTRAINT ar_info__arid__ck CHECK (arid > 0),
    ,CONSTRAINT ar_info__az_error_code__ck CHECK (az_error_code >= 0 AND az_error_code <= 19),
    ,CONSTRAINT ar_info__az_import__ck CHECK ((az_import >= 0.0 AND az_import <= 1.0) OR az_import = -1.0),
    ,CONSTRAINT ar_info__az_meas_error__ck CHECK ((az_meas_error > 0.0 AND az_meas_error <= 180.0) OR az_meas_error= -1.0),
    ,CONSTRAINT ar_info__az_model_error__ck CHECK ((az_model_error > 0.0 AND az_model_error <= 180.0) OR az_model_error = -1.0),
    ,CONSTRAINT ar_info__az_mod_pls_ms_err__ck CHECK ((az_model_plus_meas_error > 0.0 AND az_model_plus_meas_error <= 360.0) OR az_model_plus_meas_error = -1.0),
    ,CONSTRAINT ar_info__az_src_dpnt_corr__ck CHECK (az_src_dpnt_corr >= -180.0 AND az_src_dpnt_corr <= 180.0),
    ,CONSTRAINT ar_info__blk_stat_sta_corr__ck CHECK (bulk_static_sta_corr >= -50.0 AND bulk_static_sta_corr <= 50.0),
    ,CONSTRAINT ar_info__elev_corr__ck CHECK (elev_corr >= -50.0 AND elev_corr <= 50.0),
    ,CONSTRAINT ar_info__ellip_corr__ck CHECK (ellip_corr >= -50.0 AND ellip_corr <= 50.0),
    ,CONSTRAINT ar_info__orid__ck CHECK (orid > 0),
    ,CONSTRAINT ar_info__slow_error_code__ck CHECK (slow_error_code >= 0 AND slow_error_code <= 19),
    ,CONSTRAINT ar_info__slow_import__ck CHECK ((slow_import >= 0.0 AND slow_import <= 1.0) OR slow_import = -1.0),
    ,CONSTRAINT ar_info__slow_vec_res__ck CHECK ((slow_vec_res >= -1000.0 AND slow_vec_res <= 1000.0) OR slow_vec_res = -999),
    ,CONSTRAINT ar_info__sl_meas_error__ck CHECK ((sl_meas_error > 0.0) OR sl_meas_error = -1.0),
    ,CONSTRAINT ar_info__sl_model_error__ck CHECK ((sl_model_error > 0.0) OR sl_model_error = -1.0),
    ,CONSTRAINT ar_info__sl_mod_pls_ms_err__ck CHECK ((sl_model_plus_meas_error > 0.0) OR sl_model_plus_meas_error = -1.0),
    ,CONSTRAINT ar_info__sl_src_dpnt_corr__ck CHECK (sl_src_dpnt_corr >= -50.0 AND sl_src_dpnt_corr <= 50.0),
    ,CONSTRAINT ar_info__src_dpnt_corr_ty__ck CHECK ((src_dpnt_corr_type > 0 AND src_dpnt_corr_type <= 15) OR src_dpnt_corr_type = 0),
    ,CONSTRAINT ar_info__time_error_code__ck CHECK (time_error_code >= 0 AND time_error_code <= 19),
    ,CONSTRAINT ar_info__time_import__ck CHECK ((time_import >= 0.0 AND time_import <= 1.0) OR time_import = -1.0),
    ,CONSTRAINT ar_info__total_travel_time__ck CHECK ((total_travel_time > 0.0 AND total_travel_time <= 86400) OR total_travel_time = -1.0),
    ,CONSTRAINT ar_info__tt_meas_error__ck CHECK ((tt_meas_error > 0.0) OR tt_meas_error = -1.0),
    ,CONSTRAINT ar_info__tt_model_error__ck CHECK ((tt_model_error > 0.0) OR tt_model_error = -1.0),
    ,CONSTRAINT ar_info__tt_mod_pls_ms_err__ck CHECK ((tt_model_plus_meas_error > 0.0) OR tt_model_plus_meas_error = -1.0),
    ,CONSTRAINT ar_info__tt_src_dpnt_corr__ck CHECK (tt_src_dpnt_corr >= -50.0 AND tt_src_dpnt_corr <= 50.0),
    ,CONSTRAINT ar_info__tt_table_value__ck CHECK ((tt_table_value > 0.0 AND tt_table_value <= 86400) OR tt_table_value = -1.0)
);
COMMENT ON TABLE ar_info IS $$ The ar_info table contains information about arrival observa tions used in event location. This includes the predicted ob servation values, the model used to predict the values, and all uncertainties associated with that observation. $$;
COMMENT ON COLUMN ar_info.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN ar_info.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN ar_info.time_error_code IS $$ Time error code $$;
COMMENT ON COLUMN ar_info.az_error_code IS $$ Azimuth error code $$;
COMMENT ON COLUMN ar_info.slow_error_code IS $$ Slowness error code $$;
COMMENT ON COLUMN ar_info.src_dpnt_corr_type IS $$ Correction code (TT, AZ, SLO) $$;
COMMENT ON COLUMN ar_info.vmodel IS $$ Velocity model for theoretical travel time (TT) and slowness (SLO) $$;
COMMENT ON COLUMN ar_info.total_travel_time IS $$ Predicted travel time including all corrections (seconds) $$;
COMMENT ON COLUMN ar_info.tt_table_value IS $$ Base model travel time (uncorrect) $$;
COMMENT ON COLUMN ar_info.ellip_corr IS $$ Time correction due to earth's ellipticity (seconds) $$;
COMMENT ON COLUMN ar_info.elev_corr IS $$ Time correction due to station elevation (seconds) $$;
COMMENT ON COLUMN ar_info.bulk_static_sta_corr IS $$ Static station correction to travel time (seconds) $$;
COMMENT ON COLUMN ar_info.tt_src_dpnt_corr IS $$ Source-specific travel time correction (seconds) $$;
COMMENT ON COLUMN ar_info.tt_model_error IS $$ Travel time model uncertainty (seconds) $$;
COMMENT ON COLUMN ar_info.tt_meas_error IS $$ Travel time measurement uncertainty (seconds) $$;
COMMENT ON COLUMN ar_info.tt_model_plus_meas_error IS $$ Combined travel time model and measurement uncertainty (seconds) $$;
COMMENT ON COLUMN ar_info.az_src_dpnt_corr IS $$ Source-specific azimuth correction (degrees) $$;
COMMENT ON COLUMN ar_info.az_model_error IS $$ Azimuth model uncertainty (degrees) $$;
COMMENT ON COLUMN ar_info.az_meas_error IS $$ Azimuth measurement uncertainty (degrees) $$;
COMMENT ON COLUMN ar_info.az_model_plus_meas_error IS $$ Combined azimuth model and measurement uncertainty (degrees) $$;
COMMENT ON COLUMN ar_info.sl_src_dpnt_corr IS $$ Source-specific slowness correction (s/deg) $$;
COMMENT ON COLUMN ar_info.sl_model_error IS $$ Slowness model uncertainty (s/deg) $$;
COMMENT ON COLUMN ar_info.sl_meas_error IS $$ Slowness measurement uncertainty (s/deg) $$;
COMMENT ON COLUMN ar_info.sl_model_plus_meas_error IS $$ Combined slowness model and measurement uncertainty (s/deg) $$;
COMMENT ON COLUMN ar_info.time_import IS $$ Weight applied to travel time in event solution $$;
COMMENT ON COLUMN ar_info.az_import IS $$ Weight applied to azimuth in event solution $$;
COMMENT ON COLUMN ar_info.slow_import IS $$ Weight applied to slowness in event solution $$;
COMMENT ON COLUMN ar_info.slow_vec_res IS $$ Residual between predicted and observed FK vector (s/deg) $$;
COMMENT ON COLUMN ar_info.lddate IS $$ Load date $$;

-- Table: ARRIVAL
CREATE TABLE IF NOT EXISTS arrival (
    sta VARCHAR(6),
    time DOUBLE PRECISION,
    arid BIGINT,
    jdate INTEGER,
    stassid BIGINT,
    chanid BIGINT,
    chan VARCHAR(8),
    iphase VARCHAR(8),
    stype VARCHAR(1),
    deltim DOUBLE PRECISION,
    azimuth DOUBLE PRECISION,
    delaz DOUBLE PRECISION,
    slow DOUBLE PRECISION,
    delslo DOUBLE PRECISION,
    ema DOUBLE PRECISION,
    rect DOUBLE PRECISION,
    amp DOUBLE PRECISION,
    per DOUBLE PRECISION,
    logat DOUBLE PRECISION,
    clip VARCHAR(1),
    fm VARCHAR(2),
    snr DOUBLE PRECISION,
    qual VARCHAR(1),
    auth VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (time),
    ,CONSTRAINT arrival_uk UNIQUE (arid),
    ,CONSTRAINT arrival__amp__ck CHECK (amp > 0.0 OR amp = -1.0),
    ,CONSTRAINT arrival__arid__ck CHECK (arid > 0),
    ,CONSTRAINT arrival__azimuth__ck CHECK ((azimuth >= 0.0 AND azimuth <= 360.0) OR azimuth = -1.0),
    ,CONSTRAINT arrival__chanid__ck CHECK (chanid > 0 OR chanid = -1),
    ,CONSTRAINT arrival__clip__ck CHECK (clip IN ('c','n','-')),
    ,CONSTRAINT arrival__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT arrival__delaz__ck CHECK (delaz > 0.0 OR delaz = -1.0),
    ,CONSTRAINT arrival__delslo__ck CHECK (delslo > 0.0 OR delslo = -1.0),
    ,CONSTRAINT arrival__deltim__ck CHECK (deltim > 0.0 OR deltim = -1.0),
    ,CONSTRAINT arrival__ema__ck CHECK ((ema >= 0.0 AND ema <= 90.0) OR (ema = -1.0)),
    ,CONSTRAINT arrival__fm__ck CHECK (fm IN ('cu','cr','c.','du','dr','d.','.u','.r','..','-')),
    ,CONSTRAINT arrival__jdate__ck CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT arrival__logat__ck CHECK (logat > 0.0 OR logat = -999.0),
    ,CONSTRAINT arrival__per__ck CHECK (per > 0.0 OR per = -1.0),
    ,CONSTRAINT arrival__qual__ck CHECK (qual IN ('i', 'e', 'w', '-', '1', '2', '3', '4')),
    ,CONSTRAINT arrival__rect__ck CHECK ((rect >= 0.0 AND rect <= 1.0) OR rect = -1.0),
    ,CONSTRAINT arrival__slow__ck CHECK (slow >= 0.0 OR slow = -1.0),
    ,CONSTRAINT arrival__snr__ck CHECK (snr > 0.0 OR snr = -1.0),
    ,CONSTRAINT arrival__stassid__ck CHECK (stassid > 0 OR stassid = -1),
    ,CONSTRAINT arrival__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT arrival__stype__ck CHECK (stype IN ('l', 'r', 't', 'm', 'g', 'e', '-')),
    ,CONSTRAINT arrival__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE arrival IS $$ The arrival table contains summary information about arrival s. $$;
COMMENT ON COLUMN arrival.sta IS $$ Station code $$;
COMMENT ON COLUMN arrival.time IS $$ Epoch time $$;
COMMENT ON COLUMN arrival.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN arrival.jdate IS $$ Julian date $$;
COMMENT ON COLUMN arrival.stassid IS $$ Arrival group indentification $$;
COMMENT ON COLUMN arrival.chanid IS $$ Instrument identifier $$;
COMMENT ON COLUMN arrival.chan IS $$ Channel code $$;
COMMENT ON COLUMN arrival.iphase IS $$ Reported phase $$;
COMMENT ON COLUMN arrival.stype IS $$ Signal type $$;
COMMENT ON COLUMN arrival.deltim IS $$ Time uncertainty $$;
COMMENT ON COLUMN arrival.azimuth IS $$ Observed azimuth $$;
COMMENT ON COLUMN arrival.delaz IS $$ Azimuth uncertainty $$;
COMMENT ON COLUMN arrival.slow IS $$ Observed slowness, seconds/degree $$;
COMMENT ON COLUMN arrival.delslo IS $$ Slowness uncertainty $$;
COMMENT ON COLUMN arrival.ema IS $$ Emergence angle $$;
COMMENT ON COLUMN arrival.rect IS $$ Rectilinearity $$;
COMMENT ON COLUMN arrival.amp IS $$ Amplitude, instrument corrected $$;
COMMENT ON COLUMN arrival.per IS $$ Period $$;
COMMENT ON COLUMN arrival.logat IS $$ Log (amp/per) $$;
COMMENT ON COLUMN arrival.clip IS $$ Clipped flag $$;
COMMENT ON COLUMN arrival.fm IS $$ First motion $$;
COMMENT ON COLUMN arrival.snr IS $$ Signal-to-noise ratio $$;
COMMENT ON COLUMN arrival.qual IS $$ Signal onset quality $$;
COMMENT ON COLUMN arrival.auth IS $$ Author $$;
COMMENT ON COLUMN arrival.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN arrival.lddate IS $$ Load date $$;

-- Table: ARRIVAL_DYN_PARS_DBL
CREATE TABLE IF NOT EXISTS arrival_dyn_pars_dbl (
    arid BIGINT,
    group_name VARCHAR(48),
    param_name VARCHAR(48),
    d_value DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (group_name),
    ,CONSTRAINT arr_dynpars_dbl_arid_ck CHECK (ARID > 0),
    ,CONSTRAINT arr_dynpars_dbl_d_value_ck CHECK (D_VALUE >= -9999999999.999),
    ,CONSTRAINT arr_dynpars_dbl_group_name_ck CHECK (GROUP_NAME IN('DETECT','FK','MEASURE','ONSET')),
    ,CONSTRAINT arr_dynpars_dbl_param_name_ck CHECK (PARAM_NAME IN('FILTERID','LEAD','LAG'))
);
COMMENT ON TABLE arrival_dyn_pars_dbl IS $$ The arrival_dyn_pars_dbl table will store arrival parameters and metadata (float values). Each record will contain only one piece of information. $$;
COMMENT ON COLUMN arrival_dyn_pars_dbl.arid IS $$ Unique arrival identifier $$;
COMMENT ON COLUMN arrival_dyn_pars_dbl.group_name IS $$ General function or purpose where attribute is used (e.g. DETECT, ONSET, FK) $$;
COMMENT ON COLUMN arrival_dyn_pars_dbl.param_name IS $$ Attribute name (e.g. FILTERID) $$;
COMMENT ON COLUMN arrival_dyn_pars_dbl.d_value IS $$ Double precision value $$;
COMMENT ON COLUMN arrival_dyn_pars_dbl.lddate IS $$ Load date $$;

-- Table: ARRIVAL_DYN_PARS_INT
CREATE TABLE IF NOT EXISTS arrival_dyn_pars_int (
    arid BIGINT,
    group_name VARCHAR(48),
    param_name VARCHAR(48),
    i_value BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (param_name),
    ,CONSTRAINT arr_dynpars_int_arid_ck CHECK (ARID > 0),
    ,CONSTRAINT arr_dynpars_int_group_name_ck CHECK (GROUP_NAME IN('DETECT','FK','MEASURE','ONSET')),
    ,CONSTRAINT arr_dynpars_int_param_name_ck CHECK (PARAM_NAME IN('FILTERID','LEAD','LAG'))
);
COMMENT ON TABLE arrival_dyn_pars_int IS $$ The arrival_dyn_pars_int table will store arrival parameters and metadata (integer values). Each record will contain onl y one piece of information. $$;
COMMENT ON COLUMN arrival_dyn_pars_int.arid IS $$ Unique arrival identifier $$;
COMMENT ON COLUMN arrival_dyn_pars_int.group_name IS $$ General function or purpose where attribute is used (e.g. DETECT, ONSET, FK) $$;
COMMENT ON COLUMN arrival_dyn_pars_int.param_name IS $$ Attribute name (e.g. FILTERID) $$;
COMMENT ON COLUMN arrival_dyn_pars_int.i_value IS $$ Integer value $$;
COMMENT ON COLUMN arrival_dyn_pars_int.lddate IS $$ Load date $$;

-- Table: ARRIVAL_DYN_PARS_STR
CREATE TABLE IF NOT EXISTS arrival_dyn_pars_str (
    arid BIGINT,
    group_name VARCHAR(48),
    param_name VARCHAR(48),
    s_value VARCHAR(1024),
    lddate TIMESTAMP,
    ,PRIMARY KEY (param_name),
    ,CONSTRAINT arr_dynpars_str_arid_ck CHECK (ARID > 0),
    ,CONSTRAINT arr_dynpars_str_group_name_ck CHECK (GROUP_NAME IN('DETECT','FK','MEASURE','ONSET')),
    ,CONSTRAINT arr_dynpars_str_param_name_ck CHECK (PARAM_NAME IN('FILTERID','LEAD','LAG'))
);
COMMENT ON TABLE arrival_dyn_pars_str IS $$ The arrival_dyn_pars_str table will store arrival parameters and metadata (string values). Each record will contain only one piece of information. $$;
COMMENT ON COLUMN arrival_dyn_pars_str.arid IS $$ Unique arrival identifier $$;
COMMENT ON COLUMN arrival_dyn_pars_str.group_name IS $$ General function or purpose where attribute is used (e.g. DETECT, ONSET, FK) $$;
COMMENT ON COLUMN arrival_dyn_pars_str.param_name IS $$ Attribute name (e.g. FILTERID) $$;
COMMENT ON COLUMN arrival_dyn_pars_str.s_value IS $$ String value $$;
COMMENT ON COLUMN arrival_dyn_pars_str.lddate IS $$ Load date $$;

-- Table: ARRIVAL_TAG
CREATE TABLE IF NOT EXISTS arrival_tag (
    arid BIGINT,
    process_mode VARCHAR(32),
    process_attribute VARCHAR(32),
    lddate TIMESTAMP,
    ,PRIMARY KEY (arid),
    ,CONSTRAINT arrival_tag_process_mode_ck CHECK (process_mode IN ('GL', 'SL', 'LF', 'MEA', 'XA', 'SL-reviewed', 'GL-reviewed', 'SL-only, GL-mod', 'GL-only , SL-mod', 'ANALYST', 'HY', '-')),
    ,CONSTRAINT arrival_tag__arid__ck CHECK (arid > 0)
);
COMMENT ON TABLE arrival_tag IS $$ The arrival_tag table contains information to indicate which mode was used to generate the arrival. $$;
COMMENT ON COLUMN arrival_tag.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN arrival_tag.process_mode IS $$ Processing mode used to generate arrival $$;
COMMENT ON COLUMN arrival_tag.process_attribute IS $$ Attribute of processing mode $$;
COMMENT ON COLUMN arrival_tag.lddate IS $$ Load date $$;

-- Table: ASSOC
CREATE TABLE IF NOT EXISTS assoc (
    arid BIGINT,
    orid BIGINT,
    sta VARCHAR(6),
    phase VARCHAR(8),
    belief DOUBLE PRECISION,
    delta DOUBLE PRECISION,
    seaz DOUBLE PRECISION,
    esaz DOUBLE PRECISION,
    timeres DOUBLE PRECISION,
    timedef VARCHAR(1),
    azres DOUBLE PRECISION,
    azdef VARCHAR(1),
    slores DOUBLE PRECISION,
    slodef VARCHAR(1),
    emares DOUBLE PRECISION,
    wgt DOUBLE PRECISION,
    vmodel VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid),
    ,CONSTRAINT assoc__arid__ck CHECK (arid > 0),
    ,CONSTRAINT assoc__azdef__ck CHECK (azdef IN ('d', 'D', 'n', 'N', '-', 'X', 'x')),
    ,CONSTRAINT assoc__azres__ck CHECK ((azres >= -180.0 AND azres <= 180.0) OR azres = -999.0),
    ,CONSTRAINT assoc__belief__ck CHECK ((belief >= 0.0 AND belief <= 1.0) OR belief = -1.0),
    ,CONSTRAINT assoc__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT assoc__delta__ck CHECK (delta >= 0.0 OR delta = -1.0),
    ,CONSTRAINT assoc__emares__ck CHECK ((emares >= -90.0 AND emares <= 90.0) OR emares = -999.0),
    ,CONSTRAINT assoc__esaz__ck CHECK ((esaz >= 0.0 AND esaz <= 360.0) OR esaz = -999.0),
    ,CONSTRAINT assoc__orid__ck CHECK (orid > 0),
    ,CONSTRAINT assoc__seaz__ck CHECK ((seaz >= 0.0 AND seaz <= 360.0) OR seaz = -999.0),
    ,CONSTRAINT assoc__slodef__ck CHECK (slodef IN ('d', 'D', 'n', 'N', '-', 'X', 'x')),
    ,CONSTRAINT assoc__slores__ck CHECK (slores > -999.0 OR slores = -999.0),
    ,CONSTRAINT assoc__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT assoc__timedef__ck CHECK (timedef IN ('d', 'D', 'n', 'N', '-', 'X', 'x')),
    ,CONSTRAINT assoc__timeres__ck CHECK (timeres > -999.0 OR timeres = -999.0),
    ,CONSTRAINT assoc__wgt__ck CHECK (wgt > 0.0 OR wgt = -1.0)
);
COMMENT ON TABLE assoc IS $$ The assoc table contains information that connects arrivals (entries in the arrival table) to a particular origin. $$;
COMMENT ON COLUMN assoc.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN assoc.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN assoc.sta IS $$ Station code $$;
COMMENT ON COLUMN assoc.phase IS $$ Associated phase $$;
COMMENT ON COLUMN assoc.belief IS $$ Phase confidence $$;
COMMENT ON COLUMN assoc.delta IS $$ Station-to-event distance $$;
COMMENT ON COLUMN assoc.seaz IS $$ Station-to-event azimuth $$;
COMMENT ON COLUMN assoc.esaz IS $$ Event-to-station azimuth $$;
COMMENT ON COLUMN assoc.timeres IS $$ Time residual $$;
COMMENT ON COLUMN assoc.timedef IS $$ Time = defining (d,D), nondefining (n,N,x,X) $$;
COMMENT ON COLUMN assoc.azres IS $$ Azimuth residual $$;
COMMENT ON COLUMN assoc.azdef IS $$ Azimuth = defining (d,D), nondefining (n,N,x,X) $$;
COMMENT ON COLUMN assoc.slores IS $$ Slowness residual $$;
COMMENT ON COLUMN assoc.slodef IS $$ Slowness = defining (d,D), nondefining (n,N,x,X) $$;
COMMENT ON COLUMN assoc.emares IS $$ Incidence angle residual $$;
COMMENT ON COLUMN assoc.wgt IS $$ Location weight $$;
COMMENT ON COLUMN assoc.vmodel IS $$ Velocity model $$;
COMMENT ON COLUMN assoc.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN assoc.lddate IS $$ Load date $$;

-- Table: ASSOC_GA
CREATE TABLE IF NOT EXISTS assoc_ga (
    arid BIGINT,
    orid BIGINT,
    sta VARCHAR(6),
    phase VARCHAR(8),
    belief DOUBLE PRECISION,
    delta DOUBLE PRECISION,
    seaz DOUBLE PRECISION,
    esaz DOUBLE PRECISION,
    timeres DOUBLE PRECISION,
    timedef VARCHAR(1),
    azres DOUBLE PRECISION,
    azdef VARCHAR(1),
    slores DOUBLE PRECISION,
    slodef VARCHAR(1),
    emares DOUBLE PRECISION,
    wgt DOUBLE PRECISION,
    vmodel VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid)
);
COMMENT ON TABLE assoc_ga IS $$ The assoc_ga table is used by the GA application to store te mporary associations. $$;
COMMENT ON COLUMN assoc_ga.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN assoc_ga.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN assoc_ga.sta IS $$ Station code $$;
COMMENT ON COLUMN assoc_ga.phase IS $$ Associated phase $$;
COMMENT ON COLUMN assoc_ga.belief IS $$ Phase confidence $$;
COMMENT ON COLUMN assoc_ga.delta IS $$ Station-to-event distance $$;
COMMENT ON COLUMN assoc_ga.seaz IS $$ Station-to-event azimuth $$;
COMMENT ON COLUMN assoc_ga.esaz IS $$ Event-to-station azimuth $$;
COMMENT ON COLUMN assoc_ga.timeres IS $$ Time residual $$;
COMMENT ON COLUMN assoc_ga.timedef IS $$ Time = defining (d,D), nondefining (n,N,x,X) $$;
COMMENT ON COLUMN assoc_ga.azres IS $$ Azimuth residual $$;
COMMENT ON COLUMN assoc_ga.azdef IS $$ Azimuth = defining (d,D), nondefining (n,N,x,X) $$;
COMMENT ON COLUMN assoc_ga.slores IS $$ Slowness residual $$;
COMMENT ON COLUMN assoc_ga.slodef IS $$ Slowness = defining (d,D), nondefining (n,N,x,X) $$;
COMMENT ON COLUMN assoc_ga.emares IS $$ Incidence angle residual $$;
COMMENT ON COLUMN assoc_ga.wgt IS $$ Location weight $$;
COMMENT ON COLUMN assoc_ga.vmodel IS $$ Velocity model $$;
COMMENT ON COLUMN assoc_ga.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN assoc_ga.lddate IS $$ Load date $$;

-- Table: ASSOC_GA_DEL
CREATE TABLE IF NOT EXISTS assoc_ga_del (
    arid BIGINT,
    orid BIGINT,
    sta VARCHAR(6),
    phase VARCHAR(8),
    belief DOUBLE PRECISION,
    delta DOUBLE PRECISION,
    seaz DOUBLE PRECISION,
    esaz DOUBLE PRECISION,
    timeres DOUBLE PRECISION,
    timedef VARCHAR(1),
    azres DOUBLE PRECISION,
    azdef VARCHAR(1),
    slores DOUBLE PRECISION,
    slodef VARCHAR(1),
    emares DOUBLE PRECISION,
    wgt DOUBLE PRECISION,
    vmodel VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid),
    ,CONSTRAINT assoc_ga_del__arid__ck CHECK (arid > 0),
    ,CONSTRAINT assoc_ga_del__azdef__ck CHECK (azdef IN ('d', 'D', 'n', 'N', '-', 'X', 'x')),
    ,CONSTRAINT assoc_ga_del__azres__ck CHECK ((azres >= -180.0 AND azres <= 180.0) OR azres = -999.0),
    ,CONSTRAINT assoc_ga_del__belief__ck CHECK ((belief >= 0.0 AND belief <= 1.0) OR belief = -1.0),
    ,CONSTRAINT assoc_ga_del__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT assoc_ga_del__delta__ck CHECK (delta >= 0.0 OR delta = -1.0),
    ,CONSTRAINT assoc_ga_del__emares__ck CHECK ((emares >= -90.0 AND emares <= 90.0) OR emares = -999.0),
    ,CONSTRAINT assoc_ga_del__esaz__ck CHECK ((esaz >= 0.0 AND esaz <= 360.0) OR esaz = -999.0),
    ,CONSTRAINT assoc_ga_del__orid__ck CHECK (orid > 0),
    ,CONSTRAINT assoc_ga_del__seaz__ck CHECK ((seaz >= 0.0 AND seaz <= 360.0) OR seaz = -999.0),
    ,CONSTRAINT assoc_ga_del__slodef__ck CHECK (slodef IN ('d', 'D', 'n', 'N', '-', 'X', 'x')),
    ,CONSTRAINT assoc_ga_del__slores__ck CHECK (slores > -999.0 OR slores = -999.0),
    ,CONSTRAINT assoc_ga_del__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT assoc_ga_del__timedef__ck CHECK (timedef IN ('d', 'D', 'n', 'N', '-', 'X', 'x')),
    ,CONSTRAINT assoc_ga_del__timeres__ck CHECK (timeres > -999.0 OR timeres = -999.0),
    ,CONSTRAINT assoc_ga_del__wgt__ck CHECK (wgt > 0.0 OR wgt = -1.0)
);
COMMENT ON TABLE assoc_ga_del IS $$ The assoc_ga_del table is used by the GA application to stor e deleted associations for later reference, if necessary. $$;
COMMENT ON COLUMN assoc_ga_del.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN assoc_ga_del.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN assoc_ga_del.sta IS $$ Station code $$;
COMMENT ON COLUMN assoc_ga_del.phase IS $$ Associated phase $$;
COMMENT ON COLUMN assoc_ga_del.belief IS $$ Phase confidence $$;
COMMENT ON COLUMN assoc_ga_del.delta IS $$ Station-to-event distance $$;
COMMENT ON COLUMN assoc_ga_del.seaz IS $$ Station-to-event azimuth $$;
COMMENT ON COLUMN assoc_ga_del.esaz IS $$ Event-to-station azimuth $$;
COMMENT ON COLUMN assoc_ga_del.timeres IS $$ Time residual $$;
COMMENT ON COLUMN assoc_ga_del.timedef IS $$ Time = defining (d,D), nondefining (n,N,x,X) $$;
COMMENT ON COLUMN assoc_ga_del.azres IS $$ Azimuth residual $$;
COMMENT ON COLUMN assoc_ga_del.azdef IS $$ Azimuth = defining (d,D), nondefining (n,N,x,X) $$;
COMMENT ON COLUMN assoc_ga_del.slores IS $$ Slowness residual $$;
COMMENT ON COLUMN assoc_ga_del.slodef IS $$ Slowness = defining (d,D), nondefining (n,N,x,X) $$;
COMMENT ON COLUMN assoc_ga_del.emares IS $$ Incidence angle residual $$;
COMMENT ON COLUMN assoc_ga_del.wgt IS $$ Location weight $$;
COMMENT ON COLUMN assoc_ga_del.vmodel IS $$ Velocity model $$;
COMMENT ON COLUMN assoc_ga_del.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN assoc_ga_del.lddate IS $$ Load date $$;

-- Table: BEAM
CREATE TABLE IF NOT EXISTS beam (
    wfid BIGINT,
    filterid BIGINT,
    azimuth DOUBLE PRECISION,
    slow DOUBLE PRECISION,
    descrip VARCHAR(50),
    lddate TIMESTAMP,
    ,PRIMARY KEY (wfid),
    ,CONSTRAINT beam__azimuth__ck CHECK ((azimuth >= 0.0 AND azimuth <= 360.0) OR azimuth = -1.0),
    ,CONSTRAINT beam__filterid__ck CHECK (filterid > 0 OR filterid = -1),
    ,CONSTRAINT beam__slow__ck CHECK (slow >= 0.0 OR slow = -1.0),
    ,CONSTRAINT beam__wfid__ck CHECK (wfid > 0)
);
COMMENT ON TABLE beam IS $$ The beam table stores the azimuth and slowness used during t he production of a beam. Whenever an origin beam is produced , a beam record is also produced and linked through the wfid to the beam waveform stored in the wfdisc table. $$;
COMMENT ON COLUMN beam.wfid IS $$ Waveform identifier $$;
COMMENT ON COLUMN beam.filterid IS $$ This is a TBD field created in anticipation of the Persistent Parameter module $$;
COMMENT ON COLUMN beam.azimuth IS $$ Azimuth $$;
COMMENT ON COLUMN beam.slow IS $$ Slowness of an arrival $$;
COMMENT ON COLUMN beam.descrip IS $$ Text description of the beam $$;
COMMENT ON COLUMN beam.lddate IS $$ Load date $$;

-- Table: BULLETIN_RELEASE
CREATE TABLE IF NOT EXISTS bulletin_release (
    erpid BIGINT,
    orid BIGINT,
    evid BIGINT,
    magid BIGINT,
    aoi_geochar VARCHAR(1),
    classification_comments VARCHAR(4000),
    classification_results VARCHAR(4000),
    grname VARCHAR(40),
    release_status VARCHAR(16),
    auth VARCHAR(15),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (erpid),
    ,CONSTRAINT bulletin_release__erpid__ck CHECK (erpid > 0),
    ,CONSTRAINT bulletin_release__evid__ck CHECK (evid > 0),
    ,CONSTRAINT bulletin_release__geochar__ck CHECK (aoi_geochar IN ('A', 'O' )),
    ,CONSTRAINT bulletin_release__magid__ck CHECK (magid >= 0 OR magid = -1),
    ,CONSTRAINT bulletin_release__orid__ck CHECK (orid > 0)
);
COMMENT ON TABLE bulletin_release IS $$ The bulletin release table contains . $$;
COMMENT ON COLUMN bulletin_release.erpid IS $$ Event Reporting Process identifier $$;
COMMENT ON COLUMN bulletin_release.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN bulletin_release.evid IS $$ Event identifier $$;
COMMENT ON COLUMN bulletin_release.magid IS $$ Magnitude identifier $$;
COMMENT ON COLUMN bulletin_release.aoi_geochar IS $$ Area of interest geographic region characteristic $$;
COMMENT ON COLUMN bulletin_release.classification_comments IS $$ Discrim and ECM comments $$;
COMMENT ON COLUMN bulletin_release.classification_results IS $$ Discrim and ECM results $$;
COMMENT ON COLUMN bulletin_release.grname IS $$ Geographic region name $$;
COMMENT ON COLUMN bulletin_release.release_status IS $$ Action being called for $$;
COMMENT ON COLUMN bulletin_release.auth IS $$ Source/originator $$;
COMMENT ON COLUMN bulletin_release.moddate IS $$ Modification date $$;
COMMENT ON COLUMN bulletin_release.lddate IS $$ Load date $$;

-- Table: BULLETIN_RELEASE_EXPORT
CREATE TABLE IF NOT EXISTS bulletin_release_export (
    erp_seq BIGINT,
    max_erpid BIGINT,
    auth VARCHAR(15),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (erp_seq),
    ,CONSTRAINT bull_rel_exp__erp_seq__ck CHECK (erp_seq > 0),
    ,CONSTRAINT bull_rel_exp__max_erpid__ck CHECK (max_erpid > 0)
);
COMMENT ON TABLE bulletin_release_export IS $$ The bulletin release export table contains information to tr ack Event Release files in the event they are not recieved a t the intended destination. $$;
COMMENT ON COLUMN bulletin_release_export.erp_seq IS $$ Event Release Process export sequence number $$;
COMMENT ON COLUMN bulletin_release_export.max_erpid IS $$ Maximum Event Release Process Identifier $$;
COMMENT ON COLUMN bulletin_release_export.auth IS $$ Source/originator $$;
COMMENT ON COLUMN bulletin_release_export.moddate IS $$ Modification date $$;
COMMENT ON COLUMN bulletin_release_export.lddate IS $$ Load date $$;

-- Table: BUTTERWORTH_FILTER
CREATE TABLE IF NOT EXISTS butterworth_filter (
    filterid BIGINT,
    filter_type VARCHAR(16),
    filter_order SMALLINT,
    filter_low DOUBLE PRECISION,
    filter_high DOUBLE PRECISION,
    filter_zeroph SMALLINT,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (filterid),
    ,CONSTRAINT butterworth_filter__fhi__ck CHECK (filter_high > 0 OR filter_high = -1),
    ,CONSTRAINT butterworth_filter__fid__ck CHECK (filterid > 0 OR filterid = -1),
    ,CONSTRAINT butterworth_filter__flow__ck CHECK (filter_low > 0 OR filter_low = -1),
    ,CONSTRAINT butterworth_filter__fo__ck CHECK ((filter_order >= 0 AND filter_order <= 99) OR filter_order = -1)
);
COMMENT ON TABLE butterworth_filter IS $$ The butterworth_filter table stores filter processing parame ter. $$;
COMMENT ON COLUMN butterworth_filter.filterid IS $$ ID number of a filter processing parameter $$;
COMMENT ON COLUMN butterworth_filter.filter_type IS $$ Type of Butterworth filter (BP, LP, HP) $$;
COMMENT ON COLUMN butterworth_filter.filter_order IS $$ Order of Butterworth filter $$;
COMMENT ON COLUMN butterworth_filter.filter_low IS $$ Filter low frequency $$;
COMMENT ON COLUMN butterworth_filter.filter_high IS $$ Filter high frequency $$;
COMMENT ON COLUMN butterworth_filter.filter_zeroph IS $$ This is a flag to indicate zero-phase filtering. If this is set to 0, the filter is not zero-phase. If this is set to 1, the filter is zero-phase i.e. no phase lag or group delay. $$;
COMMENT ON COLUMN butterworth_filter.auth IS $$ Author $$;
COMMENT ON COLUMN butterworth_filter.lddate IS $$ Load date $$;

-- Table: CHAN_GROUPS
CREATE TABLE IF NOT EXISTS chan_groups (
    class VARCHAR(16),
    name VARCHAR(20),
    sta VARCHAR(6),
    chan VARCHAR(8),
    duration DOUBLE PRECISION,
    inwfactivity SMALLINT,
    ondate INTEGER,
    offdate INTEGER,
    lddate TIMESTAMP,
    ,PRIMARY KEY (chan),
    ,CONSTRAINT chan_groups__duration__ck CHECK (duration > 0.0 OR duration = -1.0),
    ,CONSTRAINT chan_groups__inwfactivity__ck CHECK (inwfactivity IN (0,1)),
    ,CONSTRAINT chan_groups__offdate__ck CHECK ((offdate > 1901348 AND offdate < 3001000) OR offdate = -1),
    ,CONSTRAINT chan_groups__ondate__ck CHECK (ondate > 1901348 AND ondate < 3001000),
    ,CONSTRAINT chan_groups__sta__ck CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE chan_groups IS $$ The chan_groups table is used to indicate which sta/chan pai rs belong to a given class/name (wfactivity) group. $$;
COMMENT ON COLUMN chan_groups.class IS $$ Type of interval $$;
COMMENT ON COLUMN chan_groups.name IS $$ Name of interval $$;
COMMENT ON COLUMN chan_groups.sta IS $$ Station $$;
COMMENT ON COLUMN chan_groups.chan IS $$ Channel code $$;
COMMENT ON COLUMN chan_groups.duration IS $$ Duration in seconds of the time region $$;
COMMENT ON COLUMN chan_groups.inwfactivity IS $$ Indicates whether class/name/duration is in wfactivity or not $$;
COMMENT ON COLUMN chan_groups.ondate IS $$ On date $$;
COMMENT ON COLUMN chan_groups.offdate IS $$ Off date $$;
COMMENT ON COLUMN chan_groups.lddate IS $$ Load date $$;

-- Table: CHANNAME
CREATE TABLE IF NOT EXISTS channame (
    extern_sta VARCHAR(6),
    extern_chan VARCHAR(8),
    extern_auth VARCHAR(20),
    intern_sta VARCHAR(6),
    intern_chan VARCHAR(8),
    intern_chanid BIGINT,
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (extern_chan),
    ,CONSTRAINT channame__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT channame__intern_chanid__ck CHECK (intern_chanid > 0 OR intern_chanid = -1)
);
COMMENT ON TABLE channame IS $$ The channame table provides mapping between channel and stat ion names. $$;
COMMENT ON COLUMN channame.extern_sta IS $$ External station name $$;
COMMENT ON COLUMN channame.extern_chan IS $$ External channel name $$;
COMMENT ON COLUMN channame.extern_auth IS $$ External authority using this name $$;
COMMENT ON COLUMN channame.intern_sta IS $$ Internal station name $$;
COMMENT ON COLUMN channame.intern_chan IS $$ Internal channel name $$;
COMMENT ON COLUMN channame.intern_chanid IS $$ Internal channel ID $$;
COMMENT ON COLUMN channame.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN channame.lddate IS $$ Load date $$;

-- Table: CLASSIFICATION
CREATE TABLE IF NOT EXISTS classification (
    classification_id BIGINT,
    description VARCHAR(64),
    class_level_id BIGINT,
    class_dissem_id BIGINT,
    class_derived_id BIGINT,
    class_declass_id BIGINT,
    class_refer_id BIGINT,
    class_opr_id BIGINT,
    on_date TIMESTAMP,
    off_date TIMESTAMP,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    moddate TIMESTAMP,
    ,PRIMARY KEY (classification_id),
    ,CONSTRAINT class__classification_id__ck CHECK (classification_id > 0),
    ,CONSTRAINT class__class_declass_id__ck CHECK (class_declass_id > 0),
    ,CONSTRAINT class__class_derived_id__ck CHECK (class_derived_id > 0),
    ,CONSTRAINT class__class_dissem_id__ck CHECK (class_dissem_id > 0),
    ,CONSTRAINT class__class_level_id__ck CHECK (class_level_id > 0),
    ,CONSTRAINT class__class_opr_id__ck CHECK (class_opr_id > 0)
);
COMMENT ON TABLE classification IS $$ Contains the table ID information for other tables. Makes u p the overall classification consisting of classification le vel, control markings office of primary responsibility, sour ce used for classification and declassification instructions . $$;
COMMENT ON COLUMN classification.classification_id IS $$ Classification Identifier. $$;
COMMENT ON COLUMN classification.description IS $$ Classification description. $$;
COMMENT ON COLUMN classification.class_level_id IS $$ Classification Level Identifier. $$;
COMMENT ON COLUMN classification.class_dissem_id IS $$ Classification Dissemination Identifier. $$;
COMMENT ON COLUMN classification.class_derived_id IS $$ Classification Derived From Identifier. $$;
COMMENT ON COLUMN classification.class_declass_id IS $$ Class Declassify Identifier $$;
COMMENT ON COLUMN classification.class_refer_id IS $$ Class Refer To Identifier $$;
COMMENT ON COLUMN classification.class_opr_id IS $$ ID for the classification_opr table. This is the agency, office (or OPR) responsible for classification and classification date. $$;
COMMENT ON COLUMN classification.on_date IS $$ The date the classification becomes active. $$;
COMMENT ON COLUMN classification.off_date IS $$ The date the classification becomes inactive or obsolete. $$;
COMMENT ON COLUMN classification.auth IS $$ Author $$;
COMMENT ON COLUMN classification.lddate IS $$ Load Date $$;
COMMENT ON COLUMN classification.moddate IS $$ Modification date $$;

-- Table: CLASSIFICATION_DECLASSIFY _ON
CREATE TABLE IF NOT EXISTS classification_declassify _on (
    class_declass_id BIGINT,
    class_declass VARCHAR(4000),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (class_declass_id),
    ,CONSTRAINT class_declass_on__cd_id__ck CHECK (class_declass_id > 0)
);
COMMENT ON TABLE classification_declassify _on IS $$ Contains the declassification date and reference information . Used as part of the Executive Order Box. $$;
COMMENT ON COLUMN classification_declassify _on.class_declass_id IS $$ Class Declassify Identifier $$;
COMMENT ON COLUMN classification_declassify _on.class_declass IS $$ See comment on table. $$;
COMMENT ON COLUMN classification_declassify _on.auth IS $$ Author $$;
COMMENT ON COLUMN classification_declassify _on.lddate IS $$ Load Date $$;

-- Table: CLASSIFICATION_DERIVED_FR OM
CREATE TABLE IF NOT EXISTS classification_derived_fr om (
    class_derived_id BIGINT,
    class_derived VARCHAR(4000),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (class_derived_id),
    ,CONSTRAINT class_derived_from__cd_id__ck CHECK (class_derived_id > 0)
);
COMMENT ON TABLE classification_derived_fr om IS $$ Identification of the source of classification (Classified b y or Derived From line). Part of the Executive Order Box. $$;
COMMENT ON COLUMN classification_derived_fr om.class_derived_id IS $$ Classification derived from Identifier. $$;
COMMENT ON COLUMN classification_derived_fr om.class_derived IS $$ The source of the classification, i.e. classified by or derived from. $$;
COMMENT ON COLUMN classification_derived_fr om.auth IS $$ Author $$;
COMMENT ON COLUMN classification_derived_fr om.lddate IS $$ Load Date $$;

-- Table: CLASSIFICATION_DISSEMINAT ION
CREATE TABLE IF NOT EXISTS classification_disseminat ion (
    class_dissem_id BIGINT,
    class_dissem VARCHAR(64),
    paragraph_mark VARCHAR(16),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (class_dissem_id),
    ,CONSTRAINT class_diss__class_diss_id__ck CHECK (class_dissem_id > 0)
);
COMMENT ON TABLE classification_disseminat ion IS $$ Contains the control markings of the overall security markin g. i.e. FOUO, NOFORN $$;
COMMENT ON COLUMN classification_disseminat ion.class_dissem_id IS $$ Classification Dissemination Identifier. $$;
COMMENT ON COLUMN classification_disseminat ion.class_dissem IS $$ The abbreviated control marking which may follow the classification. $$;
COMMENT ON COLUMN classification_disseminat ion.paragraph_mark IS $$ The paragraph control marking. May be an abbreviated version of the class_dissem control marking. $$;
COMMENT ON COLUMN classification_disseminat ion.auth IS $$ Author $$;
COMMENT ON COLUMN classification_disseminat ion.lddate IS $$ Load Date $$;

-- Table: CLASSIFICATION_LEVEL
CREATE TABLE IF NOT EXISTS classification_level (
    class_level_id BIGINT,
    class_level VARCHAR(64),
    paragraph_mark VARCHAR(16),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (class_level_id),
    ,CONSTRAINT class_lvl__class_lvl_id__ck CHECK (class_level_id > 0)
);
COMMENT ON TABLE classification_level IS $$ Provides the overall classification for marking the top and bottom of documents. $$;
COMMENT ON COLUMN classification_level.class_level_id IS $$ Classification Level Identifier. $$;
COMMENT ON COLUMN classification_level.class_level IS $$ Level of Classification, e.g. SECRET $$;
COMMENT ON COLUMN classification_level.paragraph_mark IS $$ Abbreviated classification for paragraph marking i.e. UNCLASSIFIED = U. $$;
COMMENT ON COLUMN classification_level.auth IS $$ Author $$;
COMMENT ON COLUMN classification_level.lddate IS $$ Load Date $$;

-- Table: CLASSIFICATION_LOOKUP
CREATE TABLE IF NOT EXISTS classification_lookup (
    class_lookup_id BIGINT,
    application VARCHAR(64),
    classification_id BIGINT,
    on_date TIMESTAMP,
    off_date TIMESTAMP,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    moddate TIMESTAMP,
    ,PRIMARY KEY (class_lookup_id),
    ,CONSTRAINT class_lookup__class_id__ck CHECK (classification_id > 0),
    ,CONSTRAINT class_lookup__class_lu_id__ck CHECK (class_lookup_id > 0)
);
COMMENT ON TABLE classification_lookup IS $$ Looks up the classification information in the classificatio n table. $$;
COMMENT ON COLUMN classification_lookup.class_lookup_id IS $$ Classification Lookup Identifier. $$;
COMMENT ON COLUMN classification_lookup.application IS $$ The name of the application using the security marking, e.g. ARS, McTool. $$;
COMMENT ON COLUMN classification_lookup.classification_id IS $$ Classification Identifier. $$;
COMMENT ON COLUMN classification_lookup.on_date IS $$ The date the classification becomes active. $$;
COMMENT ON COLUMN classification_lookup.off_date IS $$ The date the classification becomes inactive or obsolete. $$;
COMMENT ON COLUMN classification_lookup.auth IS $$ Author $$;
COMMENT ON COLUMN classification_lookup.lddate IS $$ Load Date $$;
COMMENT ON COLUMN classification_lookup.moddate IS $$ Modification date $$;

-- Table: CLASSIFICATION_OPR
CREATE TABLE IF NOT EXISTS classification_opr (
    class_opr_id BIGINT,
    class_opr VARCHAR(64),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (class_opr_id),
    ,CONSTRAINT class_opr__class_opr_id__ck CHECK (class_opr_id > 0)
);
COMMENT ON TABLE classification_opr IS $$ Used to contain the agency, office (or OPR) responsible for classification $$;
COMMENT ON COLUMN classification_opr.class_opr_id IS $$ See classification.class_opr_id description $$;
COMMENT ON COLUMN classification_opr.class_opr IS $$ See table description $$;
COMMENT ON COLUMN classification_opr.auth IS $$ Author $$;
COMMENT ON COLUMN classification_opr.lddate IS $$ Load Date $$;

-- Table: CLASSIFICATION_REFER_TO
CREATE TABLE IF NOT EXISTS classification_refer_to (
    class_refer_id BIGINT,
    class_refer VARCHAR(4000),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (class_refer_id),
    ,CONSTRAINT class_ref_to__class_ref_id__ck CHECK (class_refer_id > 0)
);
COMMENT ON TABLE classification_refer_to IS $$ The classification_refer_to table will contain the "Refer to :..." information for the Exective Order Box. $$;
COMMENT ON COLUMN classification_refer_to.class_refer_id IS $$ Class Refer To Identifier $$;
COMMENT ON COLUMN classification_refer_to.class_refer IS $$ The classification_refer_to.class_refer contains the "Refer to" string which follows the the "Declassify On" part of the Exective Order Box. It provides the source to refer to in order to properly de classify something. $$;
COMMENT ON COLUMN classification_refer_to.auth IS $$ Author $$;
COMMENT ON COLUMN classification_refer_to.lddate IS $$ Load Date $$;

-- Table: CLUSTER_INFO
CREATE TABLE IF NOT EXISTS cluster_info (
    cluid BIGINT,
    descrip VARCHAR(50),
    prefor BIGINT,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (cluid),
    ,CONSTRAINT cluster_info__cluid__ck CHECK (cluid > 0),
    ,CONSTRAINT cluster_info__prefor__ck CHECK (prefor > 0)
);
COMMENT ON TABLE cluster_info IS $$ The cluster_info table contains information relating to the cluster of events. It relates to versions of the same cluste r (same events) together. It also contains the orid of the e vent closest to the center of the cluster and the radius of the cluster. $$;
COMMENT ON COLUMN cluster_info.cluid IS $$ Unique cluster ID $$;
COMMENT ON COLUMN cluster_info.descrip IS $$ Text description of cluster $$;
COMMENT ON COLUMN cluster_info.prefor IS $$ Origin that is closest to the center of the cluster $$;
COMMENT ON COLUMN cluster_info.auth IS $$ Author $$;
COMMENT ON COLUMN cluster_info.lddate IS $$ Load date $$;

-- Table: CLUSTER_MAGREF
CREATE TABLE IF NOT EXISTS cluster_magref (
    clustaid BIGINT,
    activetime DOUBLE PRECISION,
    orid BIGINT,
    amptype VARCHAR(8),
    mtype VARCHAR(15),
    mvalue DOUBLE PRECISION,
    filterid BIGINT,
    lead DOUBLE PRECISION,
    duration DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (clustaid),
    ,CONSTRAINT cluster_magref__clustaid__ck CHECK (clustaid > 0)
);
COMMENT ON TABLE cluster_magref IS $$ The cluster_magref table provides the magnitude reference ev ent for the cluster. This reference event will be used in de termining the relative magnitude of new events found using t he SSD. Each cluster will need a magnitude reference event t o make a relative magnitude calculation on events identified by the SSD. If the magnitude reference event was not seen a t a refsta we will be unable to perform a relative magnitude calculation for that refsta. $$;
COMMENT ON COLUMN cluster_magref.clustaid IS $$ Cluster Sta ID $$;
COMMENT ON COLUMN cluster_magref.activetime IS $$ The epochtime a cluster was activated $$;
COMMENT ON COLUMN cluster_magref.orid IS $$ Orid of magref event $$;
COMMENT ON COLUMN cluster_magref.amptype IS $$ Amplitude type $$;
COMMENT ON COLUMN cluster_magref.mtype IS $$ Amplitude measurement type $$;
COMMENT ON COLUMN cluster_magref.mvalue IS $$ Amplitude measurement value (only required for specific mtype(s)) $$;
COMMENT ON COLUMN cluster_magref.filterid IS $$ Filter identifier that links to the butterworth filter table $$;
COMMENT ON COLUMN cluster_magref.lead IS $$ Number of seconds before preferred phase for amplitude measurement $$;
COMMENT ON COLUMN cluster_magref.duration IS $$ Total number of seconds of the waveform around the preferred phase for amplitude measurement $$;
COMMENT ON COLUMN cluster_magref.auth IS $$ Author $$;
COMMENT ON COLUMN cluster_magref.lddate IS $$ Load date $$;

-- Table: CLUSTER_MEC
CREATE TABLE IF NOT EXISTS cluster_mec (
    clustaid BIGINT,
    sta VARCHAR(6),
    phase VARCHAR(8),
    activetime DOUBLE PRECISION,
    corr_type VARCHAR(16),
    correction DOUBLE PRECISION,
    uncertainty DOUBLE PRECISION,
    ondate INTEGER,
    offdate INTEGER,
    total_events SMALLINT,
    ,PRIMARY KEY (sta),
    ,CONSTRAINT cluster_mec__clustaid__ck CHECK (clustaid > 0),
    ,CONSTRAINT cluster_mec__sta__ck CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE cluster_mec IS $$ The cluster_mec table provides the location correction infor mation for a sta (element). This information is used to refi ne the locations of origins. The flat file database (fdb) th at is imported into this table should not include commented lines. The cluster_mec's format is the current output of jhd sat. It will have to be augmented by the addition of clustai d when it is imported into a US NDC cluster_mec table. This will make it possible to distinguish between two different e vent clusters for the same station. $$;
COMMENT ON COLUMN cluster_mec.clustaid IS $$ Cluster Station identifier $$;
COMMENT ON COLUMN cluster_mec.sta IS $$ Element name $$;
COMMENT ON COLUMN cluster_mec.phase IS $$ Phase $$;
COMMENT ON COLUMN cluster_mec.activetime IS $$ The epochtime a cluster was activated $$;
COMMENT ON COLUMN cluster_mec.corr_type IS $$ Correction type (time, azimuth, slowness) $$;
COMMENT ON COLUMN cluster_mec.correction IS $$ Correction value $$;
COMMENT ON COLUMN cluster_mec.uncertainty IS $$ Model error $$;
COMMENT ON COLUMN cluster_mec.ondate IS $$ Julian date that the correction is good from $$;
COMMENT ON COLUMN cluster_mec.offdate IS $$ Julian date that the correction is good to $$;
COMMENT ON COLUMN cluster_mec.total_events IS $$ Total events used to create the MEC $$;

-- Table: CLUSTER_ORID
CREATE TABLE IF NOT EXISTS cluster_orid (
    clustaid BIGINT,
    orid BIGINT,
    activetime DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid),
    ,CONSTRAINT cluster_orid_clustaid_nn CHECK ("CLUSTAID" IS NOT NULL),
    ,CONSTRAINT cluster_orid_orid_nn CHECK ("ORID" IS NOT NULL),
    ,CONSTRAINT cluster_orid__clustaid__ck CHECK (clustaid > 0),
    ,CONSTRAINT cluster_orid__orid__ck CHECK (orid > 0)
);
COMMENT ON TABLE cluster_orid IS $$ The cluster_orid table provides the cluster to orid mapping. $$;
COMMENT ON COLUMN cluster_orid.clustaid IS $$ Cluster Station identifier $$;
COMMENT ON COLUMN cluster_orid.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN cluster_orid.activetime IS $$ The epochtime a cluster was activated $$;
COMMENT ON COLUMN cluster_orid.lddate IS $$ Load date $$;

-- Table: CLUSTER_OVERRIDE
CREATE TABLE IF NOT EXISTS cluster_override (
    clustaid BIGINT,
    activetime DOUBLE PRECISION,
    threshold DOUBLE PRECISION,
    ssd_dimension INTEGER,
    svd_lead DOUBLE PRECISION,
    min_detection_interval DOUBLE PRECISION,
    prefphase VARCHAR(16),
    lead DOUBLE PRECISION,
    lag DOUBLE PRECISION,
    best_event_match_multiple DOUBLE PRECISION,
    phase_onset_multiple DOUBLE PRECISION,
    det_trace_trim_multiple DOUBLE PRECISION,
    channel_masking_threshold DOUBLE PRECISION,
    pfa DOUBLE PRECISION,
    threshold_percent_overlap INTEGER,
    phase_specific_override_rec VARCHAR(32),
    max_delaz DOUBLE PRECISION,
    max_delslow DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (clustaid),
    ,CONSTRAINT cluster_override__actv__ck CHECK (activetime > 0),
    ,CONSTRAINT cluster_override__bemm__ck CHECK (best_event_match_multiple > 0 OR best_event_match_multiple = -1),
    ,CONSTRAINT cluster_override__clustaid__ck CHECK (clustaid > 0),
    ,CONSTRAINT cluster_override__cmt__ck CHECK (channel_masking_threshold >= 0.0 AND channel_masking_threshold <= 1.0),
    ,CONSTRAINT cluster_override__dttm__ck CHECK (det_trace_trim_multiple > 0 OR det_trace_trim_multiple = -1),
    ,CONSTRAINT cluster_override__lag__ck CHECK (lag > 0 OR lag = -1),
    ,CONSTRAINT cluster_override__lead__ck CHECK (lead > 0 OR lead = -1),
    ,CONSTRAINT cluster_override__mdi__ck CHECK (min_detection_interval > 0 OR min_detection_interval = -1),
    ,CONSTRAINT cluster_override__pfa__ck CHECK ((pfa >= 0.0 AND pfa <= 1.0 ) OR pfa = -1),
    ,CONSTRAINT cluster_override__pom__ck CHECK (phase_onset_multiple > 0 OR phase_onset_multiple = -1),
    ,CONSTRAINT cluster_override__ssd_dim__ck CHECK (ssd_dimension >= 0),
    ,CONSTRAINT cluster_override__svd_lead__ck CHECK (svd_lead >= 0.0 OR svd_lead = -1.0),
    ,CONSTRAINT cluster_override__th__ck CHECK (( threshold >= 0.0 AND threshold <= 1.0 ) OR threshold = -1),
    ,CONSTRAINT cluster_override__tpo__ck CHECK (threshold_percent_overlap > 0 OR threshold_percent_overlap = -1),
    ,CONSTRAINT cluster_ovrd__max_delaz__ck CHECK (max_delaz > 0 OR max_delaz = -1),
    ,CONSTRAINT cluster_ovrd__max_delsl__ck CHECK (max_delslow > 0 OR max_delslow = -1)
);
COMMENT ON TABLE cluster_override IS $$ The cluster_override table contains Multiple Event Analysis (MEA) parameter file overrides for historical purposes. This table is populated when a new cluster version is pushed int o the NDC database with the previous override values. $$;
COMMENT ON COLUMN cluster_override.clustaid IS $$ Cluster Station identifier $$;
COMMENT ON COLUMN cluster_override.activetime IS $$ The epochtime a cluster was activated $$;
COMMENT ON COLUMN cluster_override.threshold IS $$ The threshold of the detector $$;
COMMENT ON COLUMN cluster_override.ssd_dimension IS $$ Specifies how many SVD dimensions to use in the SVDDISC table. $$;
COMMENT ON COLUMN cluster_override.svd_lead IS $$ The number of seconds from the start to the first phase of the waveforms used to generate the svds $$;
COMMENT ON COLUMN cluster_override.min_detection_interval IS $$ This value is multiplied by the data's sample rate to determine the MEA detection window size. $$;
COMMENT ON COLUMN cluster_override.prefphase IS $$ Preferred phase. $$;
COMMENT ON COLUMN cluster_override.lead IS $$ Number of seconds preceding phase that makes up the reference waveform $$;
COMMENT ON COLUMN cluster_override.lag IS $$ Number of seconds following preferred phase that makes up the reference waveform $$;
COMMENT ON COLUMN cluster_override.best_event_match_multiple IS $$ This value is multiplied by a MEA detection window to extend the window to perform correlation to find the best event match. $$;
COMMENT ON COLUMN cluster_override.phase_onset_multiple IS $$ This value is multiplied by the phase's lead and lag duration to create a window to perform correlation to refine phase onset time. $$;
COMMENT ON COLUMN cluster_override.det_trace_trim_multiple IS $$ The value is multiplied by the length of one SVD to define how much to trim from both ends of a detection statistic trace. $$;
COMMENT ON COLUMN cluster_override.channel_masking_threshold IS $$ The proportion of a channel that can be masked before the channel is removed from the threshold calculation $$;
COMMENT ON COLUMN cluster_override.pfa IS $$ Probability of false alarm $$;
COMMENT ON COLUMN cluster_override.threshold_percent_overlap IS $$ Percent overlap $$;
COMMENT ON COLUMN cluster_override.phase_specific_override_rec IS $$ Name of the phase override recipe to use ('-' value represents no override desired). $$;
COMMENT ON COLUMN cluster_override.max_delaz IS $$ Allowable difference between suspect azimuth and sta-cluster azimuth seconds per kilometer $$;
COMMENT ON COLUMN cluster_override.max_delslow IS $$ Allowable difference between suspect slowness and ref slowness seconds per kilometer $$;
COMMENT ON COLUMN cluster_override.auth IS $$ Author $$;
COMMENT ON COLUMN cluster_override.lddate IS $$ Load date $$;

-- Table: CLUSTER_PHASE_OVERRIDE
CREATE TABLE IF NOT EXISTS cluster_phase_override (
    clustaid BIGINT,
    activetime DOUBLE PRECISION,
    phase_specific_override_rec VARCHAR(32),
    phase VARCHAR(8),
    lead DOUBLE PRECISION,
    lag DOUBLE PRECISION,
    flo DOUBLE PRECISION,
    fhi DOUBLE PRECISION,
    maxadj DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (phase_specific_override_rec),
    ,CONSTRAINT cluster_phase_ovrd__actv__ck CHECK (activetime > 0),
    ,CONSTRAINT cluster_phase_ovrd__fhi__ck CHECK (fhi > 0),
    ,CONSTRAINT cluster_phase_ovrd__flo__ck CHECK (flo > 0),
    ,CONSTRAINT cluster_phase_ovrd__lag__ck CHECK (lag > 0 OR lag = -1),
    ,CONSTRAINT cluster_phase_ovrd__lead__ck CHECK (lead > 0 OR lead = -1),
    ,CONSTRAINT cluster_phase_ovrd__maxadj__ck CHECK (maxadj > 0 OR maxadj = -1),
    ,CONSTRAINT cluster_phse_ovrd__clstaid__ck CHECK (clustaid > 0)
);
COMMENT ON TABLE cluster_phase_override IS $$ The cluster_phase_override table contains Multiple Event Ana lysis (MEA) parameter file overrides for historical purposes . This table is populated when a new cluster version is push ed into the NDC database with the previous override values. $$;
COMMENT ON COLUMN cluster_phase_override.clustaid IS $$ Cluster Station identifier $$;
COMMENT ON COLUMN cluster_phase_override.activetime IS $$ The epochtime a cluster was activated. $$;
COMMENT ON COLUMN cluster_phase_override.phase_specific_override_rec IS $$ Name of the phase override recipe to use ('-' -> >value represents no override desired). $$;
COMMENT ON COLUMN cluster_phase_override.phase IS $$ Phase type $$;
COMMENT ON COLUMN cluster_phase_override.lead IS $$ Number of seconds preceding phase that makes up the reference waveform. $$;
COMMENT ON COLUMN cluster_phase_override.lag IS $$ Number of seconds following preferred phase that makes up the reference waveform. $$;
COMMENT ON COLUMN cluster_phase_override.flo IS $$ Low corner frequency for filter. $$;
COMMENT ON COLUMN cluster_phase_override.fhi IS $$ High corner frequency for filter. $$;
COMMENT ON COLUMN cluster_phase_override.maxadj IS $$ The maximum time in seconds that a phase can be adjusted. $$;
COMMENT ON COLUMN cluster_phase_override.auth IS $$ Author $$;
COMMENT ON COLUMN cluster_phase_override.lddate IS $$ Load date $$;

-- Table: CLUSTER_STATION
CREATE TABLE IF NOT EXISTS cluster_station (
    clustaid BIGINT,
    activetime DOUBLE PRECISION,
    cluid BIGINT,
    sta VARCHAR(6),
    max_delaz DOUBLE PRECISION,
    max_delslow DOUBLE PRECISION,
    ssd_dimension INTEGER,
    svd_lead DOUBLE PRECISION,
    svd_lag DOUBLE PRECISION,
    prefphase VARCHAR(16),
    lead DOUBLE PRECISION,
    lag DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (activetime)
);
COMMENT ON TABLE cluster_station IS $$ The cluster_station table is used to store station-specific (not element-specific) information, e.g., stations used in c luster, azimuth limits, slowness limits. $$;
COMMENT ON COLUMN cluster_station.clustaid IS $$ Cluster Station identifier $$;
COMMENT ON COLUMN cluster_station.activetime IS $$ The epochtime a cluster was activated $$;
COMMENT ON COLUMN cluster_station.cluid IS $$ Numeric cluster identifier $$;
COMMENT ON COLUMN cluster_station.sta IS $$ Station to which array elements are referenced; used to identify sites to include in cluster $$;
COMMENT ON COLUMN cluster_station.max_delaz IS $$ Allowable difference between suspect azimuth and sta-cluster azimuth seconds per kilometer $$;
COMMENT ON COLUMN cluster_station.max_delslow IS $$ Allowable difference between suspect slowness and ref slowness seconds per kilometer $$;
COMMENT ON COLUMN cluster_station.ssd_dimension IS $$ Number of subspace vectors to include for sta/chan processing $$;
COMMENT ON COLUMN cluster_station.svd_lead IS $$ The number of seconds from the start to the first phase of the waveforms used to generate the svds $$;
COMMENT ON COLUMN cluster_station.svd_lag IS $$ The number of seconds from the start to the first phase of the waveforms used to generate the svds $$;
COMMENT ON COLUMN cluster_station.prefphase IS $$ Preferred Phase $$;
COMMENT ON COLUMN cluster_station.lead IS $$ Number of seconds preceding phase that makes up the reference waveform $$;
COMMENT ON COLUMN cluster_station.lag IS $$ Number of seconds following preferred phase that makes up the reference waveform $$;
COMMENT ON COLUMN cluster_station.auth IS $$ Author $$;
COMMENT ON COLUMN cluster_station.lddate IS $$ Load date of the data $$;

-- Table: CLUSTER_THRESHOLD
CREATE TABLE IF NOT EXISTS cluster_threshold (
    clustaid BIGINT,
    detector_type VARCHAR(16),
    ssd_dimension INTEGER,
    activetime DOUBLE PRECISION,
    orid BIGINT,
    threshold DOUBLE PRECISION,
    pfa DOUBLE PRECISION,
    overlap INTEGER,
    channel_masking_threshold DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (clustaid),
    ,CONSTRAINT cluster_threshold__ca__ck CHECK (clustaid > 0),
    ,CONSTRAINT cluster_threshold__ssd_dim__ck CHECK (ssd_dimension >= 0)
);
COMMENT ON TABLE cluster_threshold IS $$ The cluster_threshold table provides the threshold informati on for the cluster. It is possible for a cluster to have sev eral different threshold values. $$;
COMMENT ON COLUMN cluster_threshold.clustaid IS $$ Cluster Station identifier $$;
COMMENT ON COLUMN cluster_threshold.detector_type IS $$ The dector type to use with this threshold (SSD, CORR, AMP) $$;
COMMENT ON COLUMN cluster_threshold.ssd_dimension IS $$ SSD Dimension $$;
COMMENT ON COLUMN cluster_threshold.activetime IS $$ The epochtime a cluster was activated $$;
COMMENT ON COLUMN cluster_threshold.orid IS $$ The orid used to create the threshold if this is a correlation threshold otherwise the value is 0 $$;
COMMENT ON COLUMN cluster_threshold.threshold IS $$ The threshold of the detector $$;
COMMENT ON COLUMN cluster_threshold.pfa IS $$ Probability of false alarm $$;
COMMENT ON COLUMN cluster_threshold.overlap IS $$ Percent overlap $$;
COMMENT ON COLUMN cluster_threshold.channel_masking_threshold IS $$ The proportion of a channel that can be masked before the channel is removed from the threshold calculation $$;
COMMENT ON COLUMN cluster_threshold.auth IS $$ Author $$;
COMMENT ON COLUMN cluster_threshold.lddate IS $$ Load date $$;

-- Table: CODAMAG_INPUT
CREATE TABLE IF NOT EXISTS codamag_input (
    ampid BIGINT,
    flo DOUBLE PRECISION,
    fhi DOUBLE PRECISION,
    sta VARCHAR(6),
    chan VARCHAR(8),
    orid BIGINT,
    arid BIGINT,
    ampdef VARCHAR(1),
    delta DOUBLE PRECISION,
    bwratio DOUBLE PRECISION,
    samprate DOUBLE PRECISION,
    envslow DOUBLE PRECISION,
    hwide DOUBLE PRECISION,
    polyid BIGINT,
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    noise_start_time DOUBLE PRECISION,
    noise_end_time DOUBLE PRECISION,
    tmeas DOUBLE PRECISION,
    shape_spreading DOUBLE PRECISION,
    shape_decay DOUBLE PRECISION,
    shapedmin DOUBLE PRECISION,
    shapedmax DOUBLE PRECISION,
    peak_velocity DOUBLE PRECISION,
    vgdmin DOUBLE PRECISION,
    vgdmax DOUBLE PRECISION,
    path_cor_type VARCHAR(8),
    path_cor DOUBLE PRECISION,
    site_cor DOUBLE PRECISION,
    siteunit VARCHAR(9),
    wmodel_name VARCHAR(50),
    yintercept DOUBLE PRECISION,
    yslope DOUBLE PRECISION,
    ffactor DOUBLE PRECISION,
    src_region VARCHAR(50),
    mbintercept DOUBLE PRECISION,
    mbslope DOUBLE PRECISION,
    mbsigma DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (flo),
    ,CONSTRAINT codamag_input__ampdef__ck CHECK (ampdef IN ( 'd','n','D','N' )),
    ,CONSTRAINT codamag_input__ampid__ck CHECK (ampid > 0),
    ,CONSTRAINT codamag_input__arid__ck CHECK (arid > 0),
    ,CONSTRAINT codamag_input__bwratio__ck CHECK (bwratio > 0.0 OR bwratio = -999.0),
    ,CONSTRAINT codamag_input__delta__ck CHECK ((delta >= 0.0 AND delta <= 180.0) OR delta = -1.0),
    ,CONSTRAINT codamag_input__endtime__ck CHECK (endtime < 9999999999.999),
    ,CONSTRAINT codamag_input__envslow__ck CHECK (envslow >= 0.0 OR envslow = -999.0),
    ,CONSTRAINT codamag_input__ffactor__ck CHECK (ffactor > 0.0 OR ffactor = -999.0),
    ,CONSTRAINT codamag_input__hwide__ck CHECK (hwide >= 0.0),
    ,CONSTRAINT codamag_input__mbintercept__ck CHECK (mbintercept >= -999.0),
    ,CONSTRAINT codamag_input__mbsigma__ck CHECK (mbsigma > 0.0 OR mbsigma = -999.0),
    ,CONSTRAINT codamag_input__mbslope__ck CHECK (mbslope > 0.0 OR mbslope = -999.0),
    ,CONSTRAINT codamag_input__nend_time__ck CHECK (noise_end_time < 9999999999.999),
    ,CONSTRAINT codamag_input__nstart_time__ck CHECK (noise_start_time > -9999999999.999),
    ,CONSTRAINT codamag_input__orid__ck CHECK (orid > 0),
    ,CONSTRAINT codamag_input__pathcortype__ck CHECK (path_cor_type in ('none', '1D', '2D','-')),
    ,CONSTRAINT codamag_input__pathcor__ck CHECK (path_cor >= -999.0),
    ,CONSTRAINT codamag_input__peakvel__ck CHECK (peak_velocity > 0.0 OR peak_velocity = -999.0),
    ,CONSTRAINT codamag_input__polyid__ck CHECK (polyid > 0 OR polyid = -1),
    ,CONSTRAINT codamag_input__samprate__ck CHECK (samprate > 0.0),
    ,CONSTRAINT codamag_input__shapedecay__ck CHECK (shape_decay > 0.0 OR shape_decay = -999.0),
    ,CONSTRAINT codamag_input__shapedmax__ck CHECK (shapedmax > 0.0 OR shapedmax = -999.0),
    ,CONSTRAINT codamag_input__shapedmin__ck CHECK (shapedmin >= 0.0 OR shapedmin = -999.0),
    ,CONSTRAINT codamag_input__shapespread__ck CHECK (shape_spreading > 0.0 OR shape_spreading = -999.0),
    ,CONSTRAINT codamag_input__sitecor__ck CHECK (site_cor > 0.0 OR site_cor = -999.0),
    ,CONSTRAINT codamag_input__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT codamag_input__time__ck CHECK (time > -9999999999.999),
    ,CONSTRAINT codamag_input__tmeas__ck CHECK (tmeas >= -9999999999.999),
    ,CONSTRAINT codamag_input__vgdmax__ck CHECK (vgdmax > 0.0 OR vgdmax = -999.0),
    ,CONSTRAINT codamag_input__vgdmin__ck CHECK (vgdmin > 0.0 OR vgdmin = -999.0),
    ,CONSTRAINT codamag_input__yintercept__ck CHECK (yintercept >= -999.0),
    ,CONSTRAINT codamag_input__yslope__ck CHECK (yslope > 0.0 OR yslope = -999.0)
);
COMMENT ON TABLE codamag_input IS $$ The codamag_input table contains key input parameters that a re used to calculate coda amplitudes, including the boundari es of the noise and signal windows and the path and site cor rection values. $$;
COMMENT ON COLUMN codamag_input.ampid IS $$ Amplitude identifier $$;
COMMENT ON COLUMN codamag_input.flo IS $$ Low corner freq for filter $$;
COMMENT ON COLUMN codamag_input.fhi IS $$ High corner freq for filter $$;
COMMENT ON COLUMN codamag_input.sta IS $$ Station code $$;
COMMENT ON COLUMN codamag_input.chan IS $$ Channel code $$;
COMMENT ON COLUMN codamag_input.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN codamag_input.arid IS $$ LR arrival identifier $$;
COMMENT ON COLUMN codamag_input.ampdef IS $$ d or n flag indicating if station/element is included (d,D) or excluded (n,N) from coda magnitude processing $$;
COMMENT ON COLUMN codamag_input.delta IS $$ Source-receiver distance $$;
COMMENT ON COLUMN codamag_input.bwratio IS $$ Pre-filter bandwidth to Nyquist ratio $$;
COMMENT ON COLUMN codamag_input.samprate IS $$ The sample rate of the data corresponding to this record $$;
COMMENT ON COLUMN codamag_input.envslow IS $$ Slowness for envelope stacking $$;
COMMENT ON COLUMN codamag_input.hwide IS $$ Smoothing half-width for boxcar smoothing $$;
COMMENT ON COLUMN codamag_input.polyid IS $$ Polygon identifier for calibrated region $$;
COMMENT ON COLUMN codamag_input.time IS $$ Epoch start time of signal window $$;
COMMENT ON COLUMN codamag_input.endtime IS $$ Epoch end time of signal window $$;
COMMENT ON COLUMN codamag_input.noise_start_time IS $$ Epoch start time of noise window $$;
COMMENT ON COLUMN codamag_input.noise_end_time IS $$ Epoch end time of noise window $$;
COMMENT ON COLUMN codamag_input.tmeas IS $$ Time of coda amplitude measurement $$;
COMMENT ON COLUMN codamag_input.shape_spreading IS $$ Coda shape spreading factor $$;
COMMENT ON COLUMN codamag_input.shape_decay IS $$ Coda shape attenuation decay factor $$;
COMMENT ON COLUMN codamag_input.shapedmin IS $$ Minimum 1-D calibration distance for coda decay and spreading $$;
COMMENT ON COLUMN codamag_input.shapedmax IS $$ Maximum 1-D calibration distance for coda decay and spreading $$;
COMMENT ON COLUMN codamag_input.peak_velocity IS $$ Synthetic envelope peak velocity $$;
COMMENT ON COLUMN codamag_input.vgdmin IS $$ Minimum 1-D calibration distance for peak velocity $$;
COMMENT ON COLUMN codamag_input.vgdmax IS $$ Maximum 1-D calibration distance for peak velocity $$;
COMMENT ON COLUMN codamag_input.path_cor_type IS $$ Path correction type (1D or 2D) $$;
COMMENT ON COLUMN codamag_input.path_cor IS $$ Path correction (log10) $$;
COMMENT ON COLUMN codamag_input.site_cor IS $$ Site correction (log10) $$;
COMMENT ON COLUMN codamag_input.siteunit IS $$ Unit for site correction term $$;
COMMENT ON COLUMN codamag_input.wmodel_name IS $$ Yield model name $$;
COMMENT ON COLUMN codamag_input.yintercept IS $$ Yield line fit intercept $$;
COMMENT ON COLUMN codamag_input.yslope IS $$ Yield line fit slope $$;
COMMENT ON COLUMN codamag_input.ffactor IS $$ Yield F factor (log 10) $$;
COMMENT ON COLUMN codamag_input.src_region IS $$ Source region name $$;
COMMENT ON COLUMN codamag_input.mbintercept IS $$ mb line fit intercept $$;
COMMENT ON COLUMN codamag_input.mbslope IS $$ mb line fit slope $$;
COMMENT ON COLUMN codamag_input.mbsigma IS $$ mb misfit for weighting $$;
COMMENT ON COLUMN codamag_input.auth IS $$ Author $$;
COMMENT ON COLUMN codamag_input.lddate IS $$ Load Date $$;

-- Table: CODAMAG_OUTPUT
CREATE TABLE IF NOT EXISTS codamag_output (
    ampid BIGINT,
    flo DOUBLE PRECISION,
    fhi DOUBLE PRECISION,
    sta VARCHAR(6),
    chan VARCHAR(8),
    orid BIGINT,
    arid BIGINT,
    delta DOUBLE PRECISION,
    raw_amp DOUBLE PRECISION,
    uncertainty DOUBLE PRECISION,
    noise_amp DOUBLE PRECISION,
    ampcor DOUBLE PRECISION,
    amp_wgt DOUBLE PRECISION,
    mb_coda DOUBLE PRECISION,
    yield DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (flo),
    ,CONSTRAINT codamag_output__ampcor__ck CHECK (ampcor >= -999.0),
    ,CONSTRAINT codamag_output__ampid__ck CHECK (ampid > 0),
    ,CONSTRAINT codamag_output__amp_wgt__ck CHECK ((amp_wgt >= 0.0 AND amp_wgt <= 1.0) OR amp_wgt = -999.0),
    ,CONSTRAINT codamag_output__arid__ck CHECK (arid > 0),
    ,CONSTRAINT codamag_output__delta__ck CHECK ((delta >= 0.0 AND delta <= 180.0) OR delta = -1.0),
    ,CONSTRAINT codamag_output__mb_coda__ck CHECK ((mb_coda > -9.99 AND mb_coda < 50.00) OR mb_coda = -999.0),
    ,CONSTRAINT codamag_output__noise_amp__ck CHECK (noise_amp >= -999.0),
    ,CONSTRAINT codamag_output__orid__ck CHECK (orid > 0),
    ,CONSTRAINT codamag_output__raw_amp__ck CHECK (raw_amp >= -999.0),
    ,CONSTRAINT codamag_output__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT codamag_output__uncertnty__ck CHECK (uncertainty > 0.0 OR uncertainty = -1.0),
    ,CONSTRAINT codamag_output__yield__ck CHECK (yield >= 0.0 OR yield = -1.0)
);
COMMENT ON TABLE codamag_output IS $$ The codamag_output table contains raw and corrected coda amp litudes for each station/channel/frequency band. $$;
COMMENT ON COLUMN codamag_output.ampid IS $$ Amplitude identifier $$;
COMMENT ON COLUMN codamag_output.flo IS $$ Low corner freq for filter $$;
COMMENT ON COLUMN codamag_output.fhi IS $$ High corner freq for filter $$;
COMMENT ON COLUMN codamag_output.sta IS $$ Station code $$;
COMMENT ON COLUMN codamag_output.chan IS $$ Channel code $$;
COMMENT ON COLUMN codamag_output.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN codamag_output.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN codamag_output.delta IS $$ Source-receiver distance $$;
COMMENT ON COLUMN codamag_output.raw_amp IS $$ Raw (uncorrected) Coda amplitude $$;
COMMENT ON COLUMN codamag_output.uncertainty IS $$ Uncertainty for Raw (uncorrected) Coda amplitude $$;
COMMENT ON COLUMN codamag_output.noise_amp IS $$ Amplitude of noise window $$;
COMMENT ON COLUMN codamag_output.ampcor IS $$ Amplitude value corrected for path and site $$;
COMMENT ON COLUMN codamag_output.amp_wgt IS $$ Calculated moment amplitude weight factor $$;
COMMENT ON COLUMN codamag_output.mb_coda IS $$ Body coda wave magnitude value $$;
COMMENT ON COLUMN codamag_output.yield IS $$ Yield $$;
COMMENT ON COLUMN codamag_output.auth IS $$ Author $$;
COMMENT ON COLUMN codamag_output.lddate IS $$ Load date $$;

-- Table: CONTINUOUS_DATA_STATUS
CREATE TABLE IF NOT EXISTS continuous_data_status (
    status_id BIGINT,
    sta VARCHAR(6),
    chan VARCHAR(8),
    indicator VARCHAR(64),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (status_id),
    ,CONSTRAINT cd_status__status_id__ck CHECK (status_id > 0)
);
COMMENT ON TABLE continuous_data_status IS $$ A table tracking the SOH indicators embedded in the CD1.1 Da ta Frame $$;
COMMENT ON COLUMN continuous_data_status.status_id IS $$ CD Data Status Identifier $$;
COMMENT ON COLUMN continuous_data_status.sta IS $$ Station code $$;
COMMENT ON COLUMN continuous_data_status.chan IS $$ Channel code $$;
COMMENT ON COLUMN continuous_data_status.indicator IS $$ Status of Health Indicator from the CD1.1 Data Frame $$;
COMMENT ON COLUMN continuous_data_status.start_date IS $$ Initial time the indicator was enabled $$;
COMMENT ON COLUMN continuous_data_status.end_date IS $$ Last time for which the indicator was enabled $$;
COMMENT ON COLUMN continuous_data_status.author IS $$ Author $$;
COMMENT ON COLUMN continuous_data_status.moddate IS $$ Modification date $$;
COMMENT ON COLUMN continuous_data_status.lddate IS $$ Load date $$;

-- Table: DA_INTERVAL
CREATE TABLE IF NOT EXISTS da_interval (
    intvlid BIGINT,
    class VARCHAR(16),
    name VARCHAR(20),
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    state VARCHAR(16),
    auth VARCHAR(15),
    percent_available DOUBLE PRECISION,
    proc_start_date TIMESTAMP,
    proc_end_date TIMESTAMP,
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (class),
    ,CONSTRAINT da_interval_uk UNIQUE (intvlid),
    ,CONSTRAINT da_intvl__endtime__ck CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT da_intvl__intvlid__ck CHECK (intvlid > 0),
    ,CONSTRAINT da_intvl__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE da_interval IS $$ The da_interval table defines units of processing for data a cquistion . The time, endtime, and name types indicate proce ssing times for a named object. The class type allows a sing le interval table to be used for different classes of object s. $$;
COMMENT ON COLUMN da_interval.intvlid IS $$ Interval identifier $$;
COMMENT ON COLUMN da_interval.class IS $$ Type of interval $$;
COMMENT ON COLUMN da_interval.name IS $$ Name of interval $$;
COMMENT ON COLUMN da_interval.time IS $$ Starting time of data $$;
COMMENT ON COLUMN da_interval.endtime IS $$ Ending time of data $$;
COMMENT ON COLUMN da_interval.state IS $$ Current processing state $$;
COMMENT ON COLUMN da_interval.auth IS $$ Author of interval $$;
COMMENT ON COLUMN da_interval.percent_available IS $$ Percent of data available in interval $$;
COMMENT ON COLUMN da_interval.proc_start_date IS $$ Processing start date $$;
COMMENT ON COLUMN da_interval.proc_end_date IS $$ Processing stop date $$;
COMMENT ON COLUMN da_interval.moddate IS $$ Time of last processing state change $$;
COMMENT ON COLUMN da_interval.lddate IS $$ Load date $$;

-- Table: DA_REFSTA_LATENCY
CREATE TABLE IF NOT EXISTS da_refsta_latency (
    latency_id BIGINT,
    sta VARCHAR(6),
    interval_start_time TIMESTAMP,
    interval_end_time TIMESTAMP,
    min_latency_secs DOUBLE PRECISION,
    max_latency_secs DOUBLE PRECISION,
    total_secs DOUBLE PRECISION,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (latency_id),
    ,CONSTRAINT da_refsta_latency__lat_id__ck CHECK (latency_id > 0),
    ,CONSTRAINT da_refsta_latency__sta__ck CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE da_refsta_latency IS $$ The da_refsta_latency table contains latency data for the re ference stations. $$;
COMMENT ON COLUMN da_refsta_latency.latency_id IS $$ Unique identifier for latency tables. $$;
COMMENT ON COLUMN da_refsta_latency.sta IS $$ Station code. $$;
COMMENT ON COLUMN da_refsta_latency.interval_start_time IS $$ Start time of the interval. $$;
COMMENT ON COLUMN da_refsta_latency.interval_end_time IS $$ End time of the interval. $$;
COMMENT ON COLUMN da_refsta_latency.min_latency_secs IS $$ Minimum latency in seconds. $$;
COMMENT ON COLUMN da_refsta_latency.max_latency_secs IS $$ Maximum latency in seconds. $$;
COMMENT ON COLUMN da_refsta_latency.total_secs IS $$ Total seconds of latency. $$;
COMMENT ON COLUMN da_refsta_latency.author IS $$ Source/originator $$;
COMMENT ON COLUMN da_refsta_latency.moddate IS $$ Modification date $$;
COMMENT ON COLUMN da_refsta_latency.lddate IS $$ Load date $$;

-- Table: DA_REFSTA_SUMMARY
CREATE TABLE IF NOT EXISTS da_refsta_summary (
    summary_id BIGINT,
    sta VARCHAR(6),
    interval_start_time TIMESTAMP,
    interval_end_time TIMESTAMP,
    percent DOUBLE PRECISION,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (summary_id),
    ,CONSTRAINT da_refsta_summary__percent__ck CHECK (percent >= 0.0 AND percent <= 1.0),
    ,CONSTRAINT da_refsta_summary__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT da_refsta_summary__sum_id__ck CHECK (summary_id > 0)
);
COMMENT ON TABLE da_refsta_summary IS $$ Summary of expected percentage of data available for a refer ence station. $$;
COMMENT ON COLUMN da_refsta_summary.summary_id IS $$ Unique identifier for summary tables. $$;
COMMENT ON COLUMN da_refsta_summary.sta IS $$ Station code. $$;
COMMENT ON COLUMN da_refsta_summary.interval_start_time IS $$ Start time of the interval. $$;
COMMENT ON COLUMN da_refsta_summary.interval_end_time IS $$ End time of the interval. $$;
COMMENT ON COLUMN da_refsta_summary.percent IS $$ Percentage of data available in wfdiscs. $$;
COMMENT ON COLUMN da_refsta_summary.author IS $$ Source/originator $$;
COMMENT ON COLUMN da_refsta_summary.moddate IS $$ Modification date $$;
COMMENT ON COLUMN da_refsta_summary.lddate IS $$ Load date $$;

-- Table: DA_SITECHAN_LATENCY
CREATE TABLE IF NOT EXISTS da_sitechan_latency (
    latency_id BIGINT,
    sta VARCHAR(6),
    chan VARCHAR(8),
    interval_start_time TIMESTAMP,
    interval_end_time TIMESTAMP,
    min_latency_secs DOUBLE PRECISION,
    max_latency_secs DOUBLE PRECISION,
    total_secs DOUBLE PRECISION,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (latency_id),
    ,CONSTRAINT da_sitechan_latency__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT da_sitechan_lat__lat_id__ck CHECK (latency_id > 0)
);
COMMENT ON TABLE da_sitechan_latency IS $$ The da_sitechan_latency table contains latency data for the stations and channels. $$;
COMMENT ON COLUMN da_sitechan_latency.latency_id IS $$ Unique identifier for latency tables. $$;
COMMENT ON COLUMN da_sitechan_latency.sta IS $$ Station code. $$;
COMMENT ON COLUMN da_sitechan_latency.chan IS $$ Channel code. $$;
COMMENT ON COLUMN da_sitechan_latency.interval_start_time IS $$ Start time of the interval. $$;
COMMENT ON COLUMN da_sitechan_latency.interval_end_time IS $$ End time of the interval. $$;
COMMENT ON COLUMN da_sitechan_latency.min_latency_secs IS $$ Minimum latency in seconds. $$;
COMMENT ON COLUMN da_sitechan_latency.max_latency_secs IS $$ Maximum latency in seconds. $$;
COMMENT ON COLUMN da_sitechan_latency.total_secs IS $$ Total seconds of latency. $$;
COMMENT ON COLUMN da_sitechan_latency.author IS $$ Source/originator $$;
COMMENT ON COLUMN da_sitechan_latency.moddate IS $$ Modification date $$;
COMMENT ON COLUMN da_sitechan_latency.lddate IS $$ Load date $$;

-- Table: DATAUSER
CREATE TABLE IF NOT EXISTS datauser (
    userid BIGINT,
    pocid BIGINT,
    username VARCHAR(24),
    domain VARCHAR(48),
    msgtype VARCHAR(16),
    userstatus VARCHAR(24),
    priority SMALLINT,
    commid BIGINT,
    emaillimit INTEGER,
    servicetime DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (userid),
    ,CONSTRAINT datauser__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT datauser__emaillimit__ck CHECK (emaillimit >= 0 OR emaillimit = -1),
    ,CONSTRAINT datauser__pocid__ck CHECK (pocid > 0 OR pocid = -1),
    ,CONSTRAINT datauser__priority__ck CHECK (priority > 0),
    ,CONSTRAINT datauser__servicetime__ck CHECK (servicetime >= 0.0 OR servicetime = -9999999999.999),
    ,CONSTRAINT datauser__userid__ck CHECK (userid > 0 OR userid = -1),
    ,CONSTRAINT datauser__userstatus__ck CHECK (userstatus IN ('ACTIVE', 'INACTIVE'))
);
COMMENT ON TABLE datauser IS $$ The datauser table tracks authorized users of the Message an d Subscription Subsystems. Each user is identified by a (uni que) username and domain, which must match all e-mail header s. The priority column specifies the class of user, and serv icetime is the last time a request from the user was process ed. Priority and servicetime are considered when selecting t he order in which requests will be processed. The status can either be active or inactive. $$;
COMMENT ON COLUMN datauser.userid IS $$ Identifier for the user $$;
COMMENT ON COLUMN datauser.pocid IS $$ Point of contact identifier $$;
COMMENT ON COLUMN datauser.username IS $$ User name from the incoming subscription message $$;
COMMENT ON COLUMN datauser.domain IS $$ Domain name from the incoming subscription message $$;
COMMENT ON COLUMN datauser.msgtype IS $$ Message type $$;
COMMENT ON COLUMN datauser.userstatus IS $$ Status of this user $$;
COMMENT ON COLUMN datauser.priority IS $$ User's priority $$;
COMMENT ON COLUMN datauser.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN datauser.emaillimit IS $$ Maximum size of message (in bytes) that will be delivered via e-mail $$;
COMMENT ON COLUMN datauser.servicetime IS $$ Last time a request from that user was serviced $$;
COMMENT ON COLUMN datauser.lddate IS $$ Load date $$;

-- Table: DECONVOLUTION
CREATE TABLE IF NOT EXISTS deconvolution (
    deconid BIGINT,
    type VARCHAR(16),
    lowcutfrac DOUBLE PRECISION,
    lowpassfreq DOUBLE PRECISION,
    highcutfrac DOUBLE PRECISION,
    highpassfreq DOUBLE PRECISION,
    waterlevel DOUBLE PRECISION,
    finalunits VARCHAR(1),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (deconid),
    ,CONSTRAINT deconvolution__deconid__ck CHECK (deconid > 0),
    ,CONSTRAINT deconvolution__highcutfrac__ck CHECK (( highcutfrac >= 0 AND highcutfrac <=1 ) OR highcutfrac = -1),
    ,CONSTRAINT deconvolution__hipassfreq__ck CHECK (highpassfreq > 0 OR highpassfreq = -1),
    ,CONSTRAINT deconvolution__lowcutfrac__ck CHECK (( lowcutfrac >= 0 AND lowcutfrac <=1 ) OR lowcutfrac = -1),
    ,CONSTRAINT deconvolution__lowpassfreq__ck CHECK (lowpassfreq > 0 OR lowpassfreq = -1),
    ,CONSTRAINT deconvolution__type__ck CHECK (type IN('measured', 'theoretical')),
    ,CONSTRAINT deconvolution__waterlevel__ck CHECK (waterlevel > 0 OR waterlevel = 0)
);
COMMENT ON TABLE deconvolution IS $$ The deconvolution table provides some of the parameters nece ssary for deconvolution of the instrument response. The inst rument response information for a particular station at a ce rtain time is contained in the sensor and instrument table. The sensor and instrument tables provide the instrument resp onse, type (measured or theoretical), and units. Once the in strument response is removed it will be necessary to convert everything to the same unit. $$;
COMMENT ON COLUMN deconvolution.deconid IS $$ Deconvolution identifier $$;
COMMENT ON COLUMN deconvolution.type IS $$ Decon type may be 'measured' or 'theoretical' $$;
COMMENT ON COLUMN deconvolution.lowcutfrac IS $$ Low cut for cosine filter given as a fraction of lowcutfrac $$;
COMMENT ON COLUMN deconvolution.lowpassfreq IS $$ Low cut for cosine filter given as a fraction of lowpassfreq $$;
COMMENT ON COLUMN deconvolution.highcutfrac IS $$ High cut given as a fraction of Nyquist obtained from nominal sample rate $$;
COMMENT ON COLUMN deconvolution.highpassfreq IS $$ High cut given as a fraction of Nyquist obtained from nominal sample rate $$;
COMMENT ON COLUMN deconvolution.waterlevel IS $$ Limit for division (0.0 means do not apply waterlevel) $$;
COMMENT ON COLUMN deconvolution.finalunits IS $$ Final units for the data once the instrument response has been removed (d, v, or a) $$;
COMMENT ON COLUMN deconvolution.auth IS $$ Author $$;
COMMENT ON COLUMN deconvolution.lddate IS $$ Load date $$;

-- Table: DEFINING_OBSTYPES
CREATE TABLE IF NOT EXISTS defining_obstypes (
    obstype_id BIGINT,
    class VARCHAR(16),
    type VARCHAR(10),
    description VARCHAR(4000),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (obstype_id),
    ,CONSTRAINT defining_obstypes_uk UNIQUE (type),
    ,CONSTRAINT def_obstypes__obstype_id__ck CHECK (obstype_id > 0)
);
COMMENT ON TABLE defining_obstypes IS $$ Defines and describes all valid observation types that can b e used as defining for the USNDC. $$;
COMMENT ON COLUMN defining_obstypes.obstype_id IS $$ Observation Type identifier $$;
COMMENT ON COLUMN defining_obstypes.class IS $$ Defining Observation grouping or class $$;
COMMENT ON COLUMN defining_obstypes.type IS $$ Defining Observation type $$;
COMMENT ON COLUMN defining_obstypes.description IS $$ Description of defining value $$;
COMMENT ON COLUMN defining_obstypes.moddate IS $$ Modification date $$;
COMMENT ON COLUMN defining_obstypes.lddate IS $$ Load Date $$;

-- Table: DEFINING_RULES
CREATE TABLE IF NOT EXISTS defining_rules (
    rule_id BIGINT,
    net VARCHAR(8),
    refsta VARCHAR(6),
    site VARCHAR(6),
    phase VARCHAR(8),
    obstype_id BIGINT,
    value_id BIGINT,
    on_date TIMESTAMP,
    off_date TIMESTAMP,
    author VARCHAR(64),
    priority INTEGER,
    comments VARCHAR(4000),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (rule_id),
    ,CONSTRAINT defining_rules__obstype_id__ck CHECK (obstype_id > 0),
    ,CONSTRAINT defining_rules__rule_id__ck CHECK (rule_id > 0),
    ,CONSTRAINT defining_rules__value_id__ck CHECK (value_id > 0)
);
COMMENT ON TABLE defining_rules IS $$ Provides the rules for when an observation can be defining a nd the appropriate default value to be assigned. $$;
COMMENT ON COLUMN defining_rules.rule_id IS $$ Defining Rule Identifier $$;
COMMENT ON COLUMN defining_rules.net IS $$ Unique network identifier $$;
COMMENT ON COLUMN defining_rules.refsta IS $$ Reference station for station members $$;
COMMENT ON COLUMN defining_rules.site IS $$ Individual site/station element $$;
COMMENT ON COLUMN defining_rules.phase IS $$ Phase restriction for the Defining Rule $$;
COMMENT ON COLUMN defining_rules.obstype_id IS $$ Observation Type identifier $$;
COMMENT ON COLUMN defining_rules.value_id IS $$ Defining Value Identifier $$;
COMMENT ON COLUMN defining_rules.on_date IS $$ Date the defining rule becomes enabled $$;
COMMENT ON COLUMN defining_rules.off_date IS $$ Date the defining rule becomes disabled $$;
COMMENT ON COLUMN defining_rules.priority IS $$ Rule priority $$;
COMMENT ON COLUMN defining_rules.comments IS $$ Comment text $$;
COMMENT ON COLUMN defining_rules.moddate IS $$ Modification date $$;
COMMENT ON COLUMN defining_rules.lddate IS $$ Load Date $$;

-- Table: DEFINING_VALUES
CREATE TABLE IF NOT EXISTS defining_values (
    value_id BIGINT,
    value VARCHAR(1),
    description VARCHAR(4000),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (value_id),
    ,CONSTRAINT defining_values_uk UNIQUE (value),
    ,CONSTRAINT defining_values__value_id__ck CHECK (value_id > 0)
);
COMMENT ON TABLE defining_values IS $$ Defines and describes all valid defining values that can be assigned to an observation type in the USNDC. $$;
COMMENT ON COLUMN defining_values.value_id IS $$ Defining Value Identifier $$;
COMMENT ON COLUMN defining_values.value IS $$ Defining value code $$;
COMMENT ON COLUMN defining_values.description IS $$ Description of defining value $$;
COMMENT ON COLUMN defining_values.moddate IS $$ Modification date $$;
COMMENT ON COLUMN defining_values.lddate IS $$ Load Date $$;

-- Table: DETECTION
CREATE TABLE IF NOT EXISTS detection (
    arid BIGINT,
    jdate INTEGER,
    time DOUBLE PRECISION,
    sta VARCHAR(6),
    chan VARCHAR(8),
    bmtyp VARCHAR(4),
    sproid BIGINT,
    cfreq DOUBLE PRECISION,
    seaz DOUBLE PRECISION,
    delaz DOUBLE PRECISION,
    slow DOUBLE PRECISION,
    delslo DOUBLE PRECISION,
    snr DOUBLE PRECISION,
    stav DOUBLE PRECISION,
    fstat DOUBLE PRECISION,
    deltim DOUBLE PRECISION,
    bandw DOUBLE PRECISION,
    fkqual SMALLINT,
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (time),
    ,CONSTRAINT detection_uk UNIQUE (arid),
    ,CONSTRAINT detection__arid__ck CHECK (arid > 0),
    ,CONSTRAINT detection__bandw__ck CHECK (bandw > 0.0 OR bandw = -1.0),
    ,CONSTRAINT detection__bmtyp__ck CHECK (bmtyp IN ('coh','inc','hor','fsta','-')),
    ,CONSTRAINT detection__cfreq__ck CHECK (cfreq > 0.0 OR cfreq = -1.0),
    ,CONSTRAINT detection__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT detection__delaz__ck CHECK (delaz > 0.0 OR delaz = -1.0),
    ,CONSTRAINT detection__delslo__ck CHECK (delslo > 0.0 OR delslo = -1.0),
    ,CONSTRAINT detection__deltim__ck CHECK (deltim > 0.0 OR deltim = -1.0),
    ,CONSTRAINT detection__fkqual__ck CHECK ((fkqual >= 1 AND fkqual <= 4) OR fkqual = -1),
    ,CONSTRAINT detection__fstat__ck CHECK (fstat >= 0.0 OR fstat = -1.0),
    ,CONSTRAINT detection__jdate__ck CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT detection__slow__ck CHECK (slow >= 0.0 OR slow = -1.0),
    ,CONSTRAINT detection__snr__ck CHECK (snr > 0.0 OR snr = -1.0),
    ,CONSTRAINT detection__sproid__ck CHECK (sproid > 0 OR sproid = -1),
    ,CONSTRAINT detection__stav__ck CHECK (stav > 0.0 OR stav = -1.0),
    ,CONSTRAINT detection__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT detection__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE detection IS $$ The detection table contains summary information about wavef orms. $$;
COMMENT ON COLUMN detection.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN detection.jdate IS $$ Julian date $$;
COMMENT ON COLUMN detection.time IS $$ Epoch time $$;
COMMENT ON COLUMN detection.sta IS $$ Station code $$;
COMMENT ON COLUMN detection.chan IS $$ Channel code $$;
COMMENT ON COLUMN detection.bmtyp IS $$ Beam type $$;
COMMENT ON COLUMN detection.sproid IS $$ Signal processor identifier $$;
COMMENT ON COLUMN detection.cfreq IS $$ Center frequency $$;
COMMENT ON COLUMN detection.seaz IS $$ Observed azimuth $$;
COMMENT ON COLUMN detection.delaz IS $$ Azimuth uncertainty $$;
COMMENT ON COLUMN detection.slow IS $$ Observed slowness, seconds per kilometer (sec/km) $$;
COMMENT ON COLUMN detection.delslo IS $$ Slowness uncertainty $$;
COMMENT ON COLUMN detection.snr IS $$ Signal-to-noise ratio $$;
COMMENT ON COLUMN detection.stav IS $$ Short-term average $$;
COMMENT ON COLUMN detection.fstat IS $$ f-statistic $$;
COMMENT ON COLUMN detection.deltim IS $$ Time uncertainty $$;
COMMENT ON COLUMN detection.bandw IS $$ Bandwidth $$;
COMMENT ON COLUMN detection.fkqual IS $$ f-k quality $$;
COMMENT ON COLUMN detection.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN detection.lddate IS $$ Load date $$;

-- Table: DETECTION_THRESHOLD
CREATE TABLE IF NOT EXISTS detection_threshold (
    clustaid BIGINT,
    orid BIGINT,
    detector_type VARCHAR(16),
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    threshold DOUBLE PRECISION,
    num_detections INTEGER,
    sta VARCHAR(6),
    pfa DOUBLE PRECISION,
    overlap INTEGER,
    channel_masking_threshold DOUBLE PRECISION,
    ssd_dimension INTEGER,
    dof DOUBLE PRECISION,
    data_masked INTEGER,
    total_data INTEGER,
    descript VARCHAR(100),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (clustaid),
    ,CONSTRAINT detection_threshold__ca__ck CHECK (clustaid > 0),
    ,CONSTRAINT detection_threshold__cmt__ck CHECK (channel_masking_threshold >= 0 AND channel_masking_threshold <= 100),
    ,CONSTRAINT detection_threshold__dof__ck CHECK (dof > 0 OR dof = -1),
    ,CONSTRAINT detection_threshold__nd__ck CHECK (num_detections >= 0 OR num_detections = -1),
    ,CONSTRAINT detection_threshold__ol__ck CHECK (overlap > 0 OR overlap = -1),
    ,CONSTRAINT detection_threshold__pfa__ck CHECK ((pfa >= 0.0 AND pfa <= 1.0 ) OR pfa = -1),
    ,CONSTRAINT detection_threshold__sd__ck CHECK (ssd_dimension >= 0),
    ,CONSTRAINT detection_threshold__td__ck CHECK (total_data > 0 OR total_data = -1),
    ,CONSTRAINT detection_threshold__th__ck CHECK (( threshold >= 0.0 AND threshold <= 1.0 ) OR threshold = -1)
);
COMMENT ON TABLE detection_threshold IS $$ The detection_threshold table contains the calculated thresh old for the timeframe processed. $$;
COMMENT ON COLUMN detection_threshold.clustaid IS $$ Cluster Station identifier $$;
COMMENT ON COLUMN detection_threshold.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN detection_threshold.detector_type IS $$ Type of detector (SSD, NARGAR, etc.) $$;
COMMENT ON COLUMN detection_threshold.time IS $$ Epoch start time of threshold $$;
COMMENT ON COLUMN detection_threshold.endtime IS $$ Epoch end time of threshold $$;
COMMENT ON COLUMN detection_threshold.threshold IS $$ Threshold values $$;
COMMENT ON COLUMN detection_threshold.num_detections IS $$ Number of detections $$;
COMMENT ON COLUMN detection_threshold.sta IS $$ Station $$;
COMMENT ON COLUMN detection_threshold.pfa IS $$ Probability of False Alarm $$;
COMMENT ON COLUMN detection_threshold.overlap IS $$ Overlap $$;
COMMENT ON COLUMN detection_threshold.channel_masking_threshold IS $$ Channel Masking threshold $$;
COMMENT ON COLUMN detection_threshold.ssd_dimension IS $$ Subspace Dimension $$;
COMMENT ON COLUMN detection_threshold.dof IS $$ Degrees of freedom $$;
COMMENT ON COLUMN detection_threshold.data_masked IS $$ Number of samples masked $$;
COMMENT ON COLUMN detection_threshold.total_data IS $$ Total number of samples $$;
COMMENT ON COLUMN detection_threshold.descript IS $$ Description $$;
COMMENT ON COLUMN detection_threshold.auth IS $$ Author $$;
COMMENT ON COLUMN detection_threshold.lddate IS $$ Load date $$;

-- Table: DISCRIM_PARAM
CREATE TABLE IF NOT EXISTS discrim_param (
    polyid BIGINT,
    ampcor_verid BIGINT,
    sta VARCHAR(6),
    chan VARCHAR(8),
    paramsetid BIGINT,
    lowcutfrac DOUBLE PRECISION,
    minlowpassfreq DOUBLE PRECISION,
    highpassfrac DOUBLE PRECISION,
    highcutfrac DOUBLE PRECISION,
    pngv1 DOUBLE PRECISION,
    pngv2 DOUBLE PRECISION,
    pnint DOUBLE PRECISION,
    pggv1 DOUBLE PRECISION,
    pggv2 DOUBLE PRECISION,
    pgint DOUBLE PRECISION,
    sngv1 DOUBLE PRECISION,
    sngv2 DOUBLE PRECISION,
    snint DOUBLE PRECISION,
    lggv1 DOUBLE PRECISION,
    lggv2 DOUBLE PRECISION,
    lgint DOUBLE PRECISION,
    tfactor DOUBLE PRECISION,
    taperwidth DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (sta),
    ,CONSTRAINT discrim_param__ampcor_vid__ck CHECK (ampcor_verid > 0),
    ,CONSTRAINT discrim_param__highcutfrac__ck CHECK (( highcutfrac >= 0 AND highcutfrac <=1 ) OR highcutfrac = -1),
    ,CONSTRAINT discrim_param__hpf__ck CHECK (( highpassfrac >= 0 AND highpassfrac <=1 ) OR highpassfrac = -1),
    ,CONSTRAINT discrim_param__lggv1__ck CHECK (lggv1 >=0),
    ,CONSTRAINT discrim_param__lggv2__ck CHECK (lggv2 >=0),
    ,CONSTRAINT discrim_param__lgint__ck CHECK (lgint >=0),
    ,CONSTRAINT discrim_param__lowcutfrac__ck CHECK (( lowcutfrac >= 0 AND lowcutfrac <=1 ) OR lowcutfrac = -1),
    ,CONSTRAINT discrim_param__mlpf__ck CHECK (minlowpassfreq >=0),
    ,CONSTRAINT discrim_param__paramsetid__ck CHECK (paramsetid >= 0 or paramsetid = -1),
    ,CONSTRAINT discrim_param__pggv1__ck CHECK (pggv1 >=0),
    ,CONSTRAINT discrim_param__pggv2__ck CHECK (pggv2 >=0),
    ,CONSTRAINT discrim_param__pgint__ck CHECK (pgint >=0),
    ,CONSTRAINT discrim_param__pngv1__ck CHECK (pngv1 >=0),
    ,CONSTRAINT discrim_param__pngv2__ck CHECK (pngv2 >=0),
    ,CONSTRAINT discrim_param__pnint__ck CHECK (pnint >=0),
    ,CONSTRAINT discrim_param__polyid__ck CHECK (polyid >0),
    ,CONSTRAINT discrim_param__sngv1__ck CHECK (sngv1 >=0),
    ,CONSTRAINT discrim_param__sngv2__ck CHECK (sngv2 >=0),
    ,CONSTRAINT discrim_param__snint__ck CHECK (snint >=0),
    ,CONSTRAINT discrim_param__taperwidth__ck CHECK (( taperwidth >= 0 AND taperwidth <=1 ) OR taperwidth = -1),
    ,CONSTRAINT discrim_param__tfactor__ck CHECK (tfactor >0.5)
);
COMMENT ON TABLE discrim_param IS $$ The discrim_param table contains group velocities for each p olyid and station. $$;
COMMENT ON COLUMN discrim_param.polyid IS $$ Polygon Identifier $$;
COMMENT ON COLUMN discrim_param.ampcor_verid IS $$ amplitude correction version identifier $$;
COMMENT ON COLUMN discrim_param.sta IS $$ Station name $$;
COMMENT ON COLUMN discrim_param.chan IS $$ Channel where waveform was recorded $$;
COMMENT ON COLUMN discrim_param.paramsetid IS $$ id of parameter set $$;
COMMENT ON COLUMN discrim_param.lowcutfrac IS $$ low frequency cut for instrument correction in Hertz $$;
COMMENT ON COLUMN discrim_param.minlowpassfreq IS $$ low frequency pass for instrument correction in Hertz $$;
COMMENT ON COLUMN discrim_param.highpassfrac IS $$ high frequency pass for instrument correction in Hertz $$;
COMMENT ON COLUMN discrim_param.highcutfrac IS $$ high frequency cut for instrument correction in Hertz $$;
COMMENT ON COLUMN discrim_param.pngv1 IS $$ beginning group velocity in km/s for Pn phase $$;
COMMENT ON COLUMN discrim_param.pngv2 IS $$ ending group velocity in km/s for Pn phase $$;
COMMENT ON COLUMN discrim_param.pnint IS $$ intercept time in seconds for Pg phase $$;
COMMENT ON COLUMN discrim_param.pggv1 IS $$ beginning group velocity in km/s for Pg phase $$;
COMMENT ON COLUMN discrim_param.pggv2 IS $$ ending group velocity in km/s for Pg phase $$;
COMMENT ON COLUMN discrim_param.pgint IS $$ intercept time in seconds for Pg phase $$;
COMMENT ON COLUMN discrim_param.sngv1 IS $$ beginning group velocity in km/s for Sn phase $$;
COMMENT ON COLUMN discrim_param.sngv2 IS $$ ending group velocity in km/s for Sn phase $$;
COMMENT ON COLUMN discrim_param.snint IS $$ intercept time in seconds for Sn phase $$;
COMMENT ON COLUMN discrim_param.lggv1 IS $$ beginning group velocity in km/s for Lg phase $$;
COMMENT ON COLUMN discrim_param.lggv2 IS $$ ending group velocity in km/s for Lg phase $$;
COMMENT ON COLUMN discrim_param.lgint IS $$ intercept time in seconds for Lg phase $$;
COMMENT ON COLUMN discrim_param.tfactor IS $$ minimum number of cycles in the window needed to calculate an amplitude $$;
COMMENT ON COLUMN discrim_param.taperwidth IS $$ fraction of waveform to taper at each end $$;
COMMENT ON COLUMN discrim_param.auth IS $$ Author $$;
COMMENT ON COLUMN discrim_param.lddate IS $$ Load date $$;

-- Table: DISCRIMUSE
CREATE TABLE IF NOT EXISTS discrimuse (
    orid BIGINT,
    discrimtype VARCHAR(10),
    sta VARCHAR(6),
    discrim_flag VARCHAR(1),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (sta),
    ,CONSTRAINT discrimuse__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT discrimuse__discrimtype__ck CHECK (discrimtype IN ('CF','FM','LP','PP','SP','TT','BUB','DEEP','HF','HT','LO','MINE','SEIS','VOL','DU','FR',' NA','RTRMS','RESULT','-')),
    ,CONSTRAINT discrimuse__discrim_flag__ck CHECK (discrim_flag IN ('T','F','-')),
    ,CONSTRAINT discrimuse__orid__ck CHECK (orid > 0),
    ,CONSTRAINT discrimuse__sta__ck CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE discrimuse IS $$ The discrimuse table contains the use/nonuse of station data in discriminant voting. It identifies, for each station ass ociated to the origin, the use or non-use of that station's data in the discriminant vote for six different discriminant s. The votes are then combined to determine the overall even t classification (see the discrimvote table). $$;
COMMENT ON COLUMN discrimuse.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN discrimuse.discrimtype IS $$ Discriminant type $$;
COMMENT ON COLUMN discrimuse.sta IS $$ Station $$;
COMMENT ON COLUMN discrimuse.discrim_flag IS $$ Discriminant is used in event classification for the origin and station (T,F) $$;
COMMENT ON COLUMN discrimuse.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN discrimuse.lddate IS $$ Load date $$;

-- Table: DISCRIMVOTE
CREATE TABLE IF NOT EXISTS discrimvote (
    orid BIGINT,
    discrimtype VARCHAR(10),
    sta VARCHAR(6),
    vote VARCHAR(1),
    commid BIGINT,
    override INTEGER,
    eval_comment VARCHAR(22),
    lddate TIMESTAMP,
    ,PRIMARY KEY (discrimtype),
    ,CONSTRAINT discrimvote__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT discrimvote__discrimtype__ck CHECK (discrimtype IN ('CF','FM','LP','PP','SP','TT','BUB','DEEP','HF','HT','LO','MINE','SEIS','VOL','DU','FR',' NA','RTRMS','RESULT','HYD_CLASS','-')),
    ,CONSTRAINT discrimvote__orid__ck CHECK (orid > 0),
    ,CONSTRAINT discrimvote__override__ck CHECK (override >= 0 OR override = -1),
    ,CONSTRAINT discrimvote__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT discrimvote__vote__ck CHECK (vote IN ('1','2','3','4','5','6','7','A','B','C','D','-'))
);
COMMENT ON TABLE discrimvote IS $$ The discrimvote table identifies the vote value for each of six discriminants (discrimtypes). These votes are combined t o determine the overall event classification. When the vote is overridden, it includes evaluator's comments. $$;
COMMENT ON COLUMN discrimvote.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN discrimvote.discrimtype IS $$ Discriminant type $$;
COMMENT ON COLUMN discrimvote.sta IS $$ Station $$;
COMMENT ON COLUMN discrimvote.vote IS $$ Overall vote for the discriminant factor $$;
COMMENT ON COLUMN discrimvote.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN discrimvote.override IS $$ Evaluator override vote $$;
COMMENT ON COLUMN discrimvote.eval_comment IS $$ Evaluator comments on override $$;
COMMENT ON COLUMN discrimvote.lddate IS $$ Load date $$;

-- Table: DLMAN
CREATE TABLE IF NOT EXISTS dlman (
    dlid BIGINT,
    machine VARCHAR(32),
    running VARCHAR(1),
    connmanport INTEGER,
    controlport INTEGER,
    archiveport INTEGER,
    forwardport INTEGER,
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (dlid),
    ,CONSTRAINT dlman__archiveport__ck CHECK ((archiveport >= 0 AND archiveport <= 16383) OR archiveport = -1),
    ,CONSTRAINT dlman__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT dlman__connmanport__ck CHECK ((connmanport >= 0 AND connmanport <= 16383) OR connmanport = -1),
    ,CONSTRAINT dlman__controlport__ck CHECK ((controlport >= 0 AND controlport <= 16383) OR controlport = -1),
    ,CONSTRAINT dlman__dlid__ck CHECK (dlid >= 0),
    ,CONSTRAINT dlman__forwardport__ck CHECK ((forwardport >= 0 AND forwardport <= 16383) OR forwardport = -1),
    ,CONSTRAINT dlman__running__ck CHECK (running IN ('y', 'n', '-'))
);
COMMENT ON TABLE dlman IS $$ The dlman table keeps track of currently running DLMan insta nces. The column machine is the host on which this dlid runs (it may not run elsewhere). The column running indicates wh ether that DLMan is currently operational. The table also pr ovides the ports that this dlid is currently using to listen to other processes. $$;
COMMENT ON COLUMN dlman.dlid IS $$ Diskloop manager identifier $$;
COMMENT ON COLUMN dlman.machine IS $$ Machine name $$;
COMMENT ON COLUMN dlman.running IS $$ Dlman running = y/n $$;
COMMENT ON COLUMN dlman.connmanport IS $$ Connman port $$;
COMMENT ON COLUMN dlman.controlport IS $$ Datacontrol port $$;
COMMENT ON COLUMN dlman.archiveport IS $$ Archiver port $$;
COMMENT ON COLUMN dlman.forwardport IS $$ Forwarder port $$;
COMMENT ON COLUMN dlman.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN dlman.lddate IS $$ Load date $$;

-- Table: DOPPLER_DETECTION
CREATE TABLE IF NOT EXISTS doppler_detection (
    dopplerid BIGINT,
    sta VARCHAR(6),
    chan VARCHAR(8),
    event_time DOUBLE PRECISION,
    duration DOUBLE PRECISION,
    snr DOUBLE PRECISION,
    azimuth DOUBLE PRECISION,
    etype VARCHAR(7),
    cfreq DOUBLE PRECISION,
    range_minfreq DOUBLE PRECISION,
    range_maxfreq DOUBLE PRECISION,
    trace_minfreq DOUBLE PRECISION,
    trace_maxfreq DOUBLE PRECISION,
    use_as_reference_event VARCHAR(1),
    filter_string VARCHAR(2000),
    conf DOUBLE PRECISION,
    comments VARCHAR(4000),
    internal_comments VARCHAR(4000),
    analyst VARCHAR(32),
    timesent DOUBLE PRECISION,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (sta),
    ,CONSTRAINT doppler_detection_uk UNIQUE (dopplerid),
    ,CONSTRAINT doppler_det__azimuth__ck CHECK ((azimuth >= 0.0 AND azimuth <= 360.0) OR azimuth = -1.0),
    ,CONSTRAINT doppler_det__cfreq__ck CHECK (cfreq > 0.0 OR cfreq = -1.0),
    ,CONSTRAINT doppler_det__chan__ck CHECK (chan = UPPER(chan)),
    ,CONSTRAINT doppler_det__conf__ck CHECK ((conf IN(1.0,50.0,100.0)) OR conf = 0.0),
    ,CONSTRAINT doppler_det__dopplerid__ck CHECK (dopplerid > 0),
    ,CONSTRAINT doppler_det__duration__ck CHECK (duration > 0.0 OR duration = -999.0),
    ,CONSTRAINT doppler_det__etype__ck CHECK (etype = UPPER(etype)),
    ,CONSTRAINT doppler_det__event_time__ck CHECK (event_time >= -9999999999.999),
    ,CONSTRAINT doppler_det__range_maxfreq CHECK (range_maxfreq > 0.0 OR range_maxfreq = -999.0),
    ,CONSTRAINT doppler_det__range_minfreq CHECK (range_minfreq >= 0.0 OR range_minfreq = -999.0),
    ,CONSTRAINT doppler_det__snr__ck CHECK (snr > 0 OR snr = -1),
    ,CONSTRAINT doppler_det__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT doppler_det__timesent__ck CHECK (timesent > 0.0 OR timesent = -9999999999.999),
    ,CONSTRAINT doppler_det__trace_maxfreq CHECK (trace_maxfreq > 0.0 OR trace_maxfreq = -999.0),
    ,CONSTRAINT doppler_det__trace_minfreq CHECK (trace_minfreq >= 0.0 OR trace_minfreq = -999.0),
    ,CONSTRAINT doppler_det__use_as_ref_event CHECK (use_as_reference_event IN('y','n','-'))
);
COMMENT ON TABLE doppler_detection IS $$ The doppler_detection table contains summary information abo ut waveforms. $$;
COMMENT ON COLUMN doppler_detection.dopplerid IS $$ Doppler identifier $$;
COMMENT ON COLUMN doppler_detection.sta IS $$ Station code $$;
COMMENT ON COLUMN doppler_detection.chan IS $$ Channel code $$;
COMMENT ON COLUMN doppler_detection.event_time IS $$ Epoch time $$;
COMMENT ON COLUMN doppler_detection.duration IS $$ Duration of doppler shift window $$;
COMMENT ON COLUMN doppler_detection.snr IS $$ Signal-to-noise ratio $$;
COMMENT ON COLUMN doppler_detection.azimuth IS $$ Observed azimuth $$;
COMMENT ON COLUMN doppler_detection.etype IS $$ Event type $$;
COMMENT ON COLUMN doppler_detection.cfreq IS $$ Center frequency $$;
COMMENT ON COLUMN doppler_detection.range_minfreq IS $$ Detection range minimum frequency. $$;
COMMENT ON COLUMN doppler_detection.range_maxfreq IS $$ Detection range maximum frequency. $$;
COMMENT ON COLUMN doppler_detection.trace_minfreq IS $$ Detection trace minimum frequency. $$;
COMMENT ON COLUMN doppler_detection.trace_maxfreq IS $$ Detection trace maximum frequency. $$;
COMMENT ON COLUMN doppler_detection.use_as_reference_event IS $$ When set to "y", use this event as a reference event for internal AFTAC station tuning process. $$;
COMMENT ON COLUMN doppler_detection.filter_string IS $$ Compact filter representation. $$;
COMMENT ON COLUMN doppler_detection.conf IS $$ Confidence $$;
COMMENT ON COLUMN doppler_detection.comments IS $$ Comment text $$;
COMMENT ON COLUMN doppler_detection.internal_comments IS $$ Comment made by an analyst to leave feedback/questions/observations and tie it to the event without it affecting the Doppler report. $$;
COMMENT ON COLUMN doppler_detection.analyst IS $$ The analyst that created the event report $$;
COMMENT ON COLUMN doppler_detection.timesent IS $$ Time at which the event report was released $$;
COMMENT ON COLUMN doppler_detection.author IS $$ Author $$;
COMMENT ON COLUMN doppler_detection.moddate IS $$ Modification date $$;
COMMENT ON COLUMN doppler_detection.lddate IS $$ Time at which the detector generated the event $$;

-- Table: ECM_CHAN_AMPLITUDE
CREATE TABLE IF NOT EXISTS ecm_chan_amplitude (
    orid BIGINT,
    sta VARCHAR(6),
    chan VARCHAR(8),
    phase VARCHAR(8),
    lfreq DOUBLE PRECISION,
    hfreq DOUBLE PRECISION,
    ampcor_verid BIGINT,
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    ampraw DOUBLE PRECISION,
    ampmdac DOUBLE PRECISION,
    ampdac DOUBLE PRECISION,
    ampmac DOUBLE PRECISION,
    ntime DOUBLE PRECISION,
    nendtime DOUBLE PRECISION,
    snr DOUBLE PRECISION,
    ampdef VARCHAR(1),
    auth VARCHAR(15),
    comments VARCHAR(4000),
    lddate TIMESTAMP,
    ,PRIMARY KEY (hfreq),
    ,CONSTRAINT ecm_chan_amplitude__hfreq__ck CHECK (hfreq >0),
    ,CONSTRAINT ecm_chan_amplitude__lfreq__ck CHECK (lfreq >=0),
    ,CONSTRAINT ecm_chan_amplitude__ntime__ck CHECK (ntime >= -9999999999.999),
    ,CONSTRAINT ecm_chan_amplitude__orid__ck CHECK (orid >0),
    ,CONSTRAINT ecm_chan_amplitude__snr__ck CHECK (snr > 0 OR snr = -1),
    ,CONSTRAINT ecm_chan_amplitude__time__ck CHECK (time >= -9999999999.999),
    ,CONSTRAINT ecm_chan_amp__ampcor_verid__ck CHECK (( ampcor_verid >0) OR ampcor_verid = -1),
    ,CONSTRAINT ecm_chan_amp__ampdef__ck CHECK (ampdef in('n', 'N', 'd', 'D')),
    ,CONSTRAINT ecm_chan_amp__endtime__ck CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT ecm_chan_amp__nendtime__ck CHECK (nendtime < 9999999999.999 OR nendtime = 9999999999.999)
);
COMMENT ON TABLE ecm_chan_amplitude IS $$ The ecm_chan_amplitude table contains time windows (start an d end times), raw amplitude, and MDAC for each orid, station , channel, phase and frequency bin. These measurements are c ombined according to the parameters of the discriminant bein g calculated. $$;
COMMENT ON COLUMN ecm_chan_amplitude.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN ecm_chan_amplitude.sta IS $$ Station name $$;
COMMENT ON COLUMN ecm_chan_amplitude.chan IS $$ Channel name $$;
COMMENT ON COLUMN ecm_chan_amplitude.phase IS $$ phase of interest $$;
COMMENT ON COLUMN ecm_chan_amplitude.lfreq IS $$ low end of frequency bin used to filter measurement $$;
COMMENT ON COLUMN ecm_chan_amplitude.hfreq IS $$ high end of frequency bin used to filter measurement $$;
COMMENT ON COLUMN ecm_chan_amplitude.ampcor_verid IS $$ AmpCor version Identifier used in ECM Versioning $$;
COMMENT ON COLUMN ecm_chan_amplitude.time IS $$ time of reference event $$;
COMMENT ON COLUMN ecm_chan_amplitude.endtime IS $$ end time of measurement window $$;
COMMENT ON COLUMN ecm_chan_amplitude.ampraw IS $$ actual amplitude measured $$;
COMMENT ON COLUMN ecm_chan_amplitude.ampmdac IS $$ Magnitude and Distance Amplitude Correction $$;
COMMENT ON COLUMN ecm_chan_amplitude.ampdac IS $$ Distance amplitude correction $$;
COMMENT ON COLUMN ecm_chan_amplitude.ampmac IS $$ Magnitude amplitude correction $$;
COMMENT ON COLUMN ecm_chan_amplitude.ntime IS $$ start time of the noise window $$;
COMMENT ON COLUMN ecm_chan_amplitude.nendtime IS $$ end time of the noise window $$;
COMMENT ON COLUMN ecm_chan_amplitude.snr IS $$ Signal-to-noise ratio $$;
COMMENT ON COLUMN ecm_chan_amplitude.ampdef IS $$ Defining flag for element amplitude measurement to be used for station/network average $$;
COMMENT ON COLUMN ecm_chan_amplitude.auth IS $$ Author $$;
COMMENT ON COLUMN ecm_chan_amplitude.comments IS $$ comment text $$;
COMMENT ON COLUMN ecm_chan_amplitude.lddate IS $$ Load date $$;

-- Table: ECM_CONSTANT
CREATE TABLE IF NOT EXISTS ecm_constant (
    name VARCHAR(30),
    value DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (name)
);
COMMENT ON TABLE ecm_constant IS $$ The ecm_constant table contains calibration constants for EC M. This table is for lone constants that are not dependant on which channel, phase, station, or polyid being looked at. $$;
COMMENT ON COLUMN ecm_constant.name IS $$ Name of constant of interest $$;
COMMENT ON COLUMN ecm_constant.value IS $$ Value of this constant $$;
COMMENT ON COLUMN ecm_constant.lddate IS $$ Load date $$;

-- Table: ECM_COV
CREATE TABLE IF NOT EXISTS ecm_cov (
    polyid BIGINT,
    cov_verid BIGINT,
    source_type VARCHAR(15),
    discrim_name_1 VARCHAR(10),
    discrim_name_2 VARCHAR(10),
    covariance DOUBLE PRECISION,
    mean_1 DOUBLE PRECISION,
    auth VARCHAR(15),
    comments VARCHAR(4000),
    lddate TIMESTAMP,
    ,PRIMARY KEY (polyid),
    ,CONSTRAINT ecm_cov__covariance__ck CHECK (covariance >= -1 and covariance <=1),
    ,CONSTRAINT ecm_cov__cov_verid__ck CHECK (cov_verid >0),
    ,CONSTRAINT ecm_cov__mean_1__ck CHECK (( mean_1 >= 0 AND mean_1 <=1 ) OR mean_1 = -1),
    ,CONSTRAINT ecm_cov__polyid__ck CHECK (polyid >0)
);
COMMENT ON TABLE ecm_cov IS $$ The ecm_cov table contains a covariance for each polyid, sou rce type, and pair of discriminants. All records with the s ame polyid and source type will combine to define a single c ovariance matrix used for combining discriminants. $$;
COMMENT ON COLUMN ecm_cov.polyid IS $$ Polygon Identifier $$;
COMMENT ON COLUMN ecm_cov.cov_verid IS $$ version identifier of the covariance matrix $$;
COMMENT ON COLUMN ecm_cov.source_type IS $$ source type of interest $$;
COMMENT ON COLUMN ecm_cov.discrim_name_1 IS $$ first discriminant of interest $$;
COMMENT ON COLUMN ecm_cov.discrim_name_2 IS $$ second discriminant of interest $$;
COMMENT ON COLUMN ecm_cov.covariance IS $$ covariance of these two discriminants for this source type within this region of interest $$;
COMMENT ON COLUMN ecm_cov.mean_1 IS $$ mean value of the first discriminant $$;
COMMENT ON COLUMN ecm_cov.auth IS $$ Author $$;
COMMENT ON COLUMN ecm_cov.comments IS $$ comment text $$;
COMMENT ON COLUMN ecm_cov.lddate IS $$ Load date $$;

-- Table: ECM_DISCRIMINANTS
CREATE TABLE IF NOT EXISTS ecm_discriminants (
    orid BIGINT,
    discrim_name VARCHAR(15),
    cov_verid BIGINT,
    discrim_p_value DOUBLE PRECISION,
    discrim_def VARCHAR(1),
    explanation VARCHAR(4000),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid),
    ,CONSTRAINT ecm_discrim__cov_verid__ck CHECK (( cov_verid >0) OR cov_verid = -1),
    ,CONSTRAINT ecm_discrim__discrim_def__ck CHECK (discrim_def in('n', 'N', 'd', 'D', '-')),
    ,CONSTRAINT ecm_discrim__discrim_p_val__ck CHECK (( discrim_p_value >= 0 AND discrim_p_value <=1 ) OR discrim_p_value = -1),
    ,CONSTRAINT ecm_discrim__orid__ck CHECK (orid >0)
);
COMMENT ON TABLE ecm_discriminants IS $$ The ecm_discriminants table contains p-values for each evid and discriminant name. $$;
COMMENT ON COLUMN ecm_discriminants.orid IS $$ id of the origin $$;
COMMENT ON COLUMN ecm_discriminants.discrim_name IS $$ discriminant of interest $$;
COMMENT ON COLUMN ecm_discriminants.cov_verid IS $$ version identifier of the covariance matrix $$;
COMMENT ON COLUMN ecm_discriminants.discrim_p_value IS $$ p-value of this discriminant for this reference event $$;
COMMENT ON COLUMN ecm_discriminants.discrim_def IS $$ defining flag for this discriminant $$;
COMMENT ON COLUMN ecm_discriminants.explanation IS $$ text explanation of how this discriminant was calculated $$;
COMMENT ON COLUMN ecm_discriminants.auth IS $$ Author $$;
COMMENT ON COLUMN ecm_discriminants.lddate IS $$ Load date $$;

-- Table: ECM_EVENT_RESULTS
CREATE TABLE IF NOT EXISTS ecm_event_results (
    orid BIGINT,
    evid BIGINT,
    cov_verid BIGINT,
    rda_verid BIGINT,
    class_type VARCHAR(15),
    class_type_ovrd VARCHAR(15),
    comments VARCHAR(4000),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid),
    ,CONSTRAINT ecm_event_results__evid__ck CHECK (evid >0),
    ,CONSTRAINT ecm_event_results__orid__ck CHECK (orid >0),
    ,CONSTRAINT ecm_evt_results__cov_verid__ck CHECK (( cov_verid >0 ) OR cov_verid = -1),
    ,CONSTRAINT ecm_evt_results__rda_verid__ck CHECK (( rda_verid >0 ) OR rda_verid = -1)
);
COMMENT ON TABLE ecm_event_results IS $$ The ecm_event_results table contains the classification for each event. $$;
COMMENT ON COLUMN ecm_event_results.orid IS $$ id of the origin $$;
COMMENT ON COLUMN ecm_event_results.evid IS $$ id of the event of interest $$;
COMMENT ON COLUMN ecm_event_results.cov_verid IS $$ version identifier of the covariance matrix $$;
COMMENT ON COLUMN ecm_event_results.rda_verid IS $$ version identifier of the RDA $$;
COMMENT ON COLUMN ecm_event_results.class_type IS $$ source type as determined by ECM $$;
COMMENT ON COLUMN ecm_event_results.class_type_ovrd IS $$ source type as overridden by an analyst $$;
COMMENT ON COLUMN ecm_event_results.comments IS $$ comment text $$;
COMMENT ON COLUMN ecm_event_results.auth IS $$ Author $$;
COMMENT ON COLUMN ecm_event_results.lddate IS $$ Load date $$;

-- Table: ECM_REF_CHAN_AMPLITUDE
CREATE TABLE IF NOT EXISTS ecm_ref_chan_amplitude (
    evid BIGINT,
    sta VARCHAR(6),
    chan VARCHAR(8),
    phase VARCHAR(8),
    lfreq DOUBLE PRECISION,
    hfreq DOUBLE PRECISION,
    ampcor_verid BIGINT,
    polyid BIGINT,
    delta DOUBLE PRECISION,
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    ampraw DOUBLE PRECISION,
    ampmdac DOUBLE PRECISION,
    ampdac DOUBLE PRECISION,
    ampmac DOUBLE PRECISION,
    ntime DOUBLE PRECISION,
    nendtime DOUBLE PRECISION,
    snr DOUBLE PRECISION,
    ampdef VARCHAR(1),
    auth VARCHAR(15),
    comments VARCHAR(4000),
    lddate TIMESTAMP,
    ,PRIMARY KEY (lfreq),
    ,CONSTRAINT ecm_rca__ampcor_verid__ck CHECK (( ampcor_verid >0) OR ampcor_verid = -1),
    ,CONSTRAINT ecm_rca__ampdef__ck CHECK (ampdef in('n', 'N', 'd', 'D')),
    ,CONSTRAINT ecm_rca__delta__ck CHECK (delta >=0),
    ,CONSTRAINT ecm_rca__endtime__ck CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT ecm_rca__evid__ck CHECK (evid >0),
    ,CONSTRAINT ecm_rca__hfreq__ck CHECK (hfreq >0),
    ,CONSTRAINT ecm_rca__lfreq__ck CHECK (lfreq >=0),
    ,CONSTRAINT ecm_rca__nendtime__ck CHECK (nendtime < 9999999999.999 OR nendtime = 9999999999.999),
    ,CONSTRAINT ecm_rca__ntime__ck CHECK (ntime >= -9999999999.999),
    ,CONSTRAINT ecm_rca__polyid__ck CHECK (polyid >0),
    ,CONSTRAINT ecm_rca__snr__ck CHECK (snr > 0 OR snr = -1),
    ,CONSTRAINT ecm_rca__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE ecm_ref_chan_amplitude IS $$ The ecm_ref_chan_amplitude table contains reference time win dows (start and end times), raw amplitude, and MDAC for each evid, station, channel, phase and frequency bin. These meas urements were combined according to the parameters of the di scriminant that was calculated. $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.evid IS $$ Event identifier $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.sta IS $$ Station name $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.chan IS $$ Channel name $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.phase IS $$ phase of interest $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.lfreq IS $$ low end of frequency bin used to filter measurement $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.hfreq IS $$ high end of frequency bin used to filter measurement $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.ampcor_verid IS $$ AmpCor version Identifier used in ECM Versioning $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.polyid IS $$ Polygon Identifier $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.delta IS $$ Source-receiver distance $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.time IS $$ time of reference event $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.endtime IS $$ end time of measurement window $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.ampraw IS $$ actual amplitude measured $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.ampmdac IS $$ Magnitude and Distance Amplitude Correction $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.ampdac IS $$ Distance amplitude correction $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.ampmac IS $$ Magnitude amplitude correction $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.ntime IS $$ start time of the noise window $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.nendtime IS $$ end time of the noise window $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.snr IS $$ Signal-to-noise ratio $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.ampdef IS $$ Defining flag for element amplitude measurement to be used for station/network average $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.auth IS $$ Author $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.comments IS $$ comment text $$;
COMMENT ON COLUMN ecm_ref_chan_amplitude.lddate IS $$ Load date $$;

-- Table: ECM_REF_DISCRIM
CREATE TABLE IF NOT EXISTS ecm_ref_discrim (
    evid BIGINT,
    cov_verid BIGINT,
    discrim_name VARCHAR(15),
    discrim_p_value DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (cov_verid),
    ,CONSTRAINT ecm_ref_discrim__cov_verid__ck CHECK (cov_verid >0),
    ,CONSTRAINT ecm_ref_discrim__evid__ck CHECK (evid >0),
    ,CONSTRAINT ecm_ref_dscr__discrm_p_val__ck CHECK (( discrim_p_value >= 0 AND discrim_p_value <=1 ) OR discrim_p_value = -1)
);
COMMENT ON TABLE ecm_ref_discrim IS $$ The ecm_ref_discrim table contains a p-value for each refid and discriminant. The refid relates to a specific reference event in the ecm_ref_event. $$;
COMMENT ON COLUMN ecm_ref_discrim.evid IS $$ Event Identifier $$;
COMMENT ON COLUMN ecm_ref_discrim.cov_verid IS $$ version identifier of the covariance matrix $$;
COMMENT ON COLUMN ecm_ref_discrim.discrim_name IS $$ discriminant of interest $$;
COMMENT ON COLUMN ecm_ref_discrim.discrim_p_value IS $$ p-value of this discriminant for this reference event $$;
COMMENT ON COLUMN ecm_ref_discrim.auth IS $$ Author $$;
COMMENT ON COLUMN ecm_ref_discrim.lddate IS $$ Load date $$;

-- Table: ECM_REF_EVENT
CREATE TABLE IF NOT EXISTS ecm_ref_event (
    evid BIGINT,
    time DOUBLE PRECISION,
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    depth DOUBLE PRECISION,
    mb DOUBLE PRECISION,
    ms DOUBLE PRECISION,
    mw DOUBLE PRECISION,
    source_type VARCHAR(7),
    sub_type VARCHAR(10),
    polyid BIGINT,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (evid),
    ,CONSTRAINT ecm_ref_event__depth__ck CHECK (( depth >= -100 AND depth <=1000 ) OR depth = -999),
    ,CONSTRAINT ecm_ref_event__evid__ck CHECK (evid >0),
    ,CONSTRAINT ecm_ref_event__lat__ck CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT ecm_ref_event__lon__ck CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT ecm_ref_event__mb__ck CHECK (( mb >= -9.99 AND mb <=50 ) OR mb = -999),
    ,CONSTRAINT ecm_ref_event__ms__ck CHECK (( ms >= -9.99 AND ms <=50 ) OR ms = -999),
    ,CONSTRAINT ecm_ref_event__mw__ck CHECK (( mw >= -9.99 AND mw <=50 ) OR mw = -999),
    ,CONSTRAINT ecm_ref_event__polyid__ck CHECK (polyid >0),
    ,CONSTRAINT ecm_ref_event__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE ecm_ref_event IS $$ The ecm_ref_event table contains event data for each event u sed to calibrate the ECM. $$;
COMMENT ON COLUMN ecm_ref_event.evid IS $$ Event Identifier $$;
COMMENT ON COLUMN ecm_ref_event.time IS $$ time of reference event $$;
COMMENT ON COLUMN ecm_ref_event.lat IS $$ Latitude $$;
COMMENT ON COLUMN ecm_ref_event.lon IS $$ Longitude $$;
COMMENT ON COLUMN ecm_ref_event.depth IS $$ depth of reference event $$;
COMMENT ON COLUMN ecm_ref_event.mb IS $$ body wave magnitude of reference event $$;
COMMENT ON COLUMN ecm_ref_event.ms IS $$ surface wave magnitude of reference event $$;
COMMENT ON COLUMN ecm_ref_event.mw IS $$ moment magnitude of reference event $$;
COMMENT ON COLUMN ecm_ref_event.source_type IS $$ source type of interest $$;
COMMENT ON COLUMN ecm_ref_event.sub_type IS $$ source sub-type of reference event $$;
COMMENT ON COLUMN ecm_ref_event.polyid IS $$ Polygon Identifier $$;
COMMENT ON COLUMN ecm_ref_event.auth IS $$ Author $$;
COMMENT ON COLUMN ecm_ref_event.lddate IS $$ Load date $$;

-- Table: ECM_REGION_PREF_VERSION
CREATE TABLE IF NOT EXISTS ecm_region_pref_version (
    polyid BIGINT,
    cov_verid BIGINT,
    rda_verid BIGINT,
    auth VARCHAR(15),
    comments VARCHAR(4000),
    lddate TIMESTAMP,
    ,PRIMARY KEY (polyid),
    ,CONSTRAINT ecm_reg_pref_ver__cov_vid__ck CHECK (cov_verid >0),
    ,CONSTRAINT ecm_reg_pref_ver__polyid__ck CHECK (polyid >0),
    ,CONSTRAINT ecm_reg_pref_ver__rda_vid__ck CHECK (rda_verid >0)
);
COMMENT ON TABLE ecm_region_pref_version IS $$ The ecm_region_pref_version table contains _________________ _______ $$;
COMMENT ON COLUMN ecm_region_pref_version.polyid IS $$ Polygon Identifier $$;
COMMENT ON COLUMN ecm_region_pref_version.cov_verid IS $$ version identifier of the covariance matrix $$;
COMMENT ON COLUMN ecm_region_pref_version.rda_verid IS $$ version identifier of the RDA $$;
COMMENT ON COLUMN ecm_region_pref_version.auth IS $$ Author $$;
COMMENT ON COLUMN ecm_region_pref_version.comments IS $$ comment text $$;
COMMENT ON COLUMN ecm_region_pref_version.lddate IS $$ Load date $$;

-- Table: ECM_SOURCES
CREATE TABLE IF NOT EXISTS ecm_sources (
    orid BIGINT,
    source_type VARCHAR(15),
    cov_verid BIGINT,
    rda_verid BIGINT,
    pop_mem DOUBLE PRECISION,
    con_prob DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (source_type),
    ,CONSTRAINT ecm_sources__con_prob__ck CHECK (( con_prob >= 0 AND con_prob <=1 ) OR con_prob = -1),
    ,CONSTRAINT ecm_sources__cov_verid__ck CHECK (( cov_verid >0 ) OR cov_verid = -1),
    ,CONSTRAINT ecm_sources__orid__ck CHECK (orid >0),
    ,CONSTRAINT ecm_sources__pop_mem__ck CHECK (( pop_mem >= 0 AND pop_mem <=1 ) OR pop_mem = -1),
    ,CONSTRAINT ecm_sources__rda_verid__ck CHECK (( rda_verid >0 ) OR rda_verid = -1)
);
COMMENT ON TABLE ecm_sources IS $$ The ecm_sources table contains aggregate p-values and poster iori probabilities for each evid and source type. $$;
COMMENT ON COLUMN ecm_sources.orid IS $$ id of the origin $$;
COMMENT ON COLUMN ecm_sources.source_type IS $$ source type of interest $$;
COMMENT ON COLUMN ecm_sources.cov_verid IS $$ version identifier of the covariance matrix $$;
COMMENT ON COLUMN ecm_sources.rda_verid IS $$ rda version identifier $$;
COMMENT ON COLUMN ecm_sources.pop_mem IS $$ p-value for this source type $$;
COMMENT ON COLUMN ecm_sources.con_prob IS $$ posteriori probability $$;
COMMENT ON COLUMN ecm_sources.auth IS $$ Author $$;
COMMENT ON COLUMN ecm_sources.lddate IS $$ Load date $$;

-- Table: ECM_STA_PREF_VERSION
CREATE TABLE IF NOT EXISTS ecm_sta_pref_version (
    polyid BIGINT,
    sta VARCHAR(6),
    ampcor_verid BIGINT,
    auth VARCHAR(15),
    comments VARCHAR(4000),
    lddate TIMESTAMP,
    ,PRIMARY KEY (polyid),
    ,CONSTRAINT ecm_sta_pref_ver__ac_vid__ck CHECK (ampcor_verid >0 OR ampcor_verid = -1),
    ,CONSTRAINT ecm_sta_pref_ver__polyid__ck CHECK (polyid >0),
    ,CONSTRAINT ecm_sta_pref_ver__sta__ck CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE ecm_sta_pref_version IS $$ The ecm_sta_pref_version table contains ____________________ ____ $$;
COMMENT ON COLUMN ecm_sta_pref_version.polyid IS $$ Polygon Identifier $$;
COMMENT ON COLUMN ecm_sta_pref_version.sta IS $$ Station Code $$;
COMMENT ON COLUMN ecm_sta_pref_version.ampcor_verid IS $$ amplitude correction version identifier $$;
COMMENT ON COLUMN ecm_sta_pref_version.auth IS $$ Author $$;
COMMENT ON COLUMN ecm_sta_pref_version.comments IS $$ comment text $$;
COMMENT ON COLUMN ecm_sta_pref_version.lddate IS $$ Load date $$;

-- Table: ENVELOPE_CONTRIBUTION
CREATE TABLE IF NOT EXISTS envelope_contribution (
    flo DOUBLE PRECISION,
    fhi DOUBLE PRECISION,
    sta VARCHAR(6),
    chan VARCHAR(8),
    orid BIGINT,
    arid BIGINT,
    ampdef VARCHAR(1),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (flo),
    ,CONSTRAINT envelope_contrib__ampdef__ck CHECK (ampdef IN ( 'd','n','D','N' )),
    ,CONSTRAINT envelope_contrib__arid__ck CHECK (arid > 0),
    ,CONSTRAINT envelope_contrib__orid__ck CHECK (orid > 0),
    ,CONSTRAINT envelope_contrib__sta__ck CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE envelope_contribution IS $$ The envelope_contribution table contains information as to w hich frequency bands are defining or nondefining for coda ma gnitude calculation. Bands may be set defining or nondefinin g either automatically by DFX or manually by an analyst. $$;
COMMENT ON COLUMN envelope_contribution.flo IS $$ Low corner freq for filter $$;
COMMENT ON COLUMN envelope_contribution.fhi IS $$ High corner freq for filter $$;
COMMENT ON COLUMN envelope_contribution.sta IS $$ Station code $$;
COMMENT ON COLUMN envelope_contribution.chan IS $$ Channel code $$;
COMMENT ON COLUMN envelope_contribution.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN envelope_contribution.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN envelope_contribution.ampdef IS $$ d or n flag indicating if station/element is included (d,D) or excluded (n,N) from coda magnitude processing $$;
COMMENT ON COLUMN envelope_contribution.auth IS $$ Author $$;
COMMENT ON COLUMN envelope_contribution.lddate IS $$ Load date $$;

-- Table: EVENT
CREATE TABLE IF NOT EXISTS event (
    evid BIGINT,
    evname VARCHAR(32),
    prefor BIGINT,
    auth VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (evid),
    ,CONSTRAINT event__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT event__evid__ck CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT event__prefor__ck CHECK (prefor > 0)
);
COMMENT ON TABLE event IS $$ The event table contains a list of events. Multiple origins may be defined for any one event. The column prefor points t o the preferred origin. $$;
COMMENT ON COLUMN event.evid IS $$ Event identifier $$;
COMMENT ON COLUMN event.evname IS $$ Event name $$;
COMMENT ON COLUMN event.prefor IS $$ Preferred origin $$;
COMMENT ON COLUMN event.auth IS $$ Source/originator $$;
COMMENT ON COLUMN event.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN event.lddate IS $$ Load date $$;

-- Table: EVENT_CONTROL
CREATE TABLE IF NOT EXISTS event_control (
    orid BIGINT,
    evid BIGINT,
    prefer_loc VARCHAR(1),
    constrain_ot SMALLINT,
    constrain_latlon SMALLINT,
    constrain_depth SMALLINT,
    src_dpnt_corr SMALLINT,
    loc_src_dpnt_reg VARCHAR(15),
    loc_sdv_screen SMALLINT,
    loc_sdv_mult DOUBLE PRECISION,
    loc_alpha_only SMALLINT,
    loc_all_stas SMALLINT,
    loc_dist_varwgt SMALLINT,
    loc_user_varwgt DOUBLE PRECISION,
    mag_src_dpnt_reg VARCHAR(15),
    mag_sdv_screen SMALLINT,
    mag_sdv_mult DOUBLE PRECISION,
    mag_alpha_only SMALLINT,
    mag_all_stas SMALLINT,
    mb_min_dist DOUBLE PRECISION,
    mb_max_dist DOUBLE PRECISION,
    mmodel VARCHAR(15),
    cov_sm_axes DOUBLE PRECISION,
    cov_depth_time DOUBLE PRECISION,
    obs_corr_method SMALLINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid),
    ,CONSTRAINT event_ctrl__constr_depth__ck CHECK (constrain_depth IN (0,1)),
    ,CONSTRAINT event_ctrl__constr_latlon__ck CHECK (constrain_latlon IN (0,1)),
    ,CONSTRAINT event_ctrl__constr_ot__ck CHECK (constrain_ot IN (0,1)),
    ,CONSTRAINT event_ctrl__cov_depth_time__ck CHECK (cov_depth_time > 0.0 OR cov_depth_time = -999.0),
    ,CONSTRAINT event_ctrl__cov_sm_axes__ck CHECK (cov_sm_axes > 0.0 OR cov_sm_axes = -999.0),
    ,CONSTRAINT event_ctrl__evid___ck CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT event_ctrl__loc_all_stas__ck CHECK (loc_all_stas IN (0, 1)),
    ,CONSTRAINT event_ctrl__loc_alpha_only__ck CHECK (loc_alpha_only IN (0, 1)),
    ,CONSTRAINT event_ctrl__loc_distvarwgt__ck CHECK (loc_dist_varwgt IN (0, 1)),
    ,CONSTRAINT event_ctrl__loc_sdv_mult__ck CHECK (loc_sdv_mult > 0.0),
    ,CONSTRAINT event_ctrl__loc_sdv_screen__ck CHECK (loc_sdv_screen IN (0,1)),
    ,CONSTRAINT event_ctrl__loc_uservarwgt__ck CHECK (loc_user_varwgt > 0.0 OR loc_user_varwgt = -1.0),
    ,CONSTRAINT event_ctrl__mag_all_stas__ck CHECK (mag_all_stas IN (0,1)),
    ,CONSTRAINT event_ctrl__mag_alpha_only__ck CHECK (mag_alpha_only IN (0,1)),
    ,CONSTRAINT event_ctrl__mag_sdv_mult__ck CHECK (mag_sdv_mult > 0.0),
    ,CONSTRAINT event_ctrl__mag_sdv_screen__ck CHECK (mag_sdv_screen IN (0,1)),
    ,CONSTRAINT event_ctrl__mb_max_dist__ck CHECK ((mb_max_dist >= 0.0 AND mb_max_dist <= 180.0) OR mb_max_dist = -999.0),
    ,CONSTRAINT event_ctrl__mb_min_dist__ck CHECK ((mb_min_dist >= 0.0 AND mb_min_dist <= 180.0) OR mb_min_dist = -999.0),
    ,CONSTRAINT event_ctrl__obs_corr_meth__ck CHECK (obs_corr_method >= 0),
    ,CONSTRAINT event_ctrl__orid__ck CHECK (orid > 0),
    ,CONSTRAINT event_ctrl__prefer_loc__ck CHECK (prefer_loc IN ('F', 'S', 'R')),
    ,CONSTRAINT event_ctrl__src_dpnt_corr__ck CHECK (src_dpnt_corr IN (0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13))
);
COMMENT ON TABLE event_control IS $$ The event_control table contains event location and magnitud e control parameters. This information acts as an archive of the specific user-defined controls that were used to determ ine the location and magnitude of a given orid. The table al so includes two measurement columns (cov_sm_axes and cov_dep th_time) that allow the coverage ellipse to be determined fr om the confidence ellipse axes. $$;
COMMENT ON COLUMN event_control.orid IS $$ Origin identification $$;
COMMENT ON COLUMN event_control.evid IS $$ Event identification $$;
COMMENT ON COLUMN event_control.prefer_loc IS $$ Preferred location identifier (S, F, R) $$;
COMMENT ON COLUMN event_control.constrain_ot IS $$ Flag to constrain origin time $$;
COMMENT ON COLUMN event_control.constrain_latlon IS $$ Flag to constrain latitude/longitude $$;
COMMENT ON COLUMN event_control.constrain_depth IS $$ Flag to constrain depth $$;
COMMENT ON COLUMN event_control.src_dpnt_corr IS $$ Source-dependent correction code $$;
COMMENT ON COLUMN event_control.loc_src_dpnt_reg IS $$ Region name of source-dependent location correction $$;
COMMENT ON COLUMN event_control.loc_sdv_screen IS $$ Flag to ignore large data residuals in location $$;
COMMENT ON COLUMN event_control.loc_sdv_mult IS $$ Location large residual multiplier factor $$;
COMMENT ON COLUMN event_control.loc_alpha_only IS $$ Flag to use only primary stations in location $$;
COMMENT ON COLUMN event_control.loc_all_stas IS $$ Flag to use only stations with src_dpnt_corr $$;
COMMENT ON COLUMN event_control.loc_dist_varwgt IS $$ Flag to use distance variance weighting $$;
COMMENT ON COLUMN event_control.loc_user_varwgt IS $$ User-defined variance weighting $$;
COMMENT ON COLUMN event_control.mag_src_dpnt_reg IS $$ Region name of source-dependent magnitude correction $$;
COMMENT ON COLUMN event_control.mag_sdv_screen IS $$ Flag to ignore large magnitude data residuals $$;
COMMENT ON COLUMN event_control.mag_sdv_mult IS $$ Magnitude large residual multiplier factor $$;
COMMENT ON COLUMN event_control.mag_alpha_only IS $$ Flag to limit station net used in magnitude $$;
COMMENT ON COLUMN event_control.mag_all_stas IS $$ Flag to use only primary stations in magnitude $$;
COMMENT ON COLUMN event_control.mb_min_dist IS $$ Minimum distance (degrees) for mb $$;
COMMENT ON COLUMN event_control.mb_max_dist IS $$ Maximum distance (degrees) for mb $$;
COMMENT ON COLUMN event_control.mmodel IS $$ Network magnitude model $$;
COMMENT ON COLUMN event_control.cov_sm_axes IS $$ Coverage ellipse semi-axes conversion factor $$;
COMMENT ON COLUMN event_control.cov_depth_time IS $$ Coverage ellipse depth/time conversion factor $$;
COMMENT ON COLUMN event_control.obs_corr_method IS $$ Observed Correlation Method $$;
COMMENT ON COLUMN event_control.lddate IS $$ Load date $$;

-- Table: EVENT_CORRELATION
CREATE TABLE IF NOT EXISTS event_correlation (
    corr_id BIGINT,
    source_orid BIGINT,
    source_evid BIGINT,
    source_starttime DOUBLE PRECISION,
    source_secs DOUBLE PRECISION,
    reference_orid BIGINT,
    reference_evid BIGINT,
    reference_starttime DOUBLE PRECISION,
    reference_secs DOUBLE PRECISION,
    sta VARCHAR(6),
    filter_string VARCHAR(2000),
    num_chan INTEGER,
    chan_list VARCHAR(2000),
    corr_coef DOUBLE PRECISION,
    corr_time DOUBLE PRECISION,
    scan_type VARCHAR(32),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (corr_id),
    ,CONSTRAINT event_corr__corr_id__ck CHECK (corr_id > 0),
    ,CONSTRAINT event_corr__ref_evid__ck CHECK (reference_evid > 0),
    ,CONSTRAINT event_corr__ref_orid__ck CHECK (reference_orid > 0),
    ,CONSTRAINT event_corr__source_evid__ck CHECK (source_evid > 0 OR source_evid = -1),
    ,CONSTRAINT event_corr__source_orid__ck CHECK (source_orid > 0)
);
COMMENT ON TABLE event_correlation IS $$ The event_Correlation table containts correlations between s ource events in the NDC operational database to reference ev ents in the NDC archive databases for time periods as great as 15 years. $$;
COMMENT ON COLUMN event_correlation.corr_id IS $$ Correlation Identifier $$;
COMMENT ON COLUMN event_correlation.source_orid IS $$ The source origin used in the event correlation. $$;
COMMENT ON COLUMN event_correlation.source_evid IS $$ The source event used in the event correlation. $$;
COMMENT ON COLUMN event_correlation.source_starttime IS $$ The start time of the source waveform segment used for correlation. $$;
COMMENT ON COLUMN event_correlation.source_secs IS $$ The length of the source waveform in seconds used for correlation. $$;
COMMENT ON COLUMN event_correlation.reference_orid IS $$ The reference origin for this correlation from the archive database. $$;
COMMENT ON COLUMN event_correlation.reference_evid IS $$ The reference event for this correlation from the archive database. $$;
COMMENT ON COLUMN event_correlation.reference_starttime IS $$ The start time of the reference waveform segment used for correlation. $$;
COMMENT ON COLUMN event_correlation.reference_secs IS $$ The length of the reference waveform in seconds used for correlation. $$;
COMMENT ON COLUMN event_correlation.sta IS $$ Station identifier $$;
COMMENT ON COLUMN event_correlation.filter_string IS $$ Compact filter representation used as parameter to filter_data_by_string module. $$;
COMMENT ON COLUMN event_correlation.num_chan IS $$ Number of channels in CHAN_LIST $$;
COMMENT ON COLUMN event_correlation.chan_list IS $$ List of channels used for array correlation $$;
COMMENT ON COLUMN event_correlation.corr_coef IS $$ Correlation coefficient used in this correlation calculation. $$;
COMMENT ON COLUMN event_correlation.corr_time IS $$ Correlation time of event. $$;
COMMENT ON COLUMN event_correlation.scan_type IS $$ Correlation Scan type: AUTO, USER, or REF. $$;
COMMENT ON COLUMN event_correlation.author IS $$ Author of this correlation. $$;
COMMENT ON COLUMN event_correlation.moddate IS $$ Modification Date. $$;
COMMENT ON COLUMN event_correlation.lddate IS $$ Load Date. $$;

-- Table: EVENT_QUALITY
CREATE TABLE IF NOT EXISTS event_quality (
    eqid BIGINT,
    orid BIGINT,
    evqual DOUBLE PRECISION,
    netprob DOUBLE PRECISION,
    detprob DOUBLE PRECISION,
    histprob DOUBLE PRECISION,
    nndef DOUBLE PRECISION,
    nsmajax DOUBLE PRECISION,
    ndelta_sta DOUBLE PRECISION,
    ntimeres DOUBLE PRECISION,
    nazres DOUBLE PRECISION,
    nslores DOUBLE PRECISION,
    nampres DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (eqid),
    ,CONSTRAINT event_quality__detprob__ck CHECK ((detprob >= 0.0 AND detprob <= 1.0) OR detprob = -999),
    ,CONSTRAINT event_quality__eqid__ck CHECK (eqid > 0),
    ,CONSTRAINT event_quality__evqual__ck CHECK (evqual >= 0.0 AND evqual <= 1.0),
    ,CONSTRAINT event_quality__histprob__ck CHECK ((histprob >= 0.0 AND histprob <= 1.0) OR histprob = -999),
    ,CONSTRAINT event_quality__nampres__ck CHECK (( nampres >= 0.0 AND nampres <= 1.0 ) OR nampres = -999),
    ,CONSTRAINT event_quality__nazres__ck CHECK (( nazres >= 0.0 AND nazres <= 1.0 ) OR nazres = -999),
    ,CONSTRAINT event_quality__ndelta_sta__ck CHECK (ndelta_sta >= 0.0 AND ndelta_sta <= 1.0),
    ,CONSTRAINT event_quality__netprob__ck CHECK ((netprob >= 0.0 AND netprob <= 1.0) OR netprob = -999),
    ,CONSTRAINT event_quality__nndef__ck CHECK (nndef >= 0.0 AND nndef <= 1.0),
    ,CONSTRAINT event_quality__nslores__ck CHECK (( nslores >= 0.0 AND nslores <= 1.0 ) OR nslores = -999),
    ,CONSTRAINT event_quality__nsmajax__ck CHECK (nsmajax >= 0.0 AND nsmajax <= 1.0),
    ,CONSTRAINT event_quality__ntimeres__ck CHECK (ntimeres >= 0.0 AND ntimeres <= 1.0),
    ,CONSTRAINT event_quality__orid__ck CHECK (orid > 0)
);
COMMENT ON TABLE event_quality IS $$ The event_quality table holds the event quality attributes t hat are calculated by various processes such as EvLoc, ARS, and GAConflict using the Event Quality Generator. $$;
COMMENT ON COLUMN event_quality.eqid IS $$ Event quality identifier $$;
COMMENT ON COLUMN event_quality.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN event_quality.evqual IS $$ Event quality $$;
COMMENT ON COLUMN event_quality.netprob IS $$ Network probability $$;
COMMENT ON COLUMN event_quality.detprob IS $$ Detection probability $$;
COMMENT ON COLUMN event_quality.histprob IS $$ Historic probability $$;
COMMENT ON COLUMN event_quality.nndef IS $$ Normalized number of defining phases $$;
COMMENT ON COLUMN event_quality.nsmajax IS $$ Normalized semi-major axis of error ellipse $$;
COMMENT ON COLUMN event_quality.ndelta_sta IS $$ Normalized distance to the closest station $$;
COMMENT ON COLUMN event_quality.ntimeres IS $$ Normalized time residual $$;
COMMENT ON COLUMN event_quality.nazres IS $$ Normalized azimuth residual $$;
COMMENT ON COLUMN event_quality.nslores IS $$ Normalized slowness residual $$;
COMMENT ON COLUMN event_quality.nampres IS $$ Normalized amplitude residual $$;
COMMENT ON COLUMN event_quality.auth IS $$ Author $$;
COMMENT ON COLUMN event_quality.lddate IS $$ Load date $$;

-- Table: FEEDBACK
CREATE TABLE IF NOT EXISTS feedback (
    feedback_id BIGINT,
    evid BIGINT,
    orid BIGINT,
    event_time DOUBLE PRECISION,
    title VARCHAR(64),
    analyst VARCHAR(32),
    account VARCHAR(15),
    feedback_analyst VARCHAR(32),
    feedback_account VARCHAR(15),
    description ,
    response VARCHAR(4000),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (feedback_id),
    ,CONSTRAINT feedback__event_time__ck CHECK (event_time >= -9999999999.999),
    ,CONSTRAINT feedback__evid__ck CHECK (evid > 0),
    ,CONSTRAINT feedback__feedback_id__ck CHECK (feedback_id > 0),
    ,CONSTRAINT feedback__orid__ck CHECK (orid > 0)
);
COMMENT ON TABLE feedback IS $$ The feedback table contains analyst feedback from one analys t regarding a discrepancy made by another analyst' work in t he Analyst Review System (ARS). $$;
COMMENT ON COLUMN feedback.feedback_id IS $$ Feedback Identifier $$;
COMMENT ON COLUMN feedback.evid IS $$ Event Identifier $$;
COMMENT ON COLUMN feedback.orid IS $$ Origin Identifier $$;
COMMENT ON COLUMN feedback.event_time IS $$ Epoch time that the event occurred. $$;
COMMENT ON COLUMN feedback.title IS $$ Feedback title $$;
COMMENT ON COLUMN feedback.analyst IS $$ The targeted analyst the feedback pertains to. $$;
COMMENT ON COLUMN feedback.account IS $$ Pipeline account that the analyst is receiving feedback for. $$;
COMMENT ON COLUMN feedback.feedback_analyst IS $$ The original analyst of the event being reviewed. $$;
COMMENT ON COLUMN feedback.feedback_account IS $$ Pipeline account from which the analyst is receiving feedback. $$;
COMMENT ON COLUMN feedback.description IS $$ A detailed description of the feedback to the analyst. This is the primary description of the problem from the author to the analyst. $$;
COMMENT ON COLUMN feedback.response IS $$ This is the response by the analyst to the given feedback. If the feedback is rejected, this is where the reason for rejection should be documented. Rejection is used to allow accurate trending of fe edback $$;
COMMENT ON COLUMN feedback.author IS $$ The analyst creating the feedback $$;
COMMENT ON COLUMN feedback.moddate IS $$ Modification date $$;
COMMENT ON COLUMN feedback.lddate IS $$ Load date $$;

-- Table: FEEDBACK_CATAFFILIATION
CREATE TABLE IF NOT EXISTS feedback_cataffiliation (
    fbaffiliation_id BIGINT,
    feedback_id BIGINT,
    fbcategory_id BIGINT,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (fbaffiliation_id),
    ,CONSTRAINT fb_cataff__fbaffil_id__ck CHECK (fbaffiliation_id > 0),
    ,CONSTRAINT fb_cataff__fbcategory_id__ck CHECK (fbcategory_id > 0),
    ,CONSTRAINT fb_cataff__feedback_id__ck CHECK (feedback_id > 0)
);
COMMENT ON TABLE feedback_cataffiliation IS $$ The feedback_cataffiliation contains foregin keys to the fee dback table and feedback_categories table to assign categori cal affiliation(s) to each feedback. $$;
COMMENT ON COLUMN feedback_cataffiliation.fbaffiliation_id IS $$ Feedback Affiliation Identifier. $$;
COMMENT ON COLUMN feedback_cataffiliation.feedback_id IS $$ Feedback Identifier $$;
COMMENT ON COLUMN feedback_cataffiliation.fbcategory_id IS $$ Feedback Category Identifier $$;
COMMENT ON COLUMN feedback_cataffiliation.author IS $$ The analyst creating the feedback. $$;
COMMENT ON COLUMN feedback_cataffiliation.moddate IS $$ Modification date $$;
COMMENT ON COLUMN feedback_cataffiliation.lddate IS $$ Load date $$;

-- Table: FEEDBACK_CATEGORIES
CREATE TABLE IF NOT EXISTS feedback_categories (
    fbcategory_id BIGINT,
    title VARCHAR(64),
    description VARCHAR(4000),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (fbcategory_id),
    ,CONSTRAINT fb_categories__fbcat_id__ck CHECK (fbcategory_id > 0)
);
COMMENT ON TABLE feedback_categories IS $$ The feedback_categories table contains descriptions of each feedback category referenced by the feedback_cataffiliation table. $$;
COMMENT ON COLUMN feedback_categories.fbcategory_id IS $$ Feedback Category Identifier $$;
COMMENT ON COLUMN feedback_categories.title IS $$ Short description/title of the feedback category $$;
COMMENT ON COLUMN feedback_categories.description IS $$ Detailed description of the feedback category $$;
COMMENT ON COLUMN feedback_categories.author IS $$ The analyst creating the feedback. $$;
COMMENT ON COLUMN feedback_categories.moddate IS $$ Modification date $$;
COMMENT ON COLUMN feedback_categories.lddate IS $$ Load date $$;

-- Table: FEEDBACK_SCREENSHOTS
CREATE TABLE IF NOT EXISTS feedback_screenshots (
    fbscreenshot_id BIGINT,
    feedback_id BIGINT,
    title VARCHAR(64),
    description VARCHAR(4000),
    screenshot ,
    type VARCHAR(10),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (fbscreenshot_id),
    ,CONSTRAINT feedback_ss__fbss_id__ck CHECK (fbscreenshot_id > 0),
    ,CONSTRAINT feedback_ss__feedback_id__ck CHECK (feedback_id > 0),
    ,CONSTRAINT feedback_ss__type__ck CHECK (type IN ('png', 'PNG'))
);
COMMENT ON TABLE feedback_screenshots IS $$ The feedback_screenshots table contains image files related to feedback entries. $$;
COMMENT ON COLUMN feedback_screenshots.fbscreenshot_id IS $$ Feedback Screenshot Identifier $$;
COMMENT ON COLUMN feedback_screenshots.feedback_id IS $$ Feedback Identifier $$;
COMMENT ON COLUMN feedback_screenshots.title IS $$ Short description/title of the screenshot $$;
COMMENT ON COLUMN feedback_screenshots.description IS $$ Detailed description of the screenshot $$;
COMMENT ON COLUMN feedback_screenshots.screenshot IS $$ A binary storage for an image file $$;
COMMENT ON COLUMN feedback_screenshots.type IS $$ Screenshot image file type (Initial allowable types (jpg, jpeg, png)) $$;
COMMENT ON COLUMN feedback_screenshots.author IS $$ The analyst creating the feedback. $$;
COMMENT ON COLUMN feedback_screenshots.moddate IS $$ Modification date $$;
COMMENT ON COLUMN feedback_screenshots.lddate IS $$ Load date $$;

-- Table: FEEDBACK_STATE
CREATE TABLE IF NOT EXISTS feedback_state (
    fbstate_id BIGINT,
    feedback_id BIGINT,
    fbstatecategory_id BIGINT,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (fbstate_id),
    ,CONSTRAINT fb_state__fbstatecat_id__ck CHECK (fbstatecategory_id > 0),
    ,CONSTRAINT fb_state__fbstate_id__ck CHECK (fbstate_id > 0),
    ,CONSTRAINT fb_state__feedback_id__ck CHECK (feedback_id > 0)
);
COMMENT ON TABLE feedback_state IS $$ The feedback_state table contains one or more states a feedb ack is currently in or has formerly been in. A Feedback entr y can only be in one state at a time, such as saved or rejec ted. As a feedback progresses through its lifecycle, it will have more than one state per feedback entry, and the latest one entered in this table will always be the current state. $$;
COMMENT ON COLUMN feedback_state.fbstate_id IS $$ Feedback State Identifier $$;
COMMENT ON COLUMN feedback_state.feedback_id IS $$ Feedback Identifier $$;
COMMENT ON COLUMN feedback_state.fbstatecategory_id IS $$ Feedback State Category Identifier $$;
COMMENT ON COLUMN feedback_state.author IS $$ The analyst creating the feedback. $$;
COMMENT ON COLUMN feedback_state.moddate IS $$ Modification date $$;
COMMENT ON COLUMN feedback_state.lddate IS $$ Load date $$;

-- Table: FEEDBACK_STATE_CATEGORIES
CREATE TABLE IF NOT EXISTS feedback_state_categories (
    fbstatecategory_id BIGINT,
    title VARCHAR(64),
    description VARCHAR(4000),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (fbstatecategory_id),
    ,CONSTRAINT fb_state_cat__fbstcat_id__ck CHECK (fbstatecategory_id > 0)
);
COMMENT ON TABLE feedback_state_categories IS $$ The feedback_state_category contains descriptions of the var ious states a feedback record can be in such as saved or rej ected. $$;
COMMENT ON COLUMN feedback_state_categories.fbstatecategory_id IS $$ Feedback State Category Identifier $$;
COMMENT ON COLUMN feedback_state_categories.title IS $$ Short description/title of the feedback state category $$;
COMMENT ON COLUMN feedback_state_categories.description IS $$ Detailed description of the feedback state category $$;
COMMENT ON COLUMN feedback_state_categories.author IS $$ The analyst creating the feedback state category. $$;
COMMENT ON COLUMN feedback_state_categories.moddate IS $$ Modification date $$;
COMMENT ON COLUMN feedback_state_categories.lddate IS $$ Load date $$;

-- Table: FILTER
CREATE TABLE IF NOT EXISTS filter (
    filterid BIGINT,
    compound_filter ,
    filter_method VARCHAR(2),
    filter_string VARCHAR(2000),
    filter_hash VARCHAR(2000),
    lddate TIMESTAMP,
    ,PRIMARY KEY (filterid),
    ,CONSTRAINT filter__compound_filter__ck CHECK (compound_filter IN ('y','n')),
    ,CONSTRAINT filter__filterid__ck CHECK (filterid > 0),
    ,CONSTRAINT filter__filt_meth__ck CHECK (filter_method IN ('A','B','C','F','G','N','O','U','W'))
);
COMMENT ON TABLE filter IS $$ The filter table will contain the core information needed to identify filters. The attributes in this table will be high ly indexed for fast searching. The attributes will allow app lication to quickly access enough information to 1) determin e the type of filter so that an application can branch accor dingly to efficiently handle loading or 2) determine uniquen ess when assessing if a filter does or does not exist. $$;
COMMENT ON COLUMN filter.filterid IS $$ Identifier for a filter or filter collection. $$;
COMMENT ON COLUMN filter.compound_filter IS $$ Flag to indicate parent. [Y,N] $$;
COMMENT ON COLUMN filter.filter_method IS $$ Filter algorithm family. [Cascade, AR, Butterworth, Phase_Matched, Digital, Dynamic, etc.] $$;
COMMENT ON COLUMN filter.filter_string IS $$ Compact filter representation used as parameter to filter_data_by_string module. $$;
COMMENT ON COLUMN filter.filter_hash IS $$ Standardized filter specification, formatted for uniqueness checking and fast access. $$;
COMMENT ON COLUMN filter.lddate IS $$ Load Date. $$;

-- Table: FILTER_COEFFICIENTS
CREATE TABLE IF NOT EXISTS filter_coefficients (
    filterid BIGINT,
    value_name VARCHAR(48),
    col_seq INTEGER,
    d_value DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (value_name),
    ,CONSTRAINT filter_coeff__col_seq__ck CHECK (col_seq > 0),
    ,CONSTRAINT filter_coeff__d_value_ck CHECK (D_VALUE >= -9999999999.999),
    ,CONSTRAINT filter_coeff__filterid__ck CHECK (filterid > 0)
);
COMMENT ON TABLE filter_coefficients IS $$ The filter_coefficients table contains a collection of doubl e precision coefficients for a filter. For the persistent pa rameters bundle, the filter_coefficients table will be used to store numerator and denominator coefficients for a coeffi cient configured filter, identified by a parent record in th e filter table. $$;
COMMENT ON COLUMN filter_coefficients.filterid IS $$ Filter identifier $$;
COMMENT ON COLUMN filter_coefficients.value_name IS $$ Attribute name (e.g. numerator_coeff) $$;
COMMENT ON COLUMN filter_coefficients.col_seq IS $$ collection sequence/order $$;
COMMENT ON COLUMN filter_coefficients.d_value IS $$ Double precision coefficient value $$;
COMMENT ON COLUMN filter_coefficients.lddate IS $$ Load date $$;

-- Table: FILTER_GROUP
CREATE TABLE IF NOT EXISTS filter_group (
    parent_filterid BIGINT,
    child_filterid BIGINT,
    child_sequence INTEGER,
    child_function ,
    lddate TIMESTAMP,
    ,PRIMARY KEY (child_filterid),
    ,CONSTRAINT filter_group__child_funct__ck CHECK (child_function IN ('f','c')),
    ,CONSTRAINT filter_group__child_seq__ck CHECK (child_sequence > 0),
    ,CONSTRAINT filter_group__chi_filterid__ck CHECK (child_filterid > 0),
    ,CONSTRAINT filter_group__par_filterid__ck CHECK (parent_filterid > 0)
);
COMMENT ON TABLE filter_group IS $$ The filter_group table is used to link together the individu al filters of a compound filter. The parent filter record of a compound filter will have a compound_filter indicator val ue of 'Y' and may have a filter method of 'Cascade' or 'AR'. The filter_group table will contain one record for each fil ter in the compound filter group, all sharing a common paren t filter record. For Flexibility, the key to the record is p arent_filterid-child_filterid-child_sequence, to allow compl ex compound filters to use a filter more than once. $$;
COMMENT ON COLUMN filter_group.parent_filterid IS $$ Identifier for a collection or group of filters. $$;
COMMENT ON COLUMN filter_group.child_filterid IS $$ Identifier for a simple / single filter. $$;
COMMENT ON COLUMN filter_group.child_sequence IS $$ Order that the child filter should be applied. $$;
COMMENT ON COLUMN filter_group.child_function IS $$ Designation of the child filter role in the collection, either as a standard filter or as a conditioning filter. [F,C] $$;
COMMENT ON COLUMN filter_group.lddate IS $$ Load Date $$;

-- Table: FILTER_VALUES_DOUBLE
CREATE TABLE IF NOT EXISTS filter_values_double (
    filterid BIGINT,
    value_name VARCHAR(48),
    d_value DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (value_name),
    ,CONSTRAINT filter_val_dbl__d_value__ck CHECK (D_VALUE >= -9999999999.999),
    ,CONSTRAINT filter_val_dbl__filterid__ck CHECK (filterid > 0)
);
COMMENT ON TABLE filter_values_double IS $$ The filter_values_double table will store filter parameters and metadata (float values). Each record will contain only o ne piece of information. Each filter type will store only th ose pieces of information that are pertinent to that filter type. A butterworth filter will have fhi and flo attribute r ecords while digital filters may have num_numerator_coeffs o r compute_time_shift attributes. $$;
COMMENT ON COLUMN filter_values_double.filterid IS $$ Filter identifier $$;
COMMENT ON COLUMN filter_values_double.value_name IS $$ Attribute name, (e.g. fhi, flo) $$;
COMMENT ON COLUMN filter_values_double.d_value IS $$ Double precision value $$;
COMMENT ON COLUMN filter_values_double.lddate IS $$ Load date $$;

-- Table: FILTER_VALUES_INTEGER
CREATE TABLE IF NOT EXISTS filter_values_integer (
    filterid BIGINT,
    value_name VARCHAR(48),
    i_value BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (filterid),
    ,CONSTRAINT filter_val_int__filterid__ck CHECK (filterid > 0)
);
COMMENT ON TABLE filter_values_integer IS $$ The filter_values_double table will store filter parameters and metadata (integer values). Each record will contain only one piece of information. Each filter type will store only those pieces of information that are pertinent to that filte r type. A butterworth filter will have fhi and flo attribute records while digital filters may have num_numerator_coeffs or compute_time_shift attributes. $$;
COMMENT ON COLUMN filter_values_integer.filterid IS $$ Filter identifier $$;
COMMENT ON COLUMN filter_values_integer.value_name IS $$ Attribute name, (e.g. fhi, flo) $$;
COMMENT ON COLUMN filter_values_integer.i_value IS $$ Integer value. $$;
COMMENT ON COLUMN filter_values_integer.lddate IS $$ Load date $$;

-- Table: FILTER_VALUES_STRING
CREATE TABLE IF NOT EXISTS filter_values_string (
    filterid BIGINT,
    value_name VARCHAR(48),
    s_value VARCHAR(1024),
    lddate TIMESTAMP,
    ,PRIMARY KEY (filterid),
    ,CONSTRAINT filter_val_str__filterid__ck CHECK (filterid > 0)
);
COMMENT ON TABLE filter_values_string IS $$ The filter_values_string table will store filter parameters and metadata (string values). Each record will contain only one piece of information. Each filter type will store only those pieces of information that are pertinent to that filte r type. A butterworth filter will have fhi and flo attribute records while digital filters may have num_numerator_coeffs or compute_time_shift attributes. $$;
COMMENT ON COLUMN filter_values_string.filterid IS $$ Filter identifier $$;
COMMENT ON COLUMN filter_values_string.value_name IS $$ Attribute name, (e.g. fhi, flo) $$;
COMMENT ON COLUMN filter_values_string.s_value IS $$ String value $$;
COMMENT ON COLUMN filter_values_string.lddate IS $$ Load date $$;

-- Table: FK_PROCESSING
CREATE TABLE IF NOT EXISTS fk_processing (
    arid BIGINT,
    procid BIGINT,
    lead DOUBLE PRECISION,
    lag DOUBLE PRECISION,
    fkfhi DOUBLE PRECISION,
    fkflo DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (procid),
    ,CONSTRAINT fk_processing__arid__ck CHECK (arid > 0),
    ,CONSTRAINT fk_processing__fkfhi__ck CHECK (fkfhi > 0 OR fkfhi = -1),
    ,CONSTRAINT fk_processing__fkflo__ck CHECK (fkflo > 0 OR fkflo = -1),
    ,CONSTRAINT fk_processing__lag__ck CHECK (lag > 0 OR lag = -1),
    ,CONSTRAINT fk_processing__lead__ck CHECK (lead > 0 OR lead = -1),
    ,CONSTRAINT fk_processing__procid__ck CHECK (procid > 0)
);
COMMENT ON TABLE fk_processing IS $$ The fk_processing table contains identifiers to link paramet ers for fk processing. It provides an override of the defaul t processing for a station and phase. This override is speci fied on a per arrival basis. $$;
COMMENT ON COLUMN fk_processing.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN fk_processing.procid IS $$ ID number of a set of waveform processing parameters $$;
COMMENT ON COLUMN fk_processing.lead IS $$ Number of seconds before phase to include in processing $$;
COMMENT ON COLUMN fk_processing.lag IS $$ Number of seconds after phase to include in processing $$;
COMMENT ON COLUMN fk_processing.fkfhi IS $$ FK fhi value $$;
COMMENT ON COLUMN fk_processing.fkflo IS $$ FK flo value $$;
COMMENT ON COLUMN fk_processing.auth IS $$ Author $$;
COMMENT ON COLUMN fk_processing.lddate IS $$ Load date $$;

-- Table: FTPFAILED
CREATE TABLE IF NOT EXISTS ftpfailed (
    msgid BIGINT,
    ftp_address VARCHAR(64),
    numfailedattempt SMALLINT,
    lastfailedtime DOUBLE PRECISION,
    ftpstatus VARCHAR(8),
    lddate TIMESTAMP,
    ,PRIMARY KEY (msgid),
    ,CONSTRAINT ftpfailed__ftpstatus__ck CHECK (ftpstatus IN ('retry','failed','-')),
    ,CONSTRAINT ftpfailed__lastfailedtime__ck CHECK (lastfailedtime > -9999999999.999),
    ,CONSTRAINT ftpfailed__msgid__ck CHECK (msgid > 0 OR msgid = -1),
    ,CONSTRAINT ftpfailed__numfailedattempt_ck CHECK (numfailedattempt > 0 OR numfailedattempt = 0)
);
COMMENT ON TABLE ftpfailed IS $$ The ftpfailed table facilitates ftp retrieval and the placem ent of data messages between contributing systems. $$;
COMMENT ON COLUMN ftpfailed.msgid IS $$ Message identifier $$;
COMMENT ON COLUMN ftpfailed.ftp_address IS $$ ftp address for auxilary data $$;
COMMENT ON COLUMN ftpfailed.numfailedattempt IS $$ Number of failed attempts $$;
COMMENT ON COLUMN ftpfailed.lastfailedtime IS $$ Time of most recent attempt $$;
COMMENT ON COLUMN ftpfailed.ftpstatus IS $$ Status of ftp attempt (retry or failed) $$;
COMMENT ON COLUMN ftpfailed.lddate IS $$ Load date $$;

-- Table: FTPLOGIN
CREATE TABLE IF NOT EXISTS ftplogin (
    ftp_address VARCHAR(64),
    username VARCHAR(24),
    password VARCHAR(16),
    lddate TIMESTAMP,
    ,PRIMARY KEY (ftp_address)
);
COMMENT ON TABLE ftplogin IS $$ The ftplogin table is used by the auxiliary data retrieval s ystem to obtain data via ftp from auxiliary stations. $$;
COMMENT ON COLUMN ftplogin.ftp_address IS $$ ftp address for auxiliary data $$;
COMMENT ON COLUMN ftplogin.username IS $$ User name for ftp access $$;
COMMENT ON COLUMN ftplogin.password IS $$ User password for ftp access $$;
COMMENT ON COLUMN ftplogin.lddate IS $$ Load date $$;

-- Table: GA_TAG
CREATE TABLE IF NOT EXISTS ga_tag (
    objtype VARCHAR(1),
    id BIGINT,
    process_state VARCHAR(20),
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    time DOUBLE PRECISION,
    evid_reject BIGINT,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (id),
    ,CONSTRAINT ga_tag CHECK (time >= -9999999999.999),
    ,CONSTRAINT ga_tag__evid_reject__ck CHECK (evid_reject > 0 OR evid_reject = -1),
    ,CONSTRAINT ga_tag__id__ck CHECK (id > 0),
    ,CONSTRAINT ga_tag__lat__ck CHECK ((lat >= -90.0 AND lat <= 90.0) OR lat = -999.0),
    ,CONSTRAINT ga_tag__lon__ck CHECK ((lon >= -180.0 AND lon <= 180.0) OR lon = -999.0),
    ,CONSTRAINT ga_tag__objtype__ck CHECK (objtype IN ('a', 'o'))
);
COMMENT ON TABLE ga_tag IS $$ The ga_tag table contains information on the use of arrivals and origins in the GA application. $$;
COMMENT ON COLUMN ga_tag.objtype IS $$ Type of identifier (a for arrival, o for origin) $$;
COMMENT ON COLUMN ga_tag.id IS $$ Identification number (arid or orid) $$;
COMMENT ON COLUMN ga_tag.process_state IS $$ Use of arid or orid $$;
COMMENT ON COLUMN ga_tag.lat IS $$ Latitude of origin $$;
COMMENT ON COLUMN ga_tag.lon IS $$ Longitude of origin $$;
COMMENT ON COLUMN ga_tag.time IS $$ Time of origin $$;
COMMENT ON COLUMN ga_tag.evid_reject IS $$ Evid of origin arrival was rejected from $$;
COMMENT ON COLUMN ga_tag.auth IS $$ Author $$;
COMMENT ON COLUMN ga_tag.lddate IS $$ Load date $$;

-- Table: GREGION
CREATE TABLE IF NOT EXISTS gregion (
    grn INTEGER,
    grname VARCHAR(40),
    lddate TIMESTAMP,
    ,PRIMARY KEY (grn),
    ,CONSTRAINT gregion__grn__ck CHECK ((grn >= 1 AND grn <= 729) OR grn = -1)
);
COMMENT ON TABLE gregion IS $$ The gregion table contains geographic region numbers and the ir equivalent descriptions. $$;
COMMENT ON COLUMN gregion.grn IS $$ Geographic region number $$;
COMMENT ON COLUMN gregion.grname IS $$ Geographic region name $$;
COMMENT ON COLUMN gregion.lddate IS $$ Load date $$;

-- Table: HISTORIC_INFO_CYLINDER
CREATE TABLE IF NOT EXISTS historic_info_cylinder (
    historic_info_cylinder_id BIGINT,
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    radius DOUBLE PRECISION,
    depth DOUBLE PRECISION,
    lower_depth DOUBLE PRECISION,
    upper_depth DOUBLE PRECISION,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (historic_info_cylinder_id),
    ,CONSTRAINT hist_cylinder__cylinder_id__ck CHECK (historic_info_cylinder_id > 0),
    ,CONSTRAINT hist_cylinder__depth__ck CHECK (depth >= -100 AND depth <= 1000),
    ,CONSTRAINT hist_cylinder__lat__ck CHECK (lat >= -90 AND lat <= 90),
    ,CONSTRAINT hist_cylinder__lon__ck CHECK (lon >= -180 AND lat <= 180),
    ,CONSTRAINT hist_cylinder__lower_depth__ck CHECK (lower_depth >= -100 AND lower_depth <= 1000),
    ,CONSTRAINT hist_cylinder__radius__ck CHECK (radius > 0),
    ,CONSTRAINT hist_cylinder__upper_depth__ck CHECK (upper_depth >= -100 AND upper_depth <= 1000)
);
COMMENT ON TABLE historic_info_cylinder IS $$ The historic_info_cylinder table is used to describe the cyl inder (ga_grid) in a shell. $$;
COMMENT ON COLUMN historic_info_cylinder.historic_info_cylinder_id IS $$ Historic information cylinder identifier $$;
COMMENT ON COLUMN historic_info_cylinder.lat IS $$ Estimated latitude of cylinder $$;
COMMENT ON COLUMN historic_info_cylinder.lon IS $$ Estimated longitude of cylinder $$;
COMMENT ON COLUMN historic_info_cylinder.radius IS $$ Radius of cylinder $$;
COMMENT ON COLUMN historic_info_cylinder.depth IS $$ Estimated depth of the cylinder $$;
COMMENT ON COLUMN historic_info_cylinder.lower_depth IS $$ Lower depth of cylinder $$;
COMMENT ON COLUMN historic_info_cylinder.upper_depth IS $$ Upper depth of cylinder $$;
COMMENT ON COLUMN historic_info_cylinder.author IS $$ Author $$;
COMMENT ON COLUMN historic_info_cylinder.moddate IS $$ Modification date $$;
COMMENT ON COLUMN historic_info_cylinder.lddate IS $$ Load date $$;

-- Table: HISTORIC_INFO_SHELL
CREATE TABLE IF NOT EXISTS historic_info_shell (
    historic_info_shell_id BIGINT,
    algorithm_id BIGINT,
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    inner_radius DOUBLE PRECISION,
    outer_radius DOUBLE PRECISION,
    depth DOUBLE PRECISION,
    lower_depth DOUBLE PRECISION,
    upper_depth DOUBLE PRECISION,
    min_azimuth DOUBLE PRECISION,
    max_azimuth DOUBLE PRECISION,
    refsta VARCHAR(6),
    phase VARCHAR(8),
    threshold DOUBLE PRECISION,
    uncertainty DOUBLE PRECISION,
    reliability DOUBLE PRECISION,
    num_observations INTEGER,
    processing_mode SMALLINT,
    on_date TIMESTAMP,
    off_date TIMESTAMP,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (historic_info_shell_id),
    ,CONSTRAINT hist_shell__algorithm_id__ck CHECK (algorithm_id > 0),
    ,CONSTRAINT hist_shell__depth__ck CHECK (depth >= -100 AND depth <= 1000),
    ,CONSTRAINT hist_shell__inner_radius__ck CHECK (inner_radius >= 0 AND inner_radius < 180),
    ,CONSTRAINT hist_shell__lat__ck CHECK (lat >= -90 AND lat <= 90),
    ,CONSTRAINT hist_shell__lon__ck CHECK (lon >= -180 AND lat <= 180),
    ,CONSTRAINT hist_shell__lower_depth__ck CHECK (lower_depth >= -100 AND lower_depth <= 1000),
    ,CONSTRAINT hist_shell__max_azimuth__ck CHECK ((max_azimuth >= 0.0 AND max_azimuth <= 360) OR max_azimuth = -1.0),
    ,CONSTRAINT hist_shell__min_azimuth__ck CHECK ((min_azimuth >= 0.0 AND min_azimuth <= 360) OR min_azimuth = -1.0),
    ,CONSTRAINT hist_shell__outer_radius__ck CHECK (outer_radius > 0 AND outer_radius <= 180),
    ,CONSTRAINT hist_shell__shell_id__ck CHECK (historic_info_shell_id > 0),
    ,CONSTRAINT hist_shell__threshold__ck CHECK ((threshold > -9.99 AND threshold < 50.0) OR threshold = -1.0),
    ,CONSTRAINT hist_shell__uncertainty__ck CHECK (uncertainty > 0.0 OR uncertainty = -1.0),
    ,CONSTRAINT hist_shell__upper_depth__ck CHECK (upper_depth >= -100 AND upper_depth <= 1000)
);
COMMENT ON TABLE historic_info_shell IS $$ The historic_info_shell table is used to describe the shell containing cylinders for specific station and phase. $$;
COMMENT ON COLUMN historic_info_shell.historic_info_shell_id IS $$ Historic information shell identifier $$;
COMMENT ON COLUMN historic_info_shell.algorithm_id IS $$ Algorithm identifier $$;
COMMENT ON COLUMN historic_info_shell.lat IS $$ Estimated latitude of the shell $$;
COMMENT ON COLUMN historic_info_shell.lon IS $$ Estimated longitude of the shell $$;
COMMENT ON COLUMN historic_info_shell.inner_radius IS $$ Radius of inner shell $$;
COMMENT ON COLUMN historic_info_shell.outer_radius IS $$ Radius of outer shell $$;
COMMENT ON COLUMN historic_info_shell.depth IS $$ Estimated depth $$;
COMMENT ON COLUMN historic_info_shell.lower_depth IS $$ Lower depth of shell $$;
COMMENT ON COLUMN historic_info_shell.upper_depth IS $$ Upper depth of shell $$;
COMMENT ON COLUMN historic_info_shell.min_azimuth IS $$ Minimum observed azimuth $$;
COMMENT ON COLUMN historic_info_shell.max_azimuth IS $$ Maximum observed azimuth $$;
COMMENT ON COLUMN historic_info_shell.refsta IS $$ Reference station $$;
COMMENT ON COLUMN historic_info_shell.phase IS $$ Phase $$;
COMMENT ON COLUMN historic_info_shell.threshold IS $$ Magnitude detection threshold $$;
COMMENT ON COLUMN historic_info_shell.uncertainty IS $$ Uncertainty estimate of magnitude threshold $$;
COMMENT ON COLUMN historic_info_shell.reliability IS $$ Estimate based on percent of events observed $$;
COMMENT ON COLUMN historic_info_shell.num_observations IS $$ Number of observations $$;
COMMENT ON COLUMN historic_info_shell.processing_mode IS $$ Defines the type of processing used to determine the shell $$;
COMMENT ON COLUMN historic_info_shell.on_date IS $$ The date the historic information shell first became active or was created $$;
COMMENT ON COLUMN historic_info_shell.off_date IS $$ The date the historic information shell was removed from the system or made obsolete $$;
COMMENT ON COLUMN historic_info_shell.author IS $$ Author $$;
COMMENT ON COLUMN historic_info_shell.moddate IS $$ Modification date $$;
COMMENT ON COLUMN historic_info_shell.lddate IS $$ Load date $$;

-- Table: HISTORIC_INFO_STA_PHASE
CREATE TABLE IF NOT EXISTS historic_info_sta_phase (
    historic_info_sta_phase_id BIGINT,
    historic_info_cylinder_id BIGINT,
    algorithm_id BIGINT,
    refsta VARCHAR(6),
    phase VARCHAR(8),
    threshold DOUBLE PRECISION,
    uncertainty DOUBLE PRECISION,
    reliability DOUBLE PRECISION,
    num_observations INTEGER,
    processing_mode SMALLINT,
    on_date TIMESTAMP,
    off_date TIMESTAMP,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (historic_info_sta_phase_id),
    ,CONSTRAINT hist_st_phse__algorithm_id__ck CHECK (algorithm_id > 0),
    ,CONSTRAINT hist_st_phse__cylinder_id__ck CHECK (historic_info_cylinder_id > 0),
    ,CONSTRAINT hist_st_phse__num_obs__ck CHECK (num_observations > 0 OR num_observations = -1),
    ,CONSTRAINT hist_st_phse__proc_mode__ck CHECK ((processing_mode > 0 AND processing_mode < 100) OR processing_mode = -1),
    ,CONSTRAINT hist_st_phse__reliability__ck CHECK ((reliability >= 0 AND reliability <= 1.0) OR reliability = -1.0),
    ,CONSTRAINT hist_st_phse__sta_phase_id__ck CHECK (historic_info_sta_phase_id > 0),
    ,CONSTRAINT hist_st_phse__threshold__ck CHECK ((threshold > -9.99 AND threshold < 50.0) OR threshold = -999.0),
    ,CONSTRAINT hist_st_phse__uncertainty__ck CHECK (uncertainty > 0.0 OR uncertainty = -1.0)
);
COMMENT ON TABLE historic_info_sta_phase IS $$ The historic_info_sta_phase table describes the station and phase information for a given time used to compute the histo ric cylinders and shells. $$;
COMMENT ON COLUMN historic_info_sta_phase.historic_info_sta_phase_id IS $$ Historic information for stations and phases identifier $$;
COMMENT ON COLUMN historic_info_sta_phase.historic_info_cylinder_id IS $$ Historic information cylinder identifier $$;
COMMENT ON COLUMN historic_info_sta_phase.algorithm_id IS $$ Algorithm identifier $$;
COMMENT ON COLUMN historic_info_sta_phase.refsta IS $$ Reference station $$;
COMMENT ON COLUMN historic_info_sta_phase.phase IS $$ Phase $$;
COMMENT ON COLUMN historic_info_sta_phase.threshold IS $$ Magnitude detection threshold $$;
COMMENT ON COLUMN historic_info_sta_phase.uncertainty IS $$ Uncertainty estimate of magnitude threshold $$;
COMMENT ON COLUMN historic_info_sta_phase.reliability IS $$ Estimate based on percent of events observed $$;
COMMENT ON COLUMN historic_info_sta_phase.num_observations IS $$ Number of observations $$;
COMMENT ON COLUMN historic_info_sta_phase.processing_mode IS $$ Defines the type of processing used for the station/phase pair $$;
COMMENT ON COLUMN historic_info_sta_phase.on_date IS $$ The date the historic information station and phase first became active or was created $$;
COMMENT ON COLUMN historic_info_sta_phase.off_date IS $$ The date the historic information station and phase was removed from the sysem or made obsolete $$;
COMMENT ON COLUMN historic_info_sta_phase.author IS $$ Author $$;
COMMENT ON COLUMN historic_info_sta_phase.moddate IS $$ Modification date $$;
COMMENT ON COLUMN historic_info_sta_phase.lddate IS $$ Load date $$;

-- Table: HYDRO_ARR_GROUP
CREATE TABLE IF NOT EXISTS hydro_arr_group (
    hydro_id BIGINT,
    az1 DOUBLE PRECISION,
    az2 DOUBLE PRECISION,
    slow DOUBLE PRECISION,
    delaz DOUBLE PRECISION,
    nhydarr SMALLINT,
    net VARCHAR(8),
    hyd_grp_phase VARCHAR(8),
    lddate TIMESTAMP,
    ,PRIMARY KEY (hydro_id),
    ,CONSTRAINT hydro_arr_group__az1__ck CHECK ((az1 >= 0.0 AND az1 <= 360.0) OR az1 = -1.0),
    ,CONSTRAINT hydro_arr_group__az2__ck CHECK ((az2 >= 0.0 AND az2 <= 360.0) OR az2 = -1.0),
    ,CONSTRAINT hydro_arr_group__delaz__ck CHECK (delaz > 0.0 OR delaz = -1.0),
    ,CONSTRAINT hydro_arr_group__hydro_id__ck CHECK (hydro_id > 0),
    ,CONSTRAINT hydro_arr_group__slow__ck CHECK (slow >= 0.0 OR slow = -1.0)
);
COMMENT ON TABLE hydro_arr_group IS $$ The hydro_arr_group table contains hydroacoustic arrival-bas ed estimates of slowness and azimuth. $$;
COMMENT ON COLUMN hydro_arr_group.hydro_id IS $$ Hydro-arrival-group identifier $$;
COMMENT ON COLUMN hydro_arr_group.az1 IS $$ Azimuth estimated from lag times $$;
COMMENT ON COLUMN hydro_arr_group.az2 IS $$ Second possible azimuth (2 arrivals) $$;
COMMENT ON COLUMN hydro_arr_group.slow IS $$ Slowness (s/km) $$;
COMMENT ON COLUMN hydro_arr_group.delaz IS $$ Azimuth uncertainty $$;
COMMENT ON COLUMN hydro_arr_group.nhydarr IS $$ Number of arrivals in hydro-arrival-group $$;
COMMENT ON COLUMN hydro_arr_group.net IS $$ Hydro network name $$;
COMMENT ON COLUMN hydro_arr_group.hyd_grp_phase IS $$ Hydro-arrival-group phase $$;
COMMENT ON COLUMN hydro_arr_group.lddate IS $$ Load date $$;

-- Table: HYDRO_ARRIVAL
CREATE TABLE IF NOT EXISTS hydro_arrival (
    arid BIGINT,
    sta VARCHAR(6),
    duronset DOUBLE PRECISION,
    durend DOUBLE PRECISION,
    onset_time DOUBLE PRECISION,
    termination_time DOUBLE PRECISION,
    cplag DOUBLE PRECISION,
    bpfrqac DOUBLE PRECISION,
    rt DOUBLE PRECISION,
    bpfrqcep DOUBLE PRECISION,
    rms DOUBLE PRECISION,
    flt_rto DOUBLE PRECISION,
    normamp DOUBLE PRECISION,
    ampcorclip DOUBLE PRECISION,
    ampcordist DOUBLE PRECISION,
    ampcordepth DOUBLE PRECISION,
    yield DOUBLE PRECISION,
    ylderr DOUBLE PRECISION,
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (arid),
    ,CONSTRAINT hydro_arriv__ampcorclip__ck CHECK (ampcorclip >= 0.0 OR ampcorclip = -1.0),
    ,CONSTRAINT hydro_arriv__ampcordepth__ck CHECK (ampcordepth >= 0.0 OR ampcordepth = -1.0),
    ,CONSTRAINT hydro_arriv__ampcordist__ck CHECK ((ampcordist >= -180.0 AND ampcordist <= 180.0)OR ampcordist = -999.0),
    ,CONSTRAINT hydro_arriv__arid__ck CHECK (arid > 0),
    ,CONSTRAINT hydro_arriv__bpfrqac__ck CHECK (bpfrqac >= 0.0 OR bpfrqac = -1.0),
    ,CONSTRAINT hydro_arriv__bpfrqcep__ck CHECK (bpfrqcep >= 0.0 OR bpfrqcep = -1.0),
    ,CONSTRAINT hydro_arriv__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT hydro_arriv__cplag__ck CHECK (cplag > 0.0 OR cplag = -1.0),
    ,CONSTRAINT hydro_arriv__durend__ck CHECK (durend > -9999999999.999),
    ,CONSTRAINT hydro_arriv__duronset__ck CHECK (duronset > -9999999999.999),
    ,CONSTRAINT hydro_arriv__flt_rto__ck CHECK (flt_rto > 0.0 OR flt_rto = -1.0),
    ,CONSTRAINT hydro_arriv__normamp__ck CHECK (normamp > 0.0 OR normamp = -1.0),
    ,CONSTRAINT hydro_arriv__onset_time__ck CHECK (onset_time > -9999999999.999),
    ,CONSTRAINT hydro_arriv__rms__ck CHECK (rms > 0.0 OR rms = -1.0),
    ,CONSTRAINT hydro_arriv__rt__ck CHECK ((rt > 0.0 AND rt < 1.0) OR rt = -1.0),
    ,CONSTRAINT hydro_arriv__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT hydro_arriv__termin_time__ck CHECK (termination_time >= -9999999999.999),
    ,CONSTRAINT hydro_arriv__yield__ck CHECK (yield >= 0.0 OR yield = -1.0),
    ,CONSTRAINT hydro_arriv__ylderr__ck CHECK (ylderr >= 0.0 OR ylderr = -1.0)
);
COMMENT ON TABLE hydro_arrival IS $$ The hydro_arrival table contains hydroacoustic arrival infor mation such as duration and the crossing point lag of the si gnal, autocorrelation bubble pulse frequency, autocovariance peak ratio (rt), cepstrum bubble pulse, bubble pulse amplit ude versus root mean square (rms), filter ratio, normalized amplitude, sensor yield, and sensor yield error. $$;
COMMENT ON COLUMN hydro_arrival.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN hydro_arrival.sta IS $$ Station $$;
COMMENT ON COLUMN hydro_arrival.duronset IS $$ Duration onset time $$;
COMMENT ON COLUMN hydro_arrival.durend IS $$ Duration end time $$;
COMMENT ON COLUMN hydro_arrival.onset_time IS $$ Estimated onset time of signal $$;
COMMENT ON COLUMN hydro_arrival.termination_time IS $$ Estimated termination time of signal $$;
COMMENT ON COLUMN hydro_arrival.cplag IS $$ Crossing point lag of the signal $$;
COMMENT ON COLUMN hydro_arrival.bpfrqac IS $$ Autocorrelation bubble pulse $$;
COMMENT ON COLUMN hydro_arrival.rt IS $$ Autocovariance peak value $$;
COMMENT ON COLUMN hydro_arrival.bpfrqcep IS $$ Cepstrum bubble pulse $$;
COMMENT ON COLUMN hydro_arrival.rms IS $$ The rms amplitude from autocorrelation $$;
COMMENT ON COLUMN hydro_arrival.flt_rto IS $$ Filter ratio $$;
COMMENT ON COLUMN hydro_arrival.normamp IS $$ Normalized amplitude $$;
COMMENT ON COLUMN hydro_arrival.ampcorclip IS $$ Correction to raw amplitude for clipping $$;
COMMENT ON COLUMN hydro_arrival.ampcordist IS $$ Correction to raw amplitude for distance $$;
COMMENT ON COLUMN hydro_arrival.ampcordepth IS $$ Correction to raw amp for depth $$;
COMMENT ON COLUMN hydro_arrival.yield IS $$ Sensor yield $$;
COMMENT ON COLUMN hydro_arrival.ylderr IS $$ Sensor yield error $$;
COMMENT ON COLUMN hydro_arrival.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN hydro_arrival.lddate IS $$ Load date $$;

-- Table: HYDRO_ASSOC
CREATE TABLE IF NOT EXISTS hydro_assoc (
    arid BIGINT,
    hydro_id BIGINT,
    azcontrib VARCHAR(1),
    lddate TIMESTAMP,
    ,PRIMARY KEY (arid),
    ,CONSTRAINT hydro_assoc__arid__ck CHECK (arid > 0),
    ,CONSTRAINT hydro_assoc__azcontrib__ck CHECK (azcontrib IN ('y', 'n', '-')),
    ,CONSTRAINT hydro_assoc__hydro_id__ck CHECK (hydro_id > 0)
);
COMMENT ON TABLE hydro_assoc IS $$ The hydro_assoc table contains the azimuth contribution info rmation for an arrival that is connected to a particular hyd ro arrival group. $$;
COMMENT ON COLUMN hydro_assoc.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN hydro_assoc.hydro_id IS $$ Hydro-arrival-group identifier $$;
COMMENT ON COLUMN hydro_assoc.azcontrib IS $$ Azimuth contribution flag (y or n) $$;
COMMENT ON COLUMN hydro_assoc.lddate IS $$ Load date $$;

-- Table: HYDRO_ORIGIN
CREATE TABLE IF NOT EXISTS hydro_origin (
    orid BIGINT,
    hydroloc_code INTEGER,
    hydroyield DOUBLE PRECISION,
    hydroylderr DOUBLE PRECISION,
    num_in_series INTEGER,
    serid BIGINT,
    hyd_class_code INTEGER,
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid),
    ,CONSTRAINT hydro_org__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT hydro_org__hydroloc_code__ck CHECK (hydroloc_code >= 0 OR hydroloc_code = -1),
    ,CONSTRAINT hydro_org__hydroyield__ck CHECK (hydroyield > 0.0 OR hydroyield = 0.0),
    ,CONSTRAINT hydro_org__hydroylderr__ck CHECK (hydroylderr > 0.0 OR hydroylderr = 0.0),
    ,CONSTRAINT hydro_org__hyd_class_code__ck CHECK (hyd_class_code IN (1,2,3,4,5,6,-999 )),
    ,CONSTRAINT hydro_org__num_in_series__ck CHECK (num_in_series > 0 OR num_in_series = -1),
    ,CONSTRAINT hydro_org__orid__ck CHECK (orid > 0),
    ,CONSTRAINT hydro_org__serid__ck CHECK (serid > 0 OR serid = -1)
);
COMMENT ON TABLE hydro_origin IS $$ The hydro_origin table contains a summary of AFTAC-specific hydroacoustic origin information such as Type of origin loca tion, determined from: Seismic system. Various unique hydroa coustic signal types, volcanic underwater, or undetermined. Bubble pulse frequency used to calculate the yield value and that yield value error. This table also identifies if this origin is part of a series and the unique identifier for tha t series. $$;
COMMENT ON COLUMN hydro_origin.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN hydro_origin.hydroloc_code IS $$ Hydroacoustic origin location $$;
COMMENT ON COLUMN hydro_origin.hydroyield IS $$ Hydroacoustic event yield $$;
COMMENT ON COLUMN hydro_origin.hydroylderr IS $$ Hydroacoustic event yield error $$;
COMMENT ON COLUMN hydro_origin.num_in_series IS $$ Number of event in series $$;
COMMENT ON COLUMN hydro_origin.serid IS $$ Series identifier $$;
COMMENT ON COLUMN hydro_origin.hyd_class_code IS $$ Hydroacoustic event classification $$;
COMMENT ON COLUMN hydro_origin.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN hydro_origin.lddate IS $$ Load date $$;

-- Table: INSTRUMENT
CREATE TABLE IF NOT EXISTS instrument (
    inid BIGINT,
    insname VARCHAR(50),
    instype VARCHAR(6),
    band VARCHAR(1),
    digital VARCHAR(1),
    samprate DOUBLE PRECISION,
    ncalib DOUBLE PRECISION,
    ncalper DOUBLE PRECISION,
    dir VARCHAR(64),
    dfile VARCHAR(32),
    rsptype VARCHAR(6),
    lddate TIMESTAMP,
    ,PRIMARY KEY (inid),
    ,CONSTRAINT instrument__band__ck CHECK (band IN ('s','m','i','l','b','h','v','e','r','w','a','f','c','g','-')),
    ,CONSTRAINT instrument__digital__ck CHECK (digital IN ('d','a','-')),
    ,CONSTRAINT instrument__inid__ck CHECK (inid > 0),
    ,CONSTRAINT instrument__ncalib__ck CHECK (ncalib != 0.0),
    ,CONSTRAINT instrument__ncalper__ck CHECK (ncalper > 0.0),
    ,CONSTRAINT instrument__rsptype__ck CHECK (rsptype = LOWER(rsptype)),
    ,CONSTRAINT instrument__samprate__ck CHECK (samprate > 0.0)
);
COMMENT ON TABLE instrument IS $$ The instrument table contains ancillary calibration informat ion. It holds nominal one-frequency calibration factors for each instrument and pointers to nominal frequency-dependent calibration for an instrument. This table also holds pointer s to the exact calibrations obtained by direct measurement o n a particular instrument (see sensor). $$;
COMMENT ON COLUMN instrument.inid IS $$ Instrument identifier $$;
COMMENT ON COLUMN instrument.insname IS $$ Instrument name $$;
COMMENT ON COLUMN instrument.instype IS $$ Instrument type $$;
COMMENT ON COLUMN instrument.band IS $$ Frequency band $$;
COMMENT ON COLUMN instrument.digital IS $$ Data type, digital (d), or analog (a) $$;
COMMENT ON COLUMN instrument.samprate IS $$ Sampling rate in samples/second $$;
COMMENT ON COLUMN instrument.ncalib IS $$ Nominal calibration (nanometers/digital count) $$;
COMMENT ON COLUMN instrument.ncalper IS $$ Nominal calibration period (seconds) $$;
COMMENT ON COLUMN instrument.dir IS $$ Directory $$;
COMMENT ON COLUMN instrument.dfile IS $$ Data file $$;
COMMENT ON COLUMN instrument.rsptype IS $$ Response type $$;
COMMENT ON COLUMN instrument.lddate IS $$ Load date $$;

-- Table: INTERVAL
CREATE TABLE IF NOT EXISTS interval (
    intvlid BIGINT,
    class VARCHAR(16),
    name VARCHAR(20),
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    state VARCHAR(16),
    auth VARCHAR(15),
    percent_available DOUBLE PRECISION,
    proc_start_date TIMESTAMP,
    proc_end_date TIMESTAMP,
    moddate TIMESTAMP,
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (class),
    ,CONSTRAINT interval_uk UNIQUE (intvlid),
    ,CONSTRAINT interval__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT interval__endtime__ck CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT interval__intvlid__ck CHECK (intvlid > 0),
    ,CONSTRAINT interval__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE interval IS $$ The interval table defines units of processing. The time, en dtime, and name types indicate processing times for a named object. The class type allows a single interval table to be used for different classes of objects. $$;
COMMENT ON COLUMN interval.intvlid IS $$ Interval identifier $$;
COMMENT ON COLUMN interval.class IS $$ Type of interval $$;
COMMENT ON COLUMN interval.name IS $$ Name of interval $$;
COMMENT ON COLUMN interval.time IS $$ Starting time of data $$;
COMMENT ON COLUMN interval.endtime IS $$ Ending time of data $$;
COMMENT ON COLUMN interval.state IS $$ Current processing state $$;
COMMENT ON COLUMN interval.auth IS $$ Author of interval $$;
COMMENT ON COLUMN interval.percent_available IS $$ Percent of data available in interval $$;
COMMENT ON COLUMN interval.proc_start_date IS $$ Processing start date $$;
COMMENT ON COLUMN interval.proc_end_date IS $$ Processing stop date $$;
COMMENT ON COLUMN interval.moddate IS $$ Time of last processing state change $$;
COMMENT ON COLUMN interval.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN interval.lddate IS $$ Load date $$;

-- Table: MDAC_FD
CREATE TABLE IF NOT EXISTS mdac_fd (
    fdid BIGINT,
    ampcor_verid BIGINT,
    corrid BIGINT,
    lfreq DOUBLE PRECISION,
    sta VARCHAR(6),
    chan VARCHAR(8),
    tomoid BIGINT,
    polyid BIGINT,
    a DOUBLE PRECISION,
    b DOUBLE PRECISION,
    c DOUBLE PRECISION,
    sitefact DOUBLE PRECISION,
    algoid BIGINT,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (fdid),
    ,CONSTRAINT mdac_fd__algoid__ck CHECK (algoid >=0 OR algoid = -1),
    ,CONSTRAINT mdac_fd__ampcor_verid__ck CHECK (ampcor_verid >0),
    ,CONSTRAINT mdac_fd__a__ck CHECK (a >-100 OR a = -999),
    ,CONSTRAINT mdac_fd__b__ck CHECK (b >-100 OR b = -999),
    ,CONSTRAINT mdac_fd__corrid__ck CHECK (corrid >0),
    ,CONSTRAINT mdac_fd__c__ck CHECK (c >-100 OR c = -999),
    ,CONSTRAINT mdac_fd__fdid__ck CHECK (fdid >0),
    ,CONSTRAINT mdac_fd__lfreq__ck CHECK (lfreq >=0),
    ,CONSTRAINT mdac_fd__polyid__ck CHECK (polyid >=0 OR polyid = -1),
    ,CONSTRAINT mdac_fd__sitefact__ck CHECK (sitefact >-100 OR sitefact = -999),
    ,CONSTRAINT mdac_fd__tomoid__ck CHECK (tomoid >=0 OR tomoid = -1)
);
COMMENT ON TABLE mdac_fd IS $$ The mdac_fd table contains frequency dependent MDAC paramete rs for each corrid, frequency, and channel. (corrid is an in ternal id that relates to an mdac_fi record which is depende nt on polyid, phase, and station.) $$;
COMMENT ON COLUMN mdac_fd.fdid IS $$ Frequency dependent correction identifier $$;
COMMENT ON COLUMN mdac_fd.ampcor_verid IS $$ amplitude correction version identifier $$;
COMMENT ON COLUMN mdac_fd.corrid IS $$ Correction identifier $$;
COMMENT ON COLUMN mdac_fd.lfreq IS $$ Low frequency of amplitude measurement $$;
COMMENT ON COLUMN mdac_fd.sta IS $$ Station name $$;
COMMENT ON COLUMN mdac_fd.chan IS $$ Channel name $$;
COMMENT ON COLUMN mdac_fd.tomoid IS $$ Tomographic identifier $$;
COMMENT ON COLUMN mdac_fd.polyid IS $$ Polygon Identifier $$;
COMMENT ON COLUMN mdac_fd.a IS $$ First surface fit coefficient $$;
COMMENT ON COLUMN mdac_fd.b IS $$ Second surface fit coefficient $$;
COMMENT ON COLUMN mdac_fd.c IS $$ Third surface fit coefficient $$;
COMMENT ON COLUMN mdac_fd.sitefact IS $$ Site effect factor $$;
COMMENT ON COLUMN mdac_fd.algoid IS $$ Algorithm identifier $$;
COMMENT ON COLUMN mdac_fd.auth IS $$ Author, source of data $$;
COMMENT ON COLUMN mdac_fd.lddate IS $$ Load date (format YY//MM/DD HH24:MI:SS) $$;

-- Table: MDAC_FI
CREATE TABLE IF NOT EXISTS mdac_fi (
    corrid BIGINT,
    ampcor_verid BIGINT,
    polyid BIGINT,
    sta VARCHAR(6),
    phase VARCHAR(8),
    chan VARCHAR(8),
    corrname VARCHAR(32),
    sigma DOUBLE PRECISION,
    delsigma DOUBLE PRECISION,
    psi DOUBLE PRECISION,
    delpsi DOUBLE PRECISION,
    q0 DOUBLE PRECISION,
    delq0 DOUBLE PRECISION,
    gamma DOUBLE PRECISION,
    delgamma DOUBLE PRECISION,
    zeta DOUBLE PRECISION,
    m0_ref DOUBLE PRECISION,
    u0 DOUBLE PRECISION,
    eta DOUBLE PRECISION,
    deleta DOUBLE PRECISION,
    distcrit DOUBLE PRECISION,
    alphas DOUBLE PRECISION,
    betas DOUBLE PRECISION,
    rhos DOUBLE PRECISION,
    alphar DOUBLE PRECISION,
    betar DOUBLE PRECISION,
    rhor DOUBLE PRECISION,
    radpatp DOUBLE PRECISION,
    radpats DOUBLE PRECISION,
    snr1 DOUBLE PRECISION,
    snr2 DOUBLE PRECISION,
    noisetype VARCHAR(15),
    magid BIGINT,
    magtype VARCHAR(6),
    algoid BIGINT,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (ampcor_verid),
    ,CONSTRAINT mdac_fi__algoid__ck CHECK (algoid >= 0 or algoid = -1),
    ,CONSTRAINT mdac_fi__alphar__ck CHECK (alphar > 0 or alphar = -1),
    ,CONSTRAINT mdac_fi__alphas__ck CHECK (alphas > 0 or alphas = -1),
    ,CONSTRAINT mdac_fi__ampcor_verid__ck CHECK (ampcor_verid >0),
    ,CONSTRAINT mdac_fi__betar__ck CHECK (betar > 0 or betar = -1),
    ,CONSTRAINT mdac_fi__betas__ck CHECK (betas > 0 or betas = -1),
    ,CONSTRAINT mdac_fi__corrid__ck CHECK (corrid >0),
    ,CONSTRAINT mdac_fi__deleta__ck CHECK (deleta >= 0 or deleta = -1),
    ,CONSTRAINT mdac_fi__delgamma__ck CHECK (delgamma >= 0 or delgamma = -1),
    ,CONSTRAINT mdac_fi__delpsi__ck CHECK (delpsi >= 0 or delpsi = -1),
    ,CONSTRAINT mdac_fi__delq0__ck CHECK (delq0 >= 0 or delq0 = -1),
    ,CONSTRAINT mdac_fi__delsigma__ck CHECK (delsigma >= 0 or delsigma = -1),
    ,CONSTRAINT mdac_fi__distcrit__ck CHECK (distcrit >0),
    ,CONSTRAINT mdac_fi__eta__ck CHECK (eta >0),
    ,CONSTRAINT mdac_fi__gamma__ck CHECK (gamma > 0 or gamma = -1),
    ,CONSTRAINT mdac_fi__m0_ref__ck CHECK (m0_ref >0),
    ,CONSTRAINT mdac_fi__magid__ck CHECK (magid >= 0 or magid = -1),
    ,CONSTRAINT mdac_fi__polyid__ck CHECK (polyid >0),
    ,CONSTRAINT mdac_fi__psi__ck CHECK (psi >= 0 and psi <=1),
    ,CONSTRAINT mdac_fi__q0__ck CHECK (q0 > 0 or q0 = -1),
    ,CONSTRAINT mdac_fi__radpatp__ck CHECK (( radpatp >= 0 AND radpatp <=1 ) OR radpatp = -1),
    ,CONSTRAINT mdac_fi__radpats__ck CHECK (( radpats >= 0 AND radpats <=1 ) OR radpats = -1),
    ,CONSTRAINT mdac_fi__rhor__ck CHECK (rhor >0),
    ,CONSTRAINT mdac_fi__rhos__ck CHECK (rhos >0),
    ,CONSTRAINT mdac_fi__sigma__ck CHECK (sigma >0),
    ,CONSTRAINT mdac_fi__snr1__ck CHECK (snr1 > 0 or snr1 = -1),
    ,CONSTRAINT mdac_fi__snr2__ck CHECK (snr2 > 0 or snr2 = -1),
    ,CONSTRAINT mdac_fi__u0__ck CHECK (u0 >0),
    ,CONSTRAINT mdac_fi__zeta__ck CHECK (zeta >=1)
);
COMMENT ON TABLE mdac_fi IS $$ The mdac_fi table contains frequency independent MDAC parame ters for each polyid, phase, and station. $$;
COMMENT ON COLUMN mdac_fi.corrid IS $$ Correction identifier $$;
COMMENT ON COLUMN mdac_fi.ampcor_verid IS $$ amplitude correction version identifier $$;
COMMENT ON COLUMN mdac_fi.polyid IS $$ Polygon identifier $$;
COMMENT ON COLUMN mdac_fi.sta IS $$ Station name $$;
COMMENT ON COLUMN mdac_fi.phase IS $$ Phase of interest $$;
COMMENT ON COLUMN mdac_fi.chan IS $$ Channel name $$;
COMMENT ON COLUMN mdac_fi.corrname IS $$ Name of correction parameter set $$;
COMMENT ON COLUMN mdac_fi.sigma IS $$ Stress-drop in pascals $$;
COMMENT ON COLUMN mdac_fi.delsigma IS $$ Stress-drop in pascals uncertainty $$;
COMMENT ON COLUMN mdac_fi.psi IS $$ Exponent controlling moment-corner frequency scaling $$;
COMMENT ON COLUMN mdac_fi.delpsi IS $$ Uncertainty of psi $$;
COMMENT ON COLUMN mdac_fi.q0 IS $$ Attenuation at 1 Hz $$;
COMMENT ON COLUMN mdac_fi.delq0 IS $$ Uncertainty of q0 $$;
COMMENT ON COLUMN mdac_fi.gamma IS $$ Frequency exponent of attenuation $$;
COMMENT ON COLUMN mdac_fi.delgamma IS $$ Frequency exponent of attenuation uncertainty $$;
COMMENT ON COLUMN mdac_fi.zeta IS $$ Ratio of P and S wave corner frequencies $$;
COMMENT ON COLUMN mdac_fi.m0_ref IS $$ Reference seismic moment used with psi in Nm $$;
COMMENT ON COLUMN mdac_fi.u0 IS $$ Velocity of phase in m/s $$;
COMMENT ON COLUMN mdac_fi.eta IS $$ Geometric spreading exponent $$;
COMMENT ON COLUMN mdac_fi.deleta IS $$ Geometric spreading exponent uncertainty $$;
COMMENT ON COLUMN mdac_fi.distcrit IS $$ Critical distance for geometric spreading function in meters $$;
COMMENT ON COLUMN mdac_fi.alphas IS $$ P velocity at the source in m/s $$;
COMMENT ON COLUMN mdac_fi.betas IS $$ S velocity at the source in m/s $$;
COMMENT ON COLUMN mdac_fi.rhos IS $$ Density at the source in kg/m3 $$;
COMMENT ON COLUMN mdac_fi.alphar IS $$ P velocity at the receiver in m/s $$;
COMMENT ON COLUMN mdac_fi.betar IS $$ S velocity at the receiver in m/s $$;
COMMENT ON COLUMN mdac_fi.rhor IS $$ Density at the receiver in kg/m3 $$;
COMMENT ON COLUMN mdac_fi.radpatp IS $$ Radiation pattern excitation factor for P waves $$;
COMMENT ON COLUMN mdac_fi.radpats IS $$ Radiation pattern excitation factor for S waves $$;
COMMENT ON COLUMN mdac_fi.snr1 IS $$ Minimum signal-to-noise ratio used to select spectral amplitudes $$;
COMMENT ON COLUMN mdac_fi.snr2 IS $$ Minimum signal-to-noise for applying MDAC parameters $$;
COMMENT ON COLUMN mdac_fi.noisetype IS $$ Noise identifier e.g. pre-event or pre-phase $$;
COMMENT ON COLUMN mdac_fi.magid IS $$ Magnitude identifier $$;
COMMENT ON COLUMN mdac_fi.magtype IS $$ Magnitude type $$;
COMMENT ON COLUMN mdac_fi.algoid IS $$ Algorithm used $$;
COMMENT ON COLUMN mdac_fi.auth IS $$ Author $$;
COMMENT ON COLUMN mdac_fi.lddate IS $$ Load date (format YY/MM/DD HH24:MI:SS $$;

-- Table: MSGAUX
CREATE TABLE IF NOT EXISTS msgaux (
    msgid BIGINT,
    msgrow SMALLINT,
    statecount INTEGER,
    command VARCHAR(24),
    sub_status VARCHAR(24),
    lddate TIMESTAMP,
    ,PRIMARY KEY (statecount),
    ,CONSTRAINT msgaux__msgid__ck CHECK (msgid > 0 OR msgid = -1),
    ,CONSTRAINT msgaux__msgrow__ck CHECK (msgrow > 0 OR msgrow = -1),
    ,CONSTRAINT msgaux__statecount__ck CHECK (statecount >= 0)
);
COMMENT ON TABLE msgaux IS $$ The msgaux table contains records of unsuccessfully processe d Automatic Data Request Manager (AutoDRM) messages. $$;
COMMENT ON COLUMN msgaux.msgid IS $$ Message identifier $$;
COMMENT ON COLUMN msgaux.msgrow IS $$ Line number in message $$;
COMMENT ON COLUMN msgaux.statecount IS $$ Number of failures $$;
COMMENT ON COLUMN msgaux.command IS $$ Command that could not be processed $$;
COMMENT ON COLUMN msgaux.sub_status IS $$ Cause of failure $$;
COMMENT ON COLUMN msgaux.lddate IS $$ Load date $$;

-- Table: MSGDATATYPE
CREATE TABLE IF NOT EXISTS msgdatatype (
    msgid BIGINT,
    msgdtype VARCHAR(16),
    msgdformat VARCHAR(16),
    msgstatus VARCHAR(32),
    foff BIGINT,
    msize INTEGER,
    lddate TIMESTAMP,
    ,PRIMARY KEY (foff),
    ,CONSTRAINT msgdatatype__foff__ck CHECK (foff >= 0),
    ,CONSTRAINT msgdatatype__msgid__ck CHECK (msgid > 0 OR msgid = -1),
    ,CONSTRAINT msgdatatype__msgstatus__ck CHECK (msgstatus IN ('DONE', 'FAILED', '-')),
    ,CONSTRAINT msgdatatype__msize__ck CHECK (msize > 0 OR msize = -1)
);
COMMENT ON TABLE msgdatatype IS $$ The msgdatatype table supports data tracking by recording ea ch data section in a message for incoming and outgoing messa ges. $$;
COMMENT ON COLUMN msgdatatype.msgid IS $$ Message identifier $$;
COMMENT ON COLUMN msgdatatype.msgdtype IS $$ Data type of the data section within the message $$;
COMMENT ON COLUMN msgdatatype.msgdformat IS $$ General format of data that follows $$;
COMMENT ON COLUMN msgdatatype.msgstatus IS $$ Status of the data section $$;
COMMENT ON COLUMN msgdatatype.foff IS $$ File offset to beginning of data section $$;
COMMENT ON COLUMN msgdatatype.msize IS $$ Size of data section $$;
COMMENT ON COLUMN msgdatatype.lddate IS $$ Load date $$;

-- Table: MSGDEST
CREATE TABLE IF NOT EXISTS msgdest (
    msgdid BIGINT,
    msgid BIGINT,
    transmeth VARCHAR(16),
    emailto VARCHAR(64),
    msgstatus VARCHAR(32),
    itime DOUBLE PRECISION,
    timesent DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (msgdid),
    ,CONSTRAINT msgdest__itime__ck CHECK (itime > 0.0 OR itime = -999.0),
    ,CONSTRAINT msgdest__msgdid__ck CHECK (msgdid > 0 OR msgdid = -1),
    ,CONSTRAINT msgdest__msgid__ck CHECK (msgid > 0 OR msgid = -1),
    ,CONSTRAINT msgdest__msgstatus__ck CHECK (msgstatus IN ('DONE', 'FAILED', '-')),
    ,CONSTRAINT msgdest__timesent__ck CHECK (timesent > 0.0 OR timesent = -9999999999.999)
);
COMMENT ON TABLE msgdest IS $$ The msgdest table contains information about messages sent. $$;
COMMENT ON COLUMN msgdest.msgdid IS $$ Message destination identifier $$;
COMMENT ON COLUMN msgdest.msgid IS $$ Message identifier $$;
COMMENT ON COLUMN msgdest.transmeth IS $$ Method by which the response is to be delivered to the requester $$;
COMMENT ON COLUMN msgdest.emailto IS $$ E-mail address to send message $$;
COMMENT ON COLUMN msgdest.msgstatus IS $$ Current status of the response message $$;
COMMENT ON COLUMN msgdest.itime IS $$ Time at which table entry was made $$;
COMMENT ON COLUMN msgdest.timesent IS $$ Time at which message was sent $$;
COMMENT ON COLUMN msgdest.lddate IS $$ Load date $$;

-- Table: MSGDISC
CREATE TABLE IF NOT EXISTS msgdisc (
    msgid BIGINT,
    userid BIGINT,
    msgver VARCHAR(8),
    msgtype VARCHAR(16),
    subtype VARCHAR(20),
    extmsgid VARCHAR(20),
    intid BIGINT,
    intidtype VARCHAR(16),
    msgsrc VARCHAR(16),
    itime DOUBLE PRECISION,
    idate INTEGER,
    imethod VARCHAR(8),
    isrc VARCHAR(64),
    msize INTEGER,
    msgstatus VARCHAR(32),
    subject VARCHAR(64),
    dir VARCHAR(64),
    dfile VARCHAR(32),
    foff BIGINT,
    mfoff INTEGER,
    fileoff INTEGER,
    filesize INTEGER,
    sigtype VARCHAR(64),
    verifstatus VARCHAR(4),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (msgid),
    ,CONSTRAINT msgdisc__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT msgdisc__fileoff__ck CHECK (fileoff >= 0 OR fileoff = -1),
    ,CONSTRAINT msgdisc__filesize__ck CHECK (filesize > 0 OR filesize = -1),
    ,CONSTRAINT msgdisc__foff__ck CHECK (foff >= 0),
    ,CONSTRAINT msgdisc__idate__ck CHECK ((idate > 1901348 AND idate < 3001000) OR idate = -1),
    ,CONSTRAINT msgdisc__imethod__ck CHECK (imethod IN ('email','ftp','-')),
    ,CONSTRAINT msgdisc__intid__ck CHECK (intid > 0 OR intid = -1),
    ,CONSTRAINT msgdisc__itime__ck CHECK (itime > 0.0 OR itime = -999.0),
    ,CONSTRAINT msgdisc__mfoff__ck CHECK (mfoff > 0 OR mfoff = -1),
    ,CONSTRAINT msgdisc__msgid__ck CHECK (msgid > 0 OR msgid = -1),
    ,CONSTRAINT msgdisc__msgstatus__ck CHECK (msgstatus IN ('DONE', 'FAILED', '-','RECEIVED','QUEUED','RUNNING','DONE-PARTIAL','FAILED','STANDBY','RETR Y','CHILDFAILED','IGNORED','PASS')),
    ,CONSTRAINT msgdisc__msize__ck CHECK (msize > 0 OR msize = -1),
    ,CONSTRAINT msgdisc__subtype__ck CHECK (subtype IN ('V', 'R', 'L', '-')),
    ,CONSTRAINT msgdisc__userid__ck CHECK (userid > 0 OR userid = -1)
);
COMMENT ON TABLE msgdisc IS $$ The msgdisc table contains information pertinent to messages including the date and time that the message was sent or re ceived, identification information, and where the message is stored. $$;
COMMENT ON COLUMN msgdisc.msgid IS $$ Message identifier $$;
COMMENT ON COLUMN msgdisc.userid IS $$ User identifier $$;
COMMENT ON COLUMN msgdisc.msgver IS $$ Message system version number $$;
COMMENT ON COLUMN msgdisc.msgtype IS $$ Message type $$;
COMMENT ON COLUMN msgdisc.subtype IS $$ Message subtype $$;
COMMENT ON COLUMN msgdisc.extmsgid IS $$ Message identification string provided by the sender $$;
COMMENT ON COLUMN msgdisc.intid IS $$ Either the locally generated msgid of an earlier table entry that evoked the creation of this table entry or the reqid from the request table of an internally generated request $$;
COMMENT ON COLUMN msgdisc.intidtype IS $$ Intid type $$;
COMMENT ON COLUMN msgdisc.msgsrc IS $$ Message source code $$;
COMMENT ON COLUMN msgdisc.itime IS $$ Initial time message was received $$;
COMMENT ON COLUMN msgdisc.idate IS $$ Initial date message was received $$;
COMMENT ON COLUMN msgdisc.imethod IS $$ Input method (e-mail or ftp) $$;
COMMENT ON COLUMN msgdisc.isrc IS $$ Initial source of message $$;
COMMENT ON COLUMN msgdisc.msize IS $$ Message size in bytes $$;
COMMENT ON COLUMN msgdisc.msgstatus IS $$ Status of message $$;
COMMENT ON COLUMN msgdisc.subject IS $$ Subject header from e-mail message $$;
COMMENT ON COLUMN msgdisc.dir IS $$ Directory to find file $$;
COMMENT ON COLUMN msgdisc.dfile IS $$ Name of data file $$;
COMMENT ON COLUMN msgdisc.foff IS $$ Byte offset of data segment within file $$;
COMMENT ON COLUMN msgdisc.mfoff IS $$ Offset in bytes to beginning of message $$;
COMMENT ON COLUMN msgdisc.fileoff IS $$ Number of bytes to the first character of the e-mail file (first character of the e-mail header) $$;
COMMENT ON COLUMN msgdisc.filesize IS $$ Size of file $$;
COMMENT ON COLUMN msgdisc.sigtype IS $$ Digital signature type $$;
COMMENT ON COLUMN msgdisc.verifstatus IS $$ Status of verification $$;
COMMENT ON COLUMN msgdisc.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN msgdisc.lddate IS $$ Load date $$;

-- Table: MSVMAX_DESCRIPT
CREATE TABLE IF NOT EXISTS msvmax_descript (
    ampid BIGINT,
    sta VARCHAR(6),
    orid BIGINT,
    arid BIGINT,
    high_snr_count SMALLINT,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (ampid),
    ,CONSTRAINT msvmax_descript__ampid__ck CHECK (ampid > 0),
    ,CONSTRAINT msvmax_descript__arid__ck CHECK (arid > 0),
    ,CONSTRAINT msvmax_descript__hsc__ck CHECK (high_snr_count IN (-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 )),
    ,CONSTRAINT msvmax_descript__orid__ck CHECK (orid > 0),
    ,CONSTRAINT msvmax_descript__sta__ck CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE msvmax_descript IS $$ The msvmax_descript is the child of arrival and amplitude ta bles. It is the parent of the msvmax_results table. $$;
COMMENT ON COLUMN msvmax_descript.ampid IS $$ Amplitude identifier $$;
COMMENT ON COLUMN msvmax_descript.sta IS $$ Station code $$;
COMMENT ON COLUMN msvmax_descript.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN msvmax_descript.arid IS $$ LR arrival identifier $$;
COMMENT ON COLUMN msvmax_descript.high_snr_count IS $$ Count of periods where noise is greater than signal $$;
COMMENT ON COLUMN msvmax_descript.auth IS $$ Author $$;
COMMENT ON COLUMN msvmax_descript.lddate IS $$ Load date $$;

-- Table: MSVMAX_RESULTS
CREATE TABLE IF NOT EXISTS msvmax_results (
    ampid BIGINT,
    per DOUBLE PRECISION,
    meastype VARCHAR(1),
    amp DOUBLE PRECISION,
    amptime DOUBLE PRECISION,
    ins_response DOUBLE PRECISION,
    ampcor DOUBLE PRECISION,
    magnitude DOUBLE PRECISION,
    uncertainty DOUBLE PRECISION,
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (per),
    ,CONSTRAINT msvmax_results__ampcor__ck CHECK (( ampcor > -9.99 AND ampcor < 50.0 ) OR ampcor = -999.0),
    ,CONSTRAINT msvmax_results__ampid__ck CHECK (ampid > 0),
    ,CONSTRAINT msvmax_results__amptime__ck CHECK (amptime >= -9999999999.999),
    ,CONSTRAINT msvmax_results__amp__ck CHECK (amp > 0.0 OR amp = -1.0),
    ,CONSTRAINT msvmax_results__endtime__ck CHECK (endtime >= -9999999999.999),
    ,CONSTRAINT msvmax_results__ins_resp__ck CHECK (( ins_response >= 0 AND ins_response <= 99.9) OR ins_response = -1.0),
    ,CONSTRAINT msvmax_results__magnitude__ck CHECK (( magnitude > -9.99 AND magnitude < 50.0) OR magnitude = -999.0),
    ,CONSTRAINT msvmax_results__meastype__ck CHECK (meastype IN ('S','N')),
    ,CONSTRAINT msvmax_results__per__ck CHECK (per > 0.0 OR per = -1.0),
    ,CONSTRAINT msvmax_results__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE msvmax_results IS $$ The msvmax_results table is the child of the msvmax_descript table. $$;
COMMENT ON COLUMN msvmax_results.ampid IS $$ Amplitude identifier $$;
COMMENT ON COLUMN msvmax_results.per IS $$ Period (8 - 25 second) $$;
COMMENT ON COLUMN msvmax_results.meastype IS $$ Measurement type $$;
COMMENT ON COLUMN msvmax_results.amp IS $$ Amplitude value in nanometers $$;
COMMENT ON COLUMN msvmax_results.amptime IS $$ Time of amplitude measure $$;
COMMENT ON COLUMN msvmax_results.ins_response IS $$ Instrument response value $$;
COMMENT ON COLUMN msvmax_results.ampcor IS $$ Amplitude value corrected for Airy phase Butterworth filter $$;
COMMENT ON COLUMN msvmax_results.magnitude IS $$ Magnitude value $$;
COMMENT ON COLUMN msvmax_results.uncertainty IS $$ Magnitude uncertainty-future use $$;
COMMENT ON COLUMN msvmax_results.time IS $$ Epoch start time of signal window $$;
COMMENT ON COLUMN msvmax_results.endtime IS $$ Epoch start time of signal window $$;
COMMENT ON COLUMN msvmax_results.lddate IS $$ Load date $$;

-- Table: NET_CODA_SPECTRUM
CREATE TABLE IF NOT EXISTS net_coda_spectrum (
    magid BIGINT,
    freq DOUBLE PRECISION,
    ampcor DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (magid),
    ,CONSTRAINT net_coda_spectrum__ampcor__ck CHECK (( ampcor > -9.99 AND ampcor < 50.0 ) OR ampcor = -999.0),
    ,CONSTRAINT net_coda_spectrum__freq__ck CHECK (freq > 0.0 OR freq = -1.0),
    ,CONSTRAINT net_coda_spectrum__magid__ck CHECK (magid > 0)
);
COMMENT ON TABLE net_coda_spectrum IS $$ The net_coda_spectrum table contains the theoretical source spectrum for an event, used to obtain the network moment mag nitude values. The theoretical spectrum is fit to the observ ed spectrum in all frequency bands for a station that are se t to defining in the envelope_contribution table. $$;
COMMENT ON COLUMN net_coda_spectrum.magid IS $$ Magnitude identifier $$;
COMMENT ON COLUMN net_coda_spectrum.freq IS $$ Frequency $$;
COMMENT ON COLUMN net_coda_spectrum.ampcor IS $$ Amplitude value corrected for path and site $$;
COMMENT ON COLUMN net_coda_spectrum.auth IS $$ Author $$;
COMMENT ON COLUMN net_coda_spectrum.lddate IS $$ Load date $$;

-- Table: NETMAG
CREATE TABLE IF NOT EXISTS netmag (
    magid BIGINT,
    net VARCHAR(8),
    orid BIGINT,
    evid BIGINT,
    magtype VARCHAR(6),
    nsta INTEGER,
    magnitude DOUBLE PRECISION,
    uncertainty DOUBLE PRECISION,
    auth VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (magid),
    ,CONSTRAINT netmag__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT netmag__evid__ck CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT netmag__magid__ck CHECK (magid > 0),
    ,CONSTRAINT netmag__magnitude__ck CHECK ((magnitude > -9.99 AND magnitude < 50.0) OR magnitude = -999.0),
    ,CONSTRAINT netmag__nsta__ck CHECK (nsta >= 0 OR nsta = -1),
    ,CONSTRAINT netmag__orid__ck CHECK (orid > 0),
    ,CONSTRAINT netmag__uncertainty__ck CHECK (uncertainty > 0.0 OR uncertainty = -1.0)
);
COMMENT ON TABLE netmag IS $$ The netmag table contain estimates of network magnitudes of different types for an event. Each network magnitude has a u nique magid. Station magnitudes used to compute the network magnitude are in the stamag table. $$;
COMMENT ON COLUMN netmag.magid IS $$ Network magnitude identifier $$;
COMMENT ON COLUMN netmag.net IS $$ Unique network identifier $$;
COMMENT ON COLUMN netmag.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN netmag.evid IS $$ Event identifier $$;
COMMENT ON COLUMN netmag.magtype IS $$ Magnitude type (ms, mb, etc.) $$;
COMMENT ON COLUMN netmag.nsta IS $$ Number of stations used $$;
COMMENT ON COLUMN netmag.magnitude IS $$ Magnitude $$;
COMMENT ON COLUMN netmag.uncertainty IS $$ Magnitude uncertainty $$;
COMMENT ON COLUMN netmag.auth IS $$ Source/originator $$;
COMMENT ON COLUMN netmag.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN netmag.lddate IS $$ Load date $$;

-- Table: NETWORK
CREATE TABLE IF NOT EXISTS network (
    networkid BIGINT,
    net VARCHAR(8),
    network_name VARCHAR(32),
    description VARCHAR(4000),
    network_type VARCHAR(15),
    on_date TIMESTAMP,
    off_date TIMESTAMP,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (networkid),
    ,CONSTRAINT network_uk UNIQUE (net),
    ,CONSTRAINT network__network_type__ck CHECK (network_type = LOWER(network_type))
);
COMMENT ON TABLE network IS $$ The network table contains general information about seismic networks (see affiliation). $$;
COMMENT ON COLUMN network.networkid IS $$ Unique network identifier $$;
COMMENT ON COLUMN network.net IS $$ Network name $$;
COMMENT ON COLUMN network.network_name IS $$ Long network name $$;
COMMENT ON COLUMN network.description IS $$ Network description $$;
COMMENT ON COLUMN network.network_type IS $$ Network type (array, local, world-wide, etc.) $$;
COMMENT ON COLUMN network.on_date IS $$ The date the network first became active or was created $$;
COMMENT ON COLUMN network.off_date IS $$ The date the network was removed from the system or made obsolete $$;
COMMENT ON COLUMN network.author IS $$ Source/originator $$;
COMMENT ON COLUMN network.moddate IS $$ Modification date $$;
COMMENT ON COLUMN network.lddate IS $$ Load date $$;

-- Table: NETYIELD
CREATE TABLE IF NOT EXISTS netyield (
    yieldid BIGINT,
    net VARCHAR(8),
    orid BIGINT,
    evid BIGINT,
    yield DOUBLE PRECISION,
    nsta INTEGER,
    ffactor DOUBLE PRECISION,
    wmodel_name VARCHAR(50),
    auth VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (yieldid),
    ,CONSTRAINT netyield__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT netyield__evid__ck CHECK (evid > 0),
    ,CONSTRAINT netyield__ffactor__ck CHECK (ffactor > 0.0 OR ffactor = -999.0),
    ,CONSTRAINT netyield__nsta__ck CHECK (nsta >= 0 OR nsta = -1),
    ,CONSTRAINT netyield__orid__ck CHECK (orid > 0),
    ,CONSTRAINT netyield__yieldid__ck CHECK (yieldid > 0),
    ,CONSTRAINT netyield__yield__ck CHECK (yield >= 0.0 OR yield = -1.0)
);
COMMENT ON TABLE netyield IS $$ The netyield table contains network-wide yield values obtain ed from the yield values at all available stations for an ev ent. $$;
COMMENT ON COLUMN netyield.yieldid IS $$ Yield identifier $$;
COMMENT ON COLUMN netyield.net IS $$ Unique network identifier $$;
COMMENT ON COLUMN netyield.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN netyield.evid IS $$ Event identifier $$;
COMMENT ON COLUMN netyield.yield IS $$ Yield $$;
COMMENT ON COLUMN netyield.nsta IS $$ Number of stations used $$;
COMMENT ON COLUMN netyield.ffactor IS $$ Yield F factor (log 10) $$;
COMMENT ON COLUMN netyield.wmodel_name IS $$ Yield model name $$;
COMMENT ON COLUMN netyield.auth IS $$ Author $$;
COMMENT ON COLUMN netyield.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN netyield.lddate IS $$ Load date $$;

-- Table: OMITTED_CHANNELS
CREATE TABLE IF NOT EXISTS omitted_channels (
    sta VARCHAR(6),
    chan VARCHAR(8),
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    commid BIGINT,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (chan),
    ,CONSTRAINT omitted_channels__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT omitted_channels__endtime__ck CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT omitted_channels__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT omitted_channels__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE omitted_channels IS $$ The omitted_channels table identifies time intervals for whi ch channel masks exist. Channel masks are used to exclude wa veform data for the specified station, channel, time and end time from interactive and automatic data processing due to d ata quality problems (timing, calibration, etc.). $$;
COMMENT ON COLUMN omitted_channels.sta IS $$ Station code $$;
COMMENT ON COLUMN omitted_channels.chan IS $$ Channel code $$;
COMMENT ON COLUMN omitted_channels.time IS $$ Epoch time for start of channel omitted $$;
COMMENT ON COLUMN omitted_channels.endtime IS $$ Epoch time for end of channel omitted $$;
COMMENT ON COLUMN omitted_channels.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN omitted_channels.auth IS $$ Author $$;
COMMENT ON COLUMN omitted_channels.lddate IS $$ Load date $$;

-- Table: ORIGERR
CREATE TABLE IF NOT EXISTS origerr (
    orid BIGINT,
    sxx DOUBLE PRECISION,
    syy DOUBLE PRECISION,
    szz DOUBLE PRECISION,
    stt DOUBLE PRECISION,
    sxy DOUBLE PRECISION,
    sxz DOUBLE PRECISION,
    syz DOUBLE PRECISION,
    stx DOUBLE PRECISION,
    sty DOUBLE PRECISION,
    stz DOUBLE PRECISION,
    sdobs DOUBLE PRECISION,
    smajax DOUBLE PRECISION,
    sminax DOUBLE PRECISION,
    strike DOUBLE PRECISION,
    sdepth DOUBLE PRECISION,
    stime DOUBLE PRECISION,
    conf DOUBLE PRECISION,
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid),
    ,CONSTRAINT origerr__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT origerr__conf__ck CHECK ((conf BETWEEN 0.5 AND 1.0) OR conf = 0.0),
    ,CONSTRAINT origerr__orid__ck CHECK (orid > 0),
    ,CONSTRAINT origerr__sdepth__ck CHECK (sdepth > 0.0 OR sdepth = -1.0),
    ,CONSTRAINT origerr__sdobs__ck CHECK (sdobs > 0.0 OR sdobs = -1.0),
    ,CONSTRAINT origerr__smajax__ck CHECK (smajax > 0.0 OR smajax = -1.0),
    ,CONSTRAINT origerr__sminax__ck CHECK (sminax > 0.0 OR sminax = -1.0),
    ,CONSTRAINT origerr__stime__ck CHECK (stime >= 0.0 OR stime = -1.0),
    ,CONSTRAINT origerr__strike__ck CHECK ((strike >= 0.0 AND strike <= 360.0) OR strike = -1.0),
    ,CONSTRAINT origerr__stt__ck CHECK (stt > 0.0 OR stt = -1.0),
    ,CONSTRAINT origerr__sxx__ck CHECK (sxx > 0.0 OR sxx = -1.0),
    ,CONSTRAINT origerr__syy__ck CHECK (syy > 0.0 OR syy = -1.0),
    ,CONSTRAINT origerr__szz__ck CHECK (szz > 0.0 OR szz = -1.0)
);
COMMENT ON TABLE origerr IS $$ The origerr table contains summaries of confidence bounds in origin estimations. The origerr_ga table is used by the GA application to store temporary origin error information. The measurement types are the elements of the location covarian ce matrix. The descriptive types give the uncertainties in l ocation, depth, and origin time. These quantities are calcul ated from the covariance matrix, assuming gaussian errors an d a confidence level conf. $$;
COMMENT ON COLUMN origerr.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN origerr.sxx IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr.syy IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr.szz IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr.stt IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr.sxy IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr.sxz IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr.syz IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr.stx IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr.sty IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr.stz IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr.sdobs IS $$ Standard error of observations $$;
COMMENT ON COLUMN origerr.smajax IS $$ Semi-major axis of error $$;
COMMENT ON COLUMN origerr.sminax IS $$ Semi-minor axis of error $$;
COMMENT ON COLUMN origerr.strike IS $$ Strike of the semi-major axis $$;
COMMENT ON COLUMN origerr.sdepth IS $$ Depth error $$;
COMMENT ON COLUMN origerr.stime IS $$ Origin time error $$;
COMMENT ON COLUMN origerr.conf IS $$ Confidence $$;
COMMENT ON COLUMN origerr.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN origerr.lddate IS $$ Load date $$;

-- Table: ORIGERR_GA
CREATE TABLE IF NOT EXISTS origerr_ga (
    orid BIGINT,
    sxx DOUBLE PRECISION,
    syy DOUBLE PRECISION,
    szz DOUBLE PRECISION,
    stt DOUBLE PRECISION,
    sxy DOUBLE PRECISION,
    sxz DOUBLE PRECISION,
    syz DOUBLE PRECISION,
    stx DOUBLE PRECISION,
    sty DOUBLE PRECISION,
    stz DOUBLE PRECISION,
    sdobs DOUBLE PRECISION,
    smajax DOUBLE PRECISION,
    sminax DOUBLE PRECISION,
    strike DOUBLE PRECISION,
    sdepth DOUBLE PRECISION,
    stime DOUBLE PRECISION,
    conf DOUBLE PRECISION,
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid)
);
COMMENT ON TABLE origerr_ga IS $$ The origerr table contains summaries of confidence bounds in origin estimations. The origerr_ga table is used by the GA application to store temporary origin error information. The measurement types are the elements of the location covarian ce matrix. The descriptive types give the uncertainties in l ocation, depth, and origin time. These quantities are calcul ated from the covariance matrix, assuming gaussian errors an d a confidence level conf. $$;
COMMENT ON COLUMN origerr_ga.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN origerr_ga.sxx IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga.syy IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga.szz IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga.stt IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga.sxy IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga.sxz IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga.syz IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga.stx IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga.sty IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga.stz IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga.sdobs IS $$ Standard error of observations $$;
COMMENT ON COLUMN origerr_ga.smajax IS $$ Semi-major axis of error $$;
COMMENT ON COLUMN origerr_ga.sminax IS $$ Semi-minor axis of error $$;
COMMENT ON COLUMN origerr_ga.strike IS $$ Strike of the semi-major axis $$;
COMMENT ON COLUMN origerr_ga.sdepth IS $$ Depth error $$;
COMMENT ON COLUMN origerr_ga.stime IS $$ Origin time error $$;
COMMENT ON COLUMN origerr_ga.conf IS $$ Confidence $$;
COMMENT ON COLUMN origerr_ga.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN origerr_ga.lddate IS $$ Load date $$;

-- Table: ORIGERR_GA_DEL
CREATE TABLE IF NOT EXISTS origerr_ga_del (
    orid BIGINT,
    sxx DOUBLE PRECISION,
    syy DOUBLE PRECISION,
    szz DOUBLE PRECISION,
    stt DOUBLE PRECISION,
    sxy DOUBLE PRECISION,
    sxz DOUBLE PRECISION,
    syz DOUBLE PRECISION,
    stx DOUBLE PRECISION,
    sty DOUBLE PRECISION,
    stz DOUBLE PRECISION,
    sdobs DOUBLE PRECISION,
    smajax DOUBLE PRECISION,
    sminax DOUBLE PRECISION,
    strike DOUBLE PRECISION,
    sdepth DOUBLE PRECISION,
    stime DOUBLE PRECISION,
    conf DOUBLE PRECISION,
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid),
    ,CONSTRAINT origerr_ga_del__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT origerr_ga_del__conf__ck CHECK ((conf BETWEEN 0.5 AND 1.0) OR conf = 0.0),
    ,CONSTRAINT origerr_ga_del__orid__ck CHECK (orid > 0),
    ,CONSTRAINT origerr_ga_del__sdepth__ck CHECK (sdepth > 0.0 OR sdepth = -1.0),
    ,CONSTRAINT origerr_ga_del__sdobs__ck CHECK (sdobs > 0.0 OR sdobs = -1.0),
    ,CONSTRAINT origerr_ga_del__smajax__ck CHECK (smajax > 0.0 OR smajax = -1.0),
    ,CONSTRAINT origerr_ga_del__sminax__ck CHECK (sminax > 0.0 OR sminax = -1.0),
    ,CONSTRAINT origerr_ga_del__stime__ck CHECK (stime >= 0.0 OR stime = -1.0),
    ,CONSTRAINT origerr_ga_del__strike__ck CHECK ((strike >= 0.0 AND strike <= 360.0) OR strike = -1.0),
    ,CONSTRAINT origerr_ga_del__stt__ck CHECK (stt > 0.0 OR stt = -1.0),
    ,CONSTRAINT origerr_ga_del__sxx__ck CHECK (sxx > 0.0 OR sxx = -1.0),
    ,CONSTRAINT origerr_ga_del__syy__ck CHECK (syy > 0.0 OR syy = -1.0),
    ,CONSTRAINT origerr_ga_del__szz__ck CHECK (szz > 0.0 OR szz = -1.0)
);
COMMENT ON TABLE origerr_ga_del IS $$ The origerr_ga_del table contains summaries of confidence bo unds in origin estimations. $$;
COMMENT ON COLUMN origerr_ga_del.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN origerr_ga_del.sxx IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga_del.syy IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga_del.szz IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga_del.stt IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga_del.sxy IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga_del.sxz IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga_del.syz IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga_del.stx IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga_del.sty IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga_del.stz IS $$ Covariance matrix element $$;
COMMENT ON COLUMN origerr_ga_del.sdobs IS $$ Standard error of observations $$;
COMMENT ON COLUMN origerr_ga_del.smajax IS $$ Semi-major axis of error $$;
COMMENT ON COLUMN origerr_ga_del.sminax IS $$ Semi-minor axis of error $$;
COMMENT ON COLUMN origerr_ga_del.strike IS $$ Strike of the semi-major axis $$;
COMMENT ON COLUMN origerr_ga_del.sdepth IS $$ Depth error $$;
COMMENT ON COLUMN origerr_ga_del.stime IS $$ Origin time error $$;
COMMENT ON COLUMN origerr_ga_del.conf IS $$ Confidence $$;
COMMENT ON COLUMN origerr_ga_del.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN origerr_ga_del.lddate IS $$ Load date $$;

-- Table: ORIGIN
CREATE TABLE IF NOT EXISTS origin (
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    depth DOUBLE PRECISION,
    time DOUBLE PRECISION,
    orid BIGINT,
    evid BIGINT,
    jdate INTEGER,
    nass SMALLINT,
    ndef SMALLINT,
    ndp SMALLINT,
    grn INTEGER,
    srn INTEGER,
    etype VARCHAR(7),
    depdp DOUBLE PRECISION,
    dtype VARCHAR(1),
    mb DOUBLE PRECISION,
    mbid BIGINT,
    ms DOUBLE PRECISION,
    msid BIGINT,
    ml DOUBLE PRECISION,
    mlid BIGINT,
    algorithm VARCHAR(15),
    auth VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (time),
    ,CONSTRAINT origin_uk UNIQUE (orid),
    ,CONSTRAINT origin__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT origin__depdp__ck CHECK ((depdp >= 0.0 AND depdp < 1000.0) OR depdp = -999.0),
    ,CONSTRAINT origin__depth__ck CHECK ((depth >= -100.0 AND depth < 1000.0) OR depth = -999.0),
    ,CONSTRAINT origin__dtype__ck CHECK (dtype IN ('a','f','d','r','g','-')),
    ,CONSTRAINT origin__etype__ck CHECK (etype = LOWER(etype)),
    ,CONSTRAINT origin__evid__ck CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT origin__grn__ck CHECK ((grn >= 1 AND grn <= 729) OR grn = -1),
    ,CONSTRAINT origin__jdate__ck CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT origin__lon__ck CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT origin__mbid__ck CHECK (mbid > 0 OR mbid = -1),
    ,CONSTRAINT origin__mb__ck CHECK ((mb > -9.99 AND mb < 50.0) OR mb = -999.0),
    ,CONSTRAINT origin__mlid__ck CHECK (mlid > 0 OR mlid = -1),
    ,CONSTRAINT origin__ml__ck CHECK ((ml > -9.99 AND ml < 50.0) OR ml = -999.0),
    ,CONSTRAINT origin__msid__ck CHECK (msid > 0 OR msid = -1),
    ,CONSTRAINT origin__ms__ck CHECK ((ms > -9.99 AND ms < 50.0) OR ms = -999.0),
    ,CONSTRAINT origin__nass__ck CHECK (nass > 0 OR nass = -1),
    ,CONSTRAINT origin__ndef__ck CHECK ((ndef > 0 AND ndef <= nass) OR ndef = -1),
    ,CONSTRAINT origin__ndp__ck CHECK (ndp >= 0 OR ndp = -1),
    ,CONSTRAINT origin__orid__ck CHECK (orid > 0),
    ,CONSTRAINT origin__origin_lat__ck CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT origin__srn__ck CHECK ((srn >= 1 AND srn <= 50) OR srn = -1),
    ,CONSTRAINT origin__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE origin IS $$ The origin tables contain information describing a derived o r reported origin for a particular event. $$;
COMMENT ON COLUMN origin.lat IS $$ Estimated latitude $$;
COMMENT ON COLUMN origin.lon IS $$ Estimated longitude $$;
COMMENT ON COLUMN origin.depth IS $$ Estimated depth $$;
COMMENT ON COLUMN origin.time IS $$ Epoch time $$;
COMMENT ON COLUMN origin.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN origin.evid IS $$ Event identifier $$;
COMMENT ON COLUMN origin.jdate IS $$ Julian date $$;
COMMENT ON COLUMN origin.nass IS $$ Number of associated phases $$;
COMMENT ON COLUMN origin.ndef IS $$ Number of locating phases $$;
COMMENT ON COLUMN origin.ndp IS $$ Number of depth phases $$;
COMMENT ON COLUMN origin.grn IS $$ Geographic region number $$;
COMMENT ON COLUMN origin.srn IS $$ Seismic region number $$;
COMMENT ON COLUMN origin.etype IS $$ Event type $$;
COMMENT ON COLUMN origin.depdp IS $$ Estimated depth from depth phases $$;
COMMENT ON COLUMN origin.dtype IS $$ Depth method used $$;
COMMENT ON COLUMN origin.mb IS $$ Body wave magnitude $$;
COMMENT ON COLUMN origin.mbid IS $$ Mb magnitude identifier $$;
COMMENT ON COLUMN origin.ms IS $$ Surface wave magnitude $$;
COMMENT ON COLUMN origin.msid IS $$ Ms magnitude identifier $$;
COMMENT ON COLUMN origin.ml IS $$ Local magnitude $$;
COMMENT ON COLUMN origin.mlid IS $$ ML magnitude identifier $$;
COMMENT ON COLUMN origin.algorithm IS $$ Location algorithm used $$;
COMMENT ON COLUMN origin.auth IS $$ Source/originator $$;
COMMENT ON COLUMN origin.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN origin.lddate IS $$ Load date $$;

-- Table: ORIGIN_GA
CREATE TABLE IF NOT EXISTS origin_ga (
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    depth DOUBLE PRECISION,
    time DOUBLE PRECISION,
    orid BIGINT,
    evid BIGINT,
    jdate INTEGER,
    nass SMALLINT,
    ndef SMALLINT,
    ndp SMALLINT,
    grn INTEGER,
    srn INTEGER,
    etype VARCHAR(7),
    depdp DOUBLE PRECISION,
    dtype VARCHAR(1),
    mb DOUBLE PRECISION,
    mbid BIGINT,
    ms DOUBLE PRECISION,
    msid BIGINT,
    ml DOUBLE PRECISION,
    mlid BIGINT,
    algorithm VARCHAR(15),
    auth VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid)
);
COMMENT ON TABLE origin_ga IS $$ The origin and origin_ga tables contain information describi ng a derived or reported origin for a particular event. $$;
COMMENT ON COLUMN origin_ga.lat IS $$ Estimated latitude $$;
COMMENT ON COLUMN origin_ga.lon IS $$ Estimated longitude $$;
COMMENT ON COLUMN origin_ga.depth IS $$ Estimated depth $$;
COMMENT ON COLUMN origin_ga.time IS $$ Epoch time $$;
COMMENT ON COLUMN origin_ga.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN origin_ga.evid IS $$ Event identifier $$;
COMMENT ON COLUMN origin_ga.jdate IS $$ Julian date $$;
COMMENT ON COLUMN origin_ga.nass IS $$ Number of associated phases $$;
COMMENT ON COLUMN origin_ga.ndef IS $$ Number of locating phases $$;
COMMENT ON COLUMN origin_ga.ndp IS $$ Number of depth phases $$;
COMMENT ON COLUMN origin_ga.grn IS $$ Geographic region number $$;
COMMENT ON COLUMN origin_ga.srn IS $$ Seismic region number $$;
COMMENT ON COLUMN origin_ga.etype IS $$ Event type $$;
COMMENT ON COLUMN origin_ga.depdp IS $$ Estimated depth from depth phases $$;
COMMENT ON COLUMN origin_ga.dtype IS $$ Depth method used $$;
COMMENT ON COLUMN origin_ga.mb IS $$ Body wave magnitude $$;
COMMENT ON COLUMN origin_ga.mbid IS $$ Mb magnitude identifier $$;
COMMENT ON COLUMN origin_ga.ms IS $$ Surface wave magnitude $$;
COMMENT ON COLUMN origin_ga.msid IS $$ Ms magnitude identifier $$;
COMMENT ON COLUMN origin_ga.ml IS $$ Local magnitude $$;
COMMENT ON COLUMN origin_ga.mlid IS $$ ML magnitude identifier $$;
COMMENT ON COLUMN origin_ga.algorithm IS $$ Location algorithm used $$;
COMMENT ON COLUMN origin_ga.auth IS $$ Source/originator $$;
COMMENT ON COLUMN origin_ga.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN origin_ga.lddate IS $$ Load date $$;

-- Table: ORIGIN_GA_DEL
CREATE TABLE IF NOT EXISTS origin_ga_del (
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    depth DOUBLE PRECISION,
    time DOUBLE PRECISION,
    orid BIGINT,
    evid BIGINT,
    jdate INTEGER,
    nass SMALLINT,
    ndef SMALLINT,
    ndp SMALLINT,
    grn INTEGER,
    srn INTEGER,
    etype VARCHAR(7),
    depdp DOUBLE PRECISION,
    dtype VARCHAR(1),
    mb DOUBLE PRECISION,
    mbid BIGINT,
    ms DOUBLE PRECISION,
    msid BIGINT,
    ml DOUBLE PRECISION,
    mlid BIGINT,
    algorithm VARCHAR(15),
    auth VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (orid),
    ,CONSTRAINT origin_ga_del__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT origin_ga_del__depdp__ck CHECK ((depdp >= 0.0 AND depdp < 1000.0) OR depdp = -999.0),
    ,CONSTRAINT origin_ga_del__depth__ck CHECK ((depth >= -100.0 AND depth < 1000.0) OR depth = -999.0),
    ,CONSTRAINT origin_ga_del__dtype__ck CHECK (dtype IN ('f','d','r','g','-')),
    ,CONSTRAINT origin_ga_del__etype__ck CHECK (etype = LOWER(etype)),
    ,CONSTRAINT origin_ga_del__evid__ck CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT origin_ga_del__grn__ck CHECK ((grn >= 1 AND grn <= 729) OR grn = -1),
    ,CONSTRAINT origin_ga_del__jdate__ck CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT origin_ga_del__lon__ck CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT origin_ga_del__mbid__ck CHECK (mbid > 0 OR mbid = -1),
    ,CONSTRAINT origin_ga_del__mb__ck CHECK ((mb > -9.99 AND mb < 50.0) OR mb = -999.0),
    ,CONSTRAINT origin_ga_del__mlid__ck CHECK (mlid > 0 OR mlid = -1),
    ,CONSTRAINT origin_ga_del__ml__ck CHECK ((ml > -9.99 AND ml < 50.0) OR ml = -999.0),
    ,CONSTRAINT origin_ga_del__msid__ck CHECK (msid > 0 OR msid = -1),
    ,CONSTRAINT origin_ga_del__ms__ck CHECK ((ms > -9.99 AND ms < 50.0) OR ms = -999.0),
    ,CONSTRAINT origin_ga_del__nass__ck CHECK (nass > 0 OR nass = -1),
    ,CONSTRAINT origin_ga_del__ndef__ck CHECK ((ndef > 0 AND ndef <= nass) OR ndef = -1),
    ,CONSTRAINT origin_ga_del__ndp__ck CHECK (ndp >= 0 OR ndp = -1),
    ,CONSTRAINT origin_ga_del__orid__ck CHECK (orid > 0),
    ,CONSTRAINT origin_ga_del__origin_lat__ck CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT origin_ga_del__srn__ck CHECK ((srn >= 1 AND srn <= 50) OR srn = -1),
    ,CONSTRAINT origin_ga_del__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE origin_ga_del IS $$ The origin_ga_del table contains information describing a de rived or reported origin for a particular event that was del eted and may be needed for later reference. $$;
COMMENT ON COLUMN origin_ga_del.lat IS $$ Estimated latitude $$;
COMMENT ON COLUMN origin_ga_del.lon IS $$ Estimated longitude $$;
COMMENT ON COLUMN origin_ga_del.depth IS $$ Estimated depth $$;
COMMENT ON COLUMN origin_ga_del.time IS $$ Epoch time $$;
COMMENT ON COLUMN origin_ga_del.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN origin_ga_del.evid IS $$ Event identifier $$;
COMMENT ON COLUMN origin_ga_del.jdate IS $$ Julian date $$;
COMMENT ON COLUMN origin_ga_del.nass IS $$ Number of associated phases $$;
COMMENT ON COLUMN origin_ga_del.ndef IS $$ Number of locating phases $$;
COMMENT ON COLUMN origin_ga_del.ndp IS $$ Number of depth phases $$;
COMMENT ON COLUMN origin_ga_del.grn IS $$ Geographic region number $$;
COMMENT ON COLUMN origin_ga_del.srn IS $$ Seismic region number $$;
COMMENT ON COLUMN origin_ga_del.etype IS $$ Event type $$;
COMMENT ON COLUMN origin_ga_del.depdp IS $$ Estimated depth from depth phases $$;
COMMENT ON COLUMN origin_ga_del.dtype IS $$ Depth method used $$;
COMMENT ON COLUMN origin_ga_del.mb IS $$ Body wave magnitude $$;
COMMENT ON COLUMN origin_ga_del.mbid IS $$ Mb magnitude identifier $$;
COMMENT ON COLUMN origin_ga_del.ms IS $$ Surface wave magnitude $$;
COMMENT ON COLUMN origin_ga_del.msid IS $$ Ms magnitude identifier $$;
COMMENT ON COLUMN origin_ga_del.ml IS $$ Local magnitude $$;
COMMENT ON COLUMN origin_ga_del.mlid IS $$ ML magnitude identifier $$;
COMMENT ON COLUMN origin_ga_del.algorithm IS $$ Location algorithm used $$;
COMMENT ON COLUMN origin_ga_del.auth IS $$ Source/originator $$;
COMMENT ON COLUMN origin_ga_del.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN origin_ga_del.lddate IS $$ Load date $$;

-- Table: ORIGIN_MEA_TRACE
CREATE TABLE IF NOT EXISTS origin_mea_trace (
    orid BIGINT,
    clustaid BIGINT,
    activetime_lookup DOUBLE PRECISION,
    best_ref_match_orid BIGINT,
    applied_threshold DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (clustaid),
    ,CONSTRAINT origin_mea_trace__atl__ck CHECK (activetime_lookup > 0 OR activetime_lookup = -999.0),
    ,CONSTRAINT origin_mea_trace__at__ck CHECK (applied_threshold >= 0.0 AND applied_threshold <= 1.0),
    ,CONSTRAINT origin_mea_trace__brmo__ck CHECK (best_ref_match_orid > 0 OR best_ref_match_orid = -1),
    ,CONSTRAINT origin_mea_trace__ca__ck CHECK (clustaid > 0),
    ,CONSTRAINT origin_mea_trace__orid__ck CHECK (orid > 0)
);
COMMENT ON TABLE origin_mea_trace IS $$ The origin_mea_trace table contains important information ne cessary to trace the subspace detection. $$;
COMMENT ON COLUMN origin_mea_trace.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN origin_mea_trace.clustaid IS $$ Cluster Station identifier $$;
COMMENT ON COLUMN origin_mea_trace.activetime_lookup IS $$ The time used to lookup the epoch time a cluster was activated. This value is either the application data start time or set to the value of 'cluster-active-time-override' parameter. $$;
COMMENT ON COLUMN origin_mea_trace.best_ref_match_orid IS $$ Best reference event $$;
COMMENT ON COLUMN origin_mea_trace.applied_threshold IS $$ Threshold used for this detection $$;
COMMENT ON COLUMN origin_mea_trace.lddate IS $$ Load date $$;

-- Table: ORIGIN_SDO
CREATE TABLE IF NOT EXISTS origin_sdo (
    orid BIGINT,
    latlon_geom ,
    cov_ellipse_geom ,
    conf_ellipse_geom ,
    ,PRIMARY KEY (orid),
    ,CONSTRAINT origin_sdo__orid__ck CHECK (orid > 0)
);
COMMENT ON TABLE origin_sdo IS $$ The origin_sdo table contains the point geometry, coverage e llipse polygon, confidence ellipse polygon for an origin. $$;
COMMENT ON COLUMN origin_sdo.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN origin_sdo.latlon_geom IS $$ Point geometry representing origin location $$;
COMMENT ON COLUMN origin_sdo.cov_ellipse_geom IS $$ Polygon geometry representing coverage ellipse $$;
COMMENT ON COLUMN origin_sdo.conf_ellipse_geom IS $$ Polygon geometry representing confidence ellipse $$;

-- Table: ORIGIN_TAG
CREATE TABLE IF NOT EXISTS origin_tag (
    orid BIGINT,
    process_mode VARCHAR(32),
    process_attribute VARCHAR(32),
    ndef SMALLINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (process_mode),
    ,CONSTRAINT origin_tag_ndef__ck CHECK ((ndef > 0 ) OR ndef = -1),
    ,CONSTRAINT origin_tag_process_mode_ck CHECK (process_mode IN ('GL', 'SL', 'LF', 'MEA', 'SL-reviewed', 'GL-reviewed', 'SL-only, GL-mod', 'GL-only, SL-m od', 'ANALYST', '-')),
    ,CONSTRAINT origin_tag_process_mode__ck CHECK (process_mode IN ('GL', 'SL', 'LF', 'MEA','SL-reviewed', 'GL-reviewed', 'SL-only, GL-mod', 'GL-only, SL-mo d', '-'))
);
COMMENT ON TABLE origin_tag IS $$ The origin_tag table contains information to indicate which mode was used to generate the origin (i.e. automated process ing mode of defining arrivals for an automated event or anal ysis mode for a reviewed event). $$;
COMMENT ON COLUMN origin_tag.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN origin_tag.process_mode IS $$ Automated processing mode of defining arrivals or analysis mode $$;
COMMENT ON COLUMN origin_tag.process_attribute IS $$ Additional information to augment the process_mode (e.g. specific spotlight) $$;
COMMENT ON COLUMN origin_tag.ndef IS $$ Number of defining arrivals for automated processing mode $$;
COMMENT ON COLUMN origin_tag.lddate IS $$ Load date $$;

-- Table: OUTAGE_STATION_DATA
CREATE TABLE IF NOT EXISTS outage_station_data (
    outage_id BIGINT,
    sta VARCHAR(6),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (outage_id),
    ,CONSTRAINT outage_sta_data__outage_id__ck CHECK (outage_id > 0)
);
COMMENT ON TABLE outage_station_data IS $$ The outage_station_data table provides tracking of station a vailability. $$;
COMMENT ON COLUMN outage_station_data.outage_id IS $$ Outage identifier $$;
COMMENT ON COLUMN outage_station_data.sta IS $$ Station name $$;
COMMENT ON COLUMN outage_station_data.start_date IS $$ Process Start date/time $$;
COMMENT ON COLUMN outage_station_data.end_date IS $$ Last time the process ran $$;
COMMENT ON COLUMN outage_station_data.author IS $$ Author $$;
COMMENT ON COLUMN outage_station_data.moddate IS $$ Modification date $$;
COMMENT ON COLUMN outage_station_data.lddate IS $$ Load date $$;

-- Table: OUTAGE_STATION_RECEIVE
CREATE TABLE IF NOT EXISTS outage_station_receive (
    outage_id BIGINT,
    sta VARCHAR(6),
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    endtime DOUBLE PRECISION,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (outage_id),
    ,CONSTRAINT outage_sta_rec__endtime__ck CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT outage_sta_rec__outage_id__ck CHECK (outage_id > 0)
);
COMMENT ON TABLE outage_station_receive IS $$ The outage_station_receive table provides tracking of pipeli ne availability for both the operational and alternate US ND C systems. $$;
COMMENT ON COLUMN outage_station_receive.outage_id IS $$ Outage identifier $$;
COMMENT ON COLUMN outage_station_receive.sta IS $$ Station name $$;
COMMENT ON COLUMN outage_station_receive.start_date IS $$ Process Start date/time. $$;
COMMENT ON COLUMN outage_station_receive.end_date IS $$ Last time the process ran $$;
COMMENT ON COLUMN outage_station_receive.endtime IS $$ Station outage ending time. $$;
COMMENT ON COLUMN outage_station_receive.author IS $$ Author $$;
COMMENT ON COLUMN outage_station_receive.moddate IS $$ Modification date $$;
COMMENT ON COLUMN outage_station_receive.lddate IS $$ Load date $$;

-- Table: POLYGON
CREATE TABLE IF NOT EXISTS polygon (
    polyid BIGINT,
    region_name VARCHAR(30),
    perimetertype VARCHAR(8),
    insideflag VARCHAR(1),
    outsideflag VARCHAR(1),
    edgeflag VARCHAR(1),
    auth VARCHAR(15),
    comments VARCHAR(4000),
    lddate TIMESTAMP,
    ,PRIMARY KEY (polyid),
    ,CONSTRAINT polygon__edgeflag__ck CHECK (edgeflag in('n', 'N', 'y', 'Y', '-')),
    ,CONSTRAINT polygon__insideflag__ck CHECK (insideflag in('n', 'N', 'y', 'Y', '-')),
    ,CONSTRAINT polygon__outsideflag__ck CHECK (outsideflag in('n', 'N', 'y', 'Y', '-')),
    ,CONSTRAINT polygon__polyid__ck CHECK (polyid >0)
);
COMMENT ON TABLE polygon IS $$ The polygon table contains the name for each polyid. $$;
COMMENT ON COLUMN polygon.polyid IS $$ Polygon Identifier $$;
COMMENT ON COLUMN polygon.region_name IS $$ name of region $$;
COMMENT ON COLUMN polygon.perimetertype IS $$ type of perimeter (unused) $$;
COMMENT ON COLUMN polygon.insideflag IS $$ inside flag (unused) $$;
COMMENT ON COLUMN polygon.outsideflag IS $$ outage flag (unused) $$;
COMMENT ON COLUMN polygon.edgeflag IS $$ edge flag (unused) $$;
COMMENT ON COLUMN polygon.auth IS $$ Author $$;
COMMENT ON COLUMN polygon.comments IS $$ comment text $$;
COMMENT ON COLUMN polygon.lddate IS $$ Load date $$;

-- Table: POLYPOINT
CREATE TABLE IF NOT EXISTS polypoint (
    polyid BIGINT,
    sequence BIGINT,
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (sequence),
    ,CONSTRAINT polypoint__lat__ck CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT polypoint__lon__ck CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT polypoint__polyid__ck CHECK (polyid >0),
    ,CONSTRAINT polypoint__sequence__ck CHECK (sequence >0)
);
COMMENT ON TABLE polypoint IS $$ The polypoint table contains a polyid, sequence number, lati tude, and longitude for each point of a polygon. All record s with the same polyid will combine to define a single polyg on. $$;
COMMENT ON COLUMN polypoint.polyid IS $$ Polygon Identifier $$;
COMMENT ON COLUMN polypoint.sequence IS $$ point of interest $$;
COMMENT ON COLUMN polypoint.lat IS $$ Latitude $$;
COMMENT ON COLUMN polypoint.lon IS $$ Longitude $$;
COMMENT ON COLUMN polypoint.lddate IS $$ Load date $$;

-- Table: PROCESS_TRACKING
CREATE TABLE IF NOT EXISTS process_tracking (
    trackingid BIGINT,
    process VARCHAR(256),
    machine VARCHAR(128),
    sys_area VARCHAR(128),
    sys_site VARCHAR(128),
    proc_start_date TIMESTAMP,
    proc_end_date TIMESTAMP,
    state VARCHAR(16),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (trackingid),
    ,CONSTRAINT process_trckg__trackingid__ck CHECK (trackingid > 0)
);
COMMENT ON TABLE process_tracking IS $$ The process_tracking table provides tracking of pipeline ava ilability for both the operational and alternate systems. $$;
COMMENT ON COLUMN process_tracking.trackingid IS $$ Process Tracking Identifier $$;
COMMENT ON COLUMN process_tracking.process IS $$ Process name (Ex: pipeline_daemon, interactive_daemon) $$;
COMMENT ON COLUMN process_tracking.machine IS $$ Machine name $$;
COMMENT ON COLUMN process_tracking.sys_area IS $$ System Area $$;
COMMENT ON COLUMN process_tracking.sys_site IS $$ Where the process was started. $$;
COMMENT ON COLUMN process_tracking.proc_start_date IS $$ Process start date. $$;
COMMENT ON COLUMN process_tracking.proc_end_date IS $$ Process end date $$;
COMMENT ON COLUMN process_tracking.state IS $$ Current processing state $$;
COMMENT ON COLUMN process_tracking.author IS $$ Author $$;
COMMENT ON COLUMN process_tracking.moddate IS $$ Modification date. $$;
COMMENT ON COLUMN process_tracking.lddate IS $$ Load date $$;

-- Table: PROCESSING_RECIPE
CREATE TABLE IF NOT EXISTS processing_recipe (
    procid BIGINT,
    procmethod VARCHAR(20),
    idname VARCHAR(15),
    idvalue BIGINT,
    procorder INTEGER,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (procid),
    ,CONSTRAINT processing_recipe__idvalue__ck CHECK (idvalue > 0),
    ,CONSTRAINT processing_recipe__procid__ck CHECK (procid > 0),
    ,CONSTRAINT processing_recipe__procord__ck CHECK (procorder >= -1)
);
COMMENT ON TABLE processing_recipe IS $$ The processing_recipe table provides the types of waveform p rocessing and the order in which they should be applied. Thi s table allows each cluster station to be processed in diffe rent ways for different proctypes (SVD, CORR, and AMP). $$;
COMMENT ON COLUMN processing_recipe.procid IS $$ ID of the processing recipe. This ID and the procorder form the primary key $$;
COMMENT ON COLUMN processing_recipe.procmethod IS $$ Method of processing (taper, deconvolution, butterworth_filter, etc) $$;
COMMENT ON COLUMN processing_recipe.idname IS $$ The name of the id field (taperid, filterid, etc) $$;
COMMENT ON COLUMN processing_recipe.idvalue IS $$ The value of the id field $$;
COMMENT ON COLUMN processing_recipe.procorder IS $$ The value of the id field $$;
COMMENT ON COLUMN processing_recipe.auth IS $$ Author $$;
COMMENT ON COLUMN processing_recipe.lddate IS $$ Load date $$;

-- Table: QCMASKDEF
CREATE TABLE IF NOT EXISTS qcmaskdef (
    qcdefid BIGINT,
    fix SMALLINT,
    ntaper INTEGER,
    drop_thr INTEGER,
    single_trace_spike_thr DOUBLE PRECISION,
    niter INTEGER,
    nsamp INTEGER,
    nover INTEGER,
    spike_thr DOUBLE PRECISION,
    spike_stat INTEGER,
    spike_val DOUBLE PRECISION,
    spike_npwin INTEGER,
    spike_dset INTEGER,
    noise_thresh DOUBLE PRECISION,
    spike_winlen INTEGER,
    interquar_coef DOUBLE PRECISION,
    noise_nsamp INTEGER,
    noise_noverlap INTEGER,
    algorithm_list VARCHAR(100),
    ondate INTEGER,
    offdate INTEGER,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (qcdefid),
    ,CONSTRAINT qcmaskdef__dropth__ck CHECK (drop_thr >= 0),
    ,CONSTRAINT qcmaskdef__fix__ck CHECK (fix = 0 or fix = 1),
    ,CONSTRAINT qcmaskdef__intquarcoef__ck CHECK (interquar_coef >= 0),
    ,CONSTRAINT qcmaskdef__niter__ck CHECK (niter >= 0),
    ,CONSTRAINT qcmaskdef__noise_nover__ck CHECK (noise_noverlap >= 0 or noise_noverlap = -1),
    ,CONSTRAINT qcmaskdef__noise_nsamp__ck CHECK (noise_nsamp >= 0 or noise_nsamp = -1),
    ,CONSTRAINT qcmaskdef__nover__ck CHECK (nover >= 0),
    ,CONSTRAINT qcmaskdef__nsamp__ck CHECK (nsamp >= 0),
    ,CONSTRAINT qcmaskdef__ntaper__ck CHECK (ntaper >= 0),
    ,CONSTRAINT qcmaskdef__qcdefid__ck CHECK (qcdefid > 0),
    ,CONSTRAINT qcmaskdef__spikedset__ck CHECK (spike_dset in ( 0,1,2)),
    ,CONSTRAINT qcmaskdef__spikenpwin__ck CHECK (spike_npwin >= 0),
    ,CONSTRAINT qcmaskdef__spikestat__ck CHECK (spike_stat in ( 0,1)),
    ,CONSTRAINT qcmaskdef__spiketh__ck CHECK (spike_thr >= 0),
    ,CONSTRAINT qcmaskdef__spikeval__ck CHECK (spike_val >= 0 AND spike_val <=100),
    ,CONSTRAINT qcmaskdef__spikewinlen__ck CHECK (spike_winlen >= 0),
    ,CONSTRAINT qcmaskdef__stspikethr__ck CHECK (single_trace_spike_thr >= 0)
);
COMMENT ON TABLE qcmaskdef IS $$ The qcmaskdef table contains information defining the parame ters that went into the calculation of the QC mask. $$;
COMMENT ON COLUMN qcmaskdef.qcdefid IS $$ Definition identifier $$;
COMMENT ON COLUMN qcmaskdef.fix IS $$ Flag indicating how to fix the bad segment $$;
COMMENT ON COLUMN qcmaskdef.ntaper IS $$ Number of points to taper outside segment of length >=drop_thr $$;
COMMENT ON COLUMN qcmaskdef.drop_thr IS $$ Number of consecutive equal-valued samples to call a bad segment $$;
COMMENT ON COLUMN qcmaskdef.single_trace_spike_thr IS $$ Amplitude ratio threshold for single-point spikes $$;
COMMENT ON COLUMN qcmaskdef.niter IS $$ Number of iterations to perform extended QC $$;
COMMENT ON COLUMN qcmaskdef.nsamp IS $$ Number of samples in a time interval for extended QC $$;
COMMENT ON COLUMN qcmaskdef.nover IS $$ Number of overlap samples for extended QC $$;
COMMENT ON COLUMN qcmaskdef.spike_thr IS $$ Amplitude ratio threshold for extended QC spikes $$;
COMMENT ON COLUMN qcmaskdef.spike_stat IS $$ Flag for statistic to use for spike detection across multiple data vectors $$;
COMMENT ON COLUMN qcmaskdef.spike_val IS $$ Value to use for spike_stat $$;
COMMENT ON COLUMN qcmaskdef.spike_npwin IS $$ Number of points to use for single vector extended QC spike detection $$;
COMMENT ON COLUMN qcmaskdef.spike_dset IS $$ Flag for data set to use for extended QC across multiple data vectors $$;
COMMENT ON COLUMN qcmaskdef.noise_thresh IS $$ Noisy channel threshold value $$;
COMMENT ON COLUMN qcmaskdef.spike_winlen IS $$ Number of samples used in single-trace QC $$;
COMMENT ON COLUMN qcmaskdef.interquar_coef IS $$ Inter-quartile range multiplier for single-trace QC $$;
COMMENT ON COLUMN qcmaskdef.noise_nsamp IS $$ Number of samples in averaging window for noisy channel processing $$;
COMMENT ON COLUMN qcmaskdef.noise_noverlap IS $$ Number of samples windows overlap for noisy channel processing $$;
COMMENT ON COLUMN qcmaskdef.algorithm_list IS $$ List of algorithms applied during QC processing $$;
COMMENT ON COLUMN qcmaskdef.ondate IS $$ The date this record starts to be used $$;
COMMENT ON COLUMN qcmaskdef.offdate IS $$ The date this record is no longer used $$;
COMMENT ON COLUMN qcmaskdef.auth IS $$ Author $$;
COMMENT ON COLUMN qcmaskdef.lddate IS $$ Load date $$;

-- Table: QCMASKINFO
CREATE TABLE IF NOT EXISTS qcmaskinfo (
    qcmaskid BIGINT,
    sta VARCHAR(6),
    chan VARCHAR(8),
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    samprate DOUBLE PRECISION,
    nseg INTEGER,
    qcdefid BIGINT,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (qcmaskid),
    ,CONSTRAINT qcmaskinfo_uk UNIQUE (chan),
    ,CONSTRAINT qcmaskinfo__endtime__ck CHECK (endtime <= 9999999999.999 AND endtime > time),
    ,CONSTRAINT qcmaskinfo__nseg__ck CHECK (nseg >= 0 OR nseg = -1),
    ,CONSTRAINT qcmaskinfo__qcdefid__ck CHECK (qcdefid > 0),
    ,CONSTRAINT qcmaskinfo__qcmaskid__ck CHECK (qcmaskid > 0),
    ,CONSTRAINT qcmaskinfo__samprate__ck CHECK (samprate > 0.0),
    ,CONSTRAINT qcmaskinfo__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT qcmaskinfo__time__ck CHECK (time > -9999999999.999)
);
COMMENT ON TABLE qcmaskinfo IS $$ The qcmaskinfo table contains QC mask data information about a channel and time interval for which QC processing was per formed. $$;
COMMENT ON COLUMN qcmaskinfo.qcmaskid IS $$ QC mask identifier $$;
COMMENT ON COLUMN qcmaskinfo.sta IS $$ Station name $$;
COMMENT ON COLUMN qcmaskinfo.chan IS $$ Channel name $$;
COMMENT ON COLUMN qcmaskinfo.time IS $$ Start time of Mask $$;
COMMENT ON COLUMN qcmaskinfo.endtime IS $$ End time of Mask $$;
COMMENT ON COLUMN qcmaskinfo.samprate IS $$ Sample rate in samples/sec $$;
COMMENT ON COLUMN qcmaskinfo.nseg IS $$ The number of segments for this mask ( see qcmaskseg table ) $$;
COMMENT ON COLUMN qcmaskinfo.qcdefid IS $$ QC definition ientifier $$;
COMMENT ON COLUMN qcmaskinfo.auth IS $$ Author $$;
COMMENT ON COLUMN qcmaskinfo.lddate IS $$ Load date $$;

-- Table: QCMASKSEG
CREATE TABLE IF NOT EXISTS qcmaskseg (
    qcmaskid BIGINT,
    startsample INTEGER,
    endsample INTEGER,
    masktype INTEGER,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (qcmaskid),
    ,CONSTRAINT qcmaskseg__endsample__ck CHECK (endsample >= startsample),
    ,CONSTRAINT qcmaskseg__masktype__ck CHECK (masktype > 0 OR masktype = 0),
    ,CONSTRAINT qcmaskseg__qcmaskid__ck CHECK (qcmaskid > 0),
    ,CONSTRAINT qcmaskseg__startsample__ck CHECK (startsample >= 0)
);
COMMENT ON TABLE qcmaskseg IS $$ The qcmaskseg table contains information about masked data s egments resulting from QC processing. $$;
COMMENT ON COLUMN qcmaskseg.qcmaskid IS $$ QC mask identifier $$;
COMMENT ON COLUMN qcmaskseg.startsample IS $$ Number of the starting sample $$;
COMMENT ON COLUMN qcmaskseg.endsample IS $$ Number of the ending sample $$;
COMMENT ON COLUMN qcmaskseg.masktype IS $$ Flag indicating type of mask for a given segment $$;
COMMENT ON COLUMN qcmaskseg.auth IS $$ Author $$;
COMMENT ON COLUMN qcmaskseg.lddate IS $$ Load date $$;

-- Table: QSHELL_INTERVAL
CREATE TABLE IF NOT EXISTS qshell_interval (
    qshell_intvlid BIGINT,
    intvlid BIGINT,
    class VARCHAR(16),
    name VARCHAR(20),
    proc_start_date TIMESTAMP,
    proc_end_date TIMESTAMP,
    state VARCHAR(16),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (qshell_intvlid),
    ,CONSTRAINT qshell_intvl__intvlid__ck CHECK (intvlid > 0),
    ,CONSTRAINT qshell_intvl__qsh_intvlid__ck CHECK (qshell_intvlid > 0)
);
COMMENT ON TABLE qshell_interval IS $$ The qshell_interval table records processing that was perfor med against interval table rows. It records the start and e nd dates of execution of each process name in the processing sequence for the interval class. $$;
COMMENT ON COLUMN qshell_interval.qshell_intvlid IS $$ QShell Interval identifier $$;
COMMENT ON COLUMN qshell_interval.intvlid IS $$ Interval identifier $$;
COMMENT ON COLUMN qshell_interval.class IS $$ Type of interval $$;
COMMENT ON COLUMN qshell_interval.name IS $$ Name of interval $$;
COMMENT ON COLUMN qshell_interval.proc_start_date IS $$ Processing start date $$;
COMMENT ON COLUMN qshell_interval.proc_end_date IS $$ Processing stop date $$;
COMMENT ON COLUMN qshell_interval.state IS $$ Current processing state $$;
COMMENT ON COLUMN qshell_interval.author IS $$ Author of interval $$;
COMMENT ON COLUMN qshell_interval.moddate IS $$ Time of last processing state change $$;
COMMENT ON COLUMN qshell_interval.lddate IS $$ Load date $$;

-- Table: RDA_PARAM
CREATE TABLE IF NOT EXISTS rda_param (
    polyid BIGINT,
    rda_verid BIGINT,
    gamma DOUBLE PRECISION,
    lambda DOUBLE PRECISION,
    class_decision_thresh DOUBLE PRECISION,
    auth VARCHAR(15),
    comments VARCHAR(4000),
    lddate TIMESTAMP,
    ,PRIMARY KEY (rda_verid),
    ,CONSTRAINT rda_param__cdt__ck CHECK (( class_decision_thresh >= 0 AND class_decision_thresh <=1 ) OR class_decision_thresh = -1),
    ,CONSTRAINT rda_param__gamma__ck CHECK (( gamma >= 0 AND gamma <=1 ) OR gamma = -1),
    ,CONSTRAINT rda_param__lambda__ck CHECK (( lambda >= 0 AND lambda <=1 ) OR lambda = -1),
    ,CONSTRAINT rda_param__polyid__ck CHECK (polyid >0),
    ,CONSTRAINT rda_param__rda_vid__ck CHECK (rda_verid >0)
);
COMMENT ON TABLE rda_param IS $$ The rda_param table contains the Regularized Discrimination Analysis (RDA) parameters for each polyid. $$;
COMMENT ON COLUMN rda_param.polyid IS $$ Polygon Identifier $$;
COMMENT ON COLUMN rda_param.rda_verid IS $$ version identifier of the RDA $$;
COMMENT ON COLUMN rda_param.gamma IS $$ Frequency exponent of attenuation $$;
COMMENT ON COLUMN rda_param.lambda IS $$ Smoothing parameter $$;
COMMENT ON COLUMN rda_param.class_decision_thresh IS $$ Decision threshold $$;
COMMENT ON COLUMN rda_param.auth IS $$ Author $$;
COMMENT ON COLUMN rda_param.comments IS $$ comment text $$;
COMMENT ON COLUMN rda_param.lddate IS $$ Load date $$;

-- Table: REG_RATIO_DISCRIM
CREATE TABLE IF NOT EXISTS reg_ratio_discrim (
    polyid BIGINT,
    cov_verid BIGINT,
    numerator_phase VARCHAR(8),
    denominator_phase VARCHAR(8),
    num_low_freq DOUBLE PRECISION,
    num_hi_freq DOUBLE PRECISION,
    den_low_freq DOUBLE PRECISION,
    den_hi_freq DOUBLE PRECISION,
    mean_ex_val DOUBLE PRECISION,
    num_station_var DOUBLE PRECISION,
    den_station_var DOUBLE PRECISION,
    num_event_var DOUBLE PRECISION,
    den_event_var DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (denominator_phase),
    ,CONSTRAINT reg_ratio_discr__cov_vid__ck CHECK (cov_verid >0),
    ,CONSTRAINT reg_ratio_discr__dhf__ck CHECK (den_hi_freq >=0),
    ,CONSTRAINT reg_ratio_discr__dlf__ck CHECK (den_low_freq >=0),
    ,CONSTRAINT reg_ratio_discr__nhf__ck CHECK (num_hi_freq >=0),
    ,CONSTRAINT reg_ratio_discr__nlf__ck CHECK (num_low_freq >=0),
    ,CONSTRAINT reg_ratio_discr__polyid__ck CHECK (polyid >0)
);
COMMENT ON TABLE reg_ratio_discrim IS $$ The reg_ratio_discrim table contains variances and means for each polyid, numerator phase and frequency, and denominator phase and frequency. These parameters are used for discrim inants which are ratios of two phases. $$;
COMMENT ON COLUMN reg_ratio_discrim.polyid IS $$ Polygon Identifier $$;
COMMENT ON COLUMN reg_ratio_discrim.cov_verid IS $$ version identifier of the covariance matrix $$;
COMMENT ON COLUMN reg_ratio_discrim.numerator_phase IS $$ Numerator phase of interest $$;
COMMENT ON COLUMN reg_ratio_discrim.denominator_phase IS $$ Denominator phase of interest $$;
COMMENT ON COLUMN reg_ratio_discrim.num_low_freq IS $$ Low end of frequency band used to filter numerator measurement $$;
COMMENT ON COLUMN reg_ratio_discrim.num_hi_freq IS $$ High end of frequency band used to filter numerator measurement $$;
COMMENT ON COLUMN reg_ratio_discrim.den_low_freq IS $$ Low end of frequency band used to filter denominator measurement $$;
COMMENT ON COLUMN reg_ratio_discrim.den_hi_freq IS $$ High end of frequency band used to filter denominator measurement $$;
COMMENT ON COLUMN reg_ratio_discrim.mean_ex_val IS $$ Mean p-value for explosions for this discriminant within this region $$;
COMMENT ON COLUMN reg_ratio_discrim.num_station_var IS $$ Variability due to station in the numerator phase $$;
COMMENT ON COLUMN reg_ratio_discrim.den_station_var IS $$ Variability due to station in the denominator phase $$;
COMMENT ON COLUMN reg_ratio_discrim.num_event_var IS $$ Variability due to event in the numerator phase $$;
COMMENT ON COLUMN reg_ratio_discrim.den_event_var IS $$ Variability due to event in the denominator phase $$;
COMMENT ON COLUMN reg_ratio_discrim.lddate IS $$ Date this parameter set was loaded $$;

-- Table: REMAP
CREATE TABLE IF NOT EXISTS remap (
    source VARCHAR(512),
    id_name VARCHAR(12),
    original_id BIGINT,
    current_id BIGINT,
    lddate TIMESTAMP,
    ,CONSTRAINT remap_current_id_nn CHECK ("CURRENT_ID" IS NOT NULL),
    ,CONSTRAINT remap_id_name_nn CHECK ("ID_NAME" IS NOT NULL),
    ,CONSTRAINT remap_original_id_nn CHECK ("ORIGINAL_ID" IS NOT NULL),
    ,CONSTRAINT remap_source_nn CHECK ("SOURCE" IS NOT NULL)
);

-- Table: REMARK
CREATE TABLE IF NOT EXISTS remark (
    commid BIGINT,
    lineno INTEGER,
    remark VARCHAR(160),
    lddate TIMESTAMP,
    ,PRIMARY KEY (lineno),
    ,CONSTRAINT remark__commid__ck CHECK (commid > 0),
    ,CONSTRAINT remark__lineno__ck CHECK (lineno > 0)
);
COMMENT ON TABLE remark IS $$ The remark table contains comments. This table may be used t o store free-form comments that embellish records of other t ables. The commid type in many tables refers to a record in the remark table. If commid is NA (1) in a record of any oth er table, no comments are stored for that record. $$;
COMMENT ON COLUMN remark.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN remark.lineno IS $$ Comment line number $$;
COMMENT ON COLUMN remark.remark IS $$ Free-format comment $$;
COMMENT ON COLUMN remark.lddate IS $$ Load date $$;

-- Table: REMOVED_BEAM_DFILE
CREATE TABLE IF NOT EXISTS removed_beam_dfile (
    dfile VARCHAR(32),
    lddate TIMESTAMP,
    ,PRIMARY KEY (lddate)
);
COMMENT ON TABLE removed_beam_dfile IS $$ This table contains a list of beam files that have been remo ved from the USNDC. It is used to clean up orphaned beam fil es on the non-mission system side since they are only remove d on the mission side. $$;
COMMENT ON COLUMN removed_beam_dfile.dfile IS $$ Beam file name $$;
COMMENT ON COLUMN removed_beam_dfile.lddate IS $$ Load date $$;

-- Table: REQUEST
CREATE TABLE IF NOT EXISTS request (
    reqid BIGINT,
    sta VARCHAR(6),
    chan VARCHAR(8),
    array VARCHAR(8),
    orid BIGINT,
    evid BIGINT,
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    class VARCHAR(16),
    req_state VARCHAR(16),
    statecount INTEGER,
    complete INTEGER,
    requestor VARCHAR(15),
    modtime DOUBLE PRECISION,
    modauthor VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (reqid),
    ,CONSTRAINT request_uk UNIQUE (time),
    ,CONSTRAINT request__complete__ck CHECK (complete >= 0 AND complete <= 100),
    ,CONSTRAINT request__endtime__ck CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT request__evid__ck CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT request__modtime__ck CHECK (modtime > -9999999999.999),
    ,CONSTRAINT request__orid__ck CHECK (orid > 0),
    ,CONSTRAINT request__reqid__ck CHECK (reqid > 0),
    ,CONSTRAINT request__statecount__ck CHECK (statecount >= 0),
    ,CONSTRAINT request__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT request__time__ck CHECK (time > -9999999999.999)
);
COMMENT ON TABLE request IS $$ The request table defines segments of auxiliary waveform dat a to be acquired. The time, endtime, sta, and chan types def ine a single unit of data. Data import programs must succeed in acquiring all the data for a time interval before changi ng the state to indicate success. $$;
COMMENT ON COLUMN request.reqid IS $$ Request identifier $$;
COMMENT ON COLUMN request.sta IS $$ Station code $$;
COMMENT ON COLUMN request.chan IS $$ Channel code $$;
COMMENT ON COLUMN request.array IS $$ Array code $$;
COMMENT ON COLUMN request.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN request.evid IS $$ Event identifier $$;
COMMENT ON COLUMN request.time IS $$ Starting time of requested waveform data $$;
COMMENT ON COLUMN request.endtime IS $$ Ending time of requested waveform data $$;
COMMENT ON COLUMN request.class IS $$ Type of request $$;
COMMENT ON COLUMN request.req_state IS $$ Current request state $$;
COMMENT ON COLUMN request.statecount IS $$ Number of failed attempts (when state = failed) $$;
COMMENT ON COLUMN request.complete IS $$ Percentage of data acquired $$;
COMMENT ON COLUMN request.requestor IS $$ Original author of record $$;
COMMENT ON COLUMN request.modtime IS $$ Time of last state change (epoch time) $$;
COMMENT ON COLUMN request.modauthor IS $$ Author of last state change $$;
COMMENT ON COLUMN request.lddate IS $$ Load date $$;

-- Table: SADO_EMAIL_HISTORY
CREATE TABLE IF NOT EXISTS sado_email_history (
    sado_email_id BIGINT,
    report_id BIGINT,
    subject VARCHAR(1000),
    recipients VARCHAR(4000),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (sado_email_id),
    ,CONSTRAINT sado_e_hist__report_id__ck CHECK (report_id > 0),
    ,CONSTRAINT sado_e_hist__sado_email_id__ck CHECK (sado_email_id > 0)
);
COMMENT ON TABLE sado_email_history IS $$ The SADO table contains the email history of reports sent by users using the SADO Tool. $$;
COMMENT ON COLUMN sado_email_history.sado_email_id IS $$ SADO Email History Identifier. $$;
COMMENT ON COLUMN sado_email_history.report_id IS $$ Report Identifier. $$;
COMMENT ON COLUMN sado_email_history.subject IS $$ SADO Email Subject Text $$;
COMMENT ON COLUMN sado_email_history.recipients IS $$ SADO Email recipients $$;
COMMENT ON COLUMN sado_email_history.author IS $$ Author of the SADO Email $$;
COMMENT ON COLUMN sado_email_history.moddate IS $$ Modification date $$;
COMMENT ON COLUMN sado_email_history.lddate IS $$ Load Date $$;

-- Table: SADO_PDF_REPORTS
CREATE TABLE IF NOT EXISTS sado_pdf_reports (
    sado_pdf_report_id BIGINT,
    report_id BIGINT,
    report ,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (sado_pdf_report_id),
    ,CONSTRAINT sado_pdf_rpts__report_id__ck CHECK (report_id > 0),
    ,CONSTRAINT sado_pdf_rpts__spr_id__ck CHECK (sado_pdf_report_id > 0)
);
COMMENT ON TABLE sado_pdf_reports IS $$ The SADO table contains the binary stored pdf reports and as sociated id numbers. $$;
COMMENT ON COLUMN sado_pdf_reports.sado_pdf_report_id IS $$ SADO PDF Report Identifier $$;
COMMENT ON COLUMN sado_pdf_reports.report_id IS $$ SADO Report Identifier $$;
COMMENT ON COLUMN sado_pdf_reports.report IS $$ Binary format for saving the SADO pdf report $$;
COMMENT ON COLUMN sado_pdf_reports.author IS $$ Author of the SADO PDF Report. $$;
COMMENT ON COLUMN sado_pdf_reports.moddate IS $$ Modification date $$;
COMMENT ON COLUMN sado_pdf_reports.lddate IS $$ Load Date $$;

-- Table: SADO_REPORT
CREATE TABLE IF NOT EXISTS sado_report (
    report_id BIGINT,
    evid BIGINT,
    orid BIGINT,
    grn INTEGER,
    event_time DOUBLE PRECISION,
    title VARCHAR(64),
    analyst VARCHAR(32),
    account VARCHAR(15),
    description ,
    classification VARCHAR(256),
    ttge VARCHAR(1),
    sado_released VARCHAR(1),
    alert_manager_called VARCHAR(1),
    exercise VARCHAR(1),
    email_type VARCHAR(32),
    alert_manager VARCHAR(64),
    yield_calculator_region_select VARCHAR(64),
    final_determination VARCHAR(32),
    mag_magtype VARCHAR(32),
    overburden_set VARCHAR(1),
    overburden DOUBLE PRECISION,
    comments VARCHAR(4000),
    ecm_determination VARCHAR(32),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (report_id),
    ,CONSTRAINT sado_report__alrt_mgr_call__ck CHECK (alert_manager_called IN('N','Y','-')),
    ,CONSTRAINT sado_report__email_type__ck CHECK (email_type IN ( 'Code 0', 'Code 1', 'Code 2' )),
    ,CONSTRAINT sado_report__event_time__ck CHECK (event_time >= -9999999999.999),
    ,CONSTRAINT sado_report__evid__ck CHECK (evid > 0),
    ,CONSTRAINT sado_report__exercise__ck CHECK (exercise IN('N','Y','-')),
    ,CONSTRAINT sado_report__final_determ__ck CHECK (final_determination IN('Indeterminate','Earthquake','Explosion','Not Applicable' )),
    ,CONSTRAINT sado_report__grn__ck CHECK ((grn >= 1 AND grn <= 729) OR grn = -1),
    ,CONSTRAINT sado_report__orid__ck CHECK (orid > 0),
    ,CONSTRAINT sado_report__overburden__ck CHECK ((overburden >= 20.0 AND overburden <= 1000.0) OR overburden = -1.0),
    ,CONSTRAINT sado_report__overburdn_set__ck CHECK (overburden_set IN('N','Y')),
    ,CONSTRAINT sado_report__report_id__ck CHECK (report_id > 0),
    ,CONSTRAINT sado_report__sado_released__ck CHECK (sado_released IN('N','Y','-')),
    ,CONSTRAINT sado_report__ttge__ck CHECK (ttge IN('N','Y','-'))
);
COMMENT ON TABLE sado_report IS $$ The SADO table contains data about the SADO report and the e vent for the report. $$;
COMMENT ON COLUMN sado_report.report_id IS $$ Report Identifier $$;
COMMENT ON COLUMN sado_report.evid IS $$ Event Identifier $$;
COMMENT ON COLUMN sado_report.orid IS $$ Origin Identifier $$;
COMMENT ON COLUMN sado_report.grn IS $$ Geographic region number $$;
COMMENT ON COLUMN sado_report.event_time IS $$ Epoch time of an Event $$;
COMMENT ON COLUMN sado_report.title IS $$ Title of the report. Combination of the evid number and date and timestamp of the report $$;
COMMENT ON COLUMN sado_report.analyst IS $$ The analyst that created the event of the report $$;
COMMENT ON COLUMN sado_report.account IS $$ Pipeline account the report is being written from $$;
COMMENT ON COLUMN sado_report.description IS $$ SADO Report Descriptive text. $$;
COMMENT ON COLUMN sado_report.classification IS $$ The classification of the report material $$;
COMMENT ON COLUMN sado_report.ttge IS $$ Boolean indicating the Alert Manager sent an email for this report $$;
COMMENT ON COLUMN sado_report.sado_released IS $$ Boolean indicating the SADO report has been released to the AFTAC website $$;
COMMENT ON COLUMN sado_report.alert_manager_called IS $$ Boolean indicating if the user called the alert manager $$;
COMMENT ON COLUMN sado_report.exercise IS $$ Boolean indicating if the report is an exercise report $$;
COMMENT ON COLUMN sado_report.email_type IS $$ Indicates the report type of type 0, 1, or 2 $$;
COMMENT ON COLUMN sado_report.alert_manager IS $$ Indicates which alert manager was called if an alert manager was called $$;
COMMENT ON COLUMN sado_report.yield_calculator_region_select IS $$ Region selected for chemical and yield calculator. $$;
COMMENT ON COLUMN sado_report.final_determination IS $$ SADO final determination of the event $$;
COMMENT ON COLUMN sado_report.mag_magtype IS $$ String variable of magnitude + magtype used for magtypes selection in SADO tool. $$;
COMMENT ON COLUMN sado_report.overburden_set IS $$ Boolean value indicating if the user set the depth of burial manually. $$;
COMMENT ON COLUMN sado_report.overburden IS $$ Manually set Depth of Burial in meters. $$;
COMMENT ON COLUMN sado_report.comments IS $$ Commentary section for the SADO to write any extra information they would like to include in report. $$;
COMMENT ON COLUMN sado_report.ecm_determination IS $$ ECM determination selected by the user $$;
COMMENT ON COLUMN sado_report.author IS $$ Author of the SADO Report. $$;
COMMENT ON COLUMN sado_report.moddate IS $$ Modification date $$;
COMMENT ON COLUMN sado_report.lddate IS $$ Load Date $$;

-- Table: SADO_REPORT_LANDMARKS
CREATE TABLE IF NOT EXISTS sado_report_landmarks (
    report_landmarks_id BIGINT,
    report_id BIGINT,
    location_id BIGINT,
    testsite VARCHAR(1),
    name VARCHAR(64),
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    distance DOUBLE PRECISION,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (report_landmarks_id),
    ,CONSTRAINT sado_rep_lm__distance__ck CHECK (distance >= 0),
    ,CONSTRAINT sado_rep_lm__lat__ck CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT sado_rep_lm__location_id__ck CHECK (location_id > 0 OR location_id = -1),
    ,CONSTRAINT sado_rep_lm__lon__ck CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT sado_rep_lm__report_id__ck CHECK (report_id > 0),
    ,CONSTRAINT sado_rep_lm__report_lm_id__ck CHECK (report_landmarks_id > 0),
    ,CONSTRAINT sado_rep_lm__testsite__ck CHECK (testsite IN('N','Y','-'))
);
COMMENT ON TABLE sado_report_landmarks IS $$ The SADO table contains landmarks and information about land marks related to the event $$;
COMMENT ON COLUMN sado_report_landmarks.report_landmarks_id IS $$ Report Landmarks Identifier $$;
COMMENT ON COLUMN sado_report_landmarks.report_id IS $$ Report Identifier $$;
COMMENT ON COLUMN sado_report_landmarks.location_id IS $$ Location Identifier $$;
COMMENT ON COLUMN sado_report_landmarks.testsite IS $$ Boolean indicating if the landmark is a testsite from the testsite table $$;
COMMENT ON COLUMN sado_report_landmarks.name IS $$ Name for the landmark. If it is a testsite, it is the testsite name. If it is user added, it is the name provided by the user. $$;
COMMENT ON COLUMN sado_report_landmarks.lat IS $$ Estimated latitude $$;
COMMENT ON COLUMN sado_report_landmarks.lon IS $$ Estimated longitude $$;
COMMENT ON COLUMN sado_report_landmarks.distance IS $$ Distance of landmark from event location in degrees. $$;
COMMENT ON COLUMN sado_report_landmarks.author IS $$ Author of this SADO Report Landmark $$;
COMMENT ON COLUMN sado_report_landmarks.moddate IS $$ Modification date $$;
COMMENT ON COLUMN sado_report_landmarks.lddate IS $$ Load Date $$;

-- Table: SADO_SCREENSHOTS
CREATE TABLE IF NOT EXISTS sado_screenshots (
    sado_screenshot_id BIGINT,
    report_id BIGINT,
    screenshot ,
    type VARCHAR(10),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (sado_screenshot_id),
    ,CONSTRAINT sado_ss__report_id__ck CHECK (report_id > 0),
    ,CONSTRAINT sado_ss__sado_ss_id__ck CHECK (sado_screenshot_id > 0),
    ,CONSTRAINT sado_ss__type__ck CHECK (type IN ('png', 'PNG'))
);
COMMENT ON TABLE sado_screenshots IS $$ The SADO table contains image files related to SADO reports $$;
COMMENT ON COLUMN sado_screenshots.sado_screenshot_id IS $$ SADO Screenshot Identifier $$;
COMMENT ON COLUMN sado_screenshots.report_id IS $$ Report Identifier $$;
COMMENT ON COLUMN sado_screenshots.screenshot IS $$ Binary storage for an image file $$;
COMMENT ON COLUMN sado_screenshots.type IS $$ Screenshot image file types (Initial allowable types (jpg, jpeg, png)) $$;
COMMENT ON COLUMN sado_screenshots.author IS $$ Author of this SADO Screenshot $$;
COMMENT ON COLUMN sado_screenshots.moddate IS $$ Modification date $$;
COMMENT ON COLUMN sado_screenshots.lddate IS $$ Load Date $$;

-- Table: SADO_STATE
CREATE TABLE IF NOT EXISTS sado_state (
    sado_state_id BIGINT,
    report_id BIGINT,
    sado_state_category_id BIGINT,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (sado_state_id),
    ,CONSTRAINT sado_state__report_id__ck CHECK (report_id > 0),
    ,CONSTRAINT sado_state__sado_st_cat_id__ck CHECK (sado_state_category_id > 0),
    ,CONSTRAINT sado_state__sado_st_id__ck CHECK (sado_state_id > 0)
);
COMMENT ON TABLE sado_state IS $$ The SADO table contains the current state of the reports. T he reports can be new, saved, submitted, or modified. $$;
COMMENT ON COLUMN sado_state.sado_state_id IS $$ SADO State Identifier $$;
COMMENT ON COLUMN sado_state.report_id IS $$ Report Identifier $$;
COMMENT ON COLUMN sado_state.sado_state_category_id IS $$ SADO State Category Identifier $$;
COMMENT ON COLUMN sado_state.author IS $$ Author of this SADO State $$;
COMMENT ON COLUMN sado_state.moddate IS $$ Modification date $$;
COMMENT ON COLUMN sado_state.lddate IS $$ Load Date $$;

-- Table: SADO_STATE_CATEGORIES
CREATE TABLE IF NOT EXISTS sado_state_categories (
    sado_state_category_id BIGINT,
    title VARCHAR(64),
    description ,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (sado_state_category_id),
    ,CONSTRAINT sado_st_cat__ssc_id__ck CHECK (sado_state_category_id > 0)
);
COMMENT ON TABLE sado_state_categories IS $$ The SADO table contains descriptions of the various states a report can be in. $$;
COMMENT ON COLUMN sado_state_categories.sado_state_category_id IS $$ SADO State Category Identifier $$;
COMMENT ON COLUMN sado_state_categories.title IS $$ Short description/title of the sado report category $$;
COMMENT ON COLUMN sado_state_categories.description IS $$ Detailed description of the sado report category $$;
COMMENT ON COLUMN sado_state_categories.author IS $$ Author of this SADO State Category $$;
COMMENT ON COLUMN sado_state_categories.moddate IS $$ Modification date $$;
COMMENT ON COLUMN sado_state_categories.lddate IS $$ Load Date $$;

-- Table: SADO_USERS
CREATE TABLE IF NOT EXISTS sado_users (
    sado_users_id BIGINT,
    sado_name VARCHAR(64),
    office_symbol VARCHAR(64),
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (sado_users_id)
);
COMMENT ON TABLE sado_users IS $$ The SADO_USERS table contains the first and last name of the SADO to be used for and appear in SADO reports. $$;
COMMENT ON COLUMN sado_users.sado_users_id IS $$ SADO Users Identifier $$;
COMMENT ON COLUMN sado_users.sado_name IS $$ First and last name of the SADO. $$;
COMMENT ON COLUMN sado_users.author IS $$ SADO OS User. $$;
COMMENT ON COLUMN sado_users.moddate IS $$ Modification date $$;
COMMENT ON COLUMN sado_users.lddate IS $$ Load Date $$;

-- Table: SENSOR
CREATE TABLE IF NOT EXISTS sensor (
    sta VARCHAR(6),
    chan VARCHAR(8),
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    inid BIGINT,
    chanid BIGINT,
    jdate INTEGER,
    calratio DOUBLE PRECISION,
    calper DOUBLE PRECISION,
    tshift DOUBLE PRECISION,
    instant VARCHAR(1),
    lddate TIMESTAMP,
    ,PRIMARY KEY (sta),
    ,CONSTRAINT sensor__calper__ck CHECK (calper > 0.0),
    ,CONSTRAINT sensor__calratio__ck CHECK (calratio > 0.0),
    ,CONSTRAINT sensor__chanid__ck CHECK (chanid > 0 OR chanid = -1),
    ,CONSTRAINT sensor__endtime__ck CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT sensor__inid__ck CHECK (inid > 0 OR inid = -1),
    ,CONSTRAINT sensor__instant__ck CHECK (instant IN ('y','n')),
    ,CONSTRAINT sensor__jdate__ck CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT sensor__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT sensor__time__ck CHECK (time >= -9999999999.999),
    ,CONSTRAINT sensor__tshift__ck CHECK (tshift > -9999999999.999)
);
COMMENT ON TABLE sensor IS $$ The sensor table contains calibration information for specif ic sensor channels. This table provides a record of updates in the calibration factor or clock error of each instrument and links a sta/chan/time to a complete instrument response in the instrument table. Waveform data are converted into ph ysical units through multiplication by the calib type locate d in wfdisc. The correct value of calib may not be accuratel y known when the wfdisc record is entered into the database. The sensor table provides the mechanism (calratio and calpe r) to update calib, without requiring possibly hundreds of w fdisc records to be updated. Through the foreign key inid, t his table is linked to instrument, which has types pointing to flat files holding detailed calibration information in a variety of formats (see instrument). $$;
COMMENT ON COLUMN sensor.sta IS $$ Station code $$;
COMMENT ON COLUMN sensor.chan IS $$ Channel code $$;
COMMENT ON COLUMN sensor.time IS $$ Epoch time of start of recording period $$;
COMMENT ON COLUMN sensor.endtime IS $$ Epoch time of end of recording period $$;
COMMENT ON COLUMN sensor.inid IS $$ Instrument identifier $$;
COMMENT ON COLUMN sensor.chanid IS $$ Channel identifier $$;
COMMENT ON COLUMN sensor.jdate IS $$ Julian date $$;
COMMENT ON COLUMN sensor.calratio IS $$ Calibration $$;
COMMENT ON COLUMN sensor.calper IS $$ Calibration period $$;
COMMENT ON COLUMN sensor.tshift IS $$ Correction of data processing time $$;
COMMENT ON COLUMN sensor.instant IS $$ Discrete/continuing (y, n) snapshot $$;
COMMENT ON COLUMN sensor.lddate IS $$ Load date $$;

-- Table: SITE
CREATE TABLE IF NOT EXISTS site (
    sta VARCHAR(6),
    ondate INTEGER,
    offdate INTEGER,
    lat DOUBLE PRECISION,
    lon DOUBLE PRECISION,
    elev DOUBLE PRECISION,
    staname VARCHAR(50),
    statype VARCHAR(4),
    refsta VARCHAR(6),
    dnorth DOUBLE PRECISION,
    deast DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (sta),
    ,CONSTRAINT site__deast__ck CHECK (deast >= -20000.0 AND deast <= 20000.0),
    ,CONSTRAINT site__dnorth__ck CHECK (dnorth >= -20000.0 AND dnorth <= 20000.0),
    ,CONSTRAINT site__elev__ck CHECK ((elev >= -10.0 AND elev <= 10.0) OR (elev = -999.0)),
    ,CONSTRAINT site__lon__ck CHECK (lon >= -180.0 AND lon <= 180.0),
    ,CONSTRAINT site__offdate__ck CHECK ((offdate > 1901348 AND offdate < 3001000) OR offdate = -1),
    ,CONSTRAINT site__ondate__ck CHECK (ondate > 1800001 AND ondate < 3001000),
    ,CONSTRAINT site__site_lat__ck CHECK (lat >= -90.0 AND lat <= 90.0),
    ,CONSTRAINT site__statype__ck CHECK (statype IN ('ss', 'ar', '-')),
    ,CONSTRAINT site__sta__ck CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE site IS $$ The site table contains station location information. It nam es and describes a point on the earth where measurements are made (e.g., the location of an instrument or array of instr uments). This table contains information that normally chang es infrequently, such as location. In addition, the site tab le contains types that describe the offset of a station rela tive to an array reference location. Global data integrity i mplies that the sta/ondate in site be consistent with the st a/chan/ondate in the sitechan table. $$;
COMMENT ON COLUMN site.sta IS $$ Station identifier $$;
COMMENT ON COLUMN site.ondate IS $$ Julian start date $$;
COMMENT ON COLUMN site.offdate IS $$ Julian off date $$;
COMMENT ON COLUMN site.lat IS $$ Latitude $$;
COMMENT ON COLUMN site.lon IS $$ Longitude $$;
COMMENT ON COLUMN site.elev IS $$ Elevation $$;
COMMENT ON COLUMN site.staname IS $$ Station description $$;
COMMENT ON COLUMN site.statype IS $$ Station type (single station, array) $$;
COMMENT ON COLUMN site.refsta IS $$ Reference station for array members $$;
COMMENT ON COLUMN site.dnorth IS $$ Offset from array reference (km) $$;
COMMENT ON COLUMN site.deast IS $$ Offset from array reference (km) $$;
COMMENT ON COLUMN site.lddate IS $$ Load date $$;

-- Table: SITEAUX
CREATE TABLE IF NOT EXISTS siteaux (
    sta VARCHAR(6),
    chan VARCHAR(8),
    time DOUBLE PRECISION,
    nois DOUBLE PRECISION,
    noissd DOUBLE PRECISION,
    amcor DOUBLE PRECISION,
    amcorsd DOUBLE PRECISION,
    snthrsh DOUBLE PRECISION,
    rely DOUBLE PRECISION,
    ptmcor DOUBLE PRECISION,
    stmcor DOUBLE PRECISION,
    staper DOUBLE PRECISION,
    delk DOUBLE PRECISION,
    dels DOUBLE PRECISION,
    auth VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (chan),
    ,CONSTRAINT siteaux__amcorsd__ck CHECK (amcorsd > 0.0 OR amcorsd = -1.0),
    ,CONSTRAINT siteaux__amcor__ck CHECK (amcor > -999.0 OR amcor = -999.0),
    ,CONSTRAINT siteaux__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT siteaux__delk__ck CHECK (delk > 0.0 or delk = -1.0),
    ,CONSTRAINT siteaux__dels__ck CHECK (dels > 0.0 or dels = -1.0),
    ,CONSTRAINT siteaux__noissd__ck CHECK (noissd > 0.0 OR noissd = -1.0),
    ,CONSTRAINT siteaux__nois__ck CHECK (nois >= 0.0 OR nois = -1.0),
    ,CONSTRAINT siteaux__ptmcor__ck CHECK (ptmcor > -999.0 OR ptmcor = -999.0),
    ,CONSTRAINT siteaux__rely__ck CHECK ((rely >= 0.0 AND rely <= 1.0) OR rely = -1.0),
    ,CONSTRAINT siteaux__snthrsh__ck CHECK (snthrsh > 1.0 OR snthrsh = -1.0),
    ,CONSTRAINT siteaux__staper__ck CHECK (staper > 0.0 OR staper = -1.0),
    ,CONSTRAINT siteaux__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT siteaux__stmcor__ck CHECK (stmcor > -999.0 OR stmcor = -999.0),
    ,CONSTRAINT siteaux__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE siteaux IS $$ The siteaux table contains additional site-dependent paramet ers that are not included in the site table. $$;
COMMENT ON COLUMN siteaux.sta IS $$ Station code $$;
COMMENT ON COLUMN siteaux.chan IS $$ Channel code $$;
COMMENT ON COLUMN siteaux.time IS $$ Epoch time $$;
COMMENT ON COLUMN siteaux.nois IS $$ Noise amplitude $$;
COMMENT ON COLUMN siteaux.noissd IS $$ Standard deviation of log noise $$;
COMMENT ON COLUMN siteaux.amcor IS $$ Amplitude correction $$;
COMMENT ON COLUMN siteaux.amcorsd IS $$ Correction standard deviation $$;
COMMENT ON COLUMN siteaux.snthrsh IS $$ Signal/noise detection threshold $$;
COMMENT ON COLUMN siteaux.rely IS $$ Station reliability $$;
COMMENT ON COLUMN siteaux.ptmcor IS $$ P arrival time correction $$;
COMMENT ON COLUMN siteaux.stmcor IS $$ S arrival time correction $$;
COMMENT ON COLUMN siteaux.staper IS $$ Period for measurements $$;
COMMENT ON COLUMN siteaux.delk IS $$ Estimate of slowness model uncertainty $$;
COMMENT ON COLUMN siteaux.dels IS $$ Estimate of slowness measurement uncertainty $$;
COMMENT ON COLUMN siteaux.auth IS $$ Author $$;
COMMENT ON COLUMN siteaux.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN siteaux.lddate IS $$ Load date $$;

-- Table: SITECHAN
CREATE TABLE IF NOT EXISTS sitechan (
    sta VARCHAR(6),
    chan VARCHAR(8),
    ondate INTEGER,
    chanid BIGINT,
    offdate INTEGER,
    ctype VARCHAR(4),
    edepth DOUBLE PRECISION,
    hang DOUBLE PRECISION,
    vang DOUBLE PRECISION,
    descrip VARCHAR(50),
    lddate TIMESTAMP,
    ,PRIMARY KEY (chan),
    ,CONSTRAINT sitechan__chanid__ck CHECK (chanid > 0 OR chanid = -1),
    ,CONSTRAINT sitechan__ctype__ck CHECK (ctype IN ('n', 'b', 'i', '-')),
    ,CONSTRAINT sitechan__edepth__ck CHECK (edepth >= -10.0),
    ,CONSTRAINT sitechan__hang__ck CHECK ((hang >= 0.0 AND hang <= 360.0) OR hang = -1.0),
    ,CONSTRAINT sitechan__offdate__ck CHECK ((offdate > 1901348 AND offdate < 3001000) OR offdate = -1),
    ,CONSTRAINT sitechan__ondate__ck CHECK (ondate > 1901348 AND ondate < 3001000),
    ,CONSTRAINT sitechan__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT sitechan__vang__ck CHECK ((vang >= 0.0 AND vang <= 90.0) OR vang = -1.0)
);
COMMENT ON TABLE sitechan IS $$ The sitechan table contains station-channel information. It describes the orientation of a recording channel at the site referenced by sta. The table provides information about the various channels that are available at a station and mainta ins a record of the physical channel configuration at a site . $$;
COMMENT ON COLUMN sitechan.sta IS $$ Station identifier $$;
COMMENT ON COLUMN sitechan.chan IS $$ Channel code $$;
COMMENT ON COLUMN sitechan.ondate IS $$ Julian start date $$;
COMMENT ON COLUMN sitechan.chanid IS $$ Channel identifier $$;
COMMENT ON COLUMN sitechan.offdate IS $$ Julian off date $$;
COMMENT ON COLUMN sitechan.ctype IS $$ Channel type $$;
COMMENT ON COLUMN sitechan.edepth IS $$ Emplacement depth $$;
COMMENT ON COLUMN sitechan.hang IS $$ Horizontal angle $$;
COMMENT ON COLUMN sitechan.vang IS $$ Vertical angle $$;
COMMENT ON COLUMN sitechan.descrip IS $$ Channel description $$;
COMMENT ON COLUMN sitechan.lddate IS $$ Load date $$;

-- Table: SNR_PHASE
CREATE TABLE IF NOT EXISTS snr_phase (
    polyid BIGINT,
    ampcor_verid BIGINT,
    sta VARCHAR(6),
    chan VARCHAR(8),
    phase VARCHAR(8),
    min_num_elem SMALLINT,
    snr_thresh DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (polyid),
    ,CONSTRAINT snr_phase__ampcor_verid__ck CHECK (ampcor_verid >0),
    ,CONSTRAINT snr_phase__min_num_elem__ck CHECK (min_num_elem >0),
    ,CONSTRAINT snr_phase__polyid__ck CHECK (polyid >0),
    ,CONSTRAINT snr_phase__snr_thresh__ck CHECK (snr_thresh >= 1 or snr_thresh = -1)
);
COMMENT ON TABLE snr_phase IS $$ The snr_phase table contains the minimum number of stations and signal-to-noise ratio needed to measure each phase in ea ch region for each station and channel. These parameters ar e used for discriminants which are ratios of two phases. $$;
COMMENT ON COLUMN snr_phase.polyid IS $$ Polygon Identifier $$;
COMMENT ON COLUMN snr_phase.ampcor_verid IS $$ amplitude correction version identifier $$;
COMMENT ON COLUMN snr_phase.sta IS $$ Station name $$;
COMMENT ON COLUMN snr_phase.chan IS $$ Channel name $$;
COMMENT ON COLUMN snr_phase.phase IS $$ phase of interest $$;
COMMENT ON COLUMN snr_phase.min_num_elem IS $$ Minimum number of elements needed $$;
COMMENT ON COLUMN snr_phase.snr_thresh IS $$ Minimum signal-to-noise ratio needed $$;
COMMENT ON COLUMN snr_phase.auth IS $$ Author $$;
COMMENT ON COLUMN snr_phase.lddate IS $$ Load date $$;

-- Table: SREGION
CREATE TABLE IF NOT EXISTS sregion (
    srn INTEGER,
    srname VARCHAR(40),
    lddate TIMESTAMP,
    ,PRIMARY KEY (srn),
    ,CONSTRAINT sregion__srname__ck CHECK (srname = UPPER(srname)),
    ,CONSTRAINT sregion__srn__ck CHECK ((srn >= 1 AND srn <= 50) OR srn = -1)
);
COMMENT ON TABLE sregion IS $$ The sregion table contains seismic region numbers and their equivalent descriptions. $$;
COMMENT ON COLUMN sregion.srn IS $$ Seismic region number $$;
COMMENT ON COLUMN sregion.srname IS $$ Seismic region name $$;
COMMENT ON COLUMN sregion.lddate IS $$ Load date $$;

-- Table: STA_CODA_SPECTRUM
CREATE TABLE IF NOT EXISTS sta_coda_spectrum (
    ampid BIGINT,
    freq DOUBLE PRECISION,
    ampcor DOUBLE PRECISION,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (ampid),
    ,CONSTRAINT sta_coda_spectrum__ampcor__ck CHECK (( ampcor > -9.99 AND ampcor < 50.0 ) OR ampcor = -999.0),
    ,CONSTRAINT sta_coda_spectrum__ampid__ck CHECK (ampid > 0),
    ,CONSTRAINT sta_coda_spectrum__freq__ck CHECK (freq > 0.0 OR freq = -1.0)
);
COMMENT ON TABLE sta_coda_spectrum IS $$ The sta_coda_spectrum table contains the theoretical source spectrum for an event, used to obtain the station moment mag nitude values. The theoretical spectrum is fit to the observ ed spectrum in all frequency bands for a station that are se t to defining in the envelope_contribution table. $$;
COMMENT ON COLUMN sta_coda_spectrum.ampid IS $$ Amplitude identifier $$;
COMMENT ON COLUMN sta_coda_spectrum.freq IS $$ Frequency $$;
COMMENT ON COLUMN sta_coda_spectrum.ampcor IS $$ Amplitude value corrected for path and site $$;
COMMENT ON COLUMN sta_coda_spectrum.auth IS $$ Author $$;
COMMENT ON COLUMN sta_coda_spectrum.lddate IS $$ Load date $$;

-- Table: STAMAG
CREATE TABLE IF NOT EXISTS stamag (
    magid BIGINT,
    ampid BIGINT,
    sta VARCHAR(6),
    arid BIGINT,
    orid BIGINT,
    evid BIGINT,
    phase VARCHAR(8),
    delta DOUBLE PRECISION,
    magtype VARCHAR(6),
    magnitude DOUBLE PRECISION,
    uncertainty DOUBLE PRECISION,
    magres DOUBLE PRECISION,
    magdef VARCHAR(1),
    mmodel VARCHAR(15),
    auth VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (ampid),
    ,CONSTRAINT stamag__ampid__ck CHECK (ampid > 0 OR ampid = -1),
    ,CONSTRAINT stamag__arid__ck CHECK (arid > 0 OR arid = -1),
    ,CONSTRAINT stamag__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT stamag__delta__ck CHECK (delta >= 0.0 OR delta = -1.0),
    ,CONSTRAINT stamag__evid__ck CHECK (evid > 0 OR evid = -1),
    ,CONSTRAINT stamag__magdef__ck CHECK (magdef IN ('d','D', 'n','N', 'X', 'x', '-')),
    ,CONSTRAINT stamag__magid__ck CHECK (magid > 0),
    ,CONSTRAINT stamag__magnitude__ck CHECK ((magnitude > -9.99 AND magnitude < 50.0) OR magnitude = -999.0),
    ,CONSTRAINT stamag__magres__ck CHECK ((magres > -50.0 AND magres < 50.0) OR magres = -999.0),
    ,CONSTRAINT stamag__orid__ck CHECK (orid > 0),
    ,CONSTRAINT stamag__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT stamag__uncertainty__ck CHECK (uncertainty > 0.0 OR uncertainty = -1.0)
);
COMMENT ON TABLE stamag IS $$ The stamag table contains station magnitude estimates based upon measurements made on specific seismic phases. Values in the stamag table are used to calculate network magnitudes s tored in the netmag table. $$;
COMMENT ON COLUMN stamag.magid IS $$ Magnitude identifier $$;
COMMENT ON COLUMN stamag.ampid IS $$ Amplitude identifier $$;
COMMENT ON COLUMN stamag.sta IS $$ Station code $$;
COMMENT ON COLUMN stamag.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN stamag.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN stamag.evid IS $$ Event identifier $$;
COMMENT ON COLUMN stamag.phase IS $$ Associated phase $$;
COMMENT ON COLUMN stamag.delta IS $$ Station-to-event distance $$;
COMMENT ON COLUMN stamag.magtype IS $$ Magnitude type (ml, ms, mb, etc.) $$;
COMMENT ON COLUMN stamag.magnitude IS $$ Magnitude $$;
COMMENT ON COLUMN stamag.uncertainty IS $$ Magnitude uncertainty $$;
COMMENT ON COLUMN stamag.magres IS $$ Magnitude residual $$;
COMMENT ON COLUMN stamag.magdef IS $$ flag indicating if magnitude is defining (d,D) or nondefining (n,N,x,X) $$;
COMMENT ON COLUMN stamag.mmodel IS $$ Magnitude model $$;
COMMENT ON COLUMN stamag.auth IS $$ Author $$;
COMMENT ON COLUMN stamag.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN stamag.lddate IS $$ Load date $$;

-- Table: STANET
CREATE TABLE IF NOT EXISTS stanet (
    net VARCHAR(8),
    sta VARCHAR(6),
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (net),
    ,CONSTRAINT stanet__sta__ck CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE stanet IS $$ The stanet table is used for Distributed Processing. It cont ains station to array mapping. $$;
COMMENT ON COLUMN stanet.net IS $$ Unique network identifier $$;
COMMENT ON COLUMN stanet.sta IS $$ Station identifier $$;
COMMENT ON COLUMN stanet.time IS $$ Starting time for station in network $$;
COMMENT ON COLUMN stanet.endtime IS $$ endtime for station in network $$;
COMMENT ON COLUMN stanet.lddate IS $$ Load date $$;

-- Table: STAQUAL_DNAMES
CREATE TABLE IF NOT EXISTS staqual_dnames (
    id BIGINT,
    sta VARCHAR(6),
    dname VARCHAR(8),
    on_time DOUBLE PRECISION,
    off_time DOUBLE PRECISION,
    author VARCHAR(64),
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (id)
);
COMMENT ON TABLE staqual_dnames IS $$ The staqual_dnames table contains reference data of the Stat ion and the associated detection beam for use with staqual_d aily_summary table to determine which dname is used for a pa rticular station quality measurement. $$;
COMMENT ON COLUMN staqual_dnames.id IS $$ Station Quality Dname Unique identifier $$;
COMMENT ON COLUMN staqual_dnames.sta IS $$ Station name $$;
COMMENT ON COLUMN staqual_dnames.dname IS $$ Detection beam or channel name $$;
COMMENT ON COLUMN staqual_dnames.on_time IS $$ Epoch time when a station was turned on $$;
COMMENT ON COLUMN staqual_dnames.off_time IS $$ Epoch time when a station was or will be turned off $$;
COMMENT ON COLUMN staqual_dnames.author IS $$ Author $$;
COMMENT ON COLUMN staqual_dnames.moddate IS $$ Modification date $$;
COMMENT ON COLUMN staqual_dnames.lddate IS $$ Load date $$;

-- Table: STATION_PROCESSING
CREATE TABLE IF NOT EXISTS station_processing (
    clustaid BIGINT,
    activetime DOUBLE PRECISION,
    procid BIGINT,
    proctype VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (clustaid),
    ,CONSTRAINT station_processing__ca__ck CHECK (clustaid > 0)
);
COMMENT ON TABLE station_processing IS $$ The station_processing table provides a link between the sta tion and the cluster and the processing recipe for that proc essing type. $$;
COMMENT ON COLUMN station_processing.clustaid IS $$ ID number of a cluster and refsta combination $$;
COMMENT ON COLUMN station_processing.activetime IS $$ The epochtime a cluster was activated $$;
COMMENT ON COLUMN station_processing.procid IS $$ procid of the processing recipe $$;
COMMENT ON COLUMN station_processing.proctype IS $$ The type of processing (ex: SVD, AMP, Corr) $$;
COMMENT ON COLUMN station_processing.lddate IS $$ Load date $$;

-- Table: STATION_QUALITY
CREATE TABLE IF NOT EXISTS station_quality (
    sqid BIGINT,
    sta VARCHAR(6),
    dname VARCHAR(8),
    time DOUBLE PRECISION,
    endtime DOUBLE PRECISION,
    jdate INTEGER,
    avgchans DOUBLE PRECISION,
    expected DOUBLE PRECISION,
    retrieved DOUBLE PRECISION,
    masked DOUBLE PRECISION,
    masks INTEGER,
    ndet_thres DOUBLE PRECISION,
    azimuth DOUBLE PRECISION,
    slow DOUBLE PRECISION,
    noise DOUBLE PRECISION,
    noisedev DOUBLE PRECISION,
    noisetype VARCHAR(10),
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (sqid),
    ,CONSTRAINT station_qual__avgchans__ck CHECK (avgchans >= 0.0 OR avgchans = -1.0),
    ,CONSTRAINT station_qual__azimuth__ck CHECK ((azimuth >= 0.0 AND azimuth <= 360.0) OR azimuth = -1.0),
    ,CONSTRAINT station_qual__endtime__ck CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT station_qual__expected__ck CHECK (expected > 0.0),
    ,CONSTRAINT station_qual__jdate__ck CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT station_qual__masked__ck CHECK (masked >= 0.0 OR masked = -999.0),
    ,CONSTRAINT station_qual__masks__ck CHECK (masks >= 0 OR masks = -1),
    ,CONSTRAINT station_qual__ndet_thres__ck CHECK (ndet_thres >= 0.0 AND ndet_thres < 1000),
    ,CONSTRAINT station_qual__noisedev__ck CHECK (noisedev > -999.0 OR noisedev = -999.0),
    ,CONSTRAINT station_qual__noise__ck CHECK (noise > -999.0 OR noise = -999.0),
    ,CONSTRAINT station_qual__retrieved__ck CHECK (retrieved >= 0.0),
    ,CONSTRAINT station_qual__slow__ck CHECK (slow >= 0.0 OR slow = -1.0),
    ,CONSTRAINT station_qual__sqid__ck CHECK (sqid > 0),
    ,CONSTRAINT station_qual__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT station_qual__time__ck CHECK (time > -9999999999.999)
);
COMMENT ON TABLE station_quality IS $$ The station_quality table holds station quality attributes c alculated and stored by DFX. $$;
COMMENT ON COLUMN station_quality.sqid IS $$ Station quality identifier $$;
COMMENT ON COLUMN station_quality.sta IS $$ Station name $$;
COMMENT ON COLUMN station_quality.dname IS $$ Detection beam or channel name $$;
COMMENT ON COLUMN station_quality.time IS $$ Epoch start time of segment $$;
COMMENT ON COLUMN station_quality.endtime IS $$ Epoch end time of segment $$;
COMMENT ON COLUMN station_quality.jdate IS $$ Julian date of start time $$;
COMMENT ON COLUMN station_quality.avgchans IS $$ Average number of active channels $$;
COMMENT ON COLUMN station_quality.expected IS $$ Expected number of seconds of data for segment $$;
COMMENT ON COLUMN station_quality.retrieved IS $$ Actual number of seconds of data for a segment $$;
COMMENT ON COLUMN station_quality.masked IS $$ Number of seconds masked in segment $$;
COMMENT ON COLUMN station_quality.masks IS $$ Number of masks in segment $$;
COMMENT ON COLUMN station_quality.ndet_thres IS $$ Normalized detection threshold $$;
COMMENT ON COLUMN station_quality.azimuth IS $$ Beam azimuth $$;
COMMENT ON COLUMN station_quality.slow IS $$ Beam slowness $$;
COMMENT ON COLUMN station_quality.noise IS $$ Noise level for segment $$;
COMMENT ON COLUMN station_quality.noisedev IS $$ Estimate of variability in noise level for the segment $$;
COMMENT ON COLUMN station_quality.noisetype IS $$ mean-sd; noise=power beam mean; noisedev=standard deviation; med-mad; noise=power beam median; noisedev=median absolute deviation $$;
COMMENT ON COLUMN station_quality.auth IS $$ Author $$;
COMMENT ON COLUMN station_quality.lddate IS $$ Load date $$;

-- Table: STAYIELD
CREATE TABLE IF NOT EXISTS stayield (
    yieldid BIGINT,
    ampid BIGINT,
    sta VARCHAR(6),
    chan VARCHAR(8),
    orid BIGINT,
    arid BIGINT,
    yield DOUBLE PRECISION,
    ffactor DOUBLE PRECISION,
    wmodel_name VARCHAR(50),
    auth VARCHAR(15),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (ampid),
    ,CONSTRAINT stayield__ampid__ck CHECK (ampid > 0),
    ,CONSTRAINT stayield__arid__ck CHECK (arid > 0),
    ,CONSTRAINT stayield__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT stayield__ffactor__ck CHECK (ffactor > 0.0 OR ffactor = -999.0),
    ,CONSTRAINT stayield__orid__ck CHECK (orid > 0),
    ,CONSTRAINT stayield__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT stayield__yieldid__ck CHECK (yieldid > 0),
    ,CONSTRAINT stayield__yield__ck CHECK (yield >= 0.0 OR yield = -1.0)
);
COMMENT ON TABLE stayield IS $$ The stayield table contains yield values calculated from cod a amplitudes obtained for a single station. $$;
COMMENT ON COLUMN stayield.yieldid IS $$ Yield identifier $$;
COMMENT ON COLUMN stayield.ampid IS $$ Amplitude identifier $$;
COMMENT ON COLUMN stayield.sta IS $$ Station identifier $$;
COMMENT ON COLUMN stayield.chan IS $$ Channel code $$;
COMMENT ON COLUMN stayield.orid IS $$ Origin identifier $$;
COMMENT ON COLUMN stayield.arid IS $$ Arrival identifier $$;
COMMENT ON COLUMN stayield.yield IS $$ Yield $$;
COMMENT ON COLUMN stayield.ffactor IS $$ Yield F factor (log 10) $$;
COMMENT ON COLUMN stayield.wmodel_name IS $$ Yield model name $$;
COMMENT ON COLUMN stayield.auth IS $$ Author $$;
COMMENT ON COLUMN stayield.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN stayield.lddate IS $$ Load date $$;

-- Table: SVDDISC
CREATE TABLE IF NOT EXISTS svddisc (
    lsvid BIGINT,
    clustaid BIGINT,
    activetime DOUBLE PRECISION,
    sta VARCHAR(6),
    nsamp INTEGER,
    samprate DOUBLE PRECISION,
    singular_value DOUBLE PRECISION,
    units VARCHAR(1),
    dir VARCHAR(64),
    dfile VARCHAR(32),
    foff BIGINT,
    commid BIGINT,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (lsvid),
    ,CONSTRAINT svddisc_lsvid_nn CHECK ("LSVID" IS NOT NULL),
    ,CONSTRAINT svddisc__ca__ck CHECK (clustaid > 0),
    ,CONSTRAINT svddisc__lsvid__ck CHECK (lsvid > 0)
);
COMMENT ON TABLE svddisc IS $$ The svddisc table contains a left singular vector (LSV) head er file and descriptive information. This table provides a p ointer (or index) to singular value decompositions stored on disk. The LSVs are stored in ordinary disk files called svd disc or '.lsv' files as a sequence of binary four byte float values. $$;
COMMENT ON COLUMN svddisc.lsvid IS $$ Left Singular Vector identifier $$;
COMMENT ON COLUMN svddisc.clustaid IS $$ Detector identifier $$;
COMMENT ON COLUMN svddisc.activetime IS $$ The epochtime a cluster was activated $$;
COMMENT ON COLUMN svddisc.sta IS $$ Station code (Ref Sta) $$;
COMMENT ON COLUMN svddisc.nsamp IS $$ Number of samples $$;
COMMENT ON COLUMN svddisc.samprate IS $$ Sampling rate in samples/sec $$;
COMMENT ON COLUMN svddisc.singular_value IS $$ Singular value $$;
COMMENT ON COLUMN svddisc.units IS $$ Units of waveform used to create LSV $$;
COMMENT ON COLUMN svddisc.dir IS $$ Directory $$;
COMMENT ON COLUMN svddisc.dfile IS $$ Data file $$;
COMMENT ON COLUMN svddisc.foff IS $$ Byte offset of data segment within file $$;
COMMENT ON COLUMN svddisc.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN svddisc.auth IS $$ Author $$;
COMMENT ON COLUMN svddisc.lddate IS $$ Load date $$;

-- Table: SVDDISC_CHAN_ORDER
CREATE TABLE IF NOT EXISTS svddisc_chan_order (
    clustaid BIGINT,
    sta VARCHAR(6),
    chan VARCHAR(6),
    activetime DOUBLE PRECISION,
    sort_order INTEGER,
    ,PRIMARY KEY (chan),
    ,CONSTRAINT svddisc_chan_order_chan_nn CHECK ("CHAN" IS NOT NULL),
    ,CONSTRAINT svddisc_chan_order_clustaid_nn CHECK ("CLUSTAID" IS NOT NULL),
    ,CONSTRAINT svddisc_chan_order_sta_nn CHECK ("STA" IS NOT NULL),
    ,CONSTRAINT svddisc_chan_order__ca__ck CHECK (clustaid > 0),
    ,CONSTRAINT svddisc_chan_order__sta__ck CHECK (sta = UPPER(sta))
);
COMMENT ON TABLE svddisc_chan_order IS $$ The svddisc_chan_order table contains the order in which the sta and chans were combined together to form the input sent to the SVD. This is the order in which the sta and chans ar e passed to the SVD must be the same as the order of the sta and chans of the observed data passed to the SVD. $$;
COMMENT ON COLUMN svddisc_chan_order.clustaid IS $$ ID of the Cluster and Station $$;
COMMENT ON COLUMN svddisc_chan_order.sta IS $$ Station code $$;
COMMENT ON COLUMN svddisc_chan_order.chan IS $$ Channel code $$;
COMMENT ON COLUMN svddisc_chan_order.activetime IS $$ The epochtime a cluster was activated $$;
COMMENT ON COLUMN svddisc_chan_order.sort_order IS $$ Sort order $$;

-- Table: TAPER
CREATE TABLE IF NOT EXISTS taper (
    taperid BIGINT,
    taper_type VARCHAR(16),
    taper_perct DOUBLE PRECISION,
    taper_maxpts INTEGER,
    taper_minpts INTEGER,
    auth VARCHAR(15),
    lddate TIMESTAMP,
    ,PRIMARY KEY (taperid),
    ,CONSTRAINT taper__taperid__ck CHECK (taperid > 0),
    ,CONSTRAINT taper__taper_maxpts__ck CHECK (taper_maxpts >= 0 OR taper_maxpts = -1),
    ,CONSTRAINT taper__taper_minpts__ck CHECK (taper_minpts >= 0 OR taper_minpts = -1),
    ,CONSTRAINT taper__taper_perct__ck CHECK (( taper_perct >= 0 AND taper_perct <= 1 ) OR taper_perct = -1),
    ,CONSTRAINT taper__taper_type__ck CHECK (taper_type in('welch','blackman','hamming','cosine','hanning','parzen'))
);
COMMENT ON TABLE taper IS $$ The taper table contains processing parameter. $$;
COMMENT ON COLUMN taper.taperid IS $$ ID number of a taper processing parameter $$;
COMMENT ON COLUMN taper.taper_type IS $$ Type of tapering to be applied during filtering $$;
COMMENT ON COLUMN taper.taper_perct IS $$ Percent of points to be tapered $$;
COMMENT ON COLUMN taper.taper_maxpts IS $$ Max allowed taper points $$;
COMMENT ON COLUMN taper.taper_minpts IS $$ Min allowed taper points $$;
COMMENT ON COLUMN taper.auth IS $$ Author $$;
COMMENT ON COLUMN taper.lddate IS $$ Load date $$;

-- Table: TIMESTAMP
CREATE TABLE IF NOT EXISTS timestamp (
    procclass VARCHAR(16),
    procname VARCHAR(16),
    time DOUBLE PRECISION,
    lddate TIMESTAMP,
    ,PRIMARY KEY (procclass),
    ,CONSTRAINT timestamp__time__ck CHECK (time > -9999999999.999)
);
COMMENT ON TABLE timestamp IS $$ The timestamp table is used by automated processing to recor d time milestones associated with time-series data. $$;
COMMENT ON COLUMN timestamp.procclass IS $$ Process class $$;
COMMENT ON COLUMN timestamp.procname IS $$ Process name $$;
COMMENT ON COLUMN timestamp.time IS $$ Last epoch time $$;
COMMENT ON COLUMN timestamp.lddate IS $$ Load date $$;

-- Table: TOMO_INFO
CREATE TABLE IF NOT EXISTS tomo_info (
    tomoid BIGINT,
    minlat DOUBLE PRECISION,
    maxlat DOUBLE PRECISION,
    dlat DOUBLE PRECISION,
    minlon DOUBLE PRECISION,
    maxlon DOUBLE PRECISION,
    dlon DOUBLE PRECISION,
    dir VARCHAR(64),
    dfile VARCHAR(32),
    auth VARCHAR(15),
    descrip VARCHAR(50),
    lddate TIMESTAMP,
    ,PRIMARY KEY (dfile),
    ,CONSTRAINT tomo_info_uk UNIQUE (tomoid),
    ,CONSTRAINT tomo_info__dlat__ck CHECK (dlat > 0.0),
    ,CONSTRAINT tomo_info__dlon__ck CHECK (dlon > 0.0),
    ,CONSTRAINT tomo_info__maxlat__ck CHECK (maxlat >= -90.0 AND maxlat <= 90.0),
    ,CONSTRAINT tomo_info__maxlon__ck CHECK (maxlon >= -180.0 AND maxlon <= 180.0),
    ,CONSTRAINT tomo_info__minlat__ck CHECK (minlat >= -90.0 AND minlat <= 90.0),
    ,CONSTRAINT tomo_info__minlon__ck CHECK (minlon >= -180.0 AND minlon <= 180.0),
    ,CONSTRAINT tomo_info__tomoid__ck CHECK (tomoid > 0)
);
COMMENT ON TABLE tomo_info IS $$ The tomo_info table contains pointers to the storage locatio n of the tomography grids used by coda magnitude processing to obtain the path correction values. $$;
COMMENT ON COLUMN tomo_info.tomoid IS $$ Tomography identifier $$;
COMMENT ON COLUMN tomo_info.minlat IS $$ Minimum latitude $$;
COMMENT ON COLUMN tomo_info.maxlat IS $$ Maximum latitude $$;
COMMENT ON COLUMN tomo_info.dlat IS $$ Latitude grid spacing (latitude interval) $$;
COMMENT ON COLUMN tomo_info.minlon IS $$ Minimum longitude $$;
COMMENT ON COLUMN tomo_info.maxlon IS $$ Maximum longitude $$;
COMMENT ON COLUMN tomo_info.dlon IS $$ Longitude grid spacing (longitude interval) $$;
COMMENT ON COLUMN tomo_info.dir IS $$ Directory $$;
COMMENT ON COLUMN tomo_info.dfile IS $$ Data file $$;
COMMENT ON COLUMN tomo_info.auth IS $$ Author $$;
COMMENT ON COLUMN tomo_info.descrip IS $$ Description $$;
COMMENT ON COLUMN tomo_info.lddate IS $$ Load date $$;

-- Table: USER_FILTER
CREATE TABLE IF NOT EXISTS user_filter (
    osuser VARCHAR(30),
    seq INTEGER,
    filter_string VARCHAR(1024),
    filterid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (seq),
    ,CONSTRAINT userfilter__filterid__ck CHECK (filterid > 0 OR filterid = -1.0),
    ,CONSTRAINT userfilter__seq__ck CHECK (seq >= 0)
);
COMMENT ON TABLE user_filter IS $$ The user_filter table is used to store the list of filters d esignated by a user to be their filter selection list option s. $$;
COMMENT ON COLUMN user_filter.osuser IS $$ System user identifier $$;
COMMENT ON COLUMN user_filter.seq IS $$ Order that the filter will be displayed in the list. $$;
COMMENT ON COLUMN user_filter.filter_string IS $$ Compact filter representation used as parameter to filter_data_by_string module. $$;
COMMENT ON COLUMN user_filter.filterid IS $$ Filter pointer to desired filter. $$;
COMMENT ON COLUMN user_filter.lddate IS $$ Load date $$;

-- Table: USER_PRIVILEGES
CREATE TABLE IF NOT EXISTS user_privileges (
    auth VARCHAR(15),
    max_duration INTEGER,
    app_table VARCHAR(32),
    lddate TIMESTAMP,
    ,PRIMARY KEY (auth),
    ,CONSTRAINT user_privs__max_dur__ck CHECK (max_duration > 0 OR max_duration = 0)
);
COMMENT ON TABLE user_privileges IS $$ This table lists the users who are allowed to apply channel masks to waveform data and the maximum time duration each us er can apply a channel mask (applies to omitted_channels tab le). This table also lists the users who are allowed to appl y nondefining location and magnitude indicators (timedef, az def, slodef and magdef) without respect to time duration (ap plies to nondefining table). $$;
COMMENT ON COLUMN user_privileges.auth IS $$ Author (authorized user) $$;
COMMENT ON COLUMN user_privileges.max_duration IS $$ Maximum length of channel masking $$;
COMMENT ON COLUMN user_privileges.app_table IS $$ Table that this authorization applies to $$;
COMMENT ON COLUMN user_privileges.lddate IS $$ Load date $$;

-- Table: WFACTIVITY
CREATE TABLE IF NOT EXISTS wfactivity (
    class VARCHAR(16),
    name VARCHAR(20),
    time DOUBLE PRECISION,
    duration DOUBLE PRECISION,
    min_time DOUBLE PRECISION,
    max_endtime NUMERIC,
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (time),
    ,CONSTRAINT wfactivity__duration__ck CHECK (duration > 0.0 OR duration = -1.0),
    ,CONSTRAINT wfactivity__max_endtime__ck CHECK (max_endtime > -9999999999.999),
    ,CONSTRAINT wfactivity__min_time__ck CHECK (min_time > -9999999999.999),
    ,CONSTRAINT wfactivity__time__ck CHECK (time >= -9999999999.999)
);
COMMENT ON TABLE wfactivity IS $$ The wfactivity table describes activity in the wfdisc table for a channel group and time region. $$;
COMMENT ON COLUMN wfactivity.class IS $$ Type of interval $$;
COMMENT ON COLUMN wfactivity.name IS $$ Name of interval $$;
COMMENT ON COLUMN wfactivity.time IS $$ Last epoch time $$;
COMMENT ON COLUMN wfactivity.duration IS $$ Duration in seconds of the time region $$;
COMMENT ON COLUMN wfactivity.min_time IS $$ Minimum time found in wfdisc for the time period $$;
COMMENT ON COLUMN wfactivity.max_endtime IS $$ Maximum endtime found in wfdisc for the time period $$;
COMMENT ON COLUMN wfactivity.moddate IS $$ Time of last processing state change $$;
COMMENT ON COLUMN wfactivity.lddate IS $$ Load date $$;

-- Table: WFAUDIT
CREATE TABLE IF NOT EXISTS wfaudit (
    wfauditid BIGINT,
    sta VARCHAR(6),
    chan VARCHAR(8),
    old_time DOUBLE PRECISION,
    new_time DOUBLE PRECISION,
    old_endtime DOUBLE PRECISION,
    new_endtime DOUBLE PRECISION,
    moddate TIMESTAMP,
    ,PRIMARY KEY (wfauditid),
    ,CONSTRAINT wfaudit__new_endtime__ck CHECK (new_endtime > -9999999999.999),
    ,CONSTRAINT wfaudit__new_time__ck CHECK (new_time > -9999999999.999),
    ,CONSTRAINT wfaudit__old_endtime__ck CHECK (old_endtime > -9999999999.999),
    ,CONSTRAINT wfaudit__old_time__ck CHECK (old_time > -9999999999.999),
    ,CONSTRAINT wfaudit__wfauditid__ck CHECK (wfauditid > 0)
);
COMMENT ON TABLE wfaudit IS $$ The wfaudit table contains records describing the sequences of changes made to rows in the wfdisc table for continuous ( raw) waveform data $$;
COMMENT ON COLUMN wfaudit.wfauditid IS $$ Wfaudit unique identifier $$;
COMMENT ON COLUMN wfaudit.sta IS $$ Station code. $$;
COMMENT ON COLUMN wfaudit.chan IS $$ Channel code. $$;
COMMENT ON COLUMN wfaudit.old_time IS $$ :old.time value provided to the wfdisc trigger $$;
COMMENT ON COLUMN wfaudit.new_time IS $$ :new.time value provided to the wfdisc trigger $$;
COMMENT ON COLUMN wfaudit.old_endtime IS $$ :old.endtime provided to the wfdisc trigger $$;
COMMENT ON COLUMN wfaudit.new_endtime IS $$ :new.endtime provided to the wfdisc trigger $$;
COMMENT ON COLUMN wfaudit.moddate IS $$ Time of last processing state change $$;

-- Table: WFCONV
CREATE TABLE IF NOT EXISTS wfconv (
    sta VARCHAR(6),
    chan VARCHAR(8),
    chanid BIGINT,
    inauth VARCHAR(1),
    incomp VARCHAR(2),
    intype VARCHAR(2),
    insamp INTEGER,
    outauth VARCHAR(1),
    outcomp VARCHAR(2),
    outtype VARCHAR(2),
    outsamp INTEGER,
    strip VARCHAR(1),
    commid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (chan),
    ,CONSTRAINT wfconv_uk UNIQUE (chanid),
    ,CONSTRAINT wfconv__chanid__ck CHECK (chanid > 0 OR chanid = -1),
    ,CONSTRAINT wfconv__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT wfconv__inauth__ck CHECK (inauth IN ('y','n','-')),
    ,CONSTRAINT wfconv__incomp__ck CHECK (incomp IN ('CA','-')),
    ,CONSTRAINT wfconv__insamp__ck CHECK (insamp >= 0 OR insamp = -20),
    ,CONSTRAINT wfconv__intype__ck CHECK (intype IN ('t4', 's4', 's3', 's2', 'g2', 'i4', '-' )),
    ,CONSTRAINT wfconv__outauth__ck CHECK (outauth IN ('y', 'n', '-')),
    ,CONSTRAINT wfconv__outcomp__ck CHECK (outcomp IN ('-')),
    ,CONSTRAINT wfconv__outsamp__ck CHECK (outsamp >= 0 OR outsamp = -20),
    ,CONSTRAINT wfconv__outtype__ck CHECK (outtype IN ('t4', 's4', 's3', 's2', 'g2', 'i4' )),
    ,CONSTRAINT wfconv__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT wfconv__strip__ck CHECK (strip IN ('y', 'n', '-'))
);
COMMENT ON TABLE wfconv IS $$ The wfconv table contains data translations that are to be p erformed on incoming data before they are written to disk by the DLMan application. Data compression types include "-" i f the data is not compressed or "CA" for Canadian compressio n. "Type" in columns intype and outtype is the fixed-width d ata type (e.g., "s4") or - if not applicable (i.e., if the d ata is compressed). An insamp value of zero (0) indicates th at the number of samples varies. Values less than zero in co lumns insamp and outsamp indicate that the total number of s amples must be evenly divisible by insamp. Strip indicates w hether to strip the authentication headers from the data; "y " means strip them and n means do not strip them. $$;
COMMENT ON COLUMN wfconv.sta IS $$ Station code $$;
COMMENT ON COLUMN wfconv.chan IS $$ Channel code $$;
COMMENT ON COLUMN wfconv.chanid IS $$ Channel identifier $$;
COMMENT ON COLUMN wfconv.inauth IS $$ Input authenticated (y or n) $$;
COMMENT ON COLUMN wfconv.incomp IS $$ Input compression type $$;
COMMENT ON COLUMN wfconv.intype IS $$ Input fixed-width datatype $$;
COMMENT ON COLUMN wfconv.insamp IS $$ Input samples per packet $$;
COMMENT ON COLUMN wfconv.outauth IS $$ Output authenticated (y or n) $$;
COMMENT ON COLUMN wfconv.outcomp IS $$ Output compression type $$;
COMMENT ON COLUMN wfconv.outtype IS $$ Output fixed-width datatype $$;
COMMENT ON COLUMN wfconv.outsamp IS $$ Output samples per packet $$;
COMMENT ON COLUMN wfconv.strip IS $$ Data stripped of headers $$;
COMMENT ON COLUMN wfconv.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN wfconv.lddate IS $$ Load date $$;

-- Table: WFDISC
CREATE TABLE IF NOT EXISTS wfdisc (
    sta VARCHAR(6),
    chan VARCHAR(8),
    time DOUBLE PRECISION,
    wfid BIGINT,
    chanid BIGINT,
    jdate INTEGER,
    endtime DOUBLE PRECISION,
    nsamp INTEGER,
    samprate DOUBLE PRECISION,
    calib DOUBLE PRECISION,
    calper DOUBLE PRECISION,
    instype VARCHAR(6),
    segtype VARCHAR(1),
    datatype VARCHAR(2),
    clip VARCHAR(1),
    dir VARCHAR(64),
    dfile VARCHAR(32),
    foff BIGINT,
    commid BIGINT,
    lddate TIMESTAMP,
    ,CONSTRAINT wfdisc_uk UNIQUE (wfid),
    ,CONSTRAINT wfdisc__calib__ck CHECK (calib != 0.0),
    ,CONSTRAINT wfdisc__calper__ck CHECK (calper > 0.0),
    ,CONSTRAINT wfdisc__chanid__ck CHECK (chanid > 0 OR chanid = -1),
    ,CONSTRAINT wfdisc__clip__ck CHECK (clip IN ('c','n','-')),
    ,CONSTRAINT wfdisc__commid__ck CHECK (commid > 0 OR commid = -1),
    ,CONSTRAINT wfdisc__datatype__ck CHECK (datatype in ('t4', 'e1', 's4', 's3', 's2', 'g2', 'i4', '-' )),
    ,CONSTRAINT wfdisc__endtime__ck CHECK (endtime < 9999999999.999 OR endtime = 9999999999.999),
    ,CONSTRAINT wfdisc__foff__ck CHECK (foff >= 0),
    ,CONSTRAINT wfdisc__jdate__ck CHECK ((jdate > 1901348 AND jdate < 3001000) OR jdate = -1),
    ,CONSTRAINT wfdisc__nsamp__ck CHECK (nsamp > 0),
    ,CONSTRAINT wfdisc__samprate__ck CHECK (samprate > 0.0),
    ,CONSTRAINT wfdisc__segtype__ck CHECK (segtype IN ('o', 'v', 's', 'd', '-')),
    ,CONSTRAINT wfdisc__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT wfdisc__time__ck CHECK (time >= -9999999999.999),
    ,CONSTRAINT wfdisc__wfid__ck CHECK (wfid > 0)
);
COMMENT ON TABLE wfdisc IS $$ The wfdisc table contains a waveform header file and descrip tive information. This table provides a pointer (or index) t o waveforms stored on disk. The waveforms themselves are sto red in ordinary disk files called wfdisc or '.w' files as a sequence of sample values (usually in binary representation) . $$;
COMMENT ON COLUMN wfdisc.sta IS $$ Station code $$;
COMMENT ON COLUMN wfdisc.chan IS $$ Channel code $$;
COMMENT ON COLUMN wfdisc.time IS $$ Epoch time of first sample in file $$;
COMMENT ON COLUMN wfdisc.wfid IS $$ Waveform identifier $$;
COMMENT ON COLUMN wfdisc.chanid IS $$ Channel identifier $$;
COMMENT ON COLUMN wfdisc.jdate IS $$ Julian date $$;
COMMENT ON COLUMN wfdisc.endtime IS $$ Time + (nsamp-1)/ samprate $$;
COMMENT ON COLUMN wfdisc.nsamp IS $$ Number of samples $$;
COMMENT ON COLUMN wfdisc.samprate IS $$ Sampling rate in samples/sec $$;
COMMENT ON COLUMN wfdisc.calib IS $$ Nominal calibration $$;
COMMENT ON COLUMN wfdisc.calper IS $$ Nominal calibration period $$;
COMMENT ON COLUMN wfdisc.instype IS $$ Instrument code $$;
COMMENT ON COLUMN wfdisc.segtype IS $$ Indexing method $$;
COMMENT ON COLUMN wfdisc.datatype IS $$ Numeric storage $$;
COMMENT ON COLUMN wfdisc.clip IS $$ Clipped flag $$;
COMMENT ON COLUMN wfdisc.dir IS $$ Directory $$;
COMMENT ON COLUMN wfdisc.dfile IS $$ Data file $$;
COMMENT ON COLUMN wfdisc.foff IS $$ Byte offset of data segment within file $$;
COMMENT ON COLUMN wfdisc.commid IS $$ Comment identifier $$;
COMMENT ON COLUMN wfdisc.lddate IS $$ Load date $$;

-- Table: WFFILE
CREATE TABLE IF NOT EXISTS wffile (
    wffid BIGINT,
    dir VARCHAR(64),
    dfile VARCHAR(32),
    machine VARCHAR(32),
    local_dir VARCHAR(64),
    tlen DOUBLE PRECISION,
    time DOUBLE PRECISION,
    reaptime DOUBLE PRECISION,
    sta VARCHAR(6),
    chan VARCHAR(8),
    samprate DOUBLE PRECISION,
    chanid BIGINT,
    wfmid BIGINT,
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    ,PRIMARY KEY (dfile),
    ,CONSTRAINT wffile_uk UNIQUE (wffid),
    ,CONSTRAINT wffile__chanid__ck CHECK (chanid > 0 OR chanid = -1),
    ,CONSTRAINT wffile__reaptime__ck CHECK (reaptime > 0.0 OR reaptime = 0.0),
    ,CONSTRAINT wffile__samprate__ck CHECK (samprate > 0.0),
    ,CONSTRAINT wffile__sta__ck CHECK (sta = UPPER(sta)),
    ,CONSTRAINT wffile__time__ck CHECK (time > -9999999999.999),
    ,CONSTRAINT wffile__tlen__ck CHECK (tlen > 0.0 OR tlen = -1.0),
    ,CONSTRAINT wffile__wffid__ck CHECK (wffid > 0),
    ,CONSTRAINT wffile__wfmid__ck CHECK (wfmid >= 0)
);
COMMENT ON TABLE wffile IS $$ The wffile table describes the files used in the Wave Form F iles managed by the Continuous Data Services Subsystem. $$;
COMMENT ON COLUMN wffile.wffid IS $$ Wave Form File identifier $$;
COMMENT ON COLUMN wffile.dir IS $$ Directory name $$;
COMMENT ON COLUMN wffile.dfile IS $$ Filename $$;
COMMENT ON COLUMN wffile.machine IS $$ Machine name $$;
COMMENT ON COLUMN wffile.local_dir IS $$ Local directory $$;
COMMENT ON COLUMN wffile.tlen IS $$ Length of file, in seconds $$;
COMMENT ON COLUMN wffile.time IS $$ Start time $$;
COMMENT ON COLUMN wffile.reaptime IS $$ Clock time for expiration $$;
COMMENT ON COLUMN wffile.sta IS $$ Station name $$;
COMMENT ON COLUMN wffile.chan IS $$ Channel code $$;
COMMENT ON COLUMN wffile.samprate IS $$ Sampling Rate in samples per second $$;
COMMENT ON COLUMN wffile.chanid IS $$ Channel identifier $$;
COMMENT ON COLUMN wffile.wfmid IS $$ Wave Form Manager identifier $$;

-- Table: WFTAG
CREATE TABLE IF NOT EXISTS wftag (
    tagname VARCHAR(8),
    tagid BIGINT,
    wfid BIGINT,
    lddate TIMESTAMP,
    ,PRIMARY KEY (tagid),
    ,CONSTRAINT wftag__tagid__ck CHECK (tagid > 0),
    ,CONSTRAINT wftag__tagname__ck CHECK (tagname IN ('arid', 'evid', 'orid', 'stassid', 'msgid', 'clustaid', '-')),
    ,CONSTRAINT wftag__wfid__ck CHECK (wfid > 0)
);
COMMENT ON TABLE wftag IS $$ The wftag table links various identifiers (e.g., orid, arid, and stassid to wfid). Linkages can also be determined indir ectly using sta/chan/time; however, it is more efficient to use the wftag table. $$;
COMMENT ON COLUMN wftag.tagname IS $$ Key (arid, orid, evid, etc.) $$;
COMMENT ON COLUMN wftag.tagid IS $$ Tagname value $$;
COMMENT ON COLUMN wftag.wfid IS $$ Waveform identifier $$;
COMMENT ON COLUMN wftag.lddate IS $$ Load date $$;

-- Table: XTAG
CREATE TABLE IF NOT EXISTS xtag (
    thisid BIGINT,
    thatid BIGINT,
    thisname VARCHAR(8),
    thatname VARCHAR(8),
    thisdb VARCHAR(32),
    thatdb VARCHAR(32),
    lddate TIMESTAMP,
    ,PRIMARY KEY (thisname),
    ,CONSTRAINT xtag__thatid__ck CHECK (thatid > 0),
    ,CONSTRAINT xtag__thisid__ck CHECK (thisid > 0)
);
COMMENT ON TABLE xtag IS $$ The xtag table links various identifiers (e.g., orid, arid, stassid, and wfid) to other identifiers. This table is a gen eralization of the wftag table, which is limited to linking exclusively to the wfdisc table. The thisdb column describes the database account for the record specified by thisid and thisname; thatdb describes the database account for the rec ord specified by thatid and thatname. When a parent/child ta ble exists between the records thisid should designate the p arent and thatid should designate the child. $$;
COMMENT ON COLUMN xtag.thisid IS $$ thisname identifier $$;
COMMENT ON COLUMN xtag.thatid IS $$ thatname identifier $$;
COMMENT ON COLUMN xtag.thisname IS $$ Key for thisid (grid, orid, ntid, and so on) $$;
COMMENT ON COLUMN xtag.thatname IS $$ Key for thatid (arid, orid, nfid, and so on) $$;
COMMENT ON COLUMN xtag.thisdb IS $$ Database account for the records specified by thisid and thisname $$;
COMMENT ON COLUMN xtag.thatdb IS $$ Database account for the records specified by thatid and thatname $$;
COMMENT ON COLUMN xtag.lddate IS $$ Load date $$;

-- Foreign Keys
ALTER TABLE amp3c ADD CONSTRAINT amp3c_arrival_arid_fk FOREIGN KEY (arid) REFERENCES arrival (arid);
ALTER TABLE amplitude ADD CONSTRAINT amplitude_arrival_arid_fk FOREIGN KEY (arid) REFERENCES arrival (arid);
ALTER TABLE amplitude_dyn_pars_dbl ADD CONSTRAINT ampdynpar_dbl_ampid_fk FOREIGN KEY (ampid) REFERENCES amplitude (ampid);
ALTER TABLE amplitude_dyn_pars_int ADD CONSTRAINT ampdynpar_int_ampid_fk FOREIGN KEY (ampid) REFERENCES amplitude (ampid);
ALTER TABLE amplitude_dyn_pars_str ADD CONSTRAINT ampdynpar_str_ampid_fk FOREIGN KEY (ampid) REFERENCES amplitude (ampid);
ALTER TABLE apma ADD CONSTRAINT apma_arrival_arid_fk FOREIGN KEY (arid) REFERENCES arrival (arid);
ALTER TABLE ar_info ADD CONSTRAINT ar_info_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE arrival_dyn_pars_dbl ADD CONSTRAINT arrdynpar_dbl_arid_fk FOREIGN KEY (arid) REFERENCES arrival (arid);
ALTER TABLE arrival_dyn_pars_int ADD CONSTRAINT arrdynpar_int_arid_fk FOREIGN KEY (arid) REFERENCES arrival (arid);
ALTER TABLE arrival_dyn_pars_str ADD CONSTRAINT arrdynpar_str_arid_fk FOREIGN KEY (arid) REFERENCES arrival (arid);
ALTER TABLE arrival_tag ADD CONSTRAINT arrival_tag_arrival_arid_fk FOREIGN KEY (arid) REFERENCES arrival (arid);
ALTER TABLE assoc ADD CONSTRAINT assoc_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE assoc ADD CONSTRAINT assoc_arrival_arid_fk FOREIGN KEY (arid) REFERENCES arrival (arid);
ALTER TABLE assoc_ga_del ADD CONSTRAINT ass_ga_del_orig_ga_del_orid_fk FOREIGN KEY (orid) REFERENCES origin_ga_del (orid);
ALTER TABLE beam ADD CONSTRAINT beam_wfdisc_wfid_fk FOREIGN KEY (wfid) REFERENCES wfdisc (wfid);
ALTER TABLE classification ADD CONSTRAINT class_class_opr_classoprid_fk FOREIGN KEY (class_opr_id) REFERENCES classification_opr (class_opr_id);
ALTER TABLE cluster_magref ADD CONSTRAINT clu_magref_clu_sta_ca_at_fk FOREIGN KEY (clustaid) REFERENCES cluster_station (clustai d);
ALTER TABLE cluster_magref ADD CONSTRAINT  FOREIGN KEY (activetime) REFERENCES cluster_station (activ etime);
ALTER TABLE cluster_mec ADD CONSTRAINT clu_mec_clu_sta_ca_at_fk FOREIGN KEY (clustaid) REFERENCES cluster_station (clustaid);
ALTER TABLE cluster_mec ADD CONSTRAINT  FOREIGN KEY (activetime) REFERENCES cluster_station (activeti me);
ALTER TABLE cluster_orid ADD CONSTRAINT clu_orid_clu_sta_ca_at_fk FOREIGN KEY (clustaid) REFERENCES cluster_station (clustaid);
ALTER TABLE cluster_orid ADD CONSTRAINT  FOREIGN KEY (activetime) REFERENCES cluster_station (activet ime);
ALTER TABLE cluster_override ADD CONSTRAINT clu_ovrd_clu_sta_ca_at_fk FOREIGN KEY (clustaid) REFERENCES cluster_station (clust aid);
ALTER TABLE cluster_override ADD CONSTRAINT  FOREIGN KEY (activetime) REFERENCES cluster_station (act ivetime);
ALTER TABLE cluster_station ADD CONSTRAINT clu_sta_cluster_info_cluid_fk FOREIGN KEY (cluid) REFERENCES cluster_info (cluid);
ALTER TABLE cluster_threshold ADD CONSTRAINT clu_thresh_clu_sta_ca_at_fk FOREIGN KEY (clustaid) REFERENCES cluster_station (clus taid);
ALTER TABLE cluster_threshold ADD CONSTRAINT  FOREIGN KEY (activetime) REFERENCES cluster_station (ac tivetime);
ALTER TABLE codamag_input ADD CONSTRAINT codamagin_amplitude_ampid_fk FOREIGN KEY (ampid) REFERENCES amplitude (ampid);
ALTER TABLE codamag_output ADD CONSTRAINT codamagout_codamagin_ampid_fk FOREIGN KEY (ampid) REFERENCES codamag_input (ampid);
ALTER TABLE codamag_output ADD CONSTRAINT  FOREIGN KEY (flo) REFERENCES codamag_input (flo);
ALTER TABLE codamag_output ADD CONSTRAINT  FOREIGN KEY (fhi) REFERENCES codamag_input (fhi);
ALTER TABLE defining_rules ADD CONSTRAINT def_rules_def_obs_obs_id_fk FOREIGN KEY (obstype_id) REFERENCES defining_obstypes (obs type_id);
ALTER TABLE defining_rules ADD CONSTRAINT def_rules_def_vals_val_id_fk FOREIGN KEY (value_id) REFERENCES defining_values (value_i d);
ALTER TABLE detection ADD CONSTRAINT detection_arrival_arid_fk FOREIGN KEY (arid) REFERENCES arrival (arid);
ALTER TABLE discrim_param ADD CONSTRAINT discrim_par_polygon_polyid_fk FOREIGN KEY (polyid) REFERENCES polygon (polyid);
ALTER TABLE discrimuse ADD CONSTRAINT discrimuse_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE discrimvote ADD CONSTRAINT discrimvote_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE ecm_chan_amplitude ADD CONSTRAINT ecm_chan_amp_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE ecm_cov ADD CONSTRAINT ecm_cov_polygon_polyid_fk FOREIGN KEY (polyid) REFERENCES polygon (polyid);
ALTER TABLE ecm_discriminants ADD CONSTRAINT ecm_discrim_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE ecm_event_results ADD CONSTRAINT ecm_event_res_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE ecm_ref_chan_amplitude ADD CONSTRAINT ecm_rca_polygon_polyid_fk FOREIGN KEY (polyid) REFERENCES polygon (polyid);
ALTER TABLE ecm_ref_chan_amplitude ADD CONSTRAINT ecm_rca_ecm_ref_event_evid_fk FOREIGN KEY (evid) REFERENCES ecm_ref_event (evid);
ALTER TABLE ecm_ref_discrim ADD CONSTRAINT ecm_ref_d_ecm_ref_e_evid_fk FOREIGN KEY (evid) REFERENCES ecm_ref_event (evid);
ALTER TABLE ecm_region_pref_version ADD CONSTRAINT ecm_reg_pv_polygon_polyid_fk FOREIGN KEY (polyid) REFERENCES polygon (polyid);
ALTER TABLE ecm_sources ADD CONSTRAINT ecm_sources_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE ecm_sta_pref_version ADD CONSTRAINT ecm_sta_pv_polygon_polyid_fk FOREIGN KEY (polyid) REFERENCES polygon (polyid);
ALTER TABLE envelope_contribution ADD CONSTRAINT envelope_cont_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE event_control ADD CONSTRAINT event_control_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE event_correlation ADD CONSTRAINT evt_corr_evt_src_evid_evid_fk FOREIGN KEY (source_evid) REFERENCES event (source_evid);
ALTER TABLE event_correlation ADD CONSTRAINT evt_corr_orig_src_orid_orid_fk FOREIGN KEY (source_orid) REFERENCES origin (source_ori d);
ALTER TABLE event_quality ADD CONSTRAINT event_quality_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE feedback_cataffiliation ADD CONSTRAINT fbcataffil_fb_feedback_id_fk FOREIGN KEY (feedback_id) REFERENCES feedback (fe edback_id);
ALTER TABLE feedback_screenshots ADD CONSTRAINT fbscrnshots_fb_feedback_id_fk FOREIGN KEY (feedback_id) REFERENCES feedback (feedb ack_id);
ALTER TABLE feedback_state ADD CONSTRAINT fbstate_fb_feedback_id_fk FOREIGN KEY (feedback_id) REFERENCES feedback (feedback_id);
ALTER TABLE filter_coefficients ADD CONSTRAINT filter_coef_filter_filterid_fk FOREIGN KEY (filterid) REFERENCES filter (filterid);
ALTER TABLE filter_group ADD CONSTRAINT filter_grp_filt_c_filterid_fk FOREIGN KEY (child_filterid) REFERENCES filter (child_filter id);
ALTER TABLE filter_group ADD CONSTRAINT filter_grp_filt_p_filterid_fk FOREIGN KEY (parent_filterid) REFERENCES filter (parent_filt erid);
ALTER TABLE filter_values_double ADD CONSTRAINT filt_val_db_filter_filterid_fk FOREIGN KEY (filterid) REFERENCES filter (filterid);
ALTER TABLE filter_values_integer ADD CONSTRAINT filt_val_in_filter_filterid_fk FOREIGN KEY (filterid) REFERENCES filter (filterid);
ALTER TABLE filter_values_string ADD CONSTRAINT filt_val_st_filter_filterid_fk FOREIGN KEY (filterid) REFERENCES filter (filterid);
ALTER TABLE fk_processing ADD CONSTRAINT fk_proc_arrival_arid_fk FOREIGN KEY (arid) REFERENCES arrival (arid);
ALTER TABLE ftpfailed ADD CONSTRAINT ftpfailed_msgdisc_msgid_fk FOREIGN KEY (msgid) REFERENCES msgdisc (msgid);
ALTER TABLE historic_info_shell ADD CONSTRAINT hist_shell_algorithm_id_fk FOREIGN KEY (algorithm_id) REFERENCES algorithm (algo rithm_id);
ALTER TABLE historic_info_sta_phase ADD CONSTRAINT hist_sta_phase_algorithm_id_fk FOREIGN KEY (algorithm_id) REFERENCES algorithm (algorithm_id);
ALTER TABLE historic_info_sta_phase ADD CONSTRAINT hist_info_sta_phs_cyl_id_fk FOREIGN KEY (historic_info_cylinder_id) REFERENCES historic_info_cylinder (historic_info_cylinder_i d);
ALTER TABLE mdac_fd ADD CONSTRAINT mdac_fd_mdac_fi_corrid_fk FOREIGN KEY (corrid) REFERENCES mdac_fi (corrid);
ALTER TABLE mdac_fd ADD CONSTRAINT  FOREIGN KEY (ampcor_verid) REFERENCES mdac_fi (ampcor_verid);
ALTER TABLE mdac_fi ADD CONSTRAINT mdac_fi_polygon_polyid_fk FOREIGN KEY (polyid) REFERENCES polygon (polyid);
ALTER TABLE msgaux ADD CONSTRAINT msgaux_msgdisc_msgid_fk FOREIGN KEY (msgid) REFERENCES msgdisc (msgid);
ALTER TABLE msgdest ADD CONSTRAINT msgdest_msgdisc_msgid_fk FOREIGN KEY (msgid) REFERENCES msgdisc (msgid);
ALTER TABLE msgdisc ADD CONSTRAINT msgdisc_datauser_userid_fk FOREIGN KEY (userid) REFERENCES datauser (userid);
ALTER TABLE msvmax_descript ADD CONSTRAINT msvmax_descript_amp_ampid_fk FOREIGN KEY (ampid) REFERENCES amplitude (ampid);
ALTER TABLE msvmax_results ADD CONSTRAINT msvmax_results_desc_ampid_fk FOREIGN KEY (ampid) REFERENCES msvmax_descript (ampid);
ALTER TABLE net_coda_spectrum ADD CONSTRAINT netcodaspec_netmag_magid_fk FOREIGN KEY (magid) REFERENCES netmag (magid);
ALTER TABLE netmag ADD CONSTRAINT netmag_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE netyield ADD CONSTRAINT netyield_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE origerr ADD CONSTRAINT origerr_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE origerr_ga_del ADD CONSTRAINT oe_ga_del_orig_ga_del_orid_fk FOREIGN KEY (orid) REFERENCES origin_ga_del (orid);
ALTER TABLE origin_mea_trace ADD CONSTRAINT omt_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE origin_tag ADD CONSTRAINT origin_tag_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE polypoint ADD CONSTRAINT polypoint_polygon_polyid_fk FOREIGN KEY (polyid) REFERENCES polygon (polyid);
ALTER TABLE qcmaskinfo ADD CONSTRAINT qcmskinfo_qcmskdef_qcdefid_fk FOREIGN KEY (qcdefid) REFERENCES qcmaskdef (qcdefid);
ALTER TABLE qcmaskseg ADD CONSTRAINT qcmskseg_qcmskinfo_qcmaskid_fk FOREIGN KEY (qcmaskid) REFERENCES qcmaskinfo (qcmaskid);
ALTER TABLE qshell_interval ADD CONSTRAINT qshell_intvl_intvlid_intvl_fk FOREIGN KEY (intvlid) REFERENCES interval (intvlid);
ALTER TABLE rda_param ADD CONSTRAINT rda_param_polygon_polyid_fk FOREIGN KEY (polyid) REFERENCES polygon (polyid);
ALTER TABLE reg_ratio_discrim ADD CONSTRAINT reg_rat_disc_polygon_polyid_fk FOREIGN KEY (polyid) REFERENCES polygon (polyid);
ALTER TABLE sado_email_history ADD CONSTRAINT sado_eh_sado_rep_report_id_fk FOREIGN KEY (report_id) REFERENCES sado_report (report _id);
ALTER TABLE sado_pdf_reports ADD CONSTRAINT sado_pr_sado_rep_report_id_fk FOREIGN KEY (report_id) REFERENCES sado_report (report_i d);
ALTER TABLE sado_report_landmarks ADD CONSTRAINT sado_rl_sado_rep_report_id_fk FOREIGN KEY (report_id) REFERENCES sado_report (rep ort_id);
ALTER TABLE sado_screenshots ADD CONSTRAINT sado_ss_sado_rep_report_id_fk FOREIGN KEY (report_id) REFERENCES sado_report (report_i d);
ALTER TABLE sado_state ADD CONSTRAINT sado_st_sado_rep_report_id_fk FOREIGN KEY (report_id) REFERENCES sado_report (report_id);
ALTER TABLE sensor ADD CONSTRAINT sensor_instrument_inid_fk FOREIGN KEY (inid) REFERENCES instrument (inid);
ALTER TABLE snr_phase ADD CONSTRAINT snr_phase_polygon_polyid_fk FOREIGN KEY (polyid) REFERENCES polygon (polyid);
ALTER TABLE sta_coda_spectrum ADD CONSTRAINT stacodaspec_amplitude_ampid_fk FOREIGN KEY (ampid) REFERENCES amplitude (ampid);
ALTER TABLE stamag ADD CONSTRAINT stamag_origin_orid_fk FOREIGN KEY (orid) REFERENCES origin (orid);
ALTER TABLE stamag ADD CONSTRAINT stamag_amplitude_ampid_fk FOREIGN KEY (ampid) REFERENCES amplitude (ampid);
ALTER TABLE station_processing ADD CONSTRAINT sta_proc_clust_sta_ca_at_fk FOREIGN KEY (clustaid) REFERENCES cluster_station (clu staid);
ALTER TABLE station_processing ADD CONSTRAINT  FOREIGN KEY (activetime) REFERENCES cluster_station (a ctivetime);
ALTER TABLE stayield ADD CONSTRAINT stayield_amplitude_ampid_fk FOREIGN KEY (ampid) REFERENCES amplitude (ampid);
ALTER TABLE svddisc ADD CONSTRAINT svddisc_clu_sta_ca_at_fk FOREIGN KEY (clustaid) REFERENCES cluster_station (clustaid);
ALTER TABLE svddisc ADD CONSTRAINT  FOREIGN KEY (activetime) REFERENCES cluster_station (activetime);
ALTER TABLE svddisc_chan_order ADD CONSTRAINT svd_ch_ord_clu_sta_ca_at_fk FOREIGN KEY (clustaid) REFERENCES cluster_station (clu staid);
ALTER TABLE svddisc_chan_order ADD CONSTRAINT  FOREIGN KEY (activetime) REFERENCES cluster_station (a ctivetime);
ALTER TABLE wftag ADD CONSTRAINT wftag_wfdisc_wfid_fk FOREIGN KEY (wfid) REFERENCES wfdisc (wfid);