# Cross-Schema Mapping Documentation

This document describes the relationships and migration paths between the three NDC database schemas: Legacy, NDC Plus, and NDC Plus 2.

## Schema Evolution Overview

```
Legacy Schema (CSS) → NDC Plus Schema → NDC Plus 2 Schema
     |                                        ↗
     └────── Direct Migration Path ──────────┘
```

## Available Mapping Files

### 1. Legacy_to_Plus2_Mapping.mmd
**Purpose**: Direct migration mapping from Legacy to NDC Plus 2
**Format**: Mermaid ERD
**Use Case**: Organizations wanting to migrate directly from Legacy to NDC Plus 2

**Key Mappings**:
- `LEG_EVENT` → `EVENT` (EVID preservation)
- `LEG_ORIGIN` → `LOCATION_SOLUTION` (ORID mapping)
- `LEG_ARRIVAL` → `SIGNAL_DETECTION_HYPOTHESIS` (ARID mapping)
- `LEG_AMPLITUDE` → `AMPLITUDE` (AMPID mapping)
- `LEG_ASSOC` → `LOCATION_BEHAVIOR` (association tracking)
- `LEG_NETMAG` → `NETWORK_MAGNITUDE_SOLUTION` (network magnitude)
- `LEG_STAMAG` → `STATION_MAGNITUDE_SOLUTION` (station magnitude)
- `LEG_WFDISC` → `CHANNEL_SEGMENT_WAVEFORM` (waveform data)
- `LEG_QCMASK` → `QC_SEGMENT_VERSION` (quality control)
- `LEG_REMARK` → `REMARK` (comments/remarks)

### 2. Three_Schema_Mapping.mmd
**Purpose**: Comprehensive evolution diagram showing all three schemas
**Format**: Mermaid Flowchart
**Use Case**: Understanding the complete evolution path and relationships

**Features**:
- Visual representation of all three schemas
- Legacy → NDC Plus mapping (dotted lines)
- Legacy → NDC Plus 2 mapping (thick lines)
- NDC Plus → NDC Plus 2 evolution (solid lines)
- Color-coded schema groups

### 3. Cross_Schema_Mapping.mmd (Original)
**Purpose**: Original Legacy to NDC Plus mapping
**Format**: Mermaid Flowchart
**Use Case**: Organizations migrating from Legacy to NDC Plus

## Migration Strategies

### Strategy 1: Direct Legacy → NDC Plus 2
**Best For**: Organizations ready to adopt the latest schema
**Benefits**: 
- Skip intermediate migration
- Access to all latest features
- Single migration effort

**Considerations**:
- Larger change impact
- More comprehensive testing needed
- Training on new features required

### Strategy 2: Staged Migration (Legacy → NDC Plus → NDC Plus 2)
**Best For**: Organizations preferring incremental changes
**Benefits**:
- Smaller change increments
- Learn NDC Plus concepts first
- Easier rollback options

**Considerations**:
- Two migration phases
- More overall effort
- Intermediate state maintenance

## Key Schema Differences

### Legacy to NDC Plus 2 Major Changes

1. **Event Management**
   - Legacy: Simple EVENT table
   - Plus 2: Enhanced EVENT with monitoring organization tracking

2. **Location Solutions**
   - Legacy: ORIGIN table
   - Plus 2: LOCATION_SOLUTION with uncertainty modeling

3. **Signal Detection**
   - Legacy: ARRIVAL table
   - Plus 2: SIGNAL_DETECTION_HYPOTHESIS with advanced metadata

4. **Quality Control**
   - Legacy: QCMASK table
   - Plus 2: QC_SEGMENT_VERSION with comprehensive tracking

5. **Magnitude Solutions**
   - Legacy: NETMAG/STAMAG tables
   - Plus 2: Enhanced NETWORK_MAGNITUDE_SOLUTION/STATION_MAGNITUDE_SOLUTION

## Field Mapping Details

### Primary Key Preservation
Most primary keys are preserved during migration:
- `EVID` (Event ID) - preserved across all schemas
- `ORID` (Origin/Location ID) - preserved
- `ARID` (Arrival/Signal Detection ID) - preserved
- `AMPID` (Amplitude ID) - preserved

### New Fields in NDC Plus 2
- `MONITORING_ORGANIZATION` - tracks data source
- `ISCURRENT` - version control
- `MODDATE` - modification tracking
- `STAGE` - processing stage information
- `AUTHOR` - processing authority

### Enhanced Relationships
NDC Plus 2 introduces more sophisticated relationship modeling:
- Location behavior tracking
- Feature predictions
- Channel segment management
- Processing mask integration

## Implementation Recommendations

1. **Assessment Phase**
   - Inventory current Legacy schema usage
   - Identify custom modifications
   - Plan for new NDC Plus 2 features

2. **Migration Planning**
   - Choose direct vs. staged approach
   - Develop data transformation scripts
   - Plan validation procedures

3. **Testing Strategy**
   - Validate key preservation
   - Test relationship integrity
   - Verify performance characteristics

4. **Training Requirements**
   - New schema concepts
   - Enhanced features
   - Operational procedures

## Related Documentation

- [Legacy Schema Documentation](Legacy_schema.mmd)
- [NDC Plus Schema Documentation](NDC_PLUS_schema.mmd)
- [NDC Plus 2 Schema Documentation](NDC_Plus2.mmd)
- [Static Documentation Portal](http://ndc-schematest.s3-website-us-east-1.amazonaws.com/)
- [Live Documentation Portal](http://ndc-schema-rds.s3-website-us-east-1.amazonaws.com/)