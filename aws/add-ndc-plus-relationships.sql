-- Add Primary Keys and Foreign Key Relationships for NDC PLUS Schema
-- Based on NDC_PLUS_schema.mmd relationships

\c ndc_plus_schema;

-- Add Primary Keys (UUID columns)
ALTER TABLE channel_segment ADD PRIMARY KEY (uuid);
ALTER TABLE channel_segment_creation ADD PRIMARY KEY (uuid);
ALTER TABLE channel_segment_proc_mask_xref ADD PRIMARY KEY (uuid);
ALTER TABLE channel_segment_waveform ADD PRIMARY KEY (uuid);
ALTER TABLE event ADD PRIMARY KEY (uuid);
ALTER TABLE event_correlation ADD PRIMARY KEY (uuid);
ALTER TABLE event_correlation_channel_segment ADD PRIMARY KEY (uuid);
ALTER TABLE event_hypothesis ADD PRIMARY KEY (uuid);
ALTER TABLE event_hypothesis_tag ADD PRIMARY KEY (uuid);
ALTER TABLE feature_measurement_arrival_time ADD PRIMARY KEY (uuid);
ALTER TABLE feature_measurement_amplitude ADD PRIMARY KEY (uuid);
ALTER TABLE feature_measurement_enumerated ADD PRIMARY KEY (uuid);
ALTER TABLE feature_measurement_first_motion ADD PRIMARY KEY (uuid);
ALTER TABLE location_solution ADD PRIMARY KEY (uuid);
ALTER TABLE location_uncertainty ADD PRIMARY KEY (uuid);
ALTER TABLE network_magnitude_solution ADD PRIMARY KEY (uuid);
ALTER TABLE processing_mask ADD PRIMARY KEY (uuid);
ALTER TABLE qc_mask ADD PRIMARY KEY (uuid);
ALTER TABLE qc_mask_information ADD PRIMARY KEY (uuid);
ALTER TABLE qc_mask_type ADD PRIMARY KEY (uuid);
ALTER TABLE qc_mask_version ADD PRIMARY KEY (uuid);
ALTER TABLE remark ADD PRIMARY KEY (uuid);
ALTER TABLE signal_detection_hypothesis ADD PRIMARY KEY (uuid);
ALTER TABLE stage_metrics ADD PRIMARY KEY (uuid);
ALTER TABLE stage_metrics_qc_mask_version ADD PRIMARY KEY (uuid);
ALTER TABLE waveform_qc ADD PRIMARY KEY (uuid);

-- Add Foreign Key Relationships

-- EVENT_HYPOTHESIS -> EVENT
ALTER TABLE event_hypothesis ADD CONSTRAINT fk_event_hypothesis_event 
    FOREIGN KEY (event_uuid) REFERENCES event(uuid);

-- LOCATION_SOLUTION -> EVENT_HYPOTHESIS
ALTER TABLE location_solution ADD CONSTRAINT fk_location_solution_event_hypothesis 
    FOREIGN KEY (event_hypothesis_uuid) REFERENCES event_hypothesis(uuid);

-- EVENT_HYPOTHESIS -> LOCATION_SOLUTION (preferred location)
ALTER TABLE event_hypothesis ADD CONSTRAINT fk_event_hypothesis_preferred_location 
    FOREIGN KEY (preferred_location_solution_uuid) REFERENCES location_solution(uuid);

-- LOCATION_UNCERTAINTY -> LOCATION_SOLUTION
ALTER TABLE location_uncertainty ADD CONSTRAINT fk_location_uncertainty_location_solution 
    FOREIGN KEY (location_solution_uuid) REFERENCES location_solution(uuid);

-- SIGNAL_DETECTION_HYPOTHESIS -> EVENT_HYPOTHESIS
ALTER TABLE signal_detection_hypothesis ADD CONSTRAINT fk_signal_detection_event_hypothesis 
    FOREIGN KEY (event_hypothesis_uuid) REFERENCES event_hypothesis(uuid);

-- FEATURE_MEASUREMENT_ARRIVAL_TIME -> SIGNAL_DETECTION_HYPOTHESIS
ALTER TABLE feature_measurement_arrival_time ADD CONSTRAINT fk_fm_arrival_time_signal_detection 
    FOREIGN KEY (sig_det_hypo_gid) REFERENCES signal_detection_hypothesis(uuid);

-- FEATURE_MEASUREMENT_AMPLITUDE -> SIGNAL_DETECTION_HYPOTHESIS
ALTER TABLE feature_measurement_amplitude ADD CONSTRAINT fk_fm_amplitude_signal_detection 
    FOREIGN KEY (sig_det_hypo_gid) REFERENCES signal_detection_hypothesis(uuid);

-- FEATURE_MEASUREMENT_ENUMERATED -> SIGNAL_DETECTION_HYPOTHESIS
ALTER TABLE feature_measurement_enumerated ADD CONSTRAINT fk_fm_enumerated_signal_detection 
    FOREIGN KEY (sig_det_hypo_gid) REFERENCES signal_detection_hypothesis(uuid);

-- FEATURE_MEASUREMENT_FIRST_MOTION -> SIGNAL_DETECTION_HYPOTHESIS
ALTER TABLE feature_measurement_first_motion ADD CONSTRAINT fk_fm_first_motion_signal_detection 
    FOREIGN KEY (sig_det_hypo_gid) REFERENCES signal_detection_hypothesis(uuid);

-- NETWORK_MAGNITUDE_SOLUTION -> EVENT_HYPOTHESIS
ALTER TABLE network_magnitude_solution ADD CONSTRAINT fk_network_magnitude_event_hypothesis 
    FOREIGN KEY (event_hypothesis_uuid) REFERENCES event_hypothesis(uuid);

-- CHANNEL_SEGMENT -> CHANNEL_SEGMENT_CREATION
ALTER TABLE channel_segment ADD CONSTRAINT fk_channel_segment_creation 
    FOREIGN KEY (channel_segment_creation_uuid) REFERENCES channel_segment_creation(uuid);

-- CHANNEL_SEGMENT_WAVEFORM -> CHANNEL_SEGMENT
ALTER TABLE channel_segment_waveform ADD CONSTRAINT fk_channel_segment_waveform_segment 
    FOREIGN KEY (channel_segment_uuid) REFERENCES channel_segment(uuid);

-- CHANNEL_SEGMENT_PROC_MASK_XREF -> CHANNEL_SEGMENT
ALTER TABLE channel_segment_proc_mask_xref ADD CONSTRAINT fk_channel_segment_proc_mask_segment 
    FOREIGN KEY (channel_segment_uuid) REFERENCES channel_segment(uuid);

-- CHANNEL_SEGMENT_PROC_MASK_XREF -> PROCESSING_MASK
ALTER TABLE channel_segment_proc_mask_xref ADD CONSTRAINT fk_channel_segment_proc_mask_processing 
    FOREIGN KEY (processing_mask_uuid) REFERENCES processing_mask(uuid);

-- EVENT_CORRELATION -> EVENT_HYPOTHESIS (source and similar)
ALTER TABLE event_correlation ADD CONSTRAINT fk_event_correlation_source 
    FOREIGN KEY (source_event_hypothesis_uuid) REFERENCES event_hypothesis(uuid);
ALTER TABLE event_correlation ADD CONSTRAINT fk_event_correlation_similar 
    FOREIGN KEY (similar_event_hypothesis_uuid) REFERENCES event_hypothesis(uuid);

-- EVENT_CORRELATION_CHANNEL_SEGMENT -> EVENT_CORRELATION
ALTER TABLE event_correlation_channel_segment ADD CONSTRAINT fk_event_correlation_channel_segment_correlation 
    FOREIGN KEY (event_correlation_uuid) REFERENCES event_correlation(uuid);

-- EVENT_CORRELATION_CHANNEL_SEGMENT -> CHANNEL_SEGMENT
ALTER TABLE event_correlation_channel_segment ADD CONSTRAINT fk_event_correlation_channel_segment_segment 
    FOREIGN KEY (channel_segment_uuid) REFERENCES channel_segment(uuid);

-- EVENT_HYPOTHESIS_TAG -> EVENT_HYPOTHESIS
ALTER TABLE event_hypothesis_tag ADD CONSTRAINT fk_event_hypothesis_tag_event_hypothesis 
    FOREIGN KEY (event_hypothesis_uuid) REFERENCES event_hypothesis(uuid);

-- QC_MASK -> QC_MASK_VERSION
ALTER TABLE qc_mask ADD CONSTRAINT fk_qc_mask_version 
    FOREIGN KEY (qc_mask_version_uuid) REFERENCES qc_mask_version(uuid);

-- QC_MASK_INFORMATION -> QC_MASK
ALTER TABLE qc_mask_information ADD CONSTRAINT fk_qc_mask_information_qc_mask 
    FOREIGN KEY (qc_mask_uuid) REFERENCES qc_mask(uuid);

-- QC_MASK_VERSION -> QC_MASK_TYPE
ALTER TABLE qc_mask_version ADD CONSTRAINT fk_qc_mask_version_type 
    FOREIGN KEY (qc_mask_type) REFERENCES qc_mask_type(uuid);

-- STAGE_METRICS_QC_MASK_VERSION -> STAGE_METRICS
ALTER TABLE stage_metrics_qc_mask_version ADD CONSTRAINT fk_stage_metrics_qc_mask_version_stage_metrics 
    FOREIGN KEY (stage_metrics_uuid) REFERENCES stage_metrics(uuid);

-- STAGE_METRICS_QC_MASK_VERSION -> QC_MASK_VERSION
ALTER TABLE stage_metrics_qc_mask_version ADD CONSTRAINT fk_stage_metrics_qc_mask_version_qc_mask_version 
    FOREIGN KEY (qc_mask_version_uuid) REFERENCES qc_mask_version(uuid);

-- WAVEFORM_QC -> CHANNEL_SEGMENT_WAVEFORM
ALTER TABLE waveform_qc ADD CONSTRAINT fk_waveform_qc_channel_segment_waveform 
    FOREIGN KEY (channel_segment_waveform_uuid) REFERENCES channel_segment_waveform(uuid);

COMMIT;