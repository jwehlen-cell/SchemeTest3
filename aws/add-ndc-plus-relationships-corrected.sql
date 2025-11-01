-- Add corrected Foreign Key Relationships for NDC PLUS Schema
-- Based on actual table structures

\c ndc_plus_schema;

-- Core relationships that should work
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

-- EVENT_CORRELATION_CHANNEL_SEGMENT -> CHANNEL_SEGMENT (using channel_segment_gid)
ALTER TABLE event_correlation_channel_segment ADD CONSTRAINT fk_event_correlation_channel_segment_segment 
    FOREIGN KEY (channel_segment_gid) REFERENCES channel_segment(uuid);

-- EVENT_HYPOTHESIS_TAG -> EVENT_HYPOTHESIS
ALTER TABLE event_hypothesis_tag ADD CONSTRAINT fk_event_hypothesis_tag_event_hypothesis 
    FOREIGN KEY (event_hypothesis_uuid) REFERENCES event_hypothesis(uuid);

COMMIT;