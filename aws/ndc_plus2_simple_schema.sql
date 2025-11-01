-- Simple NDC PLUS 2 Schema based on NDC_Plus2.mmd
-- PostgreSQL DDL

-- Create tables based on the Mermaid diagram structure

CREATE TABLE event (
    evid INTEGER PRIMARY KEY,
    monitoring_organization VARCHAR(255),
    remark_gid VARCHAR(255),
    lddate TIMESTAMP
);

CREATE TABLE location_solution (
    orid INTEGER PRIMARY KEY,
    evid INTEGER,
    lat REAL,
    lon REAL,
    depth REAL,
    time TIMESTAMP,
    grn INTEGER,
    srn INTEGER,
    algorithm VARCHAR(255),
    author VARCHAR(255),
    stage VARCHAR(255),
    iscurrent BOOLEAN,
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    etype VARCHAR(255),
    depdp REAL,
    dtype VARCHAR(255),
    FOREIGN KEY (evid) REFERENCES event(evid)
);

CREATE TABLE location_uncertainty (
    orid INTEGER PRIMARY KEY,
    xx REAL,
    yy REAL,
    zz REAL,
    tt REAL,
    xy REAL,
    xz REAL,
    yz REAL,
    tx REAL,
    ty REAL,
    tz REAL,
    std_dev_travel_time_residuals REAL,
    stage VARCHAR(255),
    iscurrent BOOLEAN,
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    remark_gid VARCHAR(255),
    FOREIGN KEY (orid) REFERENCES location_solution(orid)
);

CREATE TABLE location_restraint (
    location_restraint_id INTEGER PRIMARY KEY,
    orid INTEGER,
    depth_restraint_type VARCHAR(255),
    depth_restraint_km REAL,
    depth_restraint_reason VARCHAR(255),
    epicenter_restraint_type VARCHAR(255),
    latitude_restraint_deg REAL,
    longitude_restraint_deg REAL,
    time_restraint_type VARCHAR(255),
    time_restraint TIMESTAMP,
    restrainer VARCHAR(255),
    lddate TIMESTAMP,
    FOREIGN KEY (orid) REFERENCES location_solution(orid)
);

CREATE TABLE signal_detection_hypothesis (
    arid INTEGER PRIMARY KEY,
    sta_name VARCHAR(255),
    sta_effective_at TIMESTAMP,
    monitoring_organization VARCHAR(255),
    deleted BOOLEAN,
    author VARCHAR(255),
    stage VARCHAR(255),
    iscurrent BOOLEAN,
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    chan VARCHAR(255),
    stassid INTEGER,
    remark_gid VARCHAR(255)
);

CREATE TABLE location_behavior (
    location_behavior_id INTEGER PRIMARY KEY,
    orid INTEGER,
    arid INTEGER,
    fmid INTEGER,
    fpid INTEGER,
    value_type VARCHAR(255),
    defining BOOLEAN,
    requested_defining BOOLEAN,
    residual REAL,
    weight REAL,
    lddate TIMESTAMP,
    FOREIGN KEY (orid) REFERENCES location_solution(orid),
    FOREIGN KEY (arid) REFERENCES signal_detection_hypothesis(arid)
);

CREATE TABLE amplitude (
    ampid INTEGER PRIMARY KEY,
    arid INTEGER,
    amplitude REAL,
    units VARCHAR(255),
    snr REAL,
    lddate TIMESTAMP,
    filterid INTEGER,
    filter_usage VARCHAR(255),
    chan_canonical_name VARCHAR(255),
    chan_effective_at TIMESTAMP,
    measurement_type VARCHAR(255),
    FOREIGN KEY (arid) REFERENCES signal_detection_hypothesis(arid)
);

CREATE TABLE feature_measurement_numeric (
    fmnum_id INTEGER PRIMARY KEY,
    arid INTEGER,
    filterid INTEGER,
    filter_usage VARCHAR(255),
    chan_canonical_name VARCHAR(255),
    chan_effective_at TIMESTAMP,
    measurement_type VARCHAR(255),
    measured_value REAL,
    standard_deviation REAL,
    lddate TIMESTAMP,
    FOREIGN KEY (arid) REFERENCES signal_detection_hypothesis(arid)
);

CREATE TABLE feature_measurement_enumerated (
    fmenum_id INTEGER PRIMARY KEY,
    arid INTEGER,
    filterid INTEGER,
    filter_usage VARCHAR(255),
    chan_canonical_name VARCHAR(255),
    chan_effective_at TIMESTAMP,
    measurement_type VARCHAR(255),
    enumeration VARCHAR(255),
    lddate TIMESTAMP,
    FOREIGN KEY (arid) REFERENCES signal_detection_hypothesis(arid)
);

CREATE TABLE feature_prediction_component (
    fpcid INTEGER PRIMARY KEY,
    phase VARCHAR(255),
    channel_object_id INTEGER,
    method VARCHAR(255),
    scatter REAL,
    lddate TIMESTAMP
);

CREATE TABLE feature_prediction_arrival_time (
    fpatid INTEGER PRIMARY KEY,
    orid INTEGER,
    chan_canonical_name VARCHAR(255),
    chan_effective_at TIMESTAMP,
    measurement_type VARCHAR(255),
    arrival_time TIMESTAMP,
    standard_deviation REAL,
    lddate TIMESTAMP,
    arid INTEGER,
    fpcid INTEGER,
    FOREIGN KEY (orid) REFERENCES location_solution(orid),
    FOREIGN KEY (fpcid) REFERENCES feature_prediction_component(fpcid)
);

CREATE TABLE feature_prediction_numeric (
    fpnid INTEGER PRIMARY KEY,
    orid INTEGER,
    chan_canonical_name VARCHAR(255),
    chan_effective_at TIMESTAMP,
    measurement_type VARCHAR(255),
    value REAL,
    standard_deviation REAL,
    lddate TIMESTAMP,
    fpcid INTEGER,
    FOREIGN KEY (orid) REFERENCES location_solution(orid),
    FOREIGN KEY (fpcid) REFERENCES feature_prediction_component(fpcid)
);

CREATE TABLE channel_segment (
    chanseg_id INTEGER PRIMARY KEY,
    chan_canonical_name VARCHAR(255),
    chan_effective_at TIMESTAMP,
    time_series_type VARCHAR(255),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    creation_time TIMESTAMP,
    lddate TIMESTAMP,
    reference_id INTEGER
);

CREATE TABLE channel_segment_waveform (
    wfid INTEGER PRIMARY KEY,
    chanseg_id INTEGER,
    segment INTEGER,
    samples INTEGER,
    samp_rate_hz INTEGER,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    storage_offset INTEGER,
    storage_length INTEGER,
    sequence_number INTEGER,
    qc_segment_version INTEGER,
    lddate TIMESTAMP,
    FOREIGN KEY (chanseg_id) REFERENCES channel_segment(chanseg_id)
);

CREATE TABLE processing_mask (
    pmid INTEGER PRIMARY KEY,
    processing_operation VARCHAR(255),
    raw_chan_canonical_name VARCHAR(255),
    raw_chan_effective_at TIMESTAMP,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    effective_at TIMESTAMP,
    lddate TIMESTAMP
);

CREATE TABLE channel_segment_proc_mask_xref (
    chanmask_xref_id INTEGER PRIMARY KEY,
    chanseg_id INTEGER,
    pmid INTEGER,
    iscurrent BOOLEAN,
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    FOREIGN KEY (chanseg_id) REFERENCES channel_segment(chanseg_id),
    FOREIGN KEY (pmid) REFERENCES processing_mask(pmid)
);

CREATE TABLE qc_segment_version (
    qcmaskid INTEGER PRIMARY KEY,
    qc_segment_gid INTEGER,
    chan_canonical_name VARCHAR(255),
    chan_effective_at TIMESTAMP,
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    category VARCHAR(255),
    type VARCHAR(255),
    rationale VARCHAR(255),
    rejected BOOLEAN,
    author VARCHAR(255),
    stage VARCHAR(255),
    iscurrent BOOLEAN,
    effective_at TIMESTAMP,
    moddate TIMESTAMP,
    lddate TIMESTAMP
);

CREATE TABLE processing_mask_qc_segment_version (
    pm_qcsv_id INTEGER PRIMARY KEY,
    pmid INTEGER,
    qcmaskid INTEGER,
    lddate TIMESTAMP,
    FOREIGN KEY (pmid) REFERENCES processing_mask(pmid),
    FOREIGN KEY (qcmaskid) REFERENCES qc_segment_version(qcmaskid)
);

CREATE TABLE network_magnitude_solution (
    netmagid INTEGER PRIMARY KEY,
    orid INTEGER,
    remark_gid VARCHAR(255),
    magtype VARCHAR(255),
    magnitude REAL,
    uncertainty REAL,
    status VARCHAR(255),
    author VARCHAR(255),
    stage VARCHAR(255),
    iscurrent BOOLEAN,
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    FOREIGN KEY (orid) REFERENCES location_solution(orid)
);

CREATE TABLE station_magnitude_solution (
    magid INTEGER PRIMARY KEY,
    netmagid INTEGER,
    ampid INTEGER,
    remark_gid VARCHAR(255),
    sta_name VARCHAR(255),
    sta_effective_at TIMESTAMP,
    phase VARCHAR(255),
    delta REAL,
    magtype VARCHAR(255),
    magnitude REAL,
    uncertainty REAL,
    residual REAL,
    weight REAL,
    defining VARCHAR(255),
    requested_defining VARCHAR(255),
    attenuation_model VARCHAR(255),
    model_correction REAL,
    station_correction REAL,
    author VARCHAR(255),
    stage VARCHAR(255),
    iscurrent BOOLEAN,
    moddate TIMESTAMP,
    lddate TIMESTAMP,
    FOREIGN KEY (netmagid) REFERENCES network_magnitude_solution(netmagid),
    FOREIGN KEY (ampid) REFERENCES amplitude(ampid)
);

CREATE TABLE remark (
    remark_id INTEGER PRIMARY KEY,
    remark_gid VARCHAR(255),
    remark TEXT,
    author VARCHAR(255),
    lddate TIMESTAMP
);

CREATE TABLE stage_metrics (
    metric_id INTEGER PRIMARY KEY,
    entity_table VARCHAR(255),
    entity_id INTEGER,
    state VARCHAR(255),
    state_reason VARCHAR(255),
    status VARCHAR(255),
    start_time TIMESTAMP,
    end_time TIMESTAMP,
    processing_start_time TIMESTAMP,
    processing_end_time TIMESTAMP,
    arid INTEGER,
    orid INTEGER,
    evid INTEGER,
    ampid INTEGER,
    magid INTEGER,
    lddate TIMESTAMP
);