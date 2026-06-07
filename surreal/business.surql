DEFINE TABLE business_entity SCHEMAFULL;
DEFINE FIELD tenant ON business_entity TYPE string ASSERT $value != NONE;
DEFINE FIELD type ON business_entity TYPE string ASSERT $value IN ['organization', 'customer', 'partner', 'vendor', 'business_unit'];
DEFINE FIELD owner ON business_entity TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD name ON business_entity TYPE string ASSERT string::len($value) > 0;
DEFINE INDEX business_entity_tenant_name ON business_entity FIELDS tenant, name UNIQUE;
DEFINE INDEX business_entity_owner ON business_entity FIELDS owner;

DEFINE TABLE business_account SCHEMAFULL;
DEFINE FIELD tenant ON business_account TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD entity ON business_account TYPE record<business_entity>;
DEFINE FIELD owner ON business_account TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD status ON business_account TYPE string ASSERT $value IN ['draft', 'active', 'suspended', 'terminated', 'expired'];
DEFINE INDEX business_account_tenant ON business_account FIELDS tenant;

DEFINE TABLE business_capability SCHEMAFULL;
DEFINE FIELD tenant ON business_capability TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD name ON business_capability TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD owner ON business_capability TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD inputs ON business_capability TYPE array;
DEFINE FIELD outputs ON business_capability TYPE array;
DEFINE INDEX business_capability_tenant_name ON business_capability FIELDS tenant, name UNIQUE;

DEFINE TABLE business_process SCHEMAFULL;
DEFINE FIELD tenant ON business_process TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD capability ON business_process TYPE record<business_capability>;
DEFINE FIELD owner ON business_process TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD steps ON business_process TYPE array ASSERT array::len($value) > 0;
DEFINE FIELD controls ON business_process TYPE array;
DEFINE INDEX business_process_tenant ON business_process FIELDS tenant;

DEFINE TABLE business_offer SCHEMAFULL;
DEFINE FIELD tenant ON business_offer TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD seller ON business_offer TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD buyer ON business_offer TYPE option<string>;
DEFINE FIELD item ON business_offer TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD terms ON business_offer TYPE array ASSERT array::len($value) > 0;
DEFINE FIELD policyRefs ON business_offer TYPE array ASSERT array::len($value) > 0;
DEFINE INDEX business_offer_tenant ON business_offer FIELDS tenant;

DEFINE TABLE business_contract SCHEMAFULL;
DEFINE FIELD tenant ON business_contract TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD parties ON business_contract TYPE array ASSERT array::len($value) >= 2;
DEFINE FIELD obligations ON business_contract TYPE array ASSERT array::len($value) > 0;
DEFINE FIELD responsibilities ON business_contract TYPE array ASSERT array::len($value) > 0;
DEFINE FIELD status ON business_contract TYPE string ASSERT $value IN ['draft', 'active', 'suspended', 'terminated', 'expired'];
DEFINE INDEX business_contract_tenant ON business_contract FIELDS tenant;

DEFINE TABLE business_metric SCHEMAFULL;
DEFINE FIELD tenant ON business_metric TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD name ON business_metric TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD owner ON business_metric TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD unit ON business_metric TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD value ON business_metric TYPE number;
DEFINE FIELD measuredAt ON business_metric TYPE datetime;
DEFINE FIELD traceId ON business_metric TYPE string ASSERT string::len($value) > 0;
DEFINE INDEX business_metric_tenant_name ON business_metric FIELDS tenant, name;

DEFINE TABLE business_action SCHEMAFULL;
DEFINE FIELD tenant ON business_action TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD actor ON business_action TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD owner ON business_action TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD businessObject ON business_action TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD policyRefs ON business_action TYPE array ASSERT array::len($value) > 0;
DEFINE FIELD intendedOutcome ON business_action TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD traceId ON business_action TYPE string ASSERT string::len($value) > 0;
DEFINE FIELD timestamp ON business_action TYPE datetime;
DEFINE INDEX business_action_tenant_trace ON business_action FIELDS tenant, traceId;
