-- Add Primary Keys and Foreign Key Relationships for Legacy Schema
-- Based on Legacy_schema.mmd relationships

\c legacy_schema;

-- Add Primary Keys
ALTER TABLE active_id ADD PRIMARY KEY (tagid);
ALTER TABLE amplitude ADD PRIMARY KEY (ampid);
ALTER TABLE arrival ADD PRIMARY KEY (arid);
ALTER TABLE event ADD PRIMARY KEY (evid);
ALTER TABLE origin ADD PRIMARY KEY (orid);
ALTER TABLE netmag ADD PRIMARY KEY (magid);
ALTER TABLE remark ADD PRIMARY KEY (commid);

-- Add Foreign Key Relationships
-- EVENT -> ORIGIN (event.prefor -> origin.orid)
ALTER TABLE event ADD CONSTRAINT fk_event_prefor 
    FOREIGN KEY (prefor) REFERENCES origin(orid);

-- ORIGIN -> EVENT (origin.evid -> event.evid)
ALTER TABLE origin ADD CONSTRAINT fk_origin_evid 
    FOREIGN KEY (evid) REFERENCES event(evid);

-- ARRIVAL -> EVENT via ASSOC (assoc.arid -> arrival.arid, assoc.orid -> origin.orid)
ALTER TABLE assoc ADD CONSTRAINT fk_assoc_arid 
    FOREIGN KEY (arid) REFERENCES arrival(arid);
ALTER TABLE assoc ADD CONSTRAINT fk_assoc_orid 
    FOREIGN KEY (orid) REFERENCES origin(orid);

-- AMPLITUDE -> ARRIVAL (amplitude.arid -> arrival.arid)
ALTER TABLE amplitude ADD CONSTRAINT fk_amplitude_arid 
    FOREIGN KEY (arid) REFERENCES arrival(arid);

-- NETMAG -> ORIGIN (netmag.orid -> origin.orid)
ALTER TABLE netmag ADD CONSTRAINT fk_netmag_orid 
    FOREIGN KEY (orid) REFERENCES origin(orid);

-- ORIGERR -> ORIGIN (origerr.orid -> origin.orid)
ALTER TABLE origerr ADD CONSTRAINT fk_origerr_orid 
    FOREIGN KEY (orid) REFERENCES origin(orid);

-- WFTAG -> ACTIVE_ID (wftag.tagid -> active_id.tagid)
ALTER TABLE wftag ADD CONSTRAINT fk_wftag_tagid 
    FOREIGN KEY (tagid) REFERENCES active_id(tagid);

-- REMARK relationships (commid references)
ALTER TABLE event ADD CONSTRAINT fk_event_commid 
    FOREIGN KEY (commid) REFERENCES remark(commid);
ALTER TABLE arrival ADD CONSTRAINT fk_arrival_commid 
    FOREIGN KEY (commid) REFERENCES remark(commid);
ALTER TABLE assoc ADD CONSTRAINT fk_assoc_commid 
    FOREIGN KEY (commid) REFERENCES remark(commid);

-- AR_INFO -> ORIGIN and ARRIVAL
ALTER TABLE ar_info ADD CONSTRAINT fk_ar_info_orid 
    FOREIGN KEY (orid) REFERENCES origin(orid);
ALTER TABLE ar_info ADD CONSTRAINT fk_ar_info_arid 
    FOREIGN KEY (arid) REFERENCES arrival(arid);

-- STAMAG -> ORIGIN and AMPLITUDE
ALTER TABLE stamag ADD CONSTRAINT fk_stamag_orid 
    FOREIGN KEY (orid) REFERENCES origin(orid);
ALTER TABLE stamag ADD CONSTRAINT fk_stamag_ampid 
    FOREIGN KEY (ampid) REFERENCES amplitude(ampid);

-- Dynamic parameter tables
ALTER TABLE amplitude_dyn_pars_int ADD CONSTRAINT fk_amp_dyn_pars_ampid 
    FOREIGN KEY (ampid) REFERENCES amplitude(ampid);
ALTER TABLE arrival_dyn_pars_int ADD CONSTRAINT fk_arr_dyn_pars_arid 
    FOREIGN KEY (arid) REFERENCES arrival(arid);

-- EVENT_CONTROL relationships
ALTER TABLE event_control ADD CONSTRAINT fk_event_control_orid 
    FOREIGN KEY (orid) REFERENCES origin(orid);
ALTER TABLE event_control ADD CONSTRAINT fk_event_control_evid 
    FOREIGN KEY (evid) REFERENCES event(evid);

-- EVENT_CORRELATION relationships  
ALTER TABLE event_correlation ADD CONSTRAINT fk_event_corr_source_evid 
    FOREIGN KEY (source_evid) REFERENCES event(evid);
ALTER TABLE event_correlation ADD CONSTRAINT fk_event_corr_source_orid 
    FOREIGN KEY (source_orid) REFERENCES origin(orid);
ALTER TABLE event_correlation ADD CONSTRAINT fk_event_corr_reference_evid 
    FOREIGN KEY (reference_evid) REFERENCES event(evid);
ALTER TABLE event_correlation ADD CONSTRAINT fk_event_corr_reference_orid 
    FOREIGN KEY (reference_orid) REFERENCES origin(orid);

COMMIT;