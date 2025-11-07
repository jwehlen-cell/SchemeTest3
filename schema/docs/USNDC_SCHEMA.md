# USNDC Database Schema Documentation
## Overview
This documentation covers the United States National Data Center (USNDC) database schema for seismic event monitoring, waveform analysis, and location determination. The schema contains 177 tables with comprehensive coverage of seismic data processing, event detection, and quality control.

## Schema Statistics
- **Total Tables**: 177
- **Total Relationships**: 9502
- **Total Columns**: 1876
- **Database Type**: Oracle

## Entity Relationship Diagram
```mermaid
erDiagram

    ACTIVE_ID {
        NUMBER(18) TAGID
        string ... "+5 more"
    }

    AFFILIATION {
        VARCHAR2(8) NET
        VARCHAR2(6) STA
        string ... "+3 more"
    }

    ALGORITHM {
        NUMBER(18) ALGORITHM_ID
        string ... "+7 more"
    }

    ALPHASITE {
        VARCHAR2(6) STA
        NUMBER(18) PREFDLID
        NUMBER(18) DLID
        NUMBER(18) COMMID
        string ... "+5 more"
    }

    AMP3C {
        NUMBER(18) ARID
        VARCHAR2(8) RID
        string ... "+7 more"
    }

    AMPDESCRIPT {
        string ... "+8 more"
    }

    AMPLITUDE {
        NUMBER(18) AMPID
        NUMBER(18) ARID
        NUMBER(18) PARID
        VARCHAR2(8) CHAN
        string ... "+13 more"
    }

    AMPLITUDE_DYN_PARS_DBL {
        NUMBER(18) AMPID
        string ... "+4 more"
    }

    AMPLITUDE_DYN_PARS_INT {
        NUMBER(18) AMPID
        string ... "+4 more"
    }

    AMPLITUDE_DYN_PARS_STR {
        NUMBER(18) AMPID
        string ... "+4 more"
    }

    AOI {
        string ... "+10 more"
    }

    APMA {
        NUMBER(18) ARID
        NUMBER(18) APMARID
        NUMBER(18) COMMID
        string ... "+21 more"
    }

    ARRIVAL {
        VARCHAR2(6) STA
        NUMBER(18) ARID
        NUMBER(18) STASSID
        NUMBER(18) CHANID
        VARCHAR2(8) CHAN
        string ... "+20 more"
    }

    ARRIVAL_DYN_PARS_DBL {
        NUMBER(18) ARID
        string ... "+4 more"
    }

    ARRIVAL_DYN_PARS_INT {
        NUMBER(18) ARID
        string ... "+4 more"
    }

    ARRIVAL_DYN_PARS_STR {
        NUMBER(18) ARID
        string ... "+4 more"
    }

    ARRIVAL_TAG {
        NUMBER(18) ARID
        string ... "+3 more"
    }

    AR_INFO {
        NUMBER(18) ORID
        NUMBER(18) ARID
        string ... "+27 more"
    }

    ASSOC {
        NUMBER(18) ARID
        NUMBER(18) ORID
        VARCHAR2(6) STA
        NUMBER(18) COMMID
        string ... "+15 more"
    }

    ASSOC_GA {
        NUMBER(18) ARID
        NUMBER(18) ORID
        VARCHAR2(6) STA
        NUMBER(18) COMMID
        string ... "+15 more"
    }

    ASSOC_GA_DEL {
        NUMBER(18) ARID
        NUMBER(18) ORID
        VARCHAR2(6) STA
        NUMBER(18) COMMID
        string ... "+15 more"
    }

    BEAM {
        NUMBER(18) WFID
        NUMBER(18) FILTERID
        string ... "+4 more"
    }

    BULLETIN_RELEASE {
        NUMBER(18) ERPID
        NUMBER(18) ORID
        NUMBER(18) EVID
        NUMBER(18) MAGID
        string ... "+8 more"
    }

    BULLETIN_RELEASE_EXPORT {
        NUMBER(18) MAX_ERPID
        string ... "+4 more"
    }

    BUTTERWORTH_FILTER {
        NUMBER(18) FILTERID
        string ... "+7 more"
    }

    CHANNAME {
        NUMBER(18) INTERN_CHANID
        NUMBER(18) COMMID
        string ... "+6 more"
    }

    CHAN_GROUPS {
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        string ... "+7 more"
    }

    CLASSIFICATION {
        NUMBER(18) CLASSIFICATION_ID
        NUMBER(18) CLASS_LEVEL_ID
        NUMBER(18) CLASS_DISSEM_ID
        NUMBER(18) CLASS_DERIVED_ID
        NUMBER(18) CLASS_DECLASS_ID
        string ... "+6 more"
    }

    CLASSIFICATION_LEVEL {
        NUMBER(18) CLASS_LEVEL_ID
        string ... "+4 more"
    }

    CLASSIFICATION_LOOKUP {
        NUMBER(18) CLASS_LOOKUP_ID
        NUMBER(18) CLASSIFICATION_ID
        string ... "+6 more"
    }

    CLASSIFICATION_OPR {
        NUMBER(18) CLASS_OPR_ID
        string ... "+3 more"
    }

    CLASSIFICATION_REFER_TO {
        NUMBER(18) CLASS_REFER_ID
        string ... "+3 more"
    }

    CLASS_DECLASS_ID {
        NUMBER(18) CLASS_DECLASS_ID
        string ... "+3 more"
    }

    CLASS_DERIVED_ID {
        NUMBER(18) CLASS_DERIVED_ID
        string ... "+3 more"
    }

    CLASS_DISSEM_ID {
        NUMBER(18) CLASS_DISSEM_ID
        string ... "+4 more"
    }

    CLUSTER_INFO {
        NUMBER(18) CLUID
        string ... "+4 more"
    }

    CLUSTER_MAGREF {
        NUMBER(18) CLUSTAID
        NUMBER(18) ORID
        NUMBER(18) FILTERID
        string ... "+8 more"
    }

    CLUSTER_MEC {
        NUMBER(18) CLUSTAID
        VARCHAR2(6) STA
        string ... "+8 more"
    }

    CLUSTER_ORID {
        NUMBER(18) CLUSTAID
        NUMBER(18) ORID
        string ... "+2 more"
    }

    CLUSTER_OVERRIDE {
        NUMBER(18) CLUSTAID
        VARCHAR2(32) PHASE_SPECIFIC_OVERRIDE_REC
        string ... "+18 more"
    }

    CLUSTER_PHASE_OVERRIDE {
        NUMBER(18) CLUSTAID
        VARCHAR2(32) PHASE_SPECIFIC_OVERRIDE_REC
        string ... "+9 more"
    }

    CLUSTER_STATION {
        NUMBER(18) CLUSTAID
        NUMBER(18) CLUID
        VARCHAR2(6) STA
        string ... "+11 more"
    }

    CLUSTER_THRESHOLD {
        NUMBER(18) CLUSTAID
        NUMBER(18) ORID
        string ... "+9 more"
    }

    CODAMAG_INPUT {
        NUMBER(18) AMPID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) ORID
        NUMBER(18) ARID
        string ... "+33 more"
    }

    CODAMAG_OUTPUT {
        NUMBER(18) AMPID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) ORID
        NUMBER(18) ARID
        string ... "+12 more"
    }

    CONTINUOUS_DATA_STATUS {
        NUMBER(18) STATUS_ID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        string ... "+6 more"
    }

    DATAUSER {
        NUMBER(18) USERID
        NUMBER(18) POCID
        NUMBER(18) COMMID
        string ... "+8 more"
    }

    DA_INTERVAL {
        NUMBER(18) INTVLID
        string ... "+11 more"
    }

    DA_REFSTA_LATENCY {
        NUMBER(18) LATENCY_ID
        VARCHAR2(6) STA
        string ... "+8 more"
    }

    DA_REFSTA_SUMMARY {
        NUMBER(18) SUMMARY_ID
        VARCHAR2(6) STA
        string ... "+6 more"
    }

    DA_SITECHAN_LATENCY {
        NUMBER(18) LATENCY_ID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        string ... "+8 more"
    }

    DECONVOLUTION {
        NUMBER(18) DECONID
        string ... "+9 more"
    }

    DEFINING_OBSTYPES {
        NUMBER(18) OBSTYPE_ID
        string ... "+6 more"
    }

    DEFINING_RULES {
        NUMBER(18) RULE_ID
        VARCHAR2(8) NET
        NUMBER(18) OBSTYPE_ID
        NUMBER(18) VALUE_ID
        string ... "+10 more"
    }

    DEFINING_VALUES {
        NUMBER(18) VALUE_ID
        string ... "+5 more"
    }

    DETECTION {
        NUMBER(18) ARID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) SPROID
        NUMBER(18) COMMID
        string ... "+15 more"
    }

    DETECTION_THRESHOLD {
        NUMBER(18) CLUSTAID
        NUMBER(18) ORID
        VARCHAR2(6) STA
        string ... "+15 more"
    }

    DISCRIMUSE {
        NUMBER(18) ORID
        VARCHAR2(6) STA
        NUMBER(18) COMMID
        string ... "+3 more"
    }

    DISCRIMVOTE {
        NUMBER(18) ORID
        VARCHAR2(6) STA
        NUMBER(18) COMMID
        NUMBER(8) OVERRIDE
        string ... "+4 more"
    }

    DISCRIM_PARAM {
        NUMBER(18) POLYID
        NUMBER(18) AMPCOR_VERID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) PARAMSETID
        string ... "+19 more"
    }

    DLMAN {
        NUMBER(18) DLID
        NUMBER(18) COMMID
        string ... "+7 more"
    }

    DOPPLER_DETECTION {
        NUMBER(18) DOPPLERID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        string ... "+20 more"
    }

    ECM_CHAN_AMPLITUDE {
        NUMBER(18) ORID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) AMPCOR_VERID
        string ... "+16 more"
    }

    ECM_CONSTANT {
        string ... "+3 more"
    }

    ECM_COV {
        NUMBER(18) POLYID
        NUMBER(18) COV_VERID
        string ... "+8 more"
    }

    ECM_DISCRIMINANTS {
        NUMBER(18) ORID
        NUMBER(18) COV_VERID
        string ... "+6 more"
    }

    ECM_EVENT_RESULTS {
        NUMBER(18) ORID
        NUMBER(18) EVID
        NUMBER(18) COV_VERID
        NUMBER(18) RDA_VERID
        string ... "+5 more"
    }

    ECM_REF_CHAN_AMPLITUDE {
        NUMBER(18) EVID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) AMPCOR_VERID
        NUMBER(18) POLYID
        string ... "+17 more"
    }

    ECM_REF_DISCRIM {
        NUMBER(18) EVID
        NUMBER(18) COV_VERID
        string ... "+4 more"
    }

    ECM_REF_EVENT {
        NUMBER(18) EVID
        NUMBER(18) POLYID
        string ... "+11 more"
    }

    ECM_REGION_PREF_VERSION {
        NUMBER(18) POLYID
        NUMBER(18) COV_VERID
        NUMBER(18) RDA_VERID
        string ... "+3 more"
    }

    ECM_SOURCES {
        NUMBER(18) ORID
        NUMBER(18) COV_VERID
        NUMBER(18) RDA_VERID
        string ... "+5 more"
    }

    ECM_STA_PREF_VERSION {
        NUMBER(18) POLYID
        VARCHAR2(6) STA
        NUMBER(18) AMPCOR_VERID
        string ... "+3 more"
    }

    ENVELOPE_CONTRIBUTION {
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) ORID
        NUMBER(18) ARID
        string ... "+5 more"
    }

    EVENT {
        NUMBER(18) EVID
        NUMBER(18) COMMID
        string ... "+4 more"
    }

    EVENT_CONTROL {
        NUMBER(18) ORID
        NUMBER(18) EVID
        string ... "+24 more"
    }

    EVENT_CORRELATION {
        NUMBER(18) CORR_ID
        NUMBER(18) SOURCE_ORID
        NUMBER(18) SOURCE_EVID
        NUMBER(18) REFERENCE_ORID
        NUMBER(18) REFERENCE_EVID
        string ... "+13 more"
    }

    EVENT_QUALITY {
        NUMBER(18) EQID
        NUMBER(18) ORID
        string ... "+13 more"
    }

    FEEDBACK {
        NUMBER(18) FEEDBACK_ID
        NUMBER(18) EVID
        NUMBER(18) ORID
        string ... "+10 more"
    }

    FEEDBACK_CATAFFILIATION {
        NUMBER(18) FBAFFILIATION_ID
        NUMBER(18) FEEDBACK_ID
        NUMBER(18) FBCATEGORY_ID
        string ... "+3 more"
    }

    FEEDBACK_CATEGORIES {
        NUMBER(18) FBCATEGORY_ID
        string ... "+5 more"
    }

    FEEDBACK_SCREENSHOTS {
        NUMBER(18) FBSCREENSHOT_ID
        NUMBER(18) FEEDBACK_ID
        string ... "+6 more"
    }

    FEEDBACK_STATE {
        NUMBER(18) FBSTATE_ID
        NUMBER(18) FEEDBACK_ID
        NUMBER(18) FBSTATECATEGORY_ID
        string ... "+3 more"
    }

    FEEDBACK_STATE_CATEGORIES {
        NUMBER(18) FBSTATECATEGORY_ID
        string ... "+5 more"
    }

    FILTER {
        NUMBER(18) FILTERID
        string ... "+4 more"
    }

    FILTER_COEFFICIENTS {
        NUMBER(18) FILTERID
        string ... "+4 more"
    }

    FILTER_GROUP {
        NUMBER(18) PARENT_FILTERID
        NUMBER(18) CHILD_FILTERID
        string ... "+2 more"
    }

    FILTER_VALUES_DOUBLE {
        NUMBER(18) FILTERID
        string ... "+3 more"
    }

    FILTER_VALUES_INTEGER {
        NUMBER(18) FILTERID
        string ... "+3 more"
    }

    FILTER_VALUES_STRING {
        NUMBER(18) FILTERID
        string ... "+3 more"
    }

    FK_PROCESSING {
        NUMBER(18) ARID
        NUMBER(18) PROCID
        string ... "+6 more"
    }

    FTPFAILED {
        NUMBER(18) MSGID
        string ... "+5 more"
    }

    FTPLOGIN {
        string ... "+4 more"
    }

    GA_TAG {
        NUMBER(18) ID
        NUMBER(18) EVID_REJECT
        string ... "+7 more"
    }

    GREGION {
        string ... "+3 more"
    }

    HISTORIC_INFO_CYLINDER {
        NUMBER(18) HISTORIC_INFO_CYLINDER_ID
        string ... "+9 more"
    }

    HISTORIC_INFO_SHELL {
        NUMBER(18) HISTORIC_INFO_SHELL_ID
        NUMBER(18) ALGORITHM_ID
        string ... "+21 more"
    }

    HISTORIC_INFO_STA_PHASE {
        NUMBER(18) HISTORIC_INFO_STA_PHASE_ID
        NUMBER(18) HISTORIC_INFO_CYLINDER_ID
        NUMBER(18) ALGORITHM_ID
        string ... "+12 more"
    }

    HYDRO_ARRIVAL {
        NUMBER(18) ARID
        VARCHAR2(6) STA
        NUMBER(18) COMMID
        string ... "+17 more"
    }

    HYDRO_ARR_GROUP {
        NUMBER(18) HYDRO_ID
        VARCHAR2(8) NET
        string ... "+7 more"
    }

    HYDRO_ASSOC {
        NUMBER(18) ARID
        NUMBER(18) HYDRO_ID
        string ... "+2 more"
    }

    HYDRO_ORIGIN {
        NUMBER(18) ORID
        NUMBER(18) SERID
        NUMBER(18) COMMID
        string ... "+6 more"
    }

    INSTRUMENT {
        NUMBER(18) INID
        string ... "+11 more"
    }

    INTERVAL {
        NUMBER(18) INTVLID
        NUMBER(18) COMMID
        string ... "+11 more"
    }

    MDAC_FD {
        NUMBER(18) FDID
        NUMBER(18) AMPCOR_VERID
        NUMBER(18) CORRID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        string ... "+7 more"
    }

    MDAC_FI {
        NUMBER(18) CORRID
        NUMBER(18) AMPCOR_VERID
        NUMBER(18) POLYID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        string ... "+30 more"
    }

    MSGAUX {
        NUMBER(18) MSGID
        string ... "+5 more"
    }

    MSGDATATYPE {
        NUMBER(18) MSGID
        string ... "+6 more"
    }

    MSGDEST {
        NUMBER(18) MSGDID
        NUMBER(18) MSGID
        string ... "+6 more"
    }

    MSGDISC {
        NUMBER(18) MSGID
        NUMBER(18) USERID
        VARCHAR2(20) EXTMSGID
        NUMBER(18) INTID
        VARCHAR2(16) INTIDTYPE
        string ... "+19 more"
    }

    MSVMAX_DESCRIPT {
        NUMBER(18) AMPID
        VARCHAR2(6) STA
        NUMBER(18) ORID
        NUMBER(18) ARID
        string ... "+3 more"
    }

    MSVMAX_RESULTS {
        NUMBER(18) AMPID
        string ... "+11 more"
    }

    NETMAG {
        NUMBER(18) MAGID
        VARCHAR2(8) NET
        NUMBER(18) ORID
        NUMBER(18) EVID
        NUMBER(18) COMMID
        string ... "+6 more"
    }

    NETWORK {
        NUMBER(18) NETWORKID
        VARCHAR2(8) NET
        string ... "+8 more"
    }

    NETYIELD {
        NUMBER(18) YIELDID
        VARCHAR2(8) NET
        NUMBER(18) ORID
        NUMBER(18) EVID
        NUMBER(18) COMMID
        string ... "+6 more"
    }

    NET_CODA_SPECTRUM {
        NUMBER(18) MAGID
        string ... "+4 more"
    }

    OMITTED_CHANNELS {
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) COMMID
        string ... "+4 more"
    }

    ORIGERR {
        NUMBER(18) ORID
        NUMBER(18) COMMID
        string ... "+18 more"
    }

    ORIGERR_GA {
        NUMBER(18) ORID
        NUMBER(18) COMMID
        string ... "+18 more"
    }

    ORIGERR_GA_DEL {
        NUMBER(18) ORID
        NUMBER(18) COMMID
        string ... "+18 more"
    }

    ORIGIN {
        NUMBER(18) ORID
        NUMBER(18) EVID
        NUMBER(18) MBID
        NUMBER(18) MSID
        NUMBER(18) MLID
        string ... "+19 more"
    }

    ORIGIN_GA {
        NUMBER(18) ORID
        NUMBER(18) EVID
        NUMBER(18) MBID
        NUMBER(18) MSID
        NUMBER(18) MLID
        string ... "+19 more"
    }

    ORIGIN_GA_DEL {
        NUMBER(18) ORID
        NUMBER(18) EVID
        NUMBER(18) MBID
        NUMBER(18) MSID
        NUMBER(18) MLID
        string ... "+19 more"
    }

    ORIGIN_MEA_TRACE {
        NUMBER(18) ORID
        NUMBER(18) CLUSTAID
        NUMBER(18) BEST_REF_MATCH_ORID
        string ... "+3 more"
    }

    ORIGIN_SDO {
        NUMBER(18) ORID
    }

    ORIGIN_TAG {
        NUMBER(18) ORID
        string ... "+4 more"
    }

    OUTAGE_STATION_DATA {
        NUMBER(18) OUTAGE_ID
        VARCHAR2(6) STA
        string ... "+5 more"
    }

    OUTAGE_STATION_RECEIVE {
        NUMBER(18) OUTAGE_ID
        VARCHAR2(6) STA
        string ... "+6 more"
    }

    POLYGON {
        NUMBER(18) POLYID
        VARCHAR2(1) INSIDEFLAG
        VARCHAR2(1) OUTSIDEFLAG
        string ... "+6 more"
    }

    POLYPOINT {
        NUMBER(18) POLYID
        string ... "+4 more"
    }

    PROCESSING_RECIPE {
        NUMBER(18) PROCID
        VARCHAR2(15) IDNAME
        NUMBER(18) IDVALUE
        string ... "+4 more"
    }

    PROCESS_TRACKING {
        NUMBER(18) TRACKINGID
        string ... "+10 more"
    }

    QCMASKDEF {
        NUMBER(18) QCDEFID
        string ... "+22 more"
    }

    QCMASKINFO {
        NUMBER(18) QCMASKID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) QCDEFID
        string ... "+6 more"
    }

    QCMASKSEG {
        NUMBER(18) QCMASKID
        string ... "+5 more"
    }

    QSHELL_INTERVAL {
        NUMBER(18) QSHELL_INTVLID
        NUMBER(18) INTVLID
        string ... "+8 more"
    }

    RDA_PARAM {
        NUMBER(18) POLYID
        NUMBER(18) RDA_VERID
        string ... "+6 more"
    }

    REG_RATIO_DISCRIM {
        NUMBER(18) POLYID
        NUMBER(18) COV_VERID
        string ... "+12 more"
    }

    REMAP {
        VARCHAR2(12) ID_NAME
        NUMBER(18) ORIGINAL_ID
        NUMBER(18) CURRENT_ID
        string ... "+2 more"
    }

    REMARK {
        NUMBER(18) COMMID
        string ... "+3 more"
    }

    REMOVED_BEAM_DFILE {
        string ... "+2 more"
    }

    REQUEST {
        NUMBER(18) REQID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) ORID
        NUMBER(18) EVID
        string ... "+11 more"
    }

    SADO_EMAIL_HISTORY {
        NUMBER(18) SADO_EMAIL_ID
        NUMBER(18) REPORT_ID
        string ... "+5 more"
    }

    SADO_PDF_REPORTS {
        NUMBER(18) SADO_PDF_REPORT_ID
        NUMBER(18) REPORT_ID
        string ... "+3 more"
    }

    SADO_REPORT {
        NUMBER(18) REPORT_ID
        NUMBER(18) EVID
        NUMBER(18) ORID
        string ... "+22 more"
    }

    SADO_REPORT_LANDMARKS {
        NUMBER(18) REPORT_LANDMARKS_ID
        NUMBER(18) REPORT_ID
        NUMBER(18) LOCATION_ID
        string ... "+8 more"
    }

    SADO_SCREENSHOTS {
        NUMBER(18) SADO_SCREENSHOT_ID
        NUMBER(18) REPORT_ID
        string ... "+4 more"
    }

    SADO_STATE {
        NUMBER(18) SADO_STATE_ID
        NUMBER(18) REPORT_ID
        NUMBER(18) SADO_STATE_CATEGORY_ID
        string ... "+3 more"
    }

    SADO_STATE_CATEGORIES {
        NUMBER(18) SADO_STATE_CATEGORY_ID
        string ... "+4 more"
    }

    SADO_USERS {
        NUMBER(18) SADO_USERS_ID
        string ... "+5 more"
    }

    SENSOR {
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) INID
        NUMBER(18) CHANID
        string ... "+8 more"
    }

    SITE {
        VARCHAR2(6) STA
        string ... "+11 more"
    }

    SITEAUX {
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) COMMID
        string ... "+14 more"
    }

    SITECHAN {
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) CHANID
        string ... "+8 more"
    }

    SNR_PHASE {
        NUMBER(18) POLYID
        NUMBER(18) AMPCOR_VERID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        string ... "+5 more"
    }

    SREGION {
        string ... "+3 more"
    }

    STAMAG {
        NUMBER(18) MAGID
        NUMBER(18) AMPID
        VARCHAR2(6) STA
        NUMBER(18) ARID
        NUMBER(18) ORID
        string ... "+10 more"
    }

    STANET {
        VARCHAR2(8) NET
        VARCHAR2(6) STA
        string ... "+3 more"
    }

    STAQUAL_DNAMES {
        NUMBER(18) ID
        VARCHAR2(6) STA
        string ... "+6 more"
    }

    STATION_PROCESSING {
        NUMBER(18) CLUSTAID
        NUMBER(18) PROCID
        string ... "+3 more"
    }

    STATION_QUALITY {
        NUMBER(18) SQID
        VARCHAR2(6) STA
        string ... "+17 more"
    }

    STAYIELD {
        NUMBER(18) YIELDID
        NUMBER(18) AMPID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) ORID
        string ... "+5 more"
    }

    STA_CODA_SPECTRUM {
        NUMBER(18) AMPID
        string ... "+4 more"
    }

    SVDDISC {
        NUMBER(18) LSVID
        NUMBER(18) CLUSTAID
        VARCHAR2(6) STA
        NUMBER(18) COMMID
        string ... "+10 more"
    }

    SVDDISC_CHAN_ORDER {
        NUMBER(18) CLUSTAID
        VARCHAR2(6) STA
        VARCHAR2(6) CHAN
        string ... "+2 more"
    }

    TAPER {
        NUMBER(18) TAPERID
        string ... "+6 more"
    }

    TIMESTAMP {
        string ... "+4 more"
    }

    TOMO_INFO {
        NUMBER(18) TOMOID
        string ... "+11 more"
    }

    USER_FILTER {
        NUMBER(18) FILTERID
        string ... "+4 more"
    }

    USER_PRIVILEGES {
        string ... "+4 more"
    }

    WFACTIVITY {
        string ... "+8 more"
    }

    WFAUDIT {
        NUMBER(18) WFAUDITID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        string ... "+5 more"
    }

    WFCONV {
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) CHANID
        NUMBER(18) COMMID
        string ... "+10 more"
    }

    WFDISC {
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) WFID
        NUMBER(18) CHANID
        NUMBER(18) COMMID
        string ... "+15 more"
    }

    WFFILE {
        NUMBER(18) WFFID
        VARCHAR2(6) STA
        VARCHAR2(8) CHAN
        NUMBER(18) CHANID
        NUMBER(18) WFMID
        string ... "+10 more"
    }

    WFTAG {
        NUMBER(18) TAGID
        NUMBER(18) WFID
        string ... "+2 more"
    }

    XTAG {
        NUMBER(18) THISID
        NUMBER(18) THATID
        string ... "+5 more"
    }

    ACTIVE_ID ||--o{ WFTAG : "TAGID"
    AFFILIATION ||--o{ DEFINING_RULES : "NET"
    AFFILIATION ||--o{ HYDRO_ARR_GROUP : "NET"
    AFFILIATION ||--o{ NETMAG : "NET"
    AFFILIATION ||--o{ NETWORK : "NET"
    AFFILIATION ||--o{ NETYIELD : "NET"
    AFFILIATION ||--o{ STANET : "NET"
    AFFILIATION ||--o{ ALPHASITE : "STA"
    AFFILIATION ||--o{ ARRIVAL : "STA"
    AFFILIATION ||--o{ ASSOC : "STA"
    AFFILIATION ||--o{ ASSOC_GA : "STA"
    AFFILIATION ||--o{ ASSOC_GA_DEL : "STA"
    AFFILIATION ||--o{ CHAN_GROUPS : "STA"
    AFFILIATION ||--o{ CLUSTER_MEC : "STA"
    AFFILIATION ||--o{ CLUSTER_STATION : "STA"
    AFFILIATION ||--o{ CODAMAG_INPUT : "STA"
    AFFILIATION ||--o{ CODAMAG_OUTPUT : "STA"
    AFFILIATION ||--o{ CONTINUOUS_DATA_STATUS : "STA"
    AFFILIATION ||--o{ DA_REFSTA_LATENCY : "STA"
    AFFILIATION ||--o{ DA_REFSTA_SUMMARY : "STA"
    AFFILIATION ||--o{ DA_SITECHAN_LATENCY : "STA"
    AFFILIATION ||--o{ DETECTION : "STA"
    AFFILIATION ||--o{ DETECTION_THRESHOLD : "STA"
    AFFILIATION ||--o{ DISCRIMUSE : "STA"
    AFFILIATION ||--o{ DISCRIMVOTE : "STA"
    AFFILIATION ||--o{ DISCRIM_PARAM : "STA"
    AFFILIATION ||--o{ DOPPLER_DETECTION : "STA"
    AFFILIATION ||--o{ ECM_CHAN_AMPLITUDE : "STA"
    AFFILIATION ||--o{ ECM_REF_CHAN_AMPLITUDE : "STA"
    AFFILIATION ||--o{ ECM_STA_PREF_VERSION : "STA"
    AFFILIATION ||--o{ ENVELOPE_CONTRIBUTION : "STA"
    AFFILIATION ||--o{ EVENT_CORRELATION : "STA"
    AFFILIATION ||--o{ HYDRO_ARRIVAL : "STA"
    AFFILIATION ||--o{ MDAC_FD : "STA"
    AFFILIATION ||--o{ MDAC_FI : "STA"
    AFFILIATION ||--o{ MSVMAX_DESCRIPT : "STA"
    AFFILIATION ||--o{ OMITTED_CHANNELS : "STA"
    AFFILIATION ||--o{ OUTAGE_STATION_DATA : "STA"
    AFFILIATION ||--o{ OUTAGE_STATION_RECEIVE : "STA"
    AFFILIATION ||--o{ QCMASKINFO : "STA"
    AFFILIATION ||--o{ REQUEST : "STA"
    AFFILIATION ||--o{ SENSOR : "STA"
    AFFILIATION ||--o{ SITE : "STA"
    AFFILIATION ||--o{ SITEAUX : "STA"
    AFFILIATION ||--o{ SITECHAN : "STA"
    AFFILIATION ||--o{ SNR_PHASE : "STA"
    AFFILIATION ||--o{ STAMAG : "STA"
    AFFILIATION ||--o{ STAQUAL_DNAMES : "STA"
    AFFILIATION ||--o{ STATION_QUALITY : "STA"
    AFFILIATION ||--o{ STAYIELD : "STA"
```

## Table Categories
### Core Seismic Data
- **EVENT**: The event table contains a list of events. Multiple origins may be defined for any one event. The column prefor points t o the preferred origin.
- **ORIGIN**: The origin tables contain information describing a derived o r reported origin for a particular event.
- **ARRIVAL**: The arrival table contains summary information about arrival s.
- **ASSOC**: The assoc table contains information that connects arrivals (entries in the arrival table) to a particular origin.
- **AMPLITUDE**: The amplitude table contains arrival-based and origin-based amplitude measurements. The amplitude measurement is describ ed in ampdescript.
- **NETMAG**: The netmag table contain estimates of network magnitudes of different types for an event. Each network magnitude has a u nique magid. Station magnitudes used to compute the network magnitude are in the stamag table.
- **STAMAG**: The stamag table contains station magnitude estimates based upon measurements made on specific seismic phases. Values in the stamag table are used to calculate network magnitudes s tored in the netmag table.

### Station and Network
- **SITE**: The site table contains station location information. It nam es and describes a point on the earth where measurements are made (e.g., the location of an instrument or array of instr uments). This table contains information that normally chang es infrequently, such as location. In addition, the site tab le contains types that describe the offset of a station rela tive to an array reference location. Global data integrity i mplies that the sta/ondate in site be consistent with the st a/chan/ondate in the sitechan table.
- **SITECHAN**: The sitechan table contains station-channel information. It describes the orientation of a recording channel at the site referenced by sta. The table provides information about the various channels that are available at a station and mainta ins a record of the physical channel configuration at a site .
- **AFFILIATION**: The affiliation table groups stations into networks.
- **NETWORK**: The network table contains general information about seismic networks (see affiliation).
- **SENSOR**: The sensor table contains calibration information for specif ic sensor channels. This table provides a record of updates in the calibration factor or clock error of each instrument and links a sta/chan/time to a complete instrument response in the instrument table. Waveform data are converted into ph ysical units through multiplication by the calib type locate d in wfdisc. The correct value of calib may not be accuratel y known when the wfdisc record is entered into the database. The sensor table provides the mechanism (calratio and calpe r) to update calib, without requiring possibly hundreds of w fdisc records to be updated. Through the foreign key inid, t his table is linked to instrument, which has types pointing to flat files holding detailed calibration information in a variety of formats (see instrument).
- **INSTRUMENT**: The instrument table contains ancillary calibration informat ion. It holds nominal one-frequency calibration factors for each instrument and pointers to nominal frequency-dependent calibration for an instrument. This table also holds pointer s to the exact calibrations obtained by direct measurement o n a particular instrument (see sensor).

### Waveform Data
- **WFDISC**: The wfdisc table contains a waveform header file and descrip tive information. This table provides a pointer (or index) t o waveforms stored on disk. The waveforms themselves are sto red in ordinary disk files called wfdisc or '.w' files as a sequence of sample values (usually in binary representation) .
- **WFTAG**: The wftag table links various identifiers (e.g., orid, arid, and stassid to wfid). Linkages can also be determined indir ectly using sta/chan/time; however, it is more efficient to use the wftag table.
- **WFFILE**: The wffile table describes the files used in the Wave Form F iles managed by the Continuous Data Services Subsystem.
- **WFCONV**: The wfconv table contains data translations that are to be p erformed on incoming data before they are written to disk by the DLMan application. Data compression types include &quot;-&quot; i f the data is not compressed or &quot;CA&quot; for Canadian compressio n. &quot;Type&quot; in columns intype and outtype is the fixed-width d ata type (e.g., &quot;s4&quot;) or - if not applicable (i.e., if the d ata is compressed). An insamp value of zero (0) indicates th at the number of samples varies. Values less than zero in co lumns insamp and outsamp indicate that the total number of s amples must be evenly divisible by insamp. Strip indicates w hether to strip the authentication headers from the data; &quot;y &quot; means strip them and n means do not strip them.
- **WFAUDIT**: The wfaudit table contains records describing the sequences of changes made to rows in the wfdisc table for continuous ( raw) waveform data
- **WFACTIVITY**: The wfactivity table describes activity in the wfdisc table for a channel group and time region.

### Quality Control
- **QCMASKDEF**: The qcmaskdef table contains information defining the parame ters that went into the calculation of the QC mask.
- **QCMASKINFO**: The qcmaskinfo table contains QC mask data information about a channel and time interval for which QC processing was per formed.
- **QCMASKSEG**: The qcmaskseg table contains information about masked data s egments resulting from QC processing.

### Processing and Detection
- **DETECTION**: The detection table contains summary information about wavef orms.
- **FILTER**: The filter table will contain the core information needed to identify filters. The attributes in this table will be high ly indexed for fast searching. The attributes will allow app lication to quickly access enough information to 1) determin e the type of filter so that an application can branch accor dingly to efficiently handle loading or 2) determine uniquen ess when assessing if a filter does or does not exist.
- **ALGORITHM**: The algorithm table describes the algorithm and valid time p eriod
- **PROCESSING_RECIPE**: The processing_recipe table provides the types of waveform p rocessing and the order in which they should be applied. Thi s table allows each cluster station to be processed in diffe rent ways for different proctypes (SVD, CORR, and AMP).

### User and System
- **DATAUSER**: The datauser table tracks authorized users of the Message an d Subscription Subsystems. Each user is identified by a (uni que) username and domain, which must match all e-mail header s. The priority column specifies the class of user, and serv icetime is the last time a request from the user was process ed. Priority and servicetime are considered when selecting t he order in which requests will be processed. The status can either be active or inactive.
- **USER_PRIVILEGES**: This table lists the users who are allowed to apply channel masks to waveform data and the maximum time duration each us er can apply a channel mask (applies to omitted_channels tab le). This table also lists the users who are allowed to appl y nondefining location and magnitude indicators (timedef, az def, slodef and magdef) without respect to time duration (ap plies to nondefining table).
- **REMARK**: The remark table contains comments. This table may be used t o store free-form comments that embellish records of other t ables. The commid type in many tables refers to a record in the remark table. If commid is NA (1) in a record of any oth er table, no comments are stored for that record.
- **TIMESTAMP**: The timestamp table is used by automated processing to recor d time milestones associated with time-series data.

### Other Tables
- **ACTIVE_ID**: The active_id table is used to track events or arrivals bein g actively worked interactively to prevent the same event/ar rival from being worked by more than one individual.
- **ALPHASITE**: The alphasite table is used for tracking continuous data con nections by the DLMan application. For a given station, ther e must be a row in the table for each address from which the station may send continuous data. The columns prefdlid and prefport describe the preferred DLMan connection for the sta tion. DLMan fills in dlid and time while a station is active ly connected. The column dlid indicates to which dlid the st ation is currently connected (may be different from prefdlid ) and the column time is the system time for the last activi ty on the station's connection (not the time of any data rec eived). For stations that are not connected, time and dlid a re zero.
- **AMP3C**: The amp3c table contains amplitude measurements made on thre e-component data for a specific detection.
- **AMPDESCRIPT**: The ampdescript table contains descriptions of how amplitude measurements in amplitude were made.
- **AMPLITUDE_DYN_PARS_DBL**: The amplitude_dyn_pars_dbl table will store amplitude parame ters and metadata (float values). Each record will contain o nly one piece of information.
- **AMPLITUDE_DYN_PARS_INT**: The amplitude_dyn_pars_int table will store amplitude parame ters and metadata (integer values). Each record will contain only one piece of information.
- **AMPLITUDE_DYN_PARS_STR**: The amplitude_dyn_pars_str table will store amplitude parame ters and metadata (string values). Each record will contain only one piece of information.
- **AOI**: The aoi table contains geographic characteristics of a parti cluar region of the Earth, based on five criteria: aoi_geoch ar, depth_geochar, lfaoi_geochar, seismic_geochar, and terra in_geochar. The entire content of this table is classified S ECRET.
- **APMA**: The apma table contains results of particle motion analysis for a specific detection.
- **ARRIVAL_DYN_PARS_DBL**: The arrival_dyn_pars_dbl table will store arrival parameters and metadata (float values). Each record will contain only one piece of information.
- **ARRIVAL_DYN_PARS_INT**: The arrival_dyn_pars_int table will store arrival parameters and metadata (integer values). Each record will contain onl y one piece of information.
- **ARRIVAL_DYN_PARS_STR**: The arrival_dyn_pars_str table will store arrival parameters and metadata (string values). Each record will contain only one piece of information.
- **ARRIVAL_TAG**: The arrival_tag table contains information to indicate which mode was used to generate the arrival.
- **AR_INFO**: The ar_info table contains information about arrival observa tions used in event location. This includes the predicted ob servation values, the model used to predict the values, and all uncertainties associated with that observation.
- **ASSOC_GA**: The assoc_ga table is used by the GA application to store te mporary associations.
- **ASSOC_GA_DEL**: The assoc_ga_del table is used by the GA application to stor e deleted associations for later reference, if necessary.
- **BEAM**: The beam table stores the azimuth and slowness used during t he production of a beam. Whenever an origin beam is produced , a beam record is also produced and linked through the wfid to the beam waveform stored in the wfdisc table.
- **BULLETIN_RELEASE**: The bulletin release table contains .
- **BULLETIN_RELEASE_EXPORT**: The bulletin release export table contains information to tr ack Event Release files in the event they are not recieved a t the intended destination.
- **BUTTERWORTH_FILTER**: The butterworth_filter table stores filter processing parame ter.
- ... and 127 more tables

## Detailed Table Specifications
### ACTIVE_ID
**Description**: The active_id table is used to track events or arrivals bein g actively worked interactively to prevent the same event/ar rival from being worked by more than one individual.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| TAGNAME | VARCHAR2(8) | ✓ | ✗ | The key name (arid or evid) |
| TAGID | NUMBER(18) | ✓ | ✗ | Tag identifier value (arid or evid) |
| CLIENT_INFO | VARCHAR2(64) | ✓ | ✗ | Client information |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### AFFILIATION
**Description**: The affiliation table groups stations into networks.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| NET | VARCHAR2(8) | ✓ | ✗ | Unique network identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station identifier |
| TIME | FLOAT(53) | ✓ | ✗ | Starting time for station in network |
| ENDTIME | FLOAT(53) | ✓ | ✗ | endtime for station in network |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ALGORITHM
**Description**: The algorithm table describes the algorithm and valid time p eriod

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ALGORITHM_ID | NUMBER(18) | ✓ | ✗ | Algorithm identifier |
| ALGORITHM_NAME | VARCHAR2(64) | ✓ | ✗ | Algorithm name |
| DESCRIPTION | VARCHAR2(4000) | ✓ | ✗ | Description of algorithm |
| ON_DATE | DATE(7) | ✓ | ✗ | The date the algorithm first became active or was created |
| OFF_DATE | DATE(7) | ✓ | ✗ | The date the algorithm was removed from the system or made obsolete |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ALPHASITE
**Description**: The alphasite table is used for tracking continuous data con nections by the DLMan application. For a given station, ther e must be a row in the table for each address from which the station may send continuous data. The columns prefdlid and prefport describe the preferred DLMan connection for the sta tion. DLMan fills in dlid and time while a station is active ly connected. The column dlid indicates to which dlid the st ation is currently connected (may be different from prefdlid ) and the column time is the system time for the last activi ty on the station's connection (not the time of any data rec eived). For stations that are not connected, time and dlid a re zero.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| ADDRESS | VARCHAR2(16) | ✓ | ✗ | Source internet address |
| PREFDLID | NUMBER(18) | ✓ | ✗ | dlid for preferred DLMan |
| PREFPORT | NUMBER(8) | ✓ | ✗ | Preferred network port |
| CON_ALLOWED | VARCHAR2(1) | ✓ | ✗ | Status on whether DLMAN is allowed to connect to this channel or not |
| DLID | NUMBER(18) | ✓ | ✗ | dlid handling station |
| TIME | FLOAT(53) | ✓ | ✗ | Clock time of most recent activity |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### AMP3C
**Description**: The amp3c table contains amplitude measurements made on thre e-component data for a specific detection.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| CFREQ | FLOAT(24) | ✓ | ✗ | Center frequency of filter band amplitude is measured on |
| VAMP | FLOAT(24) | ✓ | ✗ | Vertical amplitude |
| VSNR | FLOAT(24) | ✓ | ✗ | Vertical signal-to-noise ratio |
| HAMP | FLOAT(24) | ✓ | ✗ | Horizontal amplitude |
| HSNR | FLOAT(24) | ✓ | ✗ | Horizontal signal-to-noise ratio |
| HTOV | FLOAT(24) | ✓ | ✗ | Horizontal-to-vertical amplitude ratio |
| RID | VARCHAR2(8) | ✓ | ✗ | Recipe identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### AMPDESCRIPT
**Description**: The ampdescript table contains descriptions of how amplitude measurements in amplitude were made.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| AMPTYPE | VARCHAR2(8) | ✓ | ✗ | Amplitude measure descriptor |
| TOFF | FLOAT(24) | ✓ | ✗ | Offset from theoretical or observed arrival time |
| TLEN | FLOAT(24) | ✓ | ✗ | Duration of measurement window |
| GVLO | FLOAT(24) | ✓ | ✗ | Low group velocity for measurement window (km/sec) |
| GVHI | FLOAT(24) | ✓ | ✗ | High group velocity for measurement window kilometers per second (km/sec) |
| MTYPE | VARCHAR2(8) | ✓ | ✗ | Measurement type |
| AMPDESCR | VARCHAR2(255) | ✓ | ✗ | Description |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### AMPLITUDE
**Description**: The amplitude table contains arrival-based and origin-based amplitude measurements. The amplitude measurement is describ ed in ampdescript.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| AMPID | NUMBER(18) | ✓ | ✗ | Amplitude identifier |
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| PARID | NUMBER(18) | ✓ | ✗ | Predicted arrival identifier |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| AMP | FLOAT(24) | ✓ | ✗ | Amplitude |
| PER | FLOAT(24) | ✓ | ✗ | Period(s) |
| SNR | FLOAT(24) | ✓ | ✗ | Signal-to-noise ratio |
| AMPTIME | FLOAT(53) | ✓ | ✗ | Time of amplitude measure |
| TIME | FLOAT(53) | ✓ | ✗ | Start time of measurement window |
| DURATION | FLOAT(24) | ✓ | ✗ | Duration of measurement window |
| DELTAF | FLOAT(24) | ✓ | ✗ | Sample interval width |
| AMPTYPE | VARCHAR2(8) | ✓ | ✗ | Amplitude measure descriptor |
| UNITS | VARCHAR2(15) | ✓ | ✗ | Units |
| CLIP | VARCHAR2(1) | ✓ | ✗ | Clipped flag |
| INARRIVAL | VARCHAR2(1) | ✓ | ✗ | y or n flag indicating if amplitude (amp) is the same as the amp in the arrival table |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### AMPLITUDE_DYN_PARS_DBL
**Description**: The amplitude_dyn_pars_dbl table will store amplitude parame ters and metadata (float values). Each record will contain o nly one piece of information.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| AMPID | NUMBER(18) | ✓ | ✗ | Unique amplitude identifier |
| GROUP_NAME | VARCHAR2(48) | ✓ | ✗ | General function or purpose where attribute is used (e.g. FK) |
| PARAM_NAME | VARCHAR2(48) | ✓ | ✗ | Attribute name (e.g. LEAD, LAG) |
| D_VALUE | FLOAT(53) | ✓ | ✗ | Double precision value |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### AMPLITUDE_DYN_PARS_INT
**Description**: The amplitude_dyn_pars_int table will store amplitude parame ters and metadata (integer values). Each record will contain only one piece of information.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| AMPID | NUMBER(18) | ✓ | ✗ | Unique amplitude identifier |
| GROUP_NAME | VARCHAR2(48) | ✓ | ✗ | General function or purpose where attribute is used (e.g. FK) |
| PARAM_NAME | VARCHAR2(48) | ✓ | ✗ | Attribute name (e.g. LEAD, LAG) |
| I_VALUE | NUMBER(18) | ✓ | ✗ | Integer value |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### AMPLITUDE_DYN_PARS_STR
**Description**: The amplitude_dyn_pars_str table will store amplitude parame ters and metadata (string values). Each record will contain only one piece of information.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| AMPID | NUMBER(18) | ✓ | ✗ | Unique amplitude identifier |
| GROUP_NAME | VARCHAR2(48) | ✓ | ✗ | General function or purpose where attribute is used (e.g. FK) |
| PARAM_NAME | VARCHAR2(48) | ✓ | ✗ | Attribute name (e.g. LEAD, LAG) |
| S_VALUE | VARCHAR2(1024) | ✓ | ✗ | String value |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### AOI
**Description**: The aoi table contains geographic characteristics of a parti cluar region of the Earth, based on five criteria: aoi_geoch ar, depth_geochar, lfaoi_geochar, seismic_geochar, and terra in_geochar. The entire content of this table is classified S ECRET.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| LAT | FLOAT(53) | ✓ | ✗ | Latitude |
| LON | FLOAT(53) | ✓ | ✗ | Longitude |
| AOI_GEOCHAR | VARCHAR2(1) | ✓ | ✗ | Area of interest geographic region characteristic |
| LFAOI_GEOCHAR | VARCHAR2(1) | ✓ | ✗ | Look Forward Area of interest geographic region characteristic |
| DEPTH_GEOCHAR | VARCHAR2(1) | ✓ | ✗ | Depth geographic region characteristic |
| SEISMIC_GEOCHAR | VARCHAR2(1) | ✓ | ✗ | Seismic geographic region characteristic |
| TERRAIN_GEOCHAR | VARCHAR2(1) | ✓ | ✗ | Terrain geographic region characteristic |
| ONDATE | NUMBER(8) | ✓ | ✗ | Julian on date |
| OFFDATE | NUMBER(8) | ✓ | ✗ | Julian off date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### APMA
**Description**: The apma table contains results of particle motion analysis for a specific detection.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| PHASE | VARCHAR2(8) | ✓ | ✗ | Phase |
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| FREQ | FLOAT(24) | ✓ | ✗ | Frequency |
| SNR | FLOAT(24) | ✓ | ✗ | Signal-to-noise ratio |
| AMPP | FLOAT(24) | ✓ | ✗ | P-phase amplitude |
| AMPS | FLOAT(24) | ✓ | ✗ | S-phase amplitude |
| AMPLR | FLOAT(24) | ✓ | ✗ | Rayleigh-phase amplitude |
| RECT | FLOAT(24) | ✓ | ✗ | Rectilinearity |
| PLANS | FLOAT(24) | ✓ | ✗ | S-phase planarity |
| PLANLR | FLOAT(24) | ✓ | ✗ | Rayleigh-phase planarity |
| HVRATP | FLOAT(24) | ✓ | ✗ | P-phase horizontal-to-vertical ratio |
| HVRAT | FLOAT(24) | ✓ | ✗ | S-phase horizontal-to-vertical ratio |
| HMXMN | FLOAT(24) | ✓ | ✗ | Maximum-to-minimum horizontal ratio |
| INANG3 | FLOAT(24) | ✓ | ✗ | Short-axis incidence angle |
| SEAZP | FLOAT(24) | ✓ | ✗ | P-phase observed azimuth |
| SEAZS | FLOAT(24) | ✓ | ✗ | S-phase observed azimuth |
| SEAZLR | FLOAT(24) | ✓ | ✗ | Rayleigh-phase observed azimuth |
| INANG1 | FLOAT(24) | ✓ | ✗ | Long-axis incidence angle |
| PPHASETIME | FLOAT(53) | ✓ | ✗ | P-phase extraction time |
| SPHASETIME | FLOAT(53) | ✓ | ✗ | S-phase extraction time |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| APMARID | NUMBER(18) | ✓ | ✗ | apma recipe identifier |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ARRIVAL
**Description**: The arrival table contains summary information about arrival s.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch time |
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| JDATE | NUMBER(8) | ✓ | ✗ | Julian date |
| STASSID | NUMBER(18) | ✓ | ✗ | Arrival group indentification |
| CHANID | NUMBER(18) | ✓ | ✗ | Instrument identifier |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| IPHASE | VARCHAR2(8) | ✓ | ✗ | Reported phase |
| STYPE | VARCHAR2(1) | ✓ | ✗ | Signal type |
| DELTIM | FLOAT(24) | ✓ | ✗ | Time uncertainty |
| AZIMUTH | FLOAT(24) | ✓ | ✗ | Observed azimuth |
| DELAZ | FLOAT(24) | ✓ | ✗ | Azimuth uncertainty |
| SLOW | FLOAT(24) | ✓ | ✗ | Observed slowness, seconds/degree |
| DELSLO | FLOAT(24) | ✓ | ✗ | Slowness uncertainty |
| EMA | FLOAT(24) | ✓ | ✗ | Emergence angle |
| RECT | FLOAT(24) | ✓ | ✗ | Rectilinearity |
| AMP | FLOAT(24) | ✓ | ✗ | Amplitude, instrument corrected |
| PER | FLOAT(24) | ✓ | ✗ | Period |
| LOGAT | FLOAT(24) | ✓ | ✗ | Log (amp/per) |
| CLIP | VARCHAR2(1) | ✓ | ✗ | Clipped flag |
| FM | VARCHAR2(2) | ✓ | ✗ | First motion |
| SNR | FLOAT(24) | ✓ | ✗ | Signal-to-noise ratio |
| QUAL | VARCHAR2(1) | ✓ | ✗ | Signal onset quality |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ARRIVAL_DYN_PARS_DBL
**Description**: The arrival_dyn_pars_dbl table will store arrival parameters and metadata (float values). Each record will contain only one piece of information.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ARID | NUMBER(18) | ✓ | ✗ | Unique arrival identifier |
| GROUP_NAME | VARCHAR2(48) | ✓ | ✗ | General function or purpose where attribute is used (e.g. DETECT, ONSET, FK) |
| PARAM_NAME | VARCHAR2(48) | ✓ | ✗ | Attribute name (e.g. FILTERID) |
| D_VALUE | FLOAT(53) | ✓ | ✗ | Double precision value |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ARRIVAL_DYN_PARS_INT
**Description**: The arrival_dyn_pars_int table will store arrival parameters and metadata (integer values). Each record will contain onl y one piece of information.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ARID | NUMBER(18) | ✓ | ✗ | Unique arrival identifier |
| GROUP_NAME | VARCHAR2(48) | ✓ | ✗ | General function or purpose where attribute is used (e.g. DETECT, ONSET, FK) |
| PARAM_NAME | VARCHAR2(48) | ✓ | ✗ | Attribute name (e.g. FILTERID) |
| I_VALUE | NUMBER(18) | ✓ | ✗ | Integer value |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ARRIVAL_DYN_PARS_STR
**Description**: The arrival_dyn_pars_str table will store arrival parameters and metadata (string values). Each record will contain only one piece of information.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ARID | NUMBER(18) | ✓ | ✗ | Unique arrival identifier |
| GROUP_NAME | VARCHAR2(48) | ✓ | ✗ | General function or purpose where attribute is used (e.g. DETECT, ONSET, FK) |
| PARAM_NAME | VARCHAR2(48) | ✓ | ✗ | Attribute name (e.g. FILTERID) |
| S_VALUE | VARCHAR2(1024) | ✓ | ✗ | String value |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ARRIVAL_TAG
**Description**: The arrival_tag table contains information to indicate which mode was used to generate the arrival.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| PROCESS_MODE | VARCHAR2(32) | ✓ | ✗ | Processing mode used to generate arrival |
| PROCESS_ATTRIBUTE | VARCHAR2(32) | ✓ | ✗ | Attribute of processing mode |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### AR_INFO
**Description**: The ar_info table contains information about arrival observa tions used in event location. This includes the predicted ob servation values, the model used to predict the values, and all uncertainties associated with that observation.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| TIME_ERROR_CODE | NUMBER(9) | ✓ | ✗ | Time error code |
| AZ_ERROR_CODE | NUMBER(9) | ✓ | ✗ | Azimuth error code |
| SLOW_ERROR_CODE | NUMBER(9) | ✓ | ✗ | Slowness error code |
| SRC_DPNT_CORR_TYPE | NUMBER(9) | ✓ | ✗ | Correction code (TT, AZ, SLO) |
| VMODEL | VARCHAR2(16) | ✓ | ✗ | Velocity model for theoretical travel time (TT) and slowness (SLO) |
| TOTAL_TRAVEL_TIME | FLOAT(24) | ✓ | ✗ | Predicted travel time including all corrections (seconds) |
| TT_TABLE_VALUE | FLOAT(24) | ✓ | ✗ | Base model travel time (uncorrect) |
| ELLIP_CORR | FLOAT(24) | ✓ | ✗ | Time correction due to earth's ellipticity (seconds) |
| ELEV_CORR | FLOAT(24) | ✓ | ✗ | Time correction due to station elevation (seconds) |
| BULK_STATIC_STA_CORR | FLOAT(24) | ✓ | ✗ | Static station correction to travel time (seconds) |
| TT_SRC_DPNT_CORR | FLOAT(24) | ✓ | ✗ | Source-specific travel time correction (seconds) |
| TT_MODEL_ERROR | FLOAT(24) | ✓ | ✗ | Travel time model uncertainty (seconds) |
| TT_MEAS_ERROR | FLOAT(24) | ✓ | ✗ | Travel time measurement uncertainty (seconds) |
| TT_MODEL_PLUS_MEAS_ERROR | FLOAT(24) | ✓ | ✗ | Combined travel time model and measurement uncertainty (seconds) |
| AZ_SRC_DPNT_CORR | FLOAT(24) | ✓ | ✗ | Source-specific azimuth correction (degrees) |
| AZ_MODEL_ERROR | FLOAT(24) | ✓ | ✗ | Azimuth model uncertainty (degrees) |
| AZ_MEAS_ERROR | FLOAT(24) | ✓ | ✗ | Azimuth measurement uncertainty (degrees) |
| AZ_MODEL_PLUS_MEAS_ERROR | FLOAT(24) | ✓ | ✗ | Combined azimuth model and measurement uncertainty (degrees) |
| SL_SRC_DPNT_CORR | FLOAT(24) | ✓ | ✗ | Source-specific slowness correction (s/deg) |
| SL_MODEL_ERROR | FLOAT(24) | ✓ | ✗ | Slowness model uncertainty (s/deg) |
| SL_MEAS_ERROR | FLOAT(24) | ✓ | ✗ | Slowness measurement uncertainty (s/deg) |
| SL_MODEL_PLUS_MEAS_ERROR | FLOAT(24) | ✓ | ✗ | Combined slowness model and measurement uncertainty (s/deg) |
| TIME_IMPORT | FLOAT(24) | ✓ | ✗ | Weight applied to travel time in event solution |
| AZ_IMPORT | FLOAT(24) | ✓ | ✗ | Weight applied to azimuth in event solution |
| SLOW_IMPORT | FLOAT(24) | ✓ | ✗ | Weight applied to slowness in event solution |
| SLOW_VEC_RES | FLOAT(24) | ✓ | ✗ | Residual between predicted and observed FK vector (s/deg) |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ASSOC
**Description**: The assoc table contains information that connects arrivals (entries in the arrival table) to a particular origin.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| PHASE | VARCHAR2(8) | ✓ | ✗ | Associated phase |
| BELIEF | FLOAT(24) | ✓ | ✗ | Phase confidence |
| DELTA | FLOAT(24) | ✓ | ✗ | Station-to-event distance |
| SEAZ | FLOAT(24) | ✓ | ✗ | Station-to-event azimuth |
| ESAZ | FLOAT(24) | ✓ | ✗ | Event-to-station azimuth |
| TIMERES | FLOAT(24) | ✓ | ✗ | Time residual |
| TIMEDEF | VARCHAR2(1) | ✓ | ✗ | Time = defining (d,D), nondefining (n,N,x,X) |
| AZRES | FLOAT(24) | ✓ | ✗ | Azimuth residual |
| AZDEF | VARCHAR2(1) | ✓ | ✗ | Azimuth = defining (d,D), nondefining (n,N,x,X) |
| SLORES | FLOAT(24) | ✓ | ✗ | Slowness residual |
| SLODEF | VARCHAR2(1) | ✓ | ✗ | Slowness = defining (d,D), nondefining (n,N,x,X) |
| EMARES | FLOAT(24) | ✓ | ✗ | Incidence angle residual |
| WGT | FLOAT(24) | ✓ | ✗ | Location weight |
| VMODEL | VARCHAR2(15) | ✓ | ✗ | Velocity model |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ASSOC_GA
**Description**: The assoc_ga table is used by the GA application to store te mporary associations.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| PHASE | VARCHAR2(8) | ✓ | ✗ | Associated phase |
| BELIEF | FLOAT(24) | ✓ | ✗ | Phase confidence |
| DELTA | FLOAT(24) | ✓ | ✗ | Station-to-event distance |
| SEAZ | FLOAT(24) | ✓ | ✗ | Station-to-event azimuth |
| ESAZ | FLOAT(24) | ✓ | ✗ | Event-to-station azimuth |
| TIMERES | FLOAT(24) | ✓ | ✗ | Time residual |
| TIMEDEF | VARCHAR2(1) | ✓ | ✗ | Time = defining (d,D), nondefining (n,N,x,X) |
| AZRES | FLOAT(24) | ✓ | ✗ | Azimuth residual |
| AZDEF | VARCHAR2(1) | ✓ | ✗ | Azimuth = defining (d,D), nondefining (n,N,x,X) |
| SLORES | FLOAT(24) | ✓ | ✗ | Slowness residual |
| SLODEF | VARCHAR2(1) | ✓ | ✗ | Slowness = defining (d,D), nondefining (n,N,x,X) |
| EMARES | FLOAT(24) | ✓ | ✗ | Incidence angle residual |
| WGT | FLOAT(24) | ✓ | ✗ | Location weight |
| VMODEL | VARCHAR2(15) | ✓ | ✗ | Velocity model |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ASSOC_GA_DEL
**Description**: The assoc_ga_del table is used by the GA application to stor e deleted associations for later reference, if necessary.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| PHASE | VARCHAR2(8) | ✓ | ✗ | Associated phase |
| BELIEF | FLOAT(24) | ✓ | ✗ | Phase confidence |
| DELTA | FLOAT(24) | ✓ | ✗ | Station-to-event distance |
| SEAZ | FLOAT(24) | ✓ | ✗ | Station-to-event azimuth |
| ESAZ | FLOAT(24) | ✓ | ✗ | Event-to-station azimuth |
| TIMERES | FLOAT(24) | ✓ | ✗ | Time residual |
| TIMEDEF | VARCHAR2(1) | ✓ | ✗ | Time = defining (d,D), nondefining (n,N,x,X) |
| AZRES | FLOAT(24) | ✓ | ✗ | Azimuth residual |
| AZDEF | VARCHAR2(1) | ✓ | ✗ | Azimuth = defining (d,D), nondefining (n,N,x,X) |
| SLORES | FLOAT(24) | ✓ | ✗ | Slowness residual |
| SLODEF | VARCHAR2(1) | ✓ | ✗ | Slowness = defining (d,D), nondefining (n,N,x,X) |
| EMARES | FLOAT(24) | ✓ | ✗ | Incidence angle residual |
| WGT | FLOAT(24) | ✓ | ✗ | Location weight |
| VMODEL | VARCHAR2(15) | ✓ | ✗ | Velocity model |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### BEAM
**Description**: The beam table stores the azimuth and slowness used during t he production of a beam. Whenever an origin beam is produced , a beam record is also produced and linked through the wfid to the beam waveform stored in the wfdisc table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| WFID | NUMBER(18) | ✓ | ✗ | Waveform identifier |
| FILTERID | NUMBER(18) | ✓ | ✗ | This is a TBD field created in anticipation of the Persistent Parameter module |
| AZIMUTH | FLOAT(24) | ✓ | ✗ | Azimuth |
| SLOW | FLOAT(24) | ✓ | ✗ | Slowness of an arrival |
| DESCRIP | VARCHAR2(50) | ✓ | ✗ | Text description of the beam |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### BULLETIN_RELEASE
**Description**: The bulletin release table contains .

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ERPID | NUMBER(18) | ✓ | ✗ | Event Reporting Process identifier |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| EVID | NUMBER(18) | ✓ | ✗ | Event identifier |
| MAGID | NUMBER(18) | ✓ | ✗ | Magnitude identifier |
| AOI_GEOCHAR | VARCHAR2(1) | ✓ | ✗ | Area of interest geographic region characteristic |
| CLASSIFICATION_COMMENTS | VARCHAR2(4000) | ✓ | ✗ | Discrim and ECM comments |
| CLASSIFICATION_RESULTS | VARCHAR2(4000) | ✓ | ✗ | Discrim and ECM results |
| GRNAME | VARCHAR2(40) | ✓ | ✗ | Geographic region name |
| RELEASE_STATUS | VARCHAR2(16) | ✓ | ✗ | Action being called for |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Source/originator |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### BULLETIN_RELEASE_EXPORT
**Description**: The bulletin release export table contains information to tr ack Event Release files in the event they are not recieved a t the intended destination.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ERP_SEQ | NUMBER(18) | ✓ | ✗ | Event Release Process export sequence number |
| MAX_ERPID | NUMBER(18) | ✓ | ✗ | Maximum Event Release Process Identifier |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Source/originator |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### BUTTERWORTH_FILTER
**Description**: The butterworth_filter table stores filter processing parame ter.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FILTERID | NUMBER(18) | ✓ | ✗ | ID number of a filter processing parameter |
| FILTER_TYPE | VARCHAR2(16) | ✓ | ✗ | Type of Butterworth filter (BP, LP, HP) |
| FILTER_ORDER | NUMBER(2) | ✓ | ✗ | Order of Butterworth filter |
| FILTER_LOW | FLOAT(24) | ✓ | ✗ | Filter low frequency |
| FILTER_HIGH | FLOAT(24) | ✓ | ✗ | Filter high frequency |
| FILTER_ZEROPH | NUMBER(1) | ✓ | ✗ | This is a flag to indicate zero-phase filtering. If this is set to 0, the filter is not zero-phase. If this is set to 1, the filter is zero-phase i.e. no phase lag or group delay. |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### CHANNAME
**Description**: The channame table provides mapping between channel and stat ion names.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| EXTERN_STA | VARCHAR2(6) | ✓ | ✗ | External station name |
| EXTERN_CHAN | VARCHAR2(8) | ✓ | ✗ | External channel name |
| EXTERN_AUTH | VARCHAR2(20) | ✓ | ✗ | External authority using this name |
| INTERN_STA | VARCHAR2(6) | ✓ | ✗ | Internal station name |
| INTERN_CHAN | VARCHAR2(8) | ✓ | ✗ | Internal channel name |
| INTERN_CHANID | NUMBER(18) | ✓ | ✗ | Internal channel ID |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### CHAN_GROUPS
**Description**: The chan_groups table is used to indicate which sta/chan pai rs belong to a given class/name (wfactivity) group.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLASS | VARCHAR2(16) | ✓ | ✗ | Type of interval |
| NAME | VARCHAR2(20) | ✓ | ✗ | Name of interval |
| STA | VARCHAR2(6) | ✓ | ✗ | Station |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| DURATION | FLOAT(24) | ✓ | ✗ | Duration in seconds of the time region |
| INWFACTIVITY | NUMBER(1) | ✓ | ✗ | Indicates whether class/name/duration is in wfactivity or not |
| ONDATE | NUMBER(8) | ✓ | ✗ | On date |
| OFFDATE | NUMBER(8) | ✓ | ✗ | Off date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### CLASSIFICATION
**Description**: Contains the table ID information for other tables. Makes u p the overall classification consisting of classification le vel, control markings office of primary responsibility, sour ce used for classification and declassification instructions .

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLASSIFICATION_ID | NUMBER(18) | ✓ | ✗ | Classification Identifier. |
| DESCRIPTION | VARCHAR2(64) | ✓ | ✗ | Classification description. |
| CLASS_LEVEL_ID | NUMBER(18) | ✓ | ✗ | Classification Level Identifier. |
| CLASS_DISSEM_ID | NUMBER(18) | ✓ | ✗ | Classification Dissemination Identifier. |
| CLASS_DERIVED_ID | NUMBER(18) | ✓ | ✗ | Classification Derived From Identifier. |
| CLASS_DECLASS_ID | NUMBER(18) | ✓ | ✗ | Class Declassify Identifier |
| CLASS_REFER_ID | NUMBER(18) | ✓ | ✗ | Class Refer To Identifier |
| CLASS_OPR_ID | NUMBER(18) | ✓ | ✗ | ID for the classification_opr table. This is the agency, office (or OPR) responsible for classification and classification date. |
| ON_DATE | DATE(7) | ✓ | ✗ | The date the classification becomes active. |
| OFF_DATE | DATE(7) | ✓ | ✗ | The date the classification becomes inactive or obsolete. |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |

### CLASSIFICATION_LEVEL
**Description**: Provides the overall classification for marking the top and bottom of documents.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLASS_LEVEL_ID | NUMBER(18) | ✓ | ✗ | Classification Level Identifier. |
| CLASS_LEVEL | VARCHAR2(64) | ✓ | ✗ | Level of Classification, e.g. SECRET |
| PARAGRAPH_MARK | VARCHAR2(16) | ✓ | ✗ | Abbreviated classification for paragraph marking i.e. UNCLASSIFIED = U. |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### CLASSIFICATION_LOOKUP
**Description**: Looks up the classification information in the classificatio n table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLASS_LOOKUP_ID | NUMBER(18) | ✓ | ✗ | Classification Lookup Identifier. |
| APPLICATION | VARCHAR2(64) | ✓ | ✗ | The name of the application using the security marking, e.g. ARS, McTool. |
| CLASSIFICATION_ID | NUMBER(18) | ✓ | ✗ | Classification Identifier. |
| ON_DATE | DATE(7) | ✓ | ✗ | The date the classification becomes active. |
| OFF_DATE | DATE(7) | ✓ | ✗ | The date the classification becomes inactive or obsolete. |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |

### CLASSIFICATION_OPR
**Description**: Used to contain the agency, office (or OPR) responsible for classification

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLASS_OPR_ID | NUMBER(18) | ✓ | ✗ | See classification.class_opr_id description |
| CLASS_OPR | VARCHAR2(64) | ✓ | ✗ | See table description |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### CLASSIFICATION_REFER_TO
**Description**: The classification_refer_to table will contain the &quot;Refer to :...&quot; information for the Exective Order Box.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLASS_REFER_ID | NUMBER(18) | ✓ | ✗ | Class Refer To Identifier |
| CLASS_REFER | VARCHAR2(4000) | ✓ | ✗ | The classification_refer_to.class_refer contains the &quot;Refer to&quot; string which follows the the &quot;Declassify On&quot; part of the Exective Order Box. It provides the source to refer to in order to properly de classify something. |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### CLASS_DECLASS_ID
**Description**: Contains the declassification date and reference information . Used as part of the Executive Order Box.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLASS_DECLASS_ID | NUMBER(18) | ✓ | ✗ | Class Declassify Identifier |
| CLASS_DECLASS | VARCHAR2(4000) | ✓ | ✗ | See comment on table. |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### CLASS_DERIVED_ID
**Description**: Identification of the source of classification (Classified b y or Derived From line). Part of the Executive Order Box.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLASS_DERIVED_ID | NUMBER(18) | ✓ | ✗ | Classification derived from Identifier. |
| CLASS_DERIVED | VARCHAR2(4000) | ✓ | ✗ | The source of the classification, i.e. classified by or derived from. |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### CLASS_DISSEM_ID
**Description**: Contains the control markings of the overall security markin g. i.e. FOUO, NOFORN

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLASS_DISSEM_ID | NUMBER(18) | ✓ | ✗ | Classification Dissemination Identifier. |
| CLASS_DISSEM | VARCHAR2(64) | ✓ | ✗ | The abbreviated control marking which may follow the classification. |
| PARAGRAPH_MARK | VARCHAR2(16) | ✓ | ✗ | The paragraph control marking. May be an abbreviated version of the class_dissem control marking. |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### CLUSTER_INFO
**Description**: The cluster_info table contains information relating to the cluster of events. It relates to versions of the same cluste r (same events) together. It also contains the orid of the e vent closest to the center of the cluster and the radius of the cluster.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLUID | NUMBER(18) | ✓ | ✗ | Unique cluster ID |
| DESCRIP | VARCHAR2(50) | ✓ | ✗ | Text description of cluster |
| PREFOR | NUMBER(18) | ✓ | ✗ | Origin that is closest to the center of the cluster |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### CLUSTER_MAGREF
**Description**: The cluster_magref table provides the magnitude reference ev ent for the cluster. This reference event will be used in de termining the relative magnitude of new events found using t he SSD. Each cluster will need a magnitude reference event t o make a relative magnitude calculation on events identified by the SSD. If the magnitude reference event was not seen a t a refsta we will be unable to perform a relative magnitude calculation for that refsta.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLUSTAID | NUMBER(18) | ✓ | ✗ | Cluster Sta ID |
| ACTIVETIME | FLOAT(53) | ✓ | ✗ | The epochtime a cluster was activated |
| ORID | NUMBER(18) | ✓ | ✗ | Orid of magref event |
| AMPTYPE | VARCHAR2(8) | ✓ | ✗ | Amplitude type |
| MTYPE | VARCHAR2(15) | ✓ | ✗ | Amplitude measurement type |
| MVALUE | FLOAT(24) | ✓ | ✗ | Amplitude measurement value (only required for specific mtype(s)) |
| FILTERID | NUMBER(18) | ✓ | ✗ | Filter identifier that links to the butterworth filter table |
| LEAD | FLOAT(24) | ✓ | ✗ | Number of seconds before preferred phase for amplitude measurement |
| DURATION | FLOAT(24) | ✓ | ✗ | Total number of seconds of the waveform around the preferred phase for amplitude measurement |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### CLUSTER_MEC
**Description**: The cluster_mec table provides the location correction infor mation for a sta (element). This information is used to refi ne the locations of origins. The flat file database (fdb) th at is imported into this table should not include commented lines. The cluster_mec's format is the current output of jhd sat. It will have to be augmented by the addition of clustai d when it is imported into a US NDC cluster_mec table. This will make it possible to distinguish between two different e vent clusters for the same station.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLUSTAID | NUMBER(18) | ✓ | ✗ | Cluster Station identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Element name |
| PHASE | VARCHAR2(8) | ✓ | ✗ | Phase |
| ACTIVETIME | FLOAT(53) | ✓ | ✗ | The epochtime a cluster was activated |
| CORR_TYPE | VARCHAR2(16) | ✓ | ✗ | Correction type (time, azimuth, slowness) |
| CORRECTION | FLOAT(24) | ✓ | ✗ | Correction value |
| UNCERTAINTY | FLOAT(24) | ✓ | ✗ | Model error |
| ONDATE | NUMBER(8) | ✓ | ✗ | Julian date that the correction is good from |
| OFFDATE | NUMBER(8) | ✓ | ✗ | Julian date that the correction is good to |
| TOTAL_EVENTS | NUMBER(3) | ✓ | ✗ | Total events used to create the MEC |

### CLUSTER_ORID
**Description**: The cluster_orid table provides the cluster to orid mapping.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLUSTAID | NUMBER(18) | ✓ | ✗ | Cluster Station identifier |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| ACTIVETIME | FLOAT(53) | ✓ | ✗ | The epochtime a cluster was activated |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### CLUSTER_OVERRIDE
**Description**: The cluster_override table contains Multiple Event Analysis (MEA) parameter file overrides for historical purposes. This table is populated when a new cluster version is pushed int o the NDC database with the previous override values.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLUSTAID | NUMBER(18) | ✓ | ✗ | Cluster Station identifier |
| ACTIVETIME | FLOAT(53) | ✓ | ✗ | The epochtime a cluster was activated |
| THRESHOLD | FLOAT(24) | ✓ | ✗ | The threshold of the detector |
| SSD_DIMENSION | NUMBER(5) | ✓ | ✗ | Specifies how many SVD dimensions to use in the SVDDISC table. |
| SVD_LEAD | FLOAT(24) | ✓ | ✗ | The number of seconds from the start to the first phase of the waveforms used to generate the svds |
| MIN_DETECTION_INTERVAL | FLOAT(24) | ✓ | ✗ | This value is multiplied by the data's sample rate to determine the MEA detection window size. |
| PREFPHASE | VARCHAR2(16) | ✓ | ✗ | Preferred phase. |
| LEAD | FLOAT(24) | ✓ | ✗ | Number of seconds preceding phase that makes up the reference waveform |
| LAG | FLOAT(24) | ✓ | ✗ | Number of seconds following preferred phase that makes up the reference waveform |
| BEST_EVENT_MATCH_MULTIPLE | FLOAT(24) | ✓ | ✗ | This value is multiplied by a MEA detection window to extend the window to perform correlation to find the best event match. |
| PHASE_ONSET_MULTIPLE | FLOAT(24) | ✓ | ✗ | This value is multiplied by the phase's lead and lag duration to create a window to perform correlation to refine phase onset time. |
| DET_TRACE_TRIM_MULTIPLE | FLOAT(24) | ✓ | ✗ | The value is multiplied by the length of one SVD to define how much to trim from both ends of a detection statistic trace. |
| CHANNEL_MASKING_THRESHOLD | FLOAT(24) | ✓ | ✗ | The proportion of a channel that can be masked before the channel is removed from the threshold calculation |
| PFA | FLOAT(24) | ✓ | ✗ | Probability of false alarm |
| THRESHOLD_PERCENT_OVERLAP | NUMBER(9) | ✓ | ✗ | Percent overlap |
| PHASE_SPECIFIC_OVERRIDE_REC | VARCHAR2(32) | ✓ | ✗ | Name of the phase override recipe to use ('-' value represents no override desired). |
| MAX_DELAZ | FLOAT(24) | ✓ | ✗ | Allowable difference between suspect azimuth and sta-cluster azimuth seconds per kilometer |
| MAX_DELSLOW | FLOAT(24) | ✓ | ✗ | Allowable difference between suspect slowness and ref slowness seconds per kilometer |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### CLUSTER_PHASE_OVERRIDE
**Description**: The cluster_phase_override table contains Multiple Event Ana lysis (MEA) parameter file overrides for historical purposes . This table is populated when a new cluster version is push ed into the NDC database with the previous override values.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLUSTAID | NUMBER(18) | ✓ | ✗ | Cluster Station identifier |
| ACTIVETIME | FLOAT(53) | ✓ | ✗ | The epochtime a cluster was activated. |
| PHASE_SPECIFIC_OVERRIDE_REC | VARCHAR2(32) | ✓ | ✗ | Name of the phase override recipe to use ('-' -&gt; &gt;value represents no override desired). |
| PHASE | VARCHAR2(8) | ✓ | ✗ | Phase type |
| LEAD | FLOAT(24) | ✓ | ✗ | Number of seconds preceding phase that makes up the reference waveform. |
| LAG | FLOAT(24) | ✓ | ✗ | Number of seconds following preferred phase that makes up the reference waveform. |
| FLO | FLOAT(24) | ✓ | ✗ | Low corner frequency for filter. |
| FHI | FLOAT(24) | ✓ | ✗ | High corner frequency for filter. |
| MAXADJ | FLOAT(24) | ✓ | ✗ | The maximum time in seconds that a phase can be adjusted. |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### CLUSTER_STATION
**Description**: The cluster_station table is used to store station-specific (not element-specific) information, e.g., stations used in c luster, azimuth limits, slowness limits.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLUSTAID | NUMBER(18) | ✓ | ✗ | Cluster Station identifier |
| ACTIVETIME | FLOAT(53) | ✓ | ✗ | The epochtime a cluster was activated |
| CLUID | NUMBER(18) | ✓ | ✗ | Numeric cluster identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station to which array elements are referenced; used to identify sites to include in cluster |
| MAX_DELAZ | FLOAT(24) | ✓ | ✗ | Allowable difference between suspect azimuth and sta-cluster azimuth seconds per kilometer |
| MAX_DELSLOW | FLOAT(24) | ✓ | ✗ | Allowable difference between suspect slowness and ref slowness seconds per kilometer |
| SSD_DIMENSION | NUMBER(5) | ✓ | ✗ | Number of subspace vectors to include for sta/chan processing |
| SVD_LEAD | FLOAT(24) | ✓ | ✗ | The number of seconds from the start to the first phase of the waveforms used to generate the svds |
| SVD_LAG | FLOAT(24) | ✓ | ✗ | The number of seconds from the start to the first phase of the waveforms used to generate the svds |
| PREFPHASE | VARCHAR2(16) | ✓ | ✗ | Preferred Phase |
| LEAD | FLOAT(24) | ✓ | ✗ | Number of seconds preceding phase that makes up the reference waveform |
| LAG | FLOAT(24) | ✓ | ✗ | Number of seconds following preferred phase that makes up the reference waveform |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date of the data |

### CLUSTER_THRESHOLD
**Description**: The cluster_threshold table provides the threshold informati on for the cluster. It is possible for a cluster to have sev eral different threshold values.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLUSTAID | NUMBER(18) | ✓ | ✗ | Cluster Station identifier |
| DETECTOR_TYPE | VARCHAR2(16) | ✓ | ✗ | The dector type to use with this threshold (SSD, CORR, AMP) |
| SSD_DIMENSION | NUMBER(5) | ✓ | ✗ | SSD Dimension |
| ACTIVETIME | FLOAT(53) | ✓ | ✗ | The epochtime a cluster was activated |
| ORID | NUMBER(18) | ✓ | ✗ | The orid used to create the threshold if this is a correlation threshold otherwise the value is 0 |
| THRESHOLD | FLOAT(24) | ✓ | ✗ | The threshold of the detector |
| PFA | FLOAT(24) | ✓ | ✗ | Probability of false alarm |
| OVERLAP | NUMBER(9) | ✓ | ✗ | Percent overlap |
| CHANNEL_MASKING_THRESHOLD | FLOAT(24) | ✓ | ✗ | The proportion of a channel that can be masked before the channel is removed from the threshold calculation |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### CODAMAG_INPUT
**Description**: The codamag_input table contains key input parameters that a re used to calculate coda amplitudes, including the boundari es of the noise and signal windows and the path and site cor rection values.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| AMPID | NUMBER(18) | ✓ | ✗ | Amplitude identifier |
| FLO | FLOAT(24) | ✓ | ✗ | Low corner freq for filter |
| FHI | FLOAT(24) | ✓ | ✗ | High corner freq for filter |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| ARID | NUMBER(18) | ✓ | ✗ | LR arrival identifier |
| AMPDEF | VARCHAR2(1) | ✓ | ✗ | d or n flag indicating if station/element is included (d,D) or excluded (n,N) from coda magnitude processing |
| DELTA | FLOAT(24) | ✓ | ✗ | Source-receiver distance |
| BWRATIO | FLOAT(24) | ✓ | ✗ | Pre-filter bandwidth to Nyquist ratio |
| SAMPRATE | FLOAT(24) | ✓ | ✗ | The sample rate of the data corresponding to this record |
| ENVSLOW | FLOAT(24) | ✓ | ✗ | Slowness for envelope stacking |
| HWIDE | FLOAT(24) | ✓ | ✗ | Smoothing half-width for boxcar smoothing |
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon identifier for calibrated region |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch start time of signal window |
| ENDTIME | FLOAT(53) | ✓ | ✗ | Epoch end time of signal window |
| NOISE_START_TIME | FLOAT(53) | ✓ | ✗ | Epoch start time of noise window |
| NOISE_END_TIME | FLOAT(53) | ✓ | ✗ | Epoch end time of noise window |
| TMEAS | FLOAT(53) | ✓ | ✗ | Time of coda amplitude measurement |
| SHAPE_SPREADING | FLOAT(24) | ✓ | ✗ | Coda shape spreading factor |
| SHAPE_DECAY | FLOAT(24) | ✓ | ✗ | Coda shape attenuation decay factor |
| SHAPEDMIN | FLOAT(24) | ✓ | ✗ | Minimum 1-D calibration distance for coda decay and spreading |
| SHAPEDMAX | FLOAT(24) | ✓ | ✗ | Maximum 1-D calibration distance for coda decay and spreading |
| PEAK_VELOCITY | FLOAT(24) | ✓ | ✗ | Synthetic envelope peak velocity |
| VGDMIN | FLOAT(24) | ✓ | ✗ | Minimum 1-D calibration distance for peak velocity |
| VGDMAX | FLOAT(24) | ✓ | ✗ | Maximum 1-D calibration distance for peak velocity |
| PATH_COR_TYPE | VARCHAR2(8) | ✓ | ✗ | Path correction type (1D or 2D) |
| PATH_COR | FLOAT(24) | ✓ | ✗ | Path correction (log10) |
| SITE_COR | FLOAT(24) | ✓ | ✗ | Site correction (log10) |
| SITEUNIT | VARCHAR2(9) | ✓ | ✗ | Unit for site correction term |
| WMODEL_NAME | VARCHAR2(50) | ✓ | ✗ | Yield model name |
| YINTERCEPT | FLOAT(24) | ✓ | ✗ | Yield line fit intercept |
| YSLOPE | FLOAT(24) | ✓ | ✗ | Yield line fit slope |
| FFACTOR | FLOAT(24) | ✓ | ✗ | Yield F factor (log 10) |
| SRC_REGION | VARCHAR2(50) | ✓ | ✗ | Source region name |
| MBINTERCEPT | FLOAT(24) | ✓ | ✗ | mb line fit intercept |
| MBSLOPE | FLOAT(24) | ✓ | ✗ | mb line fit slope |
| MBSIGMA | FLOAT(24) | ✓ | ✗ | mb misfit for weighting |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### CODAMAG_OUTPUT
**Description**: The codamag_output table contains raw and corrected coda amp litudes for each station/channel/frequency band.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| AMPID | NUMBER(18) | ✓ | ✗ | Amplitude identifier |
| FLO | FLOAT(24) | ✓ | ✗ | Low corner freq for filter |
| FHI | FLOAT(24) | ✓ | ✗ | High corner freq for filter |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| DELTA | FLOAT(24) | ✓ | ✗ | Source-receiver distance |
| RAW_AMP | FLOAT(24) | ✓ | ✗ | Raw (uncorrected) Coda amplitude |
| UNCERTAINTY | FLOAT(24) | ✓ | ✗ | Uncertainty for Raw (uncorrected) Coda amplitude |
| NOISE_AMP | FLOAT(24) | ✓ | ✗ | Amplitude of noise window |
| AMPCOR | FLOAT(24) | ✓ | ✗ | Amplitude value corrected for path and site |
| AMP_WGT | FLOAT(24) | ✓ | ✗ | Calculated moment amplitude weight factor |
| MB_CODA | FLOAT(24) | ✓ | ✗ | Body coda wave magnitude value |
| YIELD | FLOAT(24) | ✓ | ✗ | Yield |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### CONTINUOUS_DATA_STATUS
**Description**: A table tracking the SOH indicators embedded in the CD1.1 Da ta Frame

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| STATUS_ID | NUMBER(18) | ✓ | ✗ | CD Data Status Identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| INDICATOR | VARCHAR2(64) | ✓ | ✗ | Status of Health Indicator from the CD1.1 Data Frame |
| START_DATE | DATE(7) | ✓ | ✗ | Initial time the indicator was enabled |
| END_DATE | DATE(7) | ✓ | ✗ | Last time for which the indicator was enabled |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DATAUSER
**Description**: The datauser table tracks authorized users of the Message an d Subscription Subsystems. Each user is identified by a (uni que) username and domain, which must match all e-mail header s. The priority column specifies the class of user, and serv icetime is the last time a request from the user was process ed. Priority and servicetime are considered when selecting t he order in which requests will be processed. The status can either be active or inactive.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| USERID | NUMBER(18) | ✓ | ✗ | Identifier for the user |
| POCID | NUMBER(18) | ✓ | ✗ | Point of contact identifier |
| USERNAME | VARCHAR2(24) | ✓ | ✗ | User name from the incoming subscription message |
| DOMAIN | VARCHAR2(48) | ✓ | ✗ | Domain name from the incoming subscription message |
| MSGTYPE | VARCHAR2(16) | ✓ | ✗ | Message type |
| USERSTATUS | VARCHAR2(24) | ✓ | ✗ | Status of this user |
| PRIORITY | NUMBER(2) | ✓ | ✗ | User's priority |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| EMAILLIMIT | NUMBER(8) | ✓ | ✗ | Maximum size of message (in bytes) that will be delivered via e-mail |
| SERVICETIME | FLOAT(53) | ✓ | ✗ | Last time a request from that user was serviced |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DA_INTERVAL
**Description**: The da_interval table defines units of processing for data a cquistion . The time, endtime, and name types indicate proce ssing times for a named object. The class type allows a sing le interval table to be used for different classes of object s.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| INTVLID | NUMBER(18) | ✓ | ✗ | Interval identifier |
| CLASS | VARCHAR2(16) | ✓ | ✗ | Type of interval |
| NAME | VARCHAR2(20) | ✓ | ✗ | Name of interval |
| TIME | FLOAT(53) | ✓ | ✗ | Starting time of data |
| ENDTIME | FLOAT(53) | ✓ | ✗ | Ending time of data |
| STATE | VARCHAR2(16) | ✓ | ✗ | Current processing state |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author of interval |
| PERCENT_AVAILABLE | FLOAT(53) | ✓ | ✗ | Percent of data available in interval |
| PROC_START_DATE | DATE(7) | ✓ | ✗ | Processing start date |
| PROC_END_DATE | DATE(7) | ✓ | ✗ | Processing stop date |
| MODDATE | DATE(7) | ✓ | ✗ | Time of last processing state change |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DA_REFSTA_LATENCY
**Description**: The da_refsta_latency table contains latency data for the re ference stations.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| LATENCY_ID | NUMBER(18) | ✓ | ✗ | Unique identifier for latency tables. |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code. |
| INTERVAL_START_TIME | DATE(7) | ✓ | ✗ | Start time of the interval. |
| INTERVAL_END_TIME | DATE(7) | ✓ | ✗ | End time of the interval. |
| MIN_LATENCY_SECS | FLOAT(53) | ✓ | ✗ | Minimum latency in seconds. |
| MAX_LATENCY_SECS | FLOAT(53) | ✓ | ✗ | Maximum latency in seconds. |
| TOTAL_SECS | FLOAT(53) | ✓ | ✗ | Total seconds of latency. |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Source/originator |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DA_REFSTA_SUMMARY
**Description**: Summary of expected percentage of data available for a refer ence station.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| SUMMARY_ID | NUMBER(18) | ✓ | ✗ | Unique identifier for summary tables. |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code. |
| INTERVAL_START_TIME | DATE(7) | ✓ | ✗ | Start time of the interval. |
| INTERVAL_END_TIME | DATE(7) | ✓ | ✗ | End time of the interval. |
| PERCENT | FLOAT(53) | ✓ | ✗ | Percentage of data available in wfdiscs. |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Source/originator |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DA_SITECHAN_LATENCY
**Description**: The da_sitechan_latency table contains latency data for the stations and channels.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| LATENCY_ID | NUMBER(18) | ✓ | ✗ | Unique identifier for latency tables. |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code. |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code. |
| INTERVAL_START_TIME | DATE(7) | ✓ | ✗ | Start time of the interval. |
| INTERVAL_END_TIME | DATE(7) | ✓ | ✗ | End time of the interval. |
| MIN_LATENCY_SECS | FLOAT(53) | ✓ | ✗ | Minimum latency in seconds. |
| MAX_LATENCY_SECS | FLOAT(53) | ✓ | ✗ | Maximum latency in seconds. |
| TOTAL_SECS | FLOAT(53) | ✓ | ✗ | Total seconds of latency. |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Source/originator |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DECONVOLUTION
**Description**: The deconvolution table provides some of the parameters nece ssary for deconvolution of the instrument response. The inst rument response information for a particular station at a ce rtain time is contained in the sensor and instrument table. The sensor and instrument tables provide the instrument resp onse, type (measured or theoretical), and units. Once the in strument response is removed it will be necessary to convert everything to the same unit.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| DECONID | NUMBER(18) | ✓ | ✗ | Deconvolution identifier |
| TYPE | VARCHAR2(16) | ✓ | ✗ | Decon type may be 'measured' or 'theoretical' |
| LOWCUTFRAC | FLOAT(24) | ✓ | ✗ | Low cut for cosine filter given as a fraction of lowcutfrac |
| LOWPASSFREQ | FLOAT(24) | ✓ | ✗ | Low cut for cosine filter given as a fraction of lowpassfreq |
| HIGHCUTFRAC | FLOAT(24) | ✓ | ✗ | High cut given as a fraction of Nyquist obtained from nominal sample rate |
| HIGHPASSFREQ | FLOAT(24) | ✓ | ✗ | High cut given as a fraction of Nyquist obtained from nominal sample rate |
| WATERLEVEL | FLOAT(24) | ✓ | ✗ | Limit for division (0.0 means do not apply waterlevel) |
| FINALUNITS | VARCHAR2(1) | ✓ | ✗ | Final units for the data once the instrument response has been removed (d, v, or a) |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DEFINING_OBSTYPES
**Description**: Defines and describes all valid observation types that can b e used as defining for the USNDC.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| OBSTYPE_ID | NUMBER(18) | ✓ | ✗ | Observation Type identifier |
| CLASS | VARCHAR2(16) | ✓ | ✗ | Defining Observation grouping or class |
| TYPE | VARCHAR2(10) | ✓ | ✗ | Defining Observation type |
| DESCRIPTION | VARCHAR2(4000) | ✓ | ✗ | Description of defining value |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | &nbsp; |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### DEFINING_RULES
**Description**: Provides the rules for when an observation can be defining a nd the appropriate default value to be assigned.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| RULE_ID | NUMBER(18) | ✓ | ✗ | Defining Rule Identifier |
| NET | VARCHAR2(8) | ✓ | ✗ | Unique network identifier |
| REFSTA | VARCHAR2(6) | ✓ | ✗ | Reference station for station members |
| SITE | VARCHAR2(6) | ✓ | ✗ | Individual site/station element |
| PHASE | VARCHAR2(8) | ✓ | ✗ | Phase restriction for the Defining Rule |
| OBSTYPE_ID | NUMBER(18) | ✓ | ✗ | Observation Type identifier |
| VALUE_ID | NUMBER(18) | ✓ | ✗ | Defining Value Identifier |
| ON_DATE | DATE(7) | ✓ | ✗ | Date the defining rule becomes enabled |
| OFF_DATE | DATE(7) | ✓ | ✗ | Date the defining rule becomes disabled |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | &nbsp; |
| PRIORITY | NUMBER(8) | ✓ | ✗ | Rule priority |
| COMMENTS | VARCHAR2(4000) | ✓ | ✗ | Comment text |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### DEFINING_VALUES
**Description**: Defines and describes all valid defining values that can be assigned to an observation type in the USNDC.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| VALUE_ID | NUMBER(18) | ✓ | ✗ | Defining Value Identifier |
| VALUE | VARCHAR2(1) | ✓ | ✗ | Defining value code |
| DESCRIPTION | VARCHAR2(4000) | ✓ | ✗ | Description of defining value |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | &nbsp; |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### DETECTION
**Description**: The detection table contains summary information about wavef orms.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| JDATE | NUMBER(8) | ✓ | ✗ | Julian date |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch time |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| BMTYP | VARCHAR2(4) | ✓ | ✗ | Beam type |
| SPROID | NUMBER(18) | ✓ | ✗ | Signal processor identifier |
| CFREQ | FLOAT(24) | ✓ | ✗ | Center frequency |
| SEAZ | FLOAT(24) | ✓ | ✗ | Observed azimuth |
| DELAZ | FLOAT(24) | ✓ | ✗ | Azimuth uncertainty |
| SLOW | FLOAT(24) | ✓ | ✗ | Observed slowness, seconds per kilometer (sec/km) |
| DELSLO | FLOAT(24) | ✓ | ✗ | Slowness uncertainty |
| SNR | FLOAT(24) | ✓ | ✗ | Signal-to-noise ratio |
| STAV | FLOAT(24) | ✓ | ✗ | Short-term average |
| FSTAT | FLOAT(24) | ✓ | ✗ | f-statistic |
| DELTIM | FLOAT(24) | ✓ | ✗ | Time uncertainty |
| BANDW | FLOAT(24) | ✓ | ✗ | Bandwidth |
| FKQUAL | NUMBER(4) | ✓ | ✗ | f-k quality |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DETECTION_THRESHOLD
**Description**: The detection_threshold table contains the calculated thresh old for the timeframe processed.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLUSTAID | NUMBER(18) | ✓ | ✗ | Cluster Station identifier |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| DETECTOR_TYPE | VARCHAR2(16) | ✓ | ✗ | Type of detector (SSD, NARGAR, etc.) |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch start time of threshold |
| ENDTIME | FLOAT(53) | ✓ | ✗ | Epoch end time of threshold |
| THRESHOLD | FLOAT(24) | ✓ | ✗ | Threshold values |
| NUM_DETECTIONS | NUMBER(9) | ✓ | ✗ | Number of detections |
| STA | VARCHAR2(6) | ✓ | ✗ | Station |
| PFA | FLOAT(24) | ✓ | ✗ | Probability of False Alarm |
| OVERLAP | NUMBER(9) | ✓ | ✗ | Overlap |
| CHANNEL_MASKING_THRESHOLD | FLOAT(24) | ✓ | ✗ | Channel Masking threshold |
| SSD_DIMENSION | NUMBER(5) | ✓ | ✗ | Subspace Dimension |
| DOF | FLOAT(24) | ✓ | ✗ | Degrees of freedom |
| DATA_MASKED | NUMBER(9) | ✓ | ✗ | Number of samples masked |
| TOTAL_DATA | NUMBER(9) | ✓ | ✗ | Total number of samples |
| DESCRIPT | VARCHAR2(100) | ✓ | ✗ | Description |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DISCRIMUSE
**Description**: The discrimuse table contains the use/nonuse of station data in discriminant voting. It identifies, for each station ass ociated to the origin, the use or non-use of that station's data in the discriminant vote for six different discriminant s. The votes are then combined to determine the overall even t classification (see the discrimvote table).

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| DISCRIMTYPE | VARCHAR2(10) | ✓ | ✗ | Discriminant type |
| STA | VARCHAR2(6) | ✓ | ✗ | Station |
| DISCRIM_FLAG | VARCHAR2(1) | ✓ | ✗ | Discriminant is used in event classification for the origin and station (T,F) |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DISCRIMVOTE
**Description**: The discrimvote table identifies the vote value for each of six discriminants (discrimtypes). These votes are combined t o determine the overall event classification. When the vote is overridden, it includes evaluator's comments.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| DISCRIMTYPE | VARCHAR2(10) | ✓ | ✗ | Discriminant type |
| STA | VARCHAR2(6) | ✓ | ✗ | Station |
| VOTE | VARCHAR2(1) | ✓ | ✗ | Overall vote for the discriminant factor |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| OVERRIDE | NUMBER(8) | ✓ | ✗ | Evaluator override vote |
| EVAL_COMMENT | VARCHAR2(22) | ✓ | ✗ | Evaluator comments on override |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DISCRIM_PARAM
**Description**: The discrim_param table contains group velocities for each p olyid and station.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon Identifier |
| AMPCOR_VERID | NUMBER(18) | ✓ | ✗ | amplitude correction version identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station name |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel where waveform was recorded |
| PARAMSETID | NUMBER(18) | ✓ | ✗ | id of parameter set |
| LOWCUTFRAC | FLOAT(24) | ✓ | ✗ | low frequency cut for instrument correction in Hertz |
| MINLOWPASSFREQ | FLOAT(24) | ✓ | ✗ | low frequency pass for instrument correction in Hertz |
| HIGHPASSFRAC | FLOAT(24) | ✓ | ✗ | high frequency pass for instrument correction in Hertz |
| HIGHCUTFRAC | FLOAT(24) | ✓ | ✗ | high frequency cut for instrument correction in Hertz |
| PNGV1 | FLOAT(24) | ✓ | ✗ | beginning group velocity in km/s for Pn phase |
| PNGV2 | FLOAT(24) | ✓ | ✗ | ending group velocity in km/s for Pn phase |
| PNINT | FLOAT(53) | ✓ | ✗ | intercept time in seconds for Pg phase |
| PGGV1 | FLOAT(24) | ✓ | ✗ | beginning group velocity in km/s for Pg phase |
| PGGV2 | FLOAT(24) | ✓ | ✗ | ending group velocity in km/s for Pg phase |
| PGINT | FLOAT(53) | ✓ | ✗ | intercept time in seconds for Pg phase |
| SNGV1 | FLOAT(24) | ✓ | ✗ | beginning group velocity in km/s for Sn phase |
| SNGV2 | FLOAT(24) | ✓ | ✗ | ending group velocity in km/s for Sn phase |
| SNINT | FLOAT(53) | ✓ | ✗ | intercept time in seconds for Sn phase |
| LGGV1 | FLOAT(24) | ✓ | ✗ | beginning group velocity in km/s for Lg phase |
| LGGV2 | FLOAT(24) | ✓ | ✗ | ending group velocity in km/s for Lg phase |
| LGINT | FLOAT(53) | ✓ | ✗ | intercept time in seconds for Lg phase |
| TFACTOR | FLOAT(24) | ✓ | ✗ | minimum number of cycles in the window needed to calculate an amplitude |
| TAPERWIDTH | FLOAT(24) | ✓ | ✗ | fraction of waveform to taper at each end |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DLMAN
**Description**: The dlman table keeps track of currently running DLMan insta nces. The column machine is the host on which this dlid runs (it may not run elsewhere). The column running indicates wh ether that DLMan is currently operational. The table also pr ovides the ports that this dlid is currently using to listen to other processes.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| DLID | NUMBER(18) | ✓ | ✗ | Diskloop manager identifier |
| MACHINE | VARCHAR2(32) | ✓ | ✗ | Machine name |
| RUNNING | VARCHAR2(1) | ✓ | ✗ | Dlman running = y/n |
| CONNMANPORT | NUMBER(6) | ✓ | ✗ | Connman port |
| CONTROLPORT | NUMBER(6) | ✓ | ✗ | Datacontrol port |
| ARCHIVEPORT | NUMBER(6) | ✓ | ✗ | Archiver port |
| FORWARDPORT | NUMBER(6) | ✓ | ✗ | Forwarder port |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### DOPPLER_DETECTION
**Description**: The doppler_detection table contains summary information abo ut waveforms.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| DOPPLERID | NUMBER(18) | ✓ | ✗ | Doppler identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| EVENT_TIME | FLOAT(53) | ✓ | ✗ | Epoch time |
| DURATION | FLOAT(24) | ✓ | ✗ | Duration of doppler shift window |
| SNR | FLOAT(24) | ✓ | ✗ | Signal-to-noise ratio |
| AZIMUTH | FLOAT(24) | ✓ | ✗ | Observed azimuth |
| ETYPE | VARCHAR2(7) | ✓ | ✗ | Event type |
| CFREQ | FLOAT(24) | ✓ | ✗ | Center frequency |
| RANGE_MINFREQ | FLOAT(24) | ✓ | ✗ | Detection range minimum frequency. |
| RANGE_MAXFREQ | FLOAT(24) | ✓ | ✗ | Detection range maximum frequency. |
| TRACE_MINFREQ | FLOAT(24) | ✓ | ✗ | Detection trace minimum frequency. |
| TRACE_MAXFREQ | FLOAT(24) | ✓ | ✗ | Detection trace maximum frequency. |
| USE_AS_REFERENCE_EVENT | VARCHAR2(1) | ✓ | ✗ | When set to &quot;y&quot;, use this event as a reference event for internal AFTAC station tuning process. |
| FILTER_STRING | VARCHAR2(2000) | ✓ | ✗ | Compact filter representation. |
| CONF | FLOAT(24) | ✓ | ✗ | Confidence |
| COMMENTS | VARCHAR2(4000) | ✓ | ✗ | Comment text |
| INTERNAL_COMMENTS | VARCHAR2(4000) | ✓ | ✗ | Comment made by an analyst to leave feedback/questions/observations and tie it to the event without it affecting the Doppler report. |
| ANALYST | VARCHAR2(32) | ✓ | ✗ | The analyst that created the event report |
| TIMESENT | FLOAT(53) | ✓ | ✗ | Time at which the event report was released |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Time at which the detector generated the event |

### ECM_CHAN_AMPLITUDE
**Description**: The ecm_chan_amplitude table contains time windows (start an d end times), raw amplitude, and MDAC for each orid, station , channel, phase and frequency bin. These measurements are c ombined according to the parameters of the discriminant bein g calculated.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station name |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel name |
| PHASE | VARCHAR2(8) | ✓ | ✗ | phase of interest |
| LFREQ | FLOAT(53) | ✓ | ✗ | low end of frequency bin used to filter measurement |
| HFREQ | FLOAT(53) | ✓ | ✗ | high end of frequency bin used to filter measurement |
| AMPCOR_VERID | NUMBER(18) | ✓ | ✗ | AmpCor version Identifier used in ECM Versioning |
| TIME | FLOAT(53) | ✓ | ✗ | time of reference event |
| ENDTIME | FLOAT(53) | ✓ | ✗ | end time of measurement window |
| AMPRAW | FLOAT(53) | ✓ | ✗ | actual amplitude measured |
| AMPMDAC | FLOAT(53) | ✓ | ✗ | Magnitude and Distance Amplitude Correction |
| AMPDAC | FLOAT(53) | ✓ | ✗ | Distance amplitude correction |
| AMPMAC | FLOAT(53) | ✓ | ✗ | Magnitude amplitude correction |
| NTIME | FLOAT(53) | ✓ | ✗ | start time of the noise window |
| NENDTIME | FLOAT(53) | ✓ | ✗ | end time of the noise window |
| SNR | FLOAT(53) | ✓ | ✗ | Signal-to-noise ratio |
| AMPDEF | VARCHAR2(1) | ✓ | ✗ | Defining flag for element amplitude measurement to be used for station/network average |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| COMMENTS | VARCHAR2(4000) | ✓ | ✗ | comment text |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ECM_CONSTANT
**Description**: The ecm_constant table contains calibration constants for EC M. This table is for lone constants that are not dependant on which channel, phase, station, or polyid being looked at.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| NAME | VARCHAR2(30) | ✓ | ✗ | Name of constant of interest |
| VALUE | FLOAT(53) | ✓ | ✗ | Value of this constant |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ECM_COV
**Description**: The ecm_cov table contains a covariance for each polyid, sou rce type, and pair of discriminants. All records with the s ame polyid and source type will combine to define a single c ovariance matrix used for combining discriminants.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon Identifier |
| COV_VERID | NUMBER(18) | ✓ | ✗ | version identifier of the covariance matrix |
| SOURCE_TYPE | VARCHAR2(15) | ✓ | ✗ | source type of interest |
| DISCRIM_NAME_1 | VARCHAR2(10) | ✓ | ✗ | first discriminant of interest |
| DISCRIM_NAME_2 | VARCHAR2(10) | ✓ | ✗ | second discriminant of interest |
| COVARIANCE | FLOAT(53) | ✓ | ✗ | covariance of these two discriminants for this source type within this region of interest |
| MEAN_1 | FLOAT(53) | ✓ | ✗ | mean value of the first discriminant |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| COMMENTS | VARCHAR2(4000) | ✓ | ✗ | comment text |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ECM_DISCRIMINANTS
**Description**: The ecm_discriminants table contains p-values for each evid and discriminant name.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | id of the origin |
| DISCRIM_NAME | VARCHAR2(15) | ✓ | ✗ | discriminant of interest |
| COV_VERID | NUMBER(18) | ✓ | ✗ | version identifier of the covariance matrix |
| DISCRIM_P_VALUE | FLOAT(53) | ✓ | ✗ | p-value of this discriminant for this reference event |
| DISCRIM_DEF | VARCHAR2(1) | ✓ | ✗ | defining flag for this discriminant |
| EXPLANATION | VARCHAR2(4000) | ✓ | ✗ | text explanation of how this discriminant was calculated |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ECM_EVENT_RESULTS
**Description**: The ecm_event_results table contains the classification for each event.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | id of the origin |
| EVID | NUMBER(18) | ✓ | ✗ | id of the event of interest |
| COV_VERID | NUMBER(18) | ✓ | ✗ | version identifier of the covariance matrix |
| RDA_VERID | NUMBER(18) | ✓ | ✗ | version identifier of the RDA |
| CLASS_TYPE | VARCHAR2(15) | ✓ | ✗ | source type as determined by ECM |
| CLASS_TYPE_OVRD | VARCHAR2(15) | ✓ | ✗ | source type as overridden by an analyst |
| COMMENTS | VARCHAR2(4000) | ✓ | ✗ | comment text |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ECM_REF_CHAN_AMPLITUDE
**Description**: The ecm_ref_chan_amplitude table contains reference time win dows (start and end times), raw amplitude, and MDAC for each evid, station, channel, phase and frequency bin. These meas urements were combined according to the parameters of the di scriminant that was calculated.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| EVID | NUMBER(18) | ✓ | ✗ | Event identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station name |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel name |
| PHASE | VARCHAR2(8) | ✓ | ✗ | phase of interest |
| LFREQ | FLOAT(53) | ✓ | ✗ | low end of frequency bin used to filter measurement |
| HFREQ | FLOAT(53) | ✓ | ✗ | high end of frequency bin used to filter measurement |
| AMPCOR_VERID | NUMBER(18) | ✓ | ✗ | AmpCor version Identifier used in ECM Versioning |
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon Identifier |
| DELTA | FLOAT(24) | ✓ | ✗ | Source-receiver distance |
| TIME | FLOAT(53) | ✓ | ✗ | time of reference event |
| ENDTIME | FLOAT(53) | ✓ | ✗ | end time of measurement window |
| AMPRAW | FLOAT(53) | ✓ | ✗ | actual amplitude measured |
| AMPMDAC | FLOAT(53) | ✓ | ✗ | Magnitude and Distance Amplitude Correction |
| AMPDAC | FLOAT(53) | ✓ | ✗ | Distance amplitude correction |
| AMPMAC | FLOAT(53) | ✓ | ✗ | Magnitude amplitude correction |
| NTIME | FLOAT(53) | ✓ | ✗ | start time of the noise window |
| NENDTIME | FLOAT(53) | ✓ | ✗ | end time of the noise window |
| SNR | FLOAT(53) | ✓ | ✗ | Signal-to-noise ratio |
| AMPDEF | VARCHAR2(1) | ✓ | ✗ | Defining flag for element amplitude measurement to be used for station/network average |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| COMMENTS | VARCHAR2(4000) | ✓ | ✗ | comment text |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ECM_REF_DISCRIM
**Description**: The ecm_ref_discrim table contains a p-value for each refid and discriminant. The refid relates to a specific reference event in the ecm_ref_event.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| EVID | NUMBER(18) | ✓ | ✗ | Event Identifier |
| COV_VERID | NUMBER(18) | ✓ | ✗ | version identifier of the covariance matrix |
| DISCRIM_NAME | VARCHAR2(15) | ✓ | ✗ | discriminant of interest |
| DISCRIM_P_VALUE | FLOAT(53) | ✓ | ✗ | p-value of this discriminant for this reference event |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ECM_REF_EVENT
**Description**: The ecm_ref_event table contains event data for each event u sed to calibrate the ECM.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| EVID | NUMBER(18) | ✓ | ✗ | Event Identifier |
| TIME | FLOAT(53) | ✓ | ✗ | time of reference event |
| LAT | FLOAT(53) | ✓ | ✗ | Latitude |
| LON | FLOAT(53) | ✓ | ✗ | Longitude |
| DEPTH | FLOAT(24) | ✓ | ✗ | depth of reference event |
| MB | FLOAT(24) | ✓ | ✗ | body wave magnitude of reference event |
| MS | FLOAT(24) | ✓ | ✗ | surface wave magnitude of reference event |
| MW | FLOAT(24) | ✓ | ✗ | moment magnitude of reference event |
| SOURCE_TYPE | VARCHAR2(7) | ✓ | ✗ | source type of interest |
| SUB_TYPE | VARCHAR2(10) | ✓ | ✗ | source sub-type of reference event |
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon Identifier |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ECM_REGION_PREF_VERSION
**Description**: The ecm_region_pref_version table contains _________________ _______

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon Identifier |
| COV_VERID | NUMBER(18) | ✓ | ✗ | version identifier of the covariance matrix |
| RDA_VERID | NUMBER(18) | ✓ | ✗ | version identifier of the RDA |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| COMMENTS | VARCHAR2(4000) | ✓ | ✗ | comment text |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ECM_SOURCES
**Description**: The ecm_sources table contains aggregate p-values and poster iori probabilities for each evid and source type.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | id of the origin |
| SOURCE_TYPE | VARCHAR2(15) | ✓ | ✗ | source type of interest |
| COV_VERID | NUMBER(18) | ✓ | ✗ | version identifier of the covariance matrix |
| RDA_VERID | NUMBER(18) | ✓ | ✗ | rda version identifier |
| POP_MEM | FLOAT(53) | ✓ | ✗ | p-value for this source type |
| CON_PROB | FLOAT(53) | ✓ | ✗ | posteriori probability |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ECM_STA_PREF_VERSION
**Description**: The ecm_sta_pref_version table contains ____________________ ____

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon Identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station Code |
| AMPCOR_VERID | NUMBER(18) | ✓ | ✗ | amplitude correction version identifier |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| COMMENTS | VARCHAR2(4000) | ✓ | ✗ | comment text |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ENVELOPE_CONTRIBUTION
**Description**: The envelope_contribution table contains information as to w hich frequency bands are defining or nondefining for coda ma gnitude calculation. Bands may be set defining or nondefinin g either automatically by DFX or manually by an analyst.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FLO | FLOAT(24) | ✓ | ✗ | Low corner freq for filter |
| FHI | FLOAT(24) | ✓ | ✗ | High corner freq for filter |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| AMPDEF | VARCHAR2(1) | ✓ | ✗ | d or n flag indicating if station/element is included (d,D) or excluded (n,N) from coda magnitude processing |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### EVENT
**Description**: The event table contains a list of events. Multiple origins may be defined for any one event. The column prefor points t o the preferred origin.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| EVID | NUMBER(18) | ✓ | ✗ | Event identifier |
| EVNAME | VARCHAR2(32) | ✓ | ✗ | Event name |
| PREFOR | NUMBER(18) | ✓ | ✗ | Preferred origin |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Source/originator |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### EVENT_CONTROL
**Description**: The event_control table contains event location and magnitud e control parameters. This information acts as an archive of the specific user-defined controls that were used to determ ine the location and magnitude of a given orid. The table al so includes two measurement columns (cov_sm_axes and cov_dep th_time) that allow the coverage ellipse to be determined fr om the confidence ellipse axes.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | Origin identification |
| EVID | NUMBER(18) | ✓ | ✗ | Event identification |
| PREFER_LOC | VARCHAR2(1) | ✓ | ✗ | Preferred location identifier (S, F, R) |
| CONSTRAIN_OT | NUMBER(1) | ✓ | ✗ | Flag to constrain origin time |
| CONSTRAIN_LATLON | NUMBER(1) | ✓ | ✗ | Flag to constrain latitude/longitude |
| CONSTRAIN_DEPTH | NUMBER(1) | ✓ | ✗ | Flag to constrain depth |
| SRC_DPNT_CORR | NUMBER(2) | ✓ | ✗ | Source-dependent correction code |
| LOC_SRC_DPNT_REG | VARCHAR2(15) | ✓ | ✗ | Region name of source-dependent location correction |
| LOC_SDV_SCREEN | NUMBER(1) | ✓ | ✗ | Flag to ignore large data residuals in location |
| LOC_SDV_MULT | FLOAT(24) | ✓ | ✗ | Location large residual multiplier factor |
| LOC_ALPHA_ONLY | NUMBER(1) | ✓ | ✗ | Flag to use only primary stations in location |
| LOC_ALL_STAS | NUMBER(1) | ✓ | ✗ | Flag to use only stations with src_dpnt_corr |
| LOC_DIST_VARWGT | NUMBER(1) | ✓ | ✗ | Flag to use distance variance weighting |
| LOC_USER_VARWGT | FLOAT(24) | ✓ | ✗ | User-defined variance weighting |
| MAG_SRC_DPNT_REG | VARCHAR2(15) | ✓ | ✗ | Region name of source-dependent magnitude correction |
| MAG_SDV_SCREEN | NUMBER(1) | ✓ | ✗ | Flag to ignore large magnitude data residuals |
| MAG_SDV_MULT | FLOAT(24) | ✓ | ✗ | Magnitude large residual multiplier factor |
| MAG_ALPHA_ONLY | NUMBER(1) | ✓ | ✗ | Flag to limit station net used in magnitude |
| MAG_ALL_STAS | NUMBER(1) | ✓ | ✗ | Flag to use only primary stations in magnitude |
| MB_MIN_DIST | FLOAT(24) | ✓ | ✗ | Minimum distance (degrees) for mb |
| MB_MAX_DIST | FLOAT(24) | ✓ | ✗ | Maximum distance (degrees) for mb |
| MMODEL | VARCHAR2(15) | ✓ | ✗ | Network magnitude model |
| COV_SM_AXES | FLOAT(24) | ✓ | ✗ | Coverage ellipse semi-axes conversion factor |
| COV_DEPTH_TIME | FLOAT(24) | ✓ | ✗ | Coverage ellipse depth/time conversion factor |
| OBS_CORR_METHOD | NUMBER(1) | ✓ | ✗ | Observed Correlation Method |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### EVENT_CORRELATION
**Description**: The event_Correlation table containts correlations between s ource events in the NDC operational database to reference ev ents in the NDC archive databases for time periods as great as 15 years.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CORR_ID | NUMBER(18) | ✓ | ✗ | Correlation Identifier |
| SOURCE_ORID | NUMBER(18) | ✓ | ✗ | The source origin used in the event correlation. |
| SOURCE_EVID | NUMBER(18) | ✓ | ✗ | The source event used in the event correlation. |
| SOURCE_STARTTIME | FLOAT(53) | ✓ | ✗ | The start time of the source waveform segment used for correlation. |
| SOURCE_SECS | FLOAT(53) | ✓ | ✗ | The length of the source waveform in seconds used for correlation. |
| REFERENCE_ORID | NUMBER(18) | ✓ | ✗ | The reference origin for this correlation from the archive database. |
| REFERENCE_EVID | NUMBER(18) | ✓ | ✗ | The reference event for this correlation from the archive database. |
| REFERENCE_STARTTIME | FLOAT(53) | ✓ | ✗ | The start time of the reference waveform segment used for correlation. |
| REFERENCE_SECS | FLOAT(53) | ✓ | ✗ | The length of the reference waveform in seconds used for correlation. |
| STA | VARCHAR2(6) | ✓ | ✗ | Station identifier |
| FILTER_STRING | VARCHAR2(2000) | ✓ | ✗ | Compact filter representation used as parameter to filter_data_by_string module. |
| NUM_CHAN | NUMBER(9) | ✓ | ✗ | Number of channels in CHAN_LIST |
| CHAN_LIST | VARCHAR2(2000) | ✓ | ✗ | List of channels used for array correlation |
| CORR_COEF | FLOAT(53) | ✓ | ✗ | Correlation coefficient used in this correlation calculation. |
| CORR_TIME | FLOAT(53) | ✓ | ✗ | Correlation time of event. |
| SCAN_TYPE | VARCHAR2(32) | ✓ | ✗ | Correlation Scan type: AUTO, USER, or REF. |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author of this correlation. |
| MODDATE | DATE(7) | ✓ | ✗ | Modification Date. |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date. |

### EVENT_QUALITY
**Description**: The event_quality table holds the event quality attributes t hat are calculated by various processes such as EvLoc, ARS, and GAConflict using the Event Quality Generator.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| EQID | NUMBER(18) | ✓ | ✗ | Event quality identifier |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| EVQUAL | FLOAT(24) | ✓ | ✗ | Event quality |
| NETPROB | FLOAT(24) | ✓ | ✗ | Network probability |
| DETPROB | FLOAT(24) | ✓ | ✗ | Detection probability |
| HISTPROB | FLOAT(24) | ✓ | ✗ | Historic probability |
| NNDEF | FLOAT(24) | ✓ | ✗ | Normalized number of defining phases |
| NSMAJAX | FLOAT(24) | ✓ | ✗ | Normalized semi-major axis of error ellipse |
| NDELTA_STA | FLOAT(24) | ✓ | ✗ | Normalized distance to the closest station |
| NTIMERES | FLOAT(24) | ✓ | ✗ | Normalized time residual |
| NAZRES | FLOAT(24) | ✓ | ✗ | Normalized azimuth residual |
| NSLORES | FLOAT(24) | ✓ | ✗ | Normalized slowness residual |
| NAMPRES | FLOAT(24) | ✓ | ✗ | Normalized amplitude residual |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FEEDBACK
**Description**: The feedback table contains analyst feedback from one analys t regarding a discrepancy made by another analyst' work in t he Analyst Review System (ARS).

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FEEDBACK_ID | NUMBER(18) | ✓ | ✗ | Feedback Identifier |
| EVID | NUMBER(18) | ✓ | ✗ | Event Identifier |
| ORID | NUMBER(18) | ✓ | ✗ | Origin Identifier |
| EVENT_TIME | FLOAT(53) | ✓ | ✗ | Epoch time that the event occurred. |
| TITLE | VARCHAR2(64) | ✓ | ✗ | Feedback title |
| ANALYST | VARCHAR2(32) | ✓ | ✗ | The targeted analyst the feedback pertains to. |
| ACCOUNT | VARCHAR2(15) | ✓ | ✗ | Pipeline account that the analyst is receiving feedback for. |
| FEEDBACK_ANALYST | VARCHAR2(32) | ✓ | ✗ | The original analyst of the event being reviewed. |
| FEEDBACK_ACCOUNT | VARCHAR2(15) | ✓ | ✗ | Pipeline account from which the analyst is receiving feedback. |
| RESPONSE | VARCHAR2(4000) | ✓ | ✗ | This is the response by the analyst to the given feedback. If the feedback is rejected, this is where the reason for rejection should be documented. Rejection is used to allow accurate trending of fe edback |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | The analyst creating the feedback |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FEEDBACK_CATAFFILIATION
**Description**: The feedback_cataffiliation contains foregin keys to the fee dback table and feedback_categories table to assign categori cal affiliation(s) to each feedback.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FBAFFILIATION_ID | NUMBER(18) | ✓ | ✗ | Feedback Affiliation Identifier. |
| FEEDBACK_ID | NUMBER(18) | ✓ | ✗ | Feedback Identifier |
| FBCATEGORY_ID | NUMBER(18) | ✓ | ✗ | Feedback Category Identifier |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | The analyst creating the feedback. |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FEEDBACK_CATEGORIES
**Description**: The feedback_categories table contains descriptions of each feedback category referenced by the feedback_cataffiliation table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FBCATEGORY_ID | NUMBER(18) | ✓ | ✗ | Feedback Category Identifier |
| TITLE | VARCHAR2(64) | ✓ | ✗ | Short description/title of the feedback category |
| DESCRIPTION | VARCHAR2(4000) | ✓ | ✗ | Detailed description of the feedback category |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | The analyst creating the feedback. |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FEEDBACK_SCREENSHOTS
**Description**: The feedback_screenshots table contains image files related to feedback entries.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FBSCREENSHOT_ID | NUMBER(18) | ✓ | ✗ | Feedback Screenshot Identifier |
| FEEDBACK_ID | NUMBER(18) | ✓ | ✗ | Feedback Identifier |
| TITLE | VARCHAR2(64) | ✓ | ✗ | Short description/title of the screenshot |
| DESCRIPTION | VARCHAR2(4000) | ✓ | ✗ | Detailed description of the screenshot |
| TYPE | VARCHAR2(10) | ✓ | ✗ | Screenshot image file type (Initial allowable types (jpg, jpeg, png)) |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | The analyst creating the feedback. |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FEEDBACK_STATE
**Description**: The feedback_state table contains one or more states a feedb ack is currently in or has formerly been in. A Feedback entr y can only be in one state at a time, such as saved or rejec ted. As a feedback progresses through its lifecycle, it will have more than one state per feedback entry, and the latest one entered in this table will always be the current state.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FBSTATE_ID | NUMBER(18) | ✓ | ✗ | Feedback State Identifier |
| FEEDBACK_ID | NUMBER(18) | ✓ | ✗ | Feedback Identifier |
| FBSTATECATEGORY_ID | NUMBER(18) | ✓ | ✗ | Feedback State Category Identifier |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | The analyst creating the feedback. |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FEEDBACK_STATE_CATEGORIES
**Description**: The feedback_state_category contains descriptions of the var ious states a feedback record can be in such as saved or rej ected.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FBSTATECATEGORY_ID | NUMBER(18) | ✓ | ✗ | Feedback State Category Identifier |
| TITLE | VARCHAR2(64) | ✓ | ✗ | Short description/title of the feedback state category |
| DESCRIPTION | VARCHAR2(4000) | ✓ | ✗ | Detailed description of the feedback state category |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | The analyst creating the feedback state category. |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FILTER
**Description**: The filter table will contain the core information needed to identify filters. The attributes in this table will be high ly indexed for fast searching. The attributes will allow app lication to quickly access enough information to 1) determin e the type of filter so that an application can branch accor dingly to efficiently handle loading or 2) determine uniquen ess when assessing if a filter does or does not exist.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FILTERID | NUMBER(18) | ✓ | ✗ | Identifier for a filter or filter collection. |
| FILTER_METHOD | VARCHAR2(2) | ✓ | ✗ | Filter algorithm family. [Cascade, AR, Butterworth, Phase_Matched, Digital, Dynamic, etc.] |
| FILTER_STRING | VARCHAR2(2000) | ✓ | ✗ | Compact filter representation used as parameter to filter_data_by_string module. |
| FILTER_HASH | VARCHAR2(2000) | ✓ | ✗ | Standardized filter specification, formatted for uniqueness checking and fast access. |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date. |

### FILTER_COEFFICIENTS
**Description**: The filter_coefficients table contains a collection of doubl e precision coefficients for a filter. For the persistent pa rameters bundle, the filter_coefficients table will be used to store numerator and denominator coefficients for a coeffi cient configured filter, identified by a parent record in th e filter table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FILTERID | NUMBER(18) | ✓ | ✗ | Filter identifier |
| VALUE_NAME | VARCHAR2(48) | ✓ | ✗ | Attribute name (e.g. numerator_coeff) |
| COL_SEQ | NUMBER(9) | ✓ | ✗ | collection sequence/order |
| D_VALUE | FLOAT(53) | ✓ | ✗ | Double precision coefficient value |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FILTER_GROUP
**Description**: The filter_group table is used to link together the individu al filters of a compound filter. The parent filter record of a compound filter will have a compound_filter indicator val ue of 'Y' and may have a filter method of 'Cascade' or 'AR'. The filter_group table will contain one record for each fil ter in the compound filter group, all sharing a common paren t filter record. For Flexibility, the key to the record is p arent_filterid-child_filterid-child_sequence, to allow compl ex compound filters to use a filter more than once.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| PARENT_FILTERID | NUMBER(18) | ✓ | ✗ | Identifier for a collection or group of filters. |
| CHILD_FILTERID | NUMBER(18) | ✓ | ✗ | Identifier for a simple / single filter. |
| CHILD_SEQUENCE | NUMBER(9) | ✓ | ✗ | Order that the child filter should be applied. |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### FILTER_VALUES_DOUBLE
**Description**: The filter_values_double table will store filter parameters and metadata (float values). Each record will contain only o ne piece of information. Each filter type will store only th ose pieces of information that are pertinent to that filter type. A butterworth filter will have fhi and flo attribute r ecords while digital filters may have num_numerator_coeffs o r compute_time_shift attributes.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FILTERID | NUMBER(18) | ✓ | ✗ | Filter identifier |
| VALUE_NAME | VARCHAR2(48) | ✓ | ✗ | Attribute name, (e.g. fhi, flo) |
| D_VALUE | FLOAT(53) | ✓ | ✗ | Double precision value |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FILTER_VALUES_INTEGER
**Description**: The filter_values_double table will store filter parameters and metadata (integer values). Each record will contain only one piece of information. Each filter type will store only those pieces of information that are pertinent to that filte r type. A butterworth filter will have fhi and flo attribute records while digital filters may have num_numerator_coeffs or compute_time_shift attributes.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FILTERID | NUMBER(18) | ✓ | ✗ | Filter identifier |
| VALUE_NAME | VARCHAR2(48) | ✓ | ✗ | Attribute name, (e.g. fhi, flo) |
| I_VALUE | NUMBER(18) | ✓ | ✗ | Integer value. |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FILTER_VALUES_STRING
**Description**: The filter_values_string table will store filter parameters and metadata (string values). Each record will contain only one piece of information. Each filter type will store only those pieces of information that are pertinent to that filte r type. A butterworth filter will have fhi and flo attribute records while digital filters may have num_numerator_coeffs or compute_time_shift attributes.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FILTERID | NUMBER(18) | ✓ | ✗ | Filter identifier |
| VALUE_NAME | VARCHAR2(48) | ✓ | ✗ | Attribute name, (e.g. fhi, flo) |
| S_VALUE | VARCHAR2(1024) | ✓ | ✗ | String value |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FK_PROCESSING
**Description**: The fk_processing table contains identifiers to link paramet ers for fk processing. It provides an override of the defaul t processing for a station and phase. This override is speci fied on a per arrival basis.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| PROCID | NUMBER(18) | ✓ | ✗ | ID number of a set of waveform processing parameters |
| LEAD | FLOAT(24) | ✓ | ✗ | Number of seconds before phase to include in processing |
| LAG | FLOAT(24) | ✓ | ✗ | Number of seconds after phase to include in processing |
| FKFHI | FLOAT(24) | ✓ | ✗ | FK fhi value |
| FKFLO | FLOAT(24) | ✓ | ✗ | FK flo value |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FTPFAILED
**Description**: The ftpfailed table facilitates ftp retrieval and the placem ent of data messages between contributing systems.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| MSGID | NUMBER(18) | ✓ | ✗ | Message identifier |
| FTP_ADDRESS | VARCHAR2(64) | ✓ | ✗ | ftp address for auxilary data |
| NUMFAILEDATTEMPT | NUMBER(2) | ✓ | ✗ | Number of failed attempts |
| LASTFAILEDTIME | FLOAT(53) | ✓ | ✗ | Time of most recent attempt |
| FTPSTATUS | VARCHAR2(8) | ✓ | ✗ | Status of ftp attempt (retry or failed) |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### FTPLOGIN
**Description**: The ftplogin table is used by the auxiliary data retrieval s ystem to obtain data via ftp from auxiliary stations.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FTP_ADDRESS | VARCHAR2(64) | ✓ | ✗ | ftp address for auxiliary data |
| USERNAME | VARCHAR2(24) | ✓ | ✗ | User name for ftp access |
| PASSWORD | VARCHAR2(16) | ✓ | ✗ | User password for ftp access |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### GA_TAG
**Description**: The ga_tag table contains information on the use of arrivals and origins in the GA application.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| OBJTYPE | VARCHAR2(1) | ✓ | ✗ | Type of identifier (a for arrival, o for origin) |
| ID | NUMBER(18) | ✓ | ✗ | Identification number (arid or orid) |
| PROCESS_STATE | VARCHAR2(20) | ✓ | ✗ | Use of arid or orid |
| LAT | FLOAT(24) | ✓ | ✗ | Latitude of origin |
| LON | FLOAT(24) | ✓ | ✗ | Longitude of origin |
| TIME | FLOAT(53) | ✓ | ✗ | Time of origin |
| EVID_REJECT | NUMBER(18) | ✓ | ✗ | Evid of origin arrival was rejected from |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### GREGION
**Description**: The gregion table contains geographic region numbers and the ir equivalent descriptions.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| GRN | NUMBER(8) | ✓ | ✗ | Geographic region number |
| GRNAME | VARCHAR2(40) | ✓ | ✗ | Geographic region name |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### HISTORIC_INFO_CYLINDER
**Description**: The historic_info_cylinder table is used to describe the cyl inder (ga_grid) in a shell.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| HISTORIC_INFO_CYLINDER_ID | NUMBER(18) | ✓ | ✗ | Historic information cylinder identifier |
| LAT | FLOAT(53) | ✓ | ✗ | Estimated latitude of cylinder |
| LON | FLOAT(53) | ✓ | ✗ | Estimated longitude of cylinder |
| RADIUS | FLOAT(24) | ✓ | ✗ | Radius of cylinder |
| DEPTH | FLOAT(24) | ✓ | ✗ | Estimated depth of the cylinder |
| LOWER_DEPTH | FLOAT(24) | ✓ | ✗ | Lower depth of cylinder |
| UPPER_DEPTH | FLOAT(24) | ✓ | ✗ | Upper depth of cylinder |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### HISTORIC_INFO_SHELL
**Description**: The historic_info_shell table is used to describe the shell containing cylinders for specific station and phase.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| HISTORIC_INFO_SHELL_ID | NUMBER(18) | ✓ | ✗ | Historic information shell identifier |
| ALGORITHM_ID | NUMBER(18) | ✓ | ✗ | Algorithm identifier |
| LAT | FLOAT(53) | ✓ | ✗ | Estimated latitude of the shell |
| LON | FLOAT(53) | ✓ | ✗ | Estimated longitude of the shell |
| INNER_RADIUS | FLOAT(24) | ✓ | ✗ | Radius of inner shell |
| OUTER_RADIUS | FLOAT(24) | ✓ | ✗ | Radius of outer shell |
| DEPTH | FLOAT(24) | ✓ | ✗ | Estimated depth |
| LOWER_DEPTH | FLOAT(24) | ✓ | ✗ | Lower depth of shell |
| UPPER_DEPTH | FLOAT(24) | ✓ | ✗ | Upper depth of shell |
| MIN_AZIMUTH | FLOAT(24) | ✓ | ✗ | Minimum observed azimuth |
| MAX_AZIMUTH | FLOAT(24) | ✓ | ✗ | Maximum observed azimuth |
| REFSTA | VARCHAR2(6) | ✓ | ✗ | Reference station |
| PHASE | VARCHAR2(8) | ✓ | ✗ | Phase |
| THRESHOLD | FLOAT(24) | ✓ | ✗ | Magnitude detection threshold |
| UNCERTAINTY | FLOAT(24) | ✓ | ✗ | Uncertainty estimate of magnitude threshold |
| RELIABILITY | FLOAT(24) | ✓ | ✗ | Estimate based on percent of events observed |
| NUM_OBSERVATIONS | NUMBER(9) | ✓ | ✗ | Number of observations |
| PROCESSING_MODE | NUMBER(2) | ✓ | ✗ | Defines the type of processing used to determine the shell |
| ON_DATE | DATE(7) | ✓ | ✗ | The date the historic information shell first became active or was created |
| OFF_DATE | DATE(7) | ✓ | ✗ | The date the historic information shell was removed from the system or made obsolete |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### HISTORIC_INFO_STA_PHASE
**Description**: The historic_info_sta_phase table describes the station and phase information for a given time used to compute the histo ric cylinders and shells.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| HISTORIC_INFO_STA_PHASE_ID | NUMBER(18) | ✓ | ✗ | Historic information for stations and phases identifier |
| HISTORIC_INFO_CYLINDER_ID | NUMBER(18) | ✓ | ✗ | Historic information cylinder identifier |
| ALGORITHM_ID | NUMBER(18) | ✓ | ✗ | Algorithm identifier |
| REFSTA | VARCHAR2(6) | ✓ | ✗ | Reference station |
| PHASE | VARCHAR2(8) | ✓ | ✗ | Phase |
| THRESHOLD | FLOAT(24) | ✓ | ✗ | Magnitude detection threshold |
| UNCERTAINTY | FLOAT(24) | ✓ | ✗ | Uncertainty estimate of magnitude threshold |
| RELIABILITY | FLOAT(24) | ✓ | ✗ | Estimate based on percent of events observed |
| NUM_OBSERVATIONS | NUMBER(9) | ✓ | ✗ | Number of observations |
| PROCESSING_MODE | NUMBER(2) | ✓ | ✗ | Defines the type of processing used for the station/phase pair |
| ON_DATE | DATE(7) | ✓ | ✗ | The date the historic information station and phase first became active or was created |
| OFF_DATE | DATE(7) | ✓ | ✗ | The date the historic information station and phase was removed from the sysem or made obsolete |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### HYDRO_ARRIVAL
**Description**: The hydro_arrival table contains hydroacoustic arrival infor mation such as duration and the crossing point lag of the si gnal, autocorrelation bubble pulse frequency, autocovariance peak ratio (rt), cepstrum bubble pulse, bubble pulse amplit ude versus root mean square (rms), filter ratio, normalized amplitude, sensor yield, and sensor yield error.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station |
| DURONSET | FLOAT(53) | ✓ | ✗ | Duration onset time |
| DUREND | FLOAT(53) | ✓ | ✗ | Duration end time |
| ONSET_TIME | FLOAT(53) | ✓ | ✗ | Estimated onset time of signal |
| TERMINATION_TIME | FLOAT(53) | ✓ | ✗ | Estimated termination time of signal |
| CPLAG | FLOAT(24) | ✓ | ✗ | Crossing point lag of the signal |
| BPFRQAC | FLOAT(24) | ✓ | ✗ | Autocorrelation bubble pulse |
| RT | FLOAT(24) | ✓ | ✗ | Autocovariance peak value |
| BPFRQCEP | FLOAT(24) | ✓ | ✗ | Cepstrum bubble pulse |
| RMS | FLOAT(24) | ✓ | ✗ | The rms amplitude from autocorrelation |
| FLT_RTO | FLOAT(24) | ✓ | ✗ | Filter ratio |
| NORMAMP | FLOAT(24) | ✓ | ✗ | Normalized amplitude |
| AMPCORCLIP | FLOAT(24) | ✓ | ✗ | Correction to raw amplitude for clipping |
| AMPCORDIST | FLOAT(24) | ✓ | ✗ | Correction to raw amplitude for distance |
| AMPCORDEPTH | FLOAT(24) | ✓ | ✗ | Correction to raw amp for depth |
| YIELD | FLOAT(24) | ✓ | ✗ | Sensor yield |
| YLDERR | FLOAT(24) | ✓ | ✗ | Sensor yield error |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### HYDRO_ARR_GROUP
**Description**: The hydro_arr_group table contains hydroacoustic arrival-bas ed estimates of slowness and azimuth.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| HYDRO_ID | NUMBER(18) | ✓ | ✗ | Hydro-arrival-group identifier |
| AZ1 | FLOAT(24) | ✓ | ✗ | Azimuth estimated from lag times |
| AZ2 | FLOAT(24) | ✓ | ✗ | Second possible azimuth (2 arrivals) |
| SLOW | FLOAT(24) | ✓ | ✗ | Slowness (s/km) |
| DELAZ | FLOAT(24) | ✓ | ✗ | Azimuth uncertainty |
| NHYDARR | NUMBER(4) | ✓ | ✗ | Number of arrivals in hydro-arrival-group |
| NET | VARCHAR2(8) | ✓ | ✗ | Hydro network name |
| HYD_GRP_PHASE | VARCHAR2(8) | ✓ | ✗ | Hydro-arrival-group phase |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### HYDRO_ASSOC
**Description**: The hydro_assoc table contains the azimuth contribution info rmation for an arrival that is connected to a particular hyd ro arrival group.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| HYDRO_ID | NUMBER(18) | ✓ | ✗ | Hydro-arrival-group identifier |
| AZCONTRIB | VARCHAR2(1) | ✓ | ✗ | Azimuth contribution flag (y or n) |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### HYDRO_ORIGIN
**Description**: The hydro_origin table contains a summary of AFTAC-specific hydroacoustic origin information such as Type of origin loca tion, determined from: Seismic system. Various unique hydroa coustic signal types, volcanic underwater, or undetermined. Bubble pulse frequency used to calculate the yield value and that yield value error. This table also identifies if this origin is part of a series and the unique identifier for tha t series.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| HYDROLOC_CODE | NUMBER(8) | ✓ | ✗ | Hydroacoustic origin location |
| HYDROYIELD | FLOAT(24) | ✓ | ✗ | Hydroacoustic event yield |
| HYDROYLDERR | FLOAT(24) | ✓ | ✗ | Hydroacoustic event yield error |
| NUM_IN_SERIES | NUMBER(8) | ✓ | ✗ | Number of event in series |
| SERID | NUMBER(18) | ✓ | ✗ | Series identifier |
| HYD_CLASS_CODE | NUMBER(8) | ✓ | ✗ | Hydroacoustic event classification |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### INSTRUMENT
**Description**: The instrument table contains ancillary calibration informat ion. It holds nominal one-frequency calibration factors for each instrument and pointers to nominal frequency-dependent calibration for an instrument. This table also holds pointer s to the exact calibrations obtained by direct measurement o n a particular instrument (see sensor).

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| INID | NUMBER(18) | ✓ | ✗ | Instrument identifier |
| INSNAME | VARCHAR2(50) | ✓ | ✗ | Instrument name |
| INSTYPE | VARCHAR2(6) | ✓ | ✗ | Instrument type |
| BAND | VARCHAR2(1) | ✓ | ✗ | Frequency band |
| DIGITAL | VARCHAR2(1) | ✓ | ✗ | Data type, digital (d), or analog (a) |
| SAMPRATE | FLOAT(24) | ✓ | ✗ | Sampling rate in samples/second |
| NCALIB | FLOAT(24) | ✓ | ✗ | Nominal calibration (nanometers/digital count) |
| NCALPER | FLOAT(24) | ✓ | ✗ | Nominal calibration period (seconds) |
| DIR | VARCHAR2(64) | ✓ | ✗ | Directory |
| DFILE | VARCHAR2(32) | ✓ | ✗ | Data file |
| RSPTYPE | VARCHAR2(6) | ✓ | ✗ | Response type |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### INTERVAL
**Description**: The interval table defines units of processing. The time, en dtime, and name types indicate processing times for a named object. The class type allows a single interval table to be used for different classes of objects.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| INTVLID | NUMBER(18) | ✓ | ✗ | Interval identifier |
| CLASS | VARCHAR2(16) | ✓ | ✗ | Type of interval |
| NAME | VARCHAR2(20) | ✓ | ✗ | Name of interval |
| TIME | FLOAT(53) | ✓ | ✗ | Starting time of data |
| ENDTIME | FLOAT(53) | ✓ | ✗ | Ending time of data |
| STATE | VARCHAR2(16) | ✓ | ✗ | Current processing state |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author of interval |
| PERCENT_AVAILABLE | FLOAT(53) | ✓ | ✗ | Percent of data available in interval |
| PROC_START_DATE | DATE(7) | ✓ | ✗ | Processing start date |
| PROC_END_DATE | DATE(7) | ✓ | ✗ | Processing stop date |
| MODDATE | DATE(7) | ✓ | ✗ | Time of last processing state change |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### MDAC_FD
**Description**: The mdac_fd table contains frequency dependent MDAC paramete rs for each corrid, frequency, and channel. (corrid is an in ternal id that relates to an mdac_fi record which is depende nt on polyid, phase, and station.)

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| FDID | NUMBER(18) | ✓ | ✗ | Frequency dependent correction identifier |
| AMPCOR_VERID | NUMBER(18) | ✓ | ✗ | amplitude correction version identifier |
| CORRID | NUMBER(18) | ✓ | ✗ | Correction identifier |
| LFREQ | FLOAT(24) | ✓ | ✗ | Low frequency of amplitude measurement |
| STA | VARCHAR2(6) | ✓ | ✗ | Station name |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel name |
| TOMOID | NUMBER(18) | ✓ | ✗ | Tomographic identifier |
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon Identifier |
| A | FLOAT(53) | ✓ | ✗ | First surface fit coefficient |
| B | FLOAT(53) | ✓ | ✗ | Second surface fit coefficient |
| C | FLOAT(53) | ✓ | ✗ | Third surface fit coefficient |
| SITEFACT | FLOAT(53) | ✓ | ✗ | Site effect factor |
| ALGOID | NUMBER(18) | ✓ | ✗ | Algorithm identifier |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author, source of data |
| LDDATE | DATE(7) | ✓ | ✗ | Load date (format YY//MM/DD HH24:MI:SS) |

### MDAC_FI
**Description**: The mdac_fi table contains frequency independent MDAC parame ters for each polyid, phase, and station.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CORRID | NUMBER(18) | ✓ | ✗ | Correction identifier |
| AMPCOR_VERID | NUMBER(18) | ✓ | ✗ | amplitude correction version identifier |
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station name |
| PHASE | VARCHAR2(8) | ✓ | ✗ | Phase of interest |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel name |
| CORRNAME | VARCHAR2(32) | ✓ | ✗ | Name of correction parameter set |
| SIGMA | FLOAT(53) | ✓ | ✗ | Stress-drop in pascals |
| DELSIGMA | FLOAT(53) | ✓ | ✗ | Stress-drop in pascals uncertainty |
| PSI | FLOAT(24) | ✓ | ✗ | Exponent controlling moment-corner frequency scaling |
| DELPSI | FLOAT(24) | ✓ | ✗ | Uncertainty of psi |
| Q0 | FLOAT(53) | ✓ | ✗ | Attenuation at 1 Hz |
| DELQ0 | FLOAT(53) | ✓ | ✗ | Uncertainty of q0 |
| GAMMA | FLOAT(24) | ✓ | ✗ | Frequency exponent of attenuation |
| DELGAMMA | FLOAT(24) | ✓ | ✗ | Frequency exponent of attenuation uncertainty |
| ZETA | FLOAT(24) | ✓ | ✗ | Ratio of P and S wave corner frequencies |
| M0_REF | FLOAT(53) | ✓ | ✗ | Reference seismic moment used with psi in Nm |
| U0 | FLOAT(24) | ✓ | ✗ | Velocity of phase in m/s |
| ETA | FLOAT(24) | ✓ | ✗ | Geometric spreading exponent |
| DELETA | FLOAT(24) | ✓ | ✗ | Geometric spreading exponent uncertainty |
| DISTCRIT | FLOAT(53) | ✓ | ✗ | Critical distance for geometric spreading function in meters |
| ALPHAS | FLOAT(24) | ✓ | ✗ | P velocity at the source in m/s |
| BETAS | FLOAT(24) | ✓ | ✗ | S velocity at the source in m/s |
| RHOS | FLOAT(53) | ✓ | ✗ | Density at the source in kg/m3 |
| ALPHAR | FLOAT(24) | ✓ | ✗ | P velocity at the receiver in m/s |
| BETAR | FLOAT(24) | ✓ | ✗ | S velocity at the receiver in m/s |
| RHOR | FLOAT(53) | ✓ | ✗ | Density at the receiver in kg/m3 |
| RADPATP | FLOAT(24) | ✓ | ✗ | Radiation pattern excitation factor for P waves |
| RADPATS | FLOAT(24) | ✓ | ✗ | Radiation pattern excitation factor for S waves |
| SNR1 | FLOAT(53) | ✓ | ✗ | Minimum signal-to-noise ratio used to select spectral amplitudes |
| SNR2 | FLOAT(53) | ✓ | ✗ | Minimum signal-to-noise for applying MDAC parameters |
| NOISETYPE | VARCHAR2(15) | ✓ | ✗ | Noise identifier e.g. pre-event or pre-phase |
| MAGID | NUMBER(18) | ✓ | ✗ | Magnitude identifier |
| MAGTYPE | VARCHAR2(6) | ✓ | ✗ | Magnitude type |
| ALGOID | NUMBER(18) | ✓ | ✗ | Algorithm used |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date (format YY/MM/DD HH24:MI:SS |

### MSGAUX
**Description**: The msgaux table contains records of unsuccessfully processe d Automatic Data Request Manager (AutoDRM) messages.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| MSGID | NUMBER(18) | ✓ | ✗ | Message identifier |
| MSGROW | NUMBER(4) | ✓ | ✗ | Line number in message |
| STATECOUNT | NUMBER(8) | ✓ | ✗ | Number of failures |
| COMMAND | VARCHAR2(24) | ✓ | ✗ | Command that could not be processed |
| SUB_STATUS | VARCHAR2(24) | ✓ | ✗ | Cause of failure |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### MSGDATATYPE
**Description**: The msgdatatype table supports data tracking by recording ea ch data section in a message for incoming and outgoing messa ges.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| MSGID | NUMBER(18) | ✓ | ✗ | Message identifier |
| MSGDTYPE | VARCHAR2(16) | ✓ | ✗ | Data type of the data section within the message |
| MSGDFORMAT | VARCHAR2(16) | ✓ | ✗ | General format of data that follows |
| MSGSTATUS | VARCHAR2(32) | ✓ | ✗ | Status of the data section |
| FOFF | NUMBER(10) | ✓ | ✗ | File offset to beginning of data section |
| MSIZE | NUMBER(8) | ✓ | ✗ | Size of data section |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### MSGDEST
**Description**: The msgdest table contains information about messages sent.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| MSGDID | NUMBER(18) | ✓ | ✗ | Message destination identifier |
| MSGID | NUMBER(18) | ✓ | ✗ | Message identifier |
| TRANSMETH | VARCHAR2(16) | ✓ | ✗ | Method by which the response is to be delivered to the requester |
| EMAILTO | VARCHAR2(64) | ✓ | ✗ | E-mail address to send message |
| MSGSTATUS | VARCHAR2(32) | ✓ | ✗ | Current status of the response message |
| ITIME | FLOAT(53) | ✓ | ✗ | Time at which table entry was made |
| TIMESENT | FLOAT(53) | ✓ | ✗ | Time at which message was sent |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### MSGDISC
**Description**: The msgdisc table contains information pertinent to messages including the date and time that the message was sent or re ceived, identification information, and where the message is stored.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| MSGID | NUMBER(18) | ✓ | ✗ | Message identifier |
| USERID | NUMBER(18) | ✓ | ✗ | User identifier |
| MSGVER | VARCHAR2(8) | ✓ | ✗ | Message system version number |
| MSGTYPE | VARCHAR2(16) | ✓ | ✗ | Message type |
| SUBTYPE | VARCHAR2(20) | ✓ | ✗ | Message subtype |
| EXTMSGID | VARCHAR2(20) | ✓ | ✗ | Message identification string provided by the sender |
| INTID | NUMBER(18) | ✓ | ✗ | Either the locally generated msgid of an earlier table entry that evoked the creation of this table entry or the reqid from the request table of an internally generated request |
| INTIDTYPE | VARCHAR2(16) | ✓ | ✗ | Intid type |
| MSGSRC | VARCHAR2(16) | ✓ | ✗ | Message source code |
| ITIME | FLOAT(53) | ✓ | ✗ | Initial time message was received |
| IDATE | NUMBER(8) | ✓ | ✗ | Initial date message was received |
| IMETHOD | VARCHAR2(8) | ✓ | ✗ | Input method (e-mail or ftp) |
| ISRC | VARCHAR2(64) | ✓ | ✗ | Initial source of message |
| MSIZE | NUMBER(8) | ✓ | ✗ | Message size in bytes |
| MSGSTATUS | VARCHAR2(32) | ✓ | ✗ | Status of message |
| SUBJECT | VARCHAR2(64) | ✓ | ✗ | Subject header from e-mail message |
| DIR | VARCHAR2(64) | ✓ | ✗ | Directory to find file |
| DFILE | VARCHAR2(32) | ✓ | ✗ | Name of data file |
| FOFF | NUMBER(10) | ✓ | ✗ | Byte offset of data segment within file |
| MFOFF | NUMBER(8) | ✓ | ✗ | Offset in bytes to beginning of message |
| FILEOFF | NUMBER(8) | ✓ | ✗ | Number of bytes to the first character of the e-mail file (first character of the e-mail header) |
| FILESIZE | NUMBER(8) | ✓ | ✗ | Size of file |
| SIGTYPE | VARCHAR2(64) | ✓ | ✗ | Digital signature type |
| VERIFSTATUS | VARCHAR2(4) | ✓ | ✗ | Status of verification |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### MSVMAX_DESCRIPT
**Description**: The msvmax_descript is the child of arrival and amplitude ta bles. It is the parent of the msvmax_results table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| AMPID | NUMBER(18) | ✓ | ✗ | Amplitude identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| ARID | NUMBER(18) | ✓ | ✗ | LR arrival identifier |
| HIGH_SNR_COUNT | NUMBER(2) | ✓ | ✗ | Count of periods where noise is greater than signal |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### MSVMAX_RESULTS
**Description**: The msvmax_results table is the child of the msvmax_descript table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| AMPID | NUMBER(18) | ✓ | ✗ | Amplitude identifier |
| PER | FLOAT(24) | ✓ | ✗ | Period (8 - 25 second) |
| MEASTYPE | VARCHAR2(1) | ✓ | ✗ | Measurement type |
| AMP | FLOAT(24) | ✓ | ✗ | Amplitude value in nanometers |
| AMPTIME | FLOAT(53) | ✓ | ✗ | Time of amplitude measure |
| INS_RESPONSE | FLOAT(24) | ✓ | ✗ | Instrument response value |
| AMPCOR | FLOAT(24) | ✓ | ✗ | Amplitude value corrected for Airy phase Butterworth filter |
| MAGNITUDE | FLOAT(24) | ✓ | ✗ | Magnitude value |
| UNCERTAINTY | FLOAT(24) | ✓ | ✗ | Magnitude uncertainty-future use |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch start time of signal window |
| ENDTIME | FLOAT(53) | ✓ | ✗ | Epoch start time of signal window |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### NETMAG
**Description**: The netmag table contain estimates of network magnitudes of different types for an event. Each network magnitude has a u nique magid. Station magnitudes used to compute the network magnitude are in the stamag table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| MAGID | NUMBER(18) | ✓ | ✗ | Network magnitude identifier |
| NET | VARCHAR2(8) | ✓ | ✗ | Unique network identifier |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| EVID | NUMBER(18) | ✓ | ✗ | Event identifier |
| MAGTYPE | VARCHAR2(6) | ✓ | ✗ | Magnitude type (ms, mb, etc.) |
| NSTA | NUMBER(8) | ✓ | ✗ | Number of stations used |
| MAGNITUDE | FLOAT(24) | ✓ | ✗ | Magnitude |
| UNCERTAINTY | FLOAT(24) | ✓ | ✗ | Magnitude uncertainty |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Source/originator |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### NETWORK
**Description**: The network table contains general information about seismic networks (see affiliation).

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| NETWORKID | NUMBER(18) | ✓ | ✗ | Unique network identifier |
| NET | VARCHAR2(8) | ✓ | ✗ | Network name |
| NETWORK_NAME | VARCHAR2(32) | ✓ | ✗ | Long network name |
| DESCRIPTION | VARCHAR2(4000) | ✓ | ✗ | Network description |
| NETWORK_TYPE | VARCHAR2(15) | ✓ | ✗ | Network type (array, local, world-wide, etc.) |
| ON_DATE | DATE(7) | ✓ | ✗ | The date the network first became active or was created |
| OFF_DATE | DATE(7) | ✓ | ✗ | The date the network was removed from the system or made obsolete |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Source/originator |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### NETYIELD
**Description**: The netyield table contains network-wide yield values obtain ed from the yield values at all available stations for an ev ent.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| YIELDID | NUMBER(18) | ✓ | ✗ | Yield identifier |
| NET | VARCHAR2(8) | ✓ | ✗ | Unique network identifier |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| EVID | NUMBER(18) | ✓ | ✗ | Event identifier |
| YIELD | FLOAT(24) | ✓ | ✗ | Yield |
| NSTA | NUMBER(8) | ✓ | ✗ | Number of stations used |
| FFACTOR | FLOAT(24) | ✓ | ✗ | Yield F factor (log 10) |
| WMODEL_NAME | VARCHAR2(50) | ✓ | ✗ | Yield model name |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### NET_CODA_SPECTRUM
**Description**: The net_coda_spectrum table contains the theoretical source spectrum for an event, used to obtain the network moment mag nitude values. The theoretical spectrum is fit to the observ ed spectrum in all frequency bands for a station that are se t to defining in the envelope_contribution table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| MAGID | NUMBER(18) | ✓ | ✗ | Magnitude identifier |
| FREQ | FLOAT(24) | ✓ | ✗ | Frequency |
| AMPCOR | FLOAT(24) | ✓ | ✗ | Amplitude value corrected for path and site |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### OMITTED_CHANNELS
**Description**: The omitted_channels table identifies time intervals for whi ch channel masks exist. Channel masks are used to exclude wa veform data for the specified station, channel, time and end time from interactive and automatic data processing due to d ata quality problems (timing, calibration, etc.).

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch time for start of channel omitted |
| ENDTIME | FLOAT(53) | ✓ | ✗ | Epoch time for end of channel omitted |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ORIGERR
**Description**: The origerr table contains summaries of confidence bounds in origin estimations. The origerr_ga table is used by the GA application to store temporary origin error information. The measurement types are the elements of the location covarian ce matrix. The descriptive types give the uncertainties in l ocation, depth, and origin time. These quantities are calcul ated from the covariance matrix, assuming gaussian errors an d a confidence level conf.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| SXX | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SYY | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SZZ | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| STT | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SXY | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SXZ | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SYZ | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| STX | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| STY | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| STZ | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SDOBS | FLOAT(24) | ✓ | ✗ | Standard error of observations |
| SMAJAX | FLOAT(24) | ✓ | ✗ | Semi-major axis of error |
| SMINAX | FLOAT(24) | ✓ | ✗ | Semi-minor axis of error |
| STRIKE | FLOAT(24) | ✓ | ✗ | Strike of the semi-major axis |
| SDEPTH | FLOAT(24) | ✓ | ✗ | Depth error |
| STIME | FLOAT(24) | ✓ | ✗ | Origin time error |
| CONF | FLOAT(24) | ✓ | ✗ | Confidence |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ORIGERR_GA
**Description**: The origerr table contains summaries of confidence bounds in origin estimations. The origerr_ga table is used by the GA application to store temporary origin error information. The measurement types are the elements of the location covarian ce matrix. The descriptive types give the uncertainties in l ocation, depth, and origin time. These quantities are calcul ated from the covariance matrix, assuming gaussian errors an d a confidence level conf.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| SXX | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SYY | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SZZ | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| STT | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SXY | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SXZ | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SYZ | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| STX | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| STY | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| STZ | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SDOBS | FLOAT(24) | ✓ | ✗ | Standard error of observations |
| SMAJAX | FLOAT(24) | ✓ | ✗ | Semi-major axis of error |
| SMINAX | FLOAT(24) | ✓ | ✗ | Semi-minor axis of error |
| STRIKE | FLOAT(24) | ✓ | ✗ | Strike of the semi-major axis |
| SDEPTH | FLOAT(24) | ✓ | ✗ | Depth error |
| STIME | FLOAT(24) | ✓ | ✗ | Origin time error |
| CONF | FLOAT(24) | ✓ | ✗ | Confidence |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ORIGERR_GA_DEL
**Description**: The origerr_ga_del table contains summaries of confidence bo unds in origin estimations.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| SXX | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SYY | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SZZ | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| STT | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SXY | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SXZ | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SYZ | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| STX | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| STY | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| STZ | FLOAT(24) | ✓ | ✗ | Covariance matrix element |
| SDOBS | FLOAT(24) | ✓ | ✗ | Standard error of observations |
| SMAJAX | FLOAT(24) | ✓ | ✗ | Semi-major axis of error |
| SMINAX | FLOAT(24) | ✓ | ✗ | Semi-minor axis of error |
| STRIKE | FLOAT(24) | ✓ | ✗ | Strike of the semi-major axis |
| SDEPTH | FLOAT(24) | ✓ | ✗ | Depth error |
| STIME | FLOAT(24) | ✓ | ✗ | Origin time error |
| CONF | FLOAT(24) | ✓ | ✗ | Confidence |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ORIGIN
**Description**: The origin tables contain information describing a derived o r reported origin for a particular event.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| LAT | FLOAT(24) | ✓ | ✗ | Estimated latitude |
| LON | FLOAT(24) | ✓ | ✗ | Estimated longitude |
| DEPTH | FLOAT(24) | ✓ | ✗ | Estimated depth |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch time |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| EVID | NUMBER(18) | ✓ | ✗ | Event identifier |
| JDATE | NUMBER(8) | ✓ | ✗ | Julian date |
| NASS | NUMBER(4) | ✓ | ✗ | Number of associated phases |
| NDEF | NUMBER(4) | ✓ | ✗ | Number of locating phases |
| NDP | NUMBER(4) | ✓ | ✗ | Number of depth phases |
| GRN | NUMBER(8) | ✓ | ✗ | Geographic region number |
| SRN | NUMBER(8) | ✓ | ✗ | Seismic region number |
| ETYPE | VARCHAR2(7) | ✓ | ✗ | Event type |
| DEPDP | FLOAT(24) | ✓ | ✗ | Estimated depth from depth phases |
| DTYPE | VARCHAR2(1) | ✓ | ✗ | Depth method used |
| MB | FLOAT(24) | ✓ | ✗ | Body wave magnitude |
| MBID | NUMBER(18) | ✓ | ✗ | Mb magnitude identifier |
| MS | FLOAT(24) | ✓ | ✗ | Surface wave magnitude |
| MSID | NUMBER(18) | ✓ | ✗ | Ms magnitude identifier |
| ML | FLOAT(24) | ✓ | ✗ | Local magnitude |
| MLID | NUMBER(18) | ✓ | ✗ | ML magnitude identifier |
| ALGORITHM | VARCHAR2(15) | ✓ | ✗ | Location algorithm used |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Source/originator |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ORIGIN_GA
**Description**: The origin and origin_ga tables contain information describi ng a derived or reported origin for a particular event.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| LAT | FLOAT(24) | ✓ | ✗ | Estimated latitude |
| LON | FLOAT(24) | ✓ | ✗ | Estimated longitude |
| DEPTH | FLOAT(24) | ✓ | ✗ | Estimated depth |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch time |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| EVID | NUMBER(18) | ✓ | ✗ | Event identifier |
| JDATE | NUMBER(8) | ✓ | ✗ | Julian date |
| NASS | NUMBER(4) | ✓ | ✗ | Number of associated phases |
| NDEF | NUMBER(4) | ✓ | ✗ | Number of locating phases |
| NDP | NUMBER(4) | ✓ | ✗ | Number of depth phases |
| GRN | NUMBER(8) | ✓ | ✗ | Geographic region number |
| SRN | NUMBER(8) | ✓ | ✗ | Seismic region number |
| ETYPE | VARCHAR2(7) | ✓ | ✗ | Event type |
| DEPDP | FLOAT(24) | ✓ | ✗ | Estimated depth from depth phases |
| DTYPE | VARCHAR2(1) | ✓ | ✗ | Depth method used |
| MB | FLOAT(24) | ✓ | ✗ | Body wave magnitude |
| MBID | NUMBER(18) | ✓ | ✗ | Mb magnitude identifier |
| MS | FLOAT(24) | ✓ | ✗ | Surface wave magnitude |
| MSID | NUMBER(18) | ✓ | ✗ | Ms magnitude identifier |
| ML | FLOAT(24) | ✓ | ✗ | Local magnitude |
| MLID | NUMBER(18) | ✓ | ✗ | ML magnitude identifier |
| ALGORITHM | VARCHAR2(15) | ✓ | ✗ | Location algorithm used |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Source/originator |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ORIGIN_GA_DEL
**Description**: The origin_ga_del table contains information describing a de rived or reported origin for a particular event that was del eted and may be needed for later reference.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| LAT | FLOAT(24) | ✓ | ✗ | Estimated latitude |
| LON | FLOAT(24) | ✓ | ✗ | Estimated longitude |
| DEPTH | FLOAT(24) | ✓ | ✗ | Estimated depth |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch time |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| EVID | NUMBER(18) | ✓ | ✗ | Event identifier |
| JDATE | NUMBER(8) | ✓ | ✗ | Julian date |
| NASS | NUMBER(4) | ✓ | ✗ | Number of associated phases |
| NDEF | NUMBER(4) | ✓ | ✗ | Number of locating phases |
| NDP | NUMBER(4) | ✓ | ✗ | Number of depth phases |
| GRN | NUMBER(8) | ✓ | ✗ | Geographic region number |
| SRN | NUMBER(8) | ✓ | ✗ | Seismic region number |
| ETYPE | VARCHAR2(7) | ✓ | ✗ | Event type |
| DEPDP | FLOAT(24) | ✓ | ✗ | Estimated depth from depth phases |
| DTYPE | VARCHAR2(1) | ✓ | ✗ | Depth method used |
| MB | FLOAT(24) | ✓ | ✗ | Body wave magnitude |
| MBID | NUMBER(18) | ✓ | ✗ | Mb magnitude identifier |
| MS | FLOAT(24) | ✓ | ✗ | Surface wave magnitude |
| MSID | NUMBER(18) | ✓ | ✗ | Ms magnitude identifier |
| ML | FLOAT(24) | ✓ | ✗ | Local magnitude |
| MLID | NUMBER(18) | ✓ | ✗ | ML magnitude identifier |
| ALGORITHM | VARCHAR2(15) | ✓ | ✗ | Location algorithm used |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Source/originator |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ORIGIN_MEA_TRACE
**Description**: The origin_mea_trace table contains important information ne cessary to trace the subspace detection.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| CLUSTAID | NUMBER(18) | ✓ | ✗ | Cluster Station identifier |
| ACTIVETIME_LOOKUP | FLOAT(53) | ✓ | ✗ | The time used to lookup the epoch time a cluster was activated. This value is either the application data start time or set to the value of 'cluster-active-time-override' parameter. |
| BEST_REF_MATCH_ORID | NUMBER(18) | ✓ | ✗ | Best reference event |
| APPLIED_THRESHOLD | FLOAT(24) | ✓ | ✗ | Threshold used for this detection |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### ORIGIN_SDO
**Description**: The origin_sdo table contains the point geometry, coverage e llipse polygon, confidence ellipse polygon for an origin.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |

### ORIGIN_TAG
**Description**: The origin_tag table contains information to indicate which mode was used to generate the origin (i.e. automated process ing mode of defining arrivals for an automated event or anal ysis mode for a reviewed event).

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| PROCESS_MODE | VARCHAR2(32) | ✓ | ✗ | Automated processing mode of defining arrivals or analysis mode |
| PROCESS_ATTRIBUTE | VARCHAR2(32) | ✓ | ✗ | Additional information to augment the process_mode (e.g. specific spotlight) |
| NDEF | NUMBER(4) | ✓ | ✗ | Number of defining arrivals for automated processing mode |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### OUTAGE_STATION_DATA
**Description**: The outage_station_data table provides tracking of station a vailability.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| OUTAGE_ID | NUMBER(18) | ✓ | ✗ | Outage identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station name |
| START_DATE | DATE(7) | ✓ | ✗ | Process Start date/time |
| END_DATE | DATE(7) | ✓ | ✗ | Last time the process ran |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### OUTAGE_STATION_RECEIVE
**Description**: The outage_station_receive table provides tracking of pipeli ne availability for both the operational and alternate US ND C systems.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| OUTAGE_ID | NUMBER(18) | ✓ | ✗ | Outage identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station name |
| START_DATE | DATE(7) | ✓ | ✗ | Process Start date/time. |
| END_DATE | DATE(7) | ✓ | ✗ | Last time the process ran |
| ENDTIME | FLOAT(53) | ✓ | ✗ | Station outage ending time. |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### POLYGON
**Description**: The polygon table contains the name for each polyid.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon Identifier |
| REGION_NAME | VARCHAR2(30) | ✓ | ✗ | name of region |
| PERIMETERTYPE | VARCHAR2(8) | ✓ | ✗ | type of perimeter (unused) |
| INSIDEFLAG | VARCHAR2(1) | ✓ | ✗ | inside flag (unused) |
| OUTSIDEFLAG | VARCHAR2(1) | ✓ | ✗ | outage flag (unused) |
| EDGEFLAG | VARCHAR2(1) | ✓ | ✗ | edge flag (unused) |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| COMMENTS | VARCHAR2(4000) | ✓ | ✗ | comment text |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### POLYPOINT
**Description**: The polypoint table contains a polyid, sequence number, lati tude, and longitude for each point of a polygon. All record s with the same polyid will combine to define a single polyg on.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon Identifier |
| SEQUENCE | NUMBER(18) | ✓ | ✗ | point of interest |
| LAT | FLOAT(53) | ✓ | ✗ | Latitude |
| LON | FLOAT(53) | ✓ | ✗ | Longitude |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### PROCESSING_RECIPE
**Description**: The processing_recipe table provides the types of waveform p rocessing and the order in which they should be applied. Thi s table allows each cluster station to be processed in diffe rent ways for different proctypes (SVD, CORR, and AMP).

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| PROCID | NUMBER(18) | ✓ | ✗ | ID of the processing recipe. This ID and the procorder form the primary key |
| PROCMETHOD | VARCHAR2(20) | ✓ | ✗ | Method of processing (taper, deconvolution, butterworth_filter, etc) |
| IDNAME | VARCHAR2(15) | ✓ | ✗ | The name of the id field (taperid, filterid, etc) |
| IDVALUE | NUMBER(18) | ✓ | ✗ | The value of the id field |
| PROCORDER | NUMBER(6) | ✓ | ✗ | The value of the id field |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### PROCESS_TRACKING
**Description**: The process_tracking table provides tracking of pipeline ava ilability for both the operational and alternate systems.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| TRACKINGID | NUMBER(18) | ✓ | ✗ | Process Tracking Identifier |
| PROCESS | VARCHAR2(256) | ✓ | ✗ | Process name (Ex: pipeline_daemon, interactive_daemon) |
| MACHINE | VARCHAR2(128) | ✓ | ✗ | Machine name |
| SYS_AREA | VARCHAR2(128) | ✓ | ✗ | System Area |
| SYS_SITE | VARCHAR2(128) | ✓ | ✗ | Where the process was started. |
| PROC_START_DATE | DATE(7) | ✓ | ✗ | Process start date. |
| PROC_END_DATE | DATE(7) | ✓ | ✗ | Process end date |
| STATE | VARCHAR2(16) | ✓ | ✗ | Current processing state |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date. |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### QCMASKDEF
**Description**: The qcmaskdef table contains information defining the parame ters that went into the calculation of the QC mask.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| QCDEFID | NUMBER(18) | ✓ | ✗ | Definition identifier |
| FIX | NUMBER(1) | ✓ | ✗ | Flag indicating how to fix the bad segment |
| NTAPER | NUMBER(8) | ✓ | ✗ | Number of points to taper outside segment of length &gt;=drop_thr |
| DROP_THR | NUMBER(8) | ✓ | ✗ | Number of consecutive equal-valued samples to call a bad segment |
| SINGLE_TRACE_SPIKE_THR | FLOAT(53) | ✓ | ✗ | Amplitude ratio threshold for single-point spikes |
| NITER | NUMBER(8) | ✓ | ✗ | Number of iterations to perform extended QC |
| NSAMP | NUMBER(8) | ✓ | ✗ | Number of samples in a time interval for extended QC |
| NOVER | NUMBER(8) | ✓ | ✗ | Number of overlap samples for extended QC |
| SPIKE_THR | FLOAT(53) | ✓ | ✗ | Amplitude ratio threshold for extended QC spikes |
| SPIKE_STAT | NUMBER(8) | ✓ | ✗ | Flag for statistic to use for spike detection across multiple data vectors |
| SPIKE_VAL | FLOAT(53) | ✓ | ✗ | Value to use for spike_stat |
| SPIKE_NPWIN | NUMBER(8) | ✓ | ✗ | Number of points to use for single vector extended QC spike detection |
| SPIKE_DSET | NUMBER(8) | ✓ | ✗ | Flag for data set to use for extended QC across multiple data vectors |
| NOISE_THRESH | FLOAT(53) | ✓ | ✗ | Noisy channel threshold value |
| SPIKE_WINLEN | NUMBER(8) | ✓ | ✗ | Number of samples used in single-trace QC |
| INTERQUAR_COEF | FLOAT(53) | ✓ | ✗ | Inter-quartile range multiplier for single-trace QC |
| NOISE_NSAMP | NUMBER(8) | ✓ | ✗ | Number of samples in averaging window for noisy channel processing |
| NOISE_NOVERLAP | NUMBER(8) | ✓ | ✗ | Number of samples windows overlap for noisy channel processing |
| ALGORITHM_LIST | VARCHAR2(100) | ✓ | ✗ | List of algorithms applied during QC processing |
| ONDATE | NUMBER(8) | ✓ | ✗ | The date this record starts to be used |
| OFFDATE | NUMBER(8) | ✓ | ✗ | The date this record is no longer used |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### QCMASKINFO
**Description**: The qcmaskinfo table contains QC mask data information about a channel and time interval for which QC processing was per formed.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| QCMASKID | NUMBER(18) | ✓ | ✗ | QC mask identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station name |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel name |
| TIME | FLOAT(53) | ✓ | ✗ | Start time of Mask |
| ENDTIME | FLOAT(53) | ✓ | ✗ | End time of Mask |
| SAMPRATE | FLOAT(24) | ✓ | ✗ | Sample rate in samples/sec |
| NSEG | NUMBER(8) | ✓ | ✗ | The number of segments for this mask ( see qcmaskseg table ) |
| QCDEFID | NUMBER(18) | ✓ | ✗ | QC definition ientifier |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### QCMASKSEG
**Description**: The qcmaskseg table contains information about masked data s egments resulting from QC processing.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| QCMASKID | NUMBER(18) | ✓ | ✗ | QC mask identifier |
| STARTSAMPLE | NUMBER(8) | ✓ | ✗ | Number of the starting sample |
| ENDSAMPLE | NUMBER(8) | ✓ | ✗ | Number of the ending sample |
| MASKTYPE | NUMBER(5) | ✓ | ✗ | Flag indicating type of mask for a given segment |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### QSHELL_INTERVAL
**Description**: The qshell_interval table records processing that was perfor med against interval table rows. It records the start and e nd dates of execution of each process name in the processing sequence for the interval class.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| QSHELL_INTVLID | NUMBER(18) | ✓ | ✗ | QShell Interval identifier |
| INTVLID | NUMBER(18) | ✓ | ✗ | Interval identifier |
| CLASS | VARCHAR2(16) | ✓ | ✗ | Type of interval |
| NAME | VARCHAR2(20) | ✓ | ✗ | Name of interval |
| PROC_START_DATE | DATE(7) | ✓ | ✗ | Processing start date |
| PROC_END_DATE | DATE(7) | ✓ | ✗ | Processing stop date |
| STATE | VARCHAR2(16) | ✓ | ✗ | Current processing state |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author of interval |
| MODDATE | DATE(7) | ✓ | ✗ | Time of last processing state change |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### RDA_PARAM
**Description**: The rda_param table contains the Regularized Discrimination Analysis (RDA) parameters for each polyid.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon Identifier |
| RDA_VERID | NUMBER(18) | ✓ | ✗ | version identifier of the RDA |
| GAMMA | FLOAT(53) | ✓ | ✗ | Frequency exponent of attenuation |
| LAMBDA | FLOAT(53) | ✓ | ✗ | Smoothing parameter |
| CLASS_DECISION_THRESH | FLOAT(53) | ✓ | ✗ | Decision threshold |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| COMMENTS | VARCHAR2(4000) | ✓ | ✗ | comment text |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### REG_RATIO_DISCRIM
**Description**: The reg_ratio_discrim table contains variances and means for each polyid, numerator phase and frequency, and denominator phase and frequency. These parameters are used for discrim inants which are ratios of two phases.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon Identifier |
| COV_VERID | NUMBER(18) | ✓ | ✗ | version identifier of the covariance matrix |
| NUMERATOR_PHASE | VARCHAR2(8) | ✓ | ✗ | Numerator phase of interest |
| DENOMINATOR_PHASE | VARCHAR2(8) | ✓ | ✗ | Denominator phase of interest |
| NUM_LOW_FREQ | FLOAT(53) | ✓ | ✗ | Low end of frequency band used to filter numerator measurement |
| NUM_HI_FREQ | FLOAT(53) | ✓ | ✗ | High end of frequency band used to filter numerator measurement |
| DEN_LOW_FREQ | FLOAT(53) | ✓ | ✗ | Low end of frequency band used to filter denominator measurement |
| DEN_HI_FREQ | FLOAT(53) | ✓ | ✗ | High end of frequency band used to filter denominator measurement |
| MEAN_EX_VAL | FLOAT(53) | ✓ | ✗ | Mean p-value for explosions for this discriminant within this region |
| NUM_STATION_VAR | FLOAT(53) | ✓ | ✗ | Variability due to station in the numerator phase |
| DEN_STATION_VAR | FLOAT(53) | ✓ | ✗ | Variability due to station in the denominator phase |
| NUM_EVENT_VAR | FLOAT(53) | ✓ | ✗ | Variability due to event in the numerator phase |
| DEN_EVENT_VAR | FLOAT(53) | ✓ | ✗ | Variability due to event in the denominator phase |
| LDDATE | DATE(7) | ✓ | ✗ | Date this parameter set was loaded |

### REMAP
**Description**: &nbsp;

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| SOURCE | VARCHAR2(512) | ✓ | ✗ | &nbsp; |
| ID_NAME | VARCHAR2(12) | ✓ | ✗ | &nbsp; |
| ORIGINAL_ID | NUMBER(18) | ✓ | ✗ | &nbsp; |
| CURRENT_ID | NUMBER(18) | ✓ | ✗ | &nbsp; |
| LDDATE | DATE(7) | ✓ | ✗ | &nbsp; |

### REMARK
**Description**: The remark table contains comments. This table may be used t o store free-form comments that embellish records of other t ables. The commid type in many tables refers to a record in the remark table. If commid is NA (1) in a record of any oth er table, no comments are stored for that record.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LINENO | NUMBER(8) | ✓ | ✗ | Comment line number |
| REMARK | VARCHAR2(160) | ✓ | ✗ | Free-format comment |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### REMOVED_BEAM_DFILE
**Description**: This table contains a list of beam files that have been remo ved from the USNDC. It is used to clean up orphaned beam fil es on the non-mission system side since they are only remove d on the mission side.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| DFILE | VARCHAR2(32) | ✓ | ✗ | Beam file name |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### REQUEST
**Description**: The request table defines segments of auxiliary waveform dat a to be acquired. The time, endtime, sta, and chan types def ine a single unit of data. Data import programs must succeed in acquiring all the data for a time interval before changi ng the state to indicate success.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| REQID | NUMBER(18) | ✓ | ✗ | Request identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| ARRAY | VARCHAR2(8) | ✓ | ✗ | Array code |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| EVID | NUMBER(18) | ✓ | ✗ | Event identifier |
| TIME | FLOAT(53) | ✓ | ✗ | Starting time of requested waveform data |
| ENDTIME | FLOAT(53) | ✓ | ✗ | Ending time of requested waveform data |
| CLASS | VARCHAR2(16) | ✓ | ✗ | Type of request |
| REQ_STATE | VARCHAR2(16) | ✓ | ✗ | Current request state |
| STATECOUNT | NUMBER(8) | ✓ | ✗ | Number of failed attempts (when state = failed) |
| COMPLETE | NUMBER(8) | ✓ | ✗ | Percentage of data acquired |
| REQUESTOR | VARCHAR2(15) | ✓ | ✗ | Original author of record |
| MODTIME | FLOAT(53) | ✓ | ✗ | Time of last state change (epoch time) |
| MODAUTHOR | VARCHAR2(15) | ✓ | ✗ | Author of last state change |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### SADO_EMAIL_HISTORY
**Description**: The SADO table contains the email history of reports sent by users using the SADO Tool.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| SADO_EMAIL_ID | NUMBER(18) | ✓ | ✗ | SADO Email History Identifier. |
| REPORT_ID | NUMBER(18) | ✓ | ✗ | Report Identifier. |
| SUBJECT | VARCHAR2(1000) | ✓ | ✗ | SADO Email Subject Text |
| RECIPIENTS | VARCHAR2(4000) | ✓ | ✗ | SADO Email recipients |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author of the SADO Email |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### SADO_PDF_REPORTS
**Description**: The SADO table contains the binary stored pdf reports and as sociated id numbers.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| SADO_PDF_REPORT_ID | NUMBER(18) | ✓ | ✗ | SADO PDF Report Identifier |
| REPORT_ID | NUMBER(18) | ✓ | ✗ | SADO Report Identifier |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author of the SADO PDF Report. |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### SADO_REPORT
**Description**: The SADO table contains data about the SADO report and the e vent for the report.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| REPORT_ID | NUMBER(18) | ✓ | ✗ | Report Identifier |
| EVID | NUMBER(18) | ✓ | ✗ | Event Identifier |
| ORID | NUMBER(18) | ✓ | ✗ | Origin Identifier |
| GRN | NUMBER(8) | ✓ | ✗ | Geographic region number |
| EVENT_TIME | FLOAT(53) | ✓ | ✗ | Epoch time of an Event |
| TITLE | VARCHAR2(64) | ✓ | ✗ | Title of the report. Combination of the evid number and date and timestamp of the report |
| ANALYST | VARCHAR2(32) | ✓ | ✗ | The analyst that created the event of the report |
| ACCOUNT | VARCHAR2(15) | ✓ | ✗ | Pipeline account the report is being written from |
| CLASSIFICATION | VARCHAR2(256) | ✓ | ✗ | The classification of the report material |
| TTGE | VARCHAR2(1) | ✓ | ✗ | Boolean indicating the Alert Manager sent an email for this report |
| SADO_RELEASED | VARCHAR2(1) | ✓ | ✗ | Boolean indicating the SADO report has been released to the AFTAC website |
| ALERT_MANAGER_CALLED | VARCHAR2(1) | ✓ | ✗ | Boolean indicating if the user called the alert manager |
| EXERCISE | VARCHAR2(1) | ✓ | ✗ | Boolean indicating if the report is an exercise report |
| EMAIL_TYPE | VARCHAR2(32) | ✓ | ✗ | Indicates the report type of type 0, 1, or 2 |
| ALERT_MANAGER | VARCHAR2(64) | ✓ | ✗ | Indicates which alert manager was called if an alert manager was called |
| YIELD_CALCULATOR_REGION_SELECT | VARCHAR2(64) | ✓ | ✗ | Region selected for chemical and yield calculator. |
| FINAL_DETERMINATION | VARCHAR2(32) | ✓ | ✗ | SADO final determination of the event |
| MAG_MAGTYPE | VARCHAR2(32) | ✓ | ✗ | String variable of magnitude + magtype used for magtypes selection in SADO tool. |
| OVERBURDEN_SET | VARCHAR2(1) | ✓ | ✗ | Boolean value indicating if the user set the depth of burial manually. |
| OVERBURDEN | FLOAT(24) | ✓ | ✗ | Manually set Depth of Burial in meters. |
| COMMENTS | VARCHAR2(4000) | ✓ | ✗ | Commentary section for the SADO to write any extra information they would like to include in report. |
| ECM_DETERMINATION | VARCHAR2(32) | ✓ | ✗ | ECM determination selected by the user |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author of the SADO Report. |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### SADO_REPORT_LANDMARKS
**Description**: The SADO table contains landmarks and information about land marks related to the event

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| REPORT_LANDMARKS_ID | NUMBER(18) | ✓ | ✗ | Report Landmarks Identifier |
| REPORT_ID | NUMBER(18) | ✓ | ✗ | Report Identifier |
| LOCATION_ID | NUMBER(18) | ✓ | ✗ | Location Identifier |
| TESTSITE | VARCHAR2(1) | ✓ | ✗ | Boolean indicating if the landmark is a testsite from the testsite table |
| NAME | VARCHAR2(64) | ✓ | ✗ | Name for the landmark. If it is a testsite, it is the testsite name. If it is user added, it is the name provided by the user. |
| LAT | FLOAT(24) | ✓ | ✗ | Estimated latitude |
| LON | FLOAT(24) | ✓ | ✗ | Estimated longitude |
| DISTANCE | FLOAT(24) | ✓ | ✗ | Distance of landmark from event location in degrees. |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author of this SADO Report Landmark |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### SADO_SCREENSHOTS
**Description**: The SADO table contains image files related to SADO reports

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| SADO_SCREENSHOT_ID | NUMBER(18) | ✓ | ✗ | SADO Screenshot Identifier |
| REPORT_ID | NUMBER(18) | ✓ | ✗ | Report Identifier |
| TYPE | VARCHAR2(10) | ✓ | ✗ | Screenshot image file types (Initial allowable types (jpg, jpeg, png)) |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author of this SADO Screenshot |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### SADO_STATE
**Description**: The SADO table contains the current state of the reports. T he reports can be new, saved, submitted, or modified.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| SADO_STATE_ID | NUMBER(18) | ✓ | ✗ | SADO State Identifier |
| REPORT_ID | NUMBER(18) | ✓ | ✗ | Report Identifier |
| SADO_STATE_CATEGORY_ID | NUMBER(18) | ✓ | ✗ | SADO State Category Identifier |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author of this SADO State |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### SADO_STATE_CATEGORIES
**Description**: The SADO table contains descriptions of the various states a report can be in.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| SADO_STATE_CATEGORY_ID | NUMBER(18) | ✓ | ✗ | SADO State Category Identifier |
| TITLE | VARCHAR2(64) | ✓ | ✗ | Short description/title of the sado report category |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author of this SADO State Category |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### SADO_USERS
**Description**: The SADO_USERS table contains the first and last name of the SADO to be used for and appear in SADO reports.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| SADO_USERS_ID | NUMBER(18) | ✓ | ✗ | SADO Users Identifier |
| SADO_NAME | VARCHAR2(64) | ✓ | ✗ | First and last name of the SADO. |
| OFFICE_SYMBOL | VARCHAR2(64) | ✓ | ✗ | &nbsp; |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | SADO OS User. |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load Date |

### SENSOR
**Description**: The sensor table contains calibration information for specif ic sensor channels. This table provides a record of updates in the calibration factor or clock error of each instrument and links a sta/chan/time to a complete instrument response in the instrument table. Waveform data are converted into ph ysical units through multiplication by the calib type locate d in wfdisc. The correct value of calib may not be accuratel y known when the wfdisc record is entered into the database. The sensor table provides the mechanism (calratio and calpe r) to update calib, without requiring possibly hundreds of w fdisc records to be updated. Through the foreign key inid, t his table is linked to instrument, which has types pointing to flat files holding detailed calibration information in a variety of formats (see instrument).

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch time of start of recording period |
| ENDTIME | FLOAT(53) | ✓ | ✗ | Epoch time of end of recording period |
| INID | NUMBER(18) | ✓ | ✗ | Instrument identifier |
| CHANID | NUMBER(18) | ✓ | ✗ | Channel identifier |
| JDATE | NUMBER(8) | ✓ | ✗ | Julian date |
| CALRATIO | FLOAT(24) | ✓ | ✗ | Calibration |
| CALPER | FLOAT(24) | ✓ | ✗ | Calibration period |
| TSHIFT | FLOAT(24) | ✓ | ✗ | Correction of data processing time |
| INSTANT | VARCHAR2(1) | ✓ | ✗ | Discrete/continuing (y, n) snapshot |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### SITE
**Description**: The site table contains station location information. It nam es and describes a point on the earth where measurements are made (e.g., the location of an instrument or array of instr uments). This table contains information that normally chang es infrequently, such as location. In addition, the site tab le contains types that describe the offset of a station rela tive to an array reference location. Global data integrity i mplies that the sta/ondate in site be consistent with the st a/chan/ondate in the sitechan table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| STA | VARCHAR2(6) | ✓ | ✗ | Station identifier |
| ONDATE | NUMBER(8) | ✓ | ✗ | Julian start date |
| OFFDATE | NUMBER(8) | ✓ | ✗ | Julian off date |
| LAT | FLOAT(53) | ✓ | ✗ | Latitude |
| LON | FLOAT(53) | ✓ | ✗ | Longitude |
| ELEV | FLOAT(24) | ✓ | ✗ | Elevation |
| STANAME | VARCHAR2(50) | ✓ | ✗ | Station description |
| STATYPE | VARCHAR2(4) | ✓ | ✗ | Station type (single station, array) |
| REFSTA | VARCHAR2(6) | ✓ | ✗ | Reference station for array members |
| DNORTH | FLOAT(24) | ✓ | ✗ | Offset from array reference (km) |
| DEAST | FLOAT(24) | ✓ | ✗ | Offset from array reference (km) |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### SITEAUX
**Description**: The siteaux table contains additional site-dependent paramet ers that are not included in the site table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch time |
| NOIS | FLOAT(24) | ✓ | ✗ | Noise amplitude |
| NOISSD | FLOAT(24) | ✓ | ✗ | Standard deviation of log noise |
| AMCOR | FLOAT(24) | ✓ | ✗ | Amplitude correction |
| AMCORSD | FLOAT(24) | ✓ | ✗ | Correction standard deviation |
| SNTHRSH | FLOAT(24) | ✓ | ✗ | Signal/noise detection threshold |
| RELY | FLOAT(24) | ✓ | ✗ | Station reliability |
| PTMCOR | FLOAT(24) | ✓ | ✗ | P arrival time correction |
| STMCOR | FLOAT(24) | ✓ | ✗ | S arrival time correction |
| STAPER | FLOAT(24) | ✓ | ✗ | Period for measurements |
| DELK | FLOAT(24) | ✓ | ✗ | Estimate of slowness model uncertainty |
| DELS | FLOAT(24) | ✓ | ✗ | Estimate of slowness measurement uncertainty |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### SITECHAN
**Description**: The sitechan table contains station-channel information. It describes the orientation of a recording channel at the site referenced by sta. The table provides information about the various channels that are available at a station and mainta ins a record of the physical channel configuration at a site .

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| STA | VARCHAR2(6) | ✓ | ✗ | Station identifier |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| ONDATE | NUMBER(8) | ✓ | ✗ | Julian start date |
| CHANID | NUMBER(18) | ✓ | ✗ | Channel identifier |
| OFFDATE | NUMBER(8) | ✓ | ✗ | Julian off date |
| CTYPE | VARCHAR2(4) | ✓ | ✗ | Channel type |
| EDEPTH | FLOAT(24) | ✓ | ✗ | Emplacement depth |
| HANG | FLOAT(24) | ✓ | ✗ | Horizontal angle |
| VANG | FLOAT(24) | ✓ | ✗ | Vertical angle |
| DESCRIP | VARCHAR2(50) | ✓ | ✗ | Channel description |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### SNR_PHASE
**Description**: The snr_phase table contains the minimum number of stations and signal-to-noise ratio needed to measure each phase in ea ch region for each station and channel. These parameters ar e used for discriminants which are ratios of two phases.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| POLYID | NUMBER(18) | ✓ | ✗ | Polygon Identifier |
| AMPCOR_VERID | NUMBER(18) | ✓ | ✗ | amplitude correction version identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station name |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel name |
| PHASE | VARCHAR2(8) | ✓ | ✗ | phase of interest |
| MIN_NUM_ELEM | NUMBER(3) | ✓ | ✗ | Minimum number of elements needed |
| SNR_THRESH | FLOAT(53) | ✓ | ✗ | Minimum signal-to-noise ratio needed |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### SREGION
**Description**: The sregion table contains seismic region numbers and their equivalent descriptions.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| SRN | NUMBER(8) | ✓ | ✗ | Seismic region number |
| SRNAME | VARCHAR2(40) | ✓ | ✗ | Seismic region name |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### STAMAG
**Description**: The stamag table contains station magnitude estimates based upon measurements made on specific seismic phases. Values in the stamag table are used to calculate network magnitudes s tored in the netmag table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| MAGID | NUMBER(18) | ✓ | ✗ | Magnitude identifier |
| AMPID | NUMBER(18) | ✓ | ✗ | Amplitude identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| EVID | NUMBER(18) | ✓ | ✗ | Event identifier |
| PHASE | VARCHAR2(8) | ✓ | ✗ | Associated phase |
| DELTA | FLOAT(24) | ✓ | ✗ | Station-to-event distance |
| MAGTYPE | VARCHAR2(6) | ✓ | ✗ | Magnitude type (ml, ms, mb, etc.) |
| MAGNITUDE | FLOAT(24) | ✓ | ✗ | Magnitude |
| UNCERTAINTY | FLOAT(24) | ✓ | ✗ | Magnitude uncertainty |
| MAGRES | FLOAT(24) | ✓ | ✗ | Magnitude residual |
| MAGDEF | VARCHAR2(1) | ✓ | ✗ | flag indicating if magnitude is defining (d,D) or nondefining (n,N,x,X) |
| MMODEL | VARCHAR2(15) | ✓ | ✗ | Magnitude model |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### STANET
**Description**: The stanet table is used for Distributed Processing. It cont ains station to array mapping.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| NET | VARCHAR2(8) | ✓ | ✗ | Unique network identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station identifier |
| TIME | FLOAT(53) | ✓ | ✗ | Starting time for station in network |
| ENDTIME | FLOAT(53) | ✓ | ✗ | endtime for station in network |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### STAQUAL_DNAMES
**Description**: The staqual_dnames table contains reference data of the Stat ion and the associated detection beam for use with staqual_d aily_summary table to determine which dname is used for a pa rticular station quality measurement.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| ID | NUMBER(18) | ✓ | ✗ | Station Quality Dname Unique identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station name |
| DNAME | VARCHAR2(8) | ✓ | ✗ | Detection beam or channel name |
| ON_TIME | FLOAT(53) | ✓ | ✗ | Epoch time when a station was turned on |
| OFF_TIME | FLOAT(53) | ✓ | ✗ | Epoch time when a station was or will be turned off |
| AUTHOR | VARCHAR2(64) | ✓ | ✗ | Author |
| MODDATE | DATE(7) | ✓ | ✗ | Modification date |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### STATION_PROCESSING
**Description**: The station_processing table provides a link between the sta tion and the cluster and the processing recipe for that proc essing type.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLUSTAID | NUMBER(18) | ✓ | ✗ | ID number of a cluster and refsta combination |
| ACTIVETIME | FLOAT(53) | ✓ | ✗ | The epochtime a cluster was activated |
| PROCID | NUMBER(18) | ✓ | ✗ | procid of the processing recipe |
| PROCTYPE | VARCHAR2(15) | ✓ | ✗ | The type of processing (ex: SVD, AMP, Corr) |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### STATION_QUALITY
**Description**: The station_quality table holds station quality attributes c alculated and stored by DFX.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| SQID | NUMBER(18) | ✓ | ✗ | Station quality identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station name |
| DNAME | VARCHAR2(8) | ✓ | ✗ | Detection beam or channel name |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch start time of segment |
| ENDTIME | FLOAT(53) | ✓ | ✗ | Epoch end time of segment |
| JDATE | NUMBER(8) | ✓ | ✗ | Julian date of start time |
| AVGCHANS | FLOAT(24) | ✓ | ✗ | Average number of active channels |
| EXPECTED | FLOAT(53) | ✓ | ✗ | Expected number of seconds of data for segment |
| RETRIEVED | FLOAT(53) | ✓ | ✗ | Actual number of seconds of data for a segment |
| MASKED | FLOAT(53) | ✓ | ✗ | Number of seconds masked in segment |
| MASKS | NUMBER(8) | ✓ | ✗ | Number of masks in segment |
| NDET_THRES | FLOAT(24) | ✓ | ✗ | Normalized detection threshold |
| AZIMUTH | FLOAT(24) | ✓ | ✗ | Beam azimuth |
| SLOW | FLOAT(24) | ✓ | ✗ | Beam slowness |
| NOISE | FLOAT(24) | ✓ | ✗ | Noise level for segment |
| NOISEDEV | FLOAT(24) | ✓ | ✗ | Estimate of variability in noise level for the segment |
| NOISETYPE | VARCHAR2(10) | ✓ | ✗ | mean-sd; noise=power beam mean; noisedev=standard deviation; med-mad; noise=power beam median; noisedev=median absolute deviation |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### STAYIELD
**Description**: The stayield table contains yield values calculated from cod a amplitudes obtained for a single station.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| YIELDID | NUMBER(18) | ✓ | ✗ | Yield identifier |
| AMPID | NUMBER(18) | ✓ | ✗ | Amplitude identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station identifier |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| ORID | NUMBER(18) | ✓ | ✗ | Origin identifier |
| ARID | NUMBER(18) | ✓ | ✗ | Arrival identifier |
| YIELD | FLOAT(24) | ✓ | ✗ | Yield |
| FFACTOR | FLOAT(24) | ✓ | ✗ | Yield F factor (log 10) |
| WMODEL_NAME | VARCHAR2(50) | ✓ | ✗ | Yield model name |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### STA_CODA_SPECTRUM
**Description**: The sta_coda_spectrum table contains the theoretical source spectrum for an event, used to obtain the station moment mag nitude values. The theoretical spectrum is fit to the observ ed spectrum in all frequency bands for a station that are se t to defining in the envelope_contribution table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| AMPID | NUMBER(18) | ✓ | ✗ | Amplitude identifier |
| FREQ | FLOAT(24) | ✓ | ✗ | Frequency |
| AMPCOR | FLOAT(24) | ✓ | ✗ | Amplitude value corrected for path and site |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### SVDDISC
**Description**: The svddisc table contains a left singular vector (LSV) head er file and descriptive information. This table provides a p ointer (or index) to singular value decompositions stored on disk. The LSVs are stored in ordinary disk files called svd disc or '.lsv' files as a sequence of binary four byte float values.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| LSVID | NUMBER(18) | ✓ | ✗ | Left Singular Vector identifier |
| CLUSTAID | NUMBER(18) | ✓ | ✗ | Detector identifier |
| ACTIVETIME | FLOAT(53) | ✓ | ✗ | The epochtime a cluster was activated |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code (Ref Sta) |
| NSAMP | NUMBER(8) | ✓ | ✗ | Number of samples |
| SAMPRATE | FLOAT(24) | ✓ | ✗ | Sampling rate in samples/sec |
| SINGULAR_VALUE | FLOAT(24) | ✓ | ✗ | Singular value |
| UNITS | VARCHAR2(1) | ✓ | ✗ | Units of waveform used to create LSV |
| DIR | VARCHAR2(64) | ✓ | ✗ | Directory |
| DFILE | VARCHAR2(32) | ✓ | ✗ | Data file |
| FOFF | NUMBER(10) | ✓ | ✗ | Byte offset of data segment within file |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### SVDDISC_CHAN_ORDER
**Description**: The svddisc_chan_order table contains the order in which the sta and chans were combined together to form the input sent to the SVD. This is the order in which the sta and chans ar e passed to the SVD must be the same as the order of the sta and chans of the observed data passed to the SVD.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLUSTAID | NUMBER(18) | ✓ | ✗ | ID of the Cluster and Station |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(6) | ✓ | ✗ | Channel code |
| ACTIVETIME | FLOAT(53) | ✓ | ✗ | The epochtime a cluster was activated |
| SORT_ORDER | NUMBER(6) | ✓ | ✗ | Sort order |

### TAPER
**Description**: The taper table contains processing parameter.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| TAPERID | NUMBER(18) | ✓ | ✗ | ID number of a taper processing parameter |
| TAPER_TYPE | VARCHAR2(16) | ✓ | ✗ | Type of tapering to be applied during filtering |
| TAPER_PERCT | FLOAT(24) | ✓ | ✗ | Percent of points to be tapered |
| TAPER_MAXPTS | NUMBER(8) | ✓ | ✗ | Max allowed taper points |
| TAPER_MINPTS | NUMBER(8) | ✓ | ✗ | Min allowed taper points |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### TIMESTAMP
**Description**: The timestamp table is used by automated processing to recor d time milestones associated with time-series data.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| PROCCLASS | VARCHAR2(16) | ✓ | ✗ | Process class |
| PROCNAME | VARCHAR2(16) | ✓ | ✗ | Process name |
| TIME | FLOAT(53) | ✓ | ✗ | Last epoch time |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### TOMO_INFO
**Description**: The tomo_info table contains pointers to the storage locatio n of the tomography grids used by coda magnitude processing to obtain the path correction values.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| TOMOID | NUMBER(18) | ✓ | ✗ | Tomography identifier |
| MINLAT | FLOAT(24) | ✓ | ✗ | Minimum latitude |
| MAXLAT | FLOAT(24) | ✓ | ✗ | Maximum latitude |
| DLAT | FLOAT(24) | ✓ | ✗ | Latitude grid spacing (latitude interval) |
| MINLON | FLOAT(24) | ✓ | ✗ | Minimum longitude |
| MAXLON | FLOAT(24) | ✓ | ✗ | Maximum longitude |
| DLON | FLOAT(24) | ✓ | ✗ | Longitude grid spacing (longitude interval) |
| DIR | VARCHAR2(64) | ✓ | ✗ | Directory |
| DFILE | VARCHAR2(32) | ✓ | ✗ | Data file |
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author |
| DESCRIP | VARCHAR2(50) | ✓ | ✗ | Description |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### USER_FILTER
**Description**: The user_filter table is used to store the list of filters d esignated by a user to be their filter selection list option s.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| OSUSER | VARCHAR2(30) | ✓ | ✗ | System user identifier |
| SEQ | NUMBER(9) | ✓ | ✗ | Order that the filter will be displayed in the list. |
| FILTER_STRING | VARCHAR2(1024) | ✓ | ✗ | Compact filter representation used as parameter to filter_data_by_string module. |
| FILTERID | NUMBER(18) | ✓ | ✗ | Filter pointer to desired filter. |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### USER_PRIVILEGES
**Description**: This table lists the users who are allowed to apply channel masks to waveform data and the maximum time duration each us er can apply a channel mask (applies to omitted_channels tab le). This table also lists the users who are allowed to appl y nondefining location and magnitude indicators (timedef, az def, slodef and magdef) without respect to time duration (ap plies to nondefining table).

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| AUTH | VARCHAR2(15) | ✓ | ✗ | Author (authorized user) |
| MAX_DURATION | NUMBER(9) | ✓ | ✗ | Maximum length of channel masking |
| APP_TABLE | VARCHAR2(32) | ✓ | ✗ | Table that this authorization applies to |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### WFACTIVITY
**Description**: The wfactivity table describes activity in the wfdisc table for a channel group and time region.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| CLASS | VARCHAR2(16) | ✓ | ✗ | Type of interval |
| NAME | VARCHAR2(20) | ✓ | ✗ | Name of interval |
| TIME | FLOAT(53) | ✓ | ✗ | Last epoch time |
| DURATION | FLOAT(24) | ✓ | ✗ | Duration in seconds of the time region |
| MIN_TIME | FLOAT(53) | ✓ | ✗ | Minimum time found in wfdisc for the time period |
| MAX_ENDTIME | NUMBER() | ✓ | ✗ | Maximum endtime found in wfdisc for the time period |
| MODDATE | DATE(7) | ✓ | ✗ | Time of last processing state change |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### WFAUDIT
**Description**: The wfaudit table contains records describing the sequences of changes made to rows in the wfdisc table for continuous ( raw) waveform data

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| WFAUDITID | NUMBER(18) | ✓ | ✗ | Wfaudit unique identifier |
| STA | VARCHAR2(6) | ✓ | ✗ | Station code. |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code. |
| OLD_TIME | FLOAT(53) | ✓ | ✗ | :old.time value provided to the wfdisc trigger |
| NEW_TIME | FLOAT(53) | ✓ | ✗ | :new.time value provided to the wfdisc trigger |
| OLD_ENDTIME | FLOAT(53) | ✓ | ✗ | :old.endtime provided to the wfdisc trigger |
| NEW_ENDTIME | FLOAT(53) | ✓ | ✗ | :new.endtime provided to the wfdisc trigger |
| MODDATE | DATE(7) | ✓ | ✗ | Time of last processing state change |

### WFCONV
**Description**: The wfconv table contains data translations that are to be p erformed on incoming data before they are written to disk by the DLMan application. Data compression types include &quot;-&quot; i f the data is not compressed or &quot;CA&quot; for Canadian compressio n. &quot;Type&quot; in columns intype and outtype is the fixed-width d ata type (e.g., &quot;s4&quot;) or - if not applicable (i.e., if the d ata is compressed). An insamp value of zero (0) indicates th at the number of samples varies. Values less than zero in co lumns insamp and outsamp indicate that the total number of s amples must be evenly divisible by insamp. Strip indicates w hether to strip the authentication headers from the data; &quot;y &quot; means strip them and n means do not strip them.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| CHANID | NUMBER(18) | ✓ | ✗ | Channel identifier |
| INAUTH | VARCHAR2(1) | ✓ | ✗ | Input authenticated (y or n) |
| INCOMP | VARCHAR2(2) | ✓ | ✗ | Input compression type |
| INTYPE | VARCHAR2(2) | ✓ | ✗ | Input fixed-width datatype |
| INSAMP | NUMBER(8) | ✓ | ✗ | Input samples per packet |
| OUTAUTH | VARCHAR2(1) | ✓ | ✗ | Output authenticated (y or n) |
| OUTCOMP | VARCHAR2(2) | ✓ | ✗ | Output compression type |
| OUTTYPE | VARCHAR2(2) | ✓ | ✗ | Output fixed-width datatype |
| OUTSAMP | NUMBER(8) | ✓ | ✗ | Output samples per packet |
| STRIP | VARCHAR2(1) | ✓ | ✗ | Data stripped of headers |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### WFDISC
**Description**: The wfdisc table contains a waveform header file and descrip tive information. This table provides a pointer (or index) t o waveforms stored on disk. The waveforms themselves are sto red in ordinary disk files called wfdisc or '.w' files as a sequence of sample values (usually in binary representation) .

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| STA | VARCHAR2(6) | ✓ | ✗ | Station code |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| TIME | FLOAT(53) | ✓ | ✗ | Epoch time of first sample in file |
| WFID | NUMBER(18) | ✓ | ✗ | Waveform identifier |
| CHANID | NUMBER(18) | ✓ | ✗ | Channel identifier |
| JDATE | NUMBER(8) | ✓ | ✗ | Julian date |
| ENDTIME | FLOAT(53) | ✓ | ✗ | Time + (nsamp-1)/ samprate |
| NSAMP | NUMBER(8) | ✓ | ✗ | Number of samples |
| SAMPRATE | FLOAT(24) | ✓ | ✗ | Sampling rate in samples/sec |
| CALIB | FLOAT(24) | ✓ | ✗ | Nominal calibration |
| CALPER | FLOAT(24) | ✓ | ✗ | Nominal calibration period |
| INSTYPE | VARCHAR2(6) | ✓ | ✗ | Instrument code |
| SEGTYPE | VARCHAR2(1) | ✓ | ✗ | Indexing method |
| DATATYPE | VARCHAR2(2) | ✓ | ✗ | Numeric storage |
| CLIP | VARCHAR2(1) | ✓ | ✗ | Clipped flag |
| DIR | VARCHAR2(64) | ✓ | ✗ | Directory |
| DFILE | VARCHAR2(32) | ✓ | ✗ | Data file |
| FOFF | NUMBER(10) | ✓ | ✗ | Byte offset of data segment within file |
| COMMID | NUMBER(18) | ✓ | ✗ | Comment identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### WFFILE
**Description**: The wffile table describes the files used in the Wave Form F iles managed by the Continuous Data Services Subsystem.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| WFFID | NUMBER(18) | ✓ | ✗ | Wave Form File identifier |
| DIR | VARCHAR2(64) | ✓ | ✗ | Directory name |
| DFILE | VARCHAR2(32) | ✓ | ✗ | Filename |
| MACHINE | VARCHAR2(32) | ✓ | ✗ | Machine name |
| LOCAL_DIR | VARCHAR2(64) | ✓ | ✗ | Local directory |
| TLEN | FLOAT(24) | ✓ | ✗ | Length of file, in seconds |
| TIME | FLOAT(53) | ✓ | ✗ | Start time |
| REAPTIME | FLOAT(53) | ✓ | ✗ | Clock time for expiration |
| STA | VARCHAR2(6) | ✓ | ✗ | Station name |
| CHAN | VARCHAR2(8) | ✓ | ✗ | Channel code |
| SAMPRATE | FLOAT(24) | ✓ | ✗ | Sampling Rate in samples per second |
| CHANID | NUMBER(18) | ✓ | ✗ | Channel identifier |
| WFMID | NUMBER(18) | ✓ | ✗ | Wave Form Manager identifier |
| MODDATE | DATE(7) | ✓ | ✗ | &nbsp; |
| LDDATE | DATE(7) | ✓ | ✗ | &nbsp; |

### WFTAG
**Description**: The wftag table links various identifiers (e.g., orid, arid, and stassid to wfid). Linkages can also be determined indir ectly using sta/chan/time; however, it is more efficient to use the wftag table.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| TAGNAME | VARCHAR2(8) | ✓ | ✗ | Key (arid, orid, evid, etc.) |
| TAGID | NUMBER(18) | ✓ | ✗ | Tagname value |
| WFID | NUMBER(18) | ✓ | ✗ | Waveform identifier |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

### XTAG
**Description**: The xtag table links various identifiers (e.g., orid, arid, stassid, and wfid) to other identifiers. This table is a gen eralization of the wftag table, which is limited to linking exclusively to the wfdisc table. The thisdb column describes the database account for the record specified by thisid and thisname; thatdb describes the database account for the rec ord specified by thatid and thatname. When a parent/child ta ble exists between the records thisid should designate the p arent and thatid should designate the child.

| Column | Type | Nullable | Primary Key | Description |
|--------|------|----------|-------------|-------------|
| THISID | NUMBER(18) | ✓ | ✗ | thisname identifier |
| THATID | NUMBER(18) | ✓ | ✗ | thatname identifier |
| THISNAME | VARCHAR2(8) | ✓ | ✗ | Key for thisid (grid, orid, ntid, and so on) |
| THATNAME | VARCHAR2(8) | ✓ | ✗ | Key for thatid (arid, orid, nfid, and so on) |
| THISDB | VARCHAR2(32) | ✓ | ✗ | Database account for the records specified by thisid and thisname |
| THATDB | VARCHAR2(32) | ✓ | ✗ | Database account for the records specified by thatid and thatname |
| LDDATE | DATE(7) | ✓ | ✗ | Load date |

