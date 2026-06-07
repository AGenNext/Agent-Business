export type BusinessEntityType = 'organization' | 'customer' | 'partner' | 'vendor' | 'business_unit';
export type LifecycleState = 'draft' | 'active' | 'suspended' | 'terminated' | 'expired';

export interface BusinessEntity {
  id: string;
  tenant: string;
  type: BusinessEntityType;
  name: string;
  owner: string;
}

export interface BusinessAccount {
  id: string;
  tenant: string;
  entity: string;
  owner: string;
  status: LifecycleState;
}

export interface BusinessCapability {
  id: string;
  tenant: string;
  name: string;
  owner: string;
  inputs: string[];
  outputs: string[];
}

export interface BusinessProcess {
  id: string;
  tenant: string;
  capability: string;
  owner: string;
  steps: string[];
  controls: string[];
}

export interface BusinessPolicyRef {
  id: string;
  policy: string;
  version: string;
  required: boolean;
}

export interface BusinessOffer {
  id: string;
  tenant: string;
  seller: string;
  buyer?: string;
  item: string;
  terms: string[];
  policyRefs: BusinessPolicyRef[];
}

export interface BusinessContract {
  id: string;
  tenant: string;
  parties: string[];
  obligations: string[];
  responsibilities: string[];
  status: LifecycleState;
}

export interface BusinessMetric {
  id: string;
  tenant: string;
  name: string;
  owner: string;
  unit: string;
  value: number;
  measuredAt: string;
  traceId: string;
}

export interface BusinessAction {
  id: string;
  tenant: string;
  actor: string;
  owner: string;
  businessObject: string;
  policyRefs: BusinessPolicyRef[];
  intendedOutcome: string;
  traceId: string;
  timestamp: string;
}

export interface ValidationResult {
  ok: boolean;
  errors: string[];
}

function required(value: unknown): boolean {
  return !(value === undefined || value === null || value === '');
}

export function validateBusinessAction(action: BusinessAction): ValidationResult {
  const errors: string[] = [];
  if (!required(action.tenant)) errors.push('tenant is required');
  if (!required(action.actor)) errors.push('actor is required');
  if (!required(action.owner)) errors.push('owner is required');
  if (!required(action.businessObject)) errors.push('businessObject is required');
  if (!required(action.intendedOutcome)) errors.push('intendedOutcome is required');
  if (!required(action.traceId)) errors.push('traceId is required');
  if (!required(action.timestamp)) errors.push('timestamp is required');
  if (!Array.isArray(action.policyRefs) || action.policyRefs.length === 0) errors.push('at least one policyRef is required');
  return { ok: errors.length === 0, errors };
}

export function validateBusinessContract(contract: BusinessContract): ValidationResult {
  const errors: string[] = [];
  if (!required(contract.tenant)) errors.push('tenant is required');
  if (!Array.isArray(contract.parties) || contract.parties.length < 2) errors.push('at least two parties are required');
  if (!Array.isArray(contract.obligations) || contract.obligations.length === 0) errors.push('obligations are required');
  if (!Array.isArray(contract.responsibilities) || contract.responsibilities.length === 0) errors.push('responsibilities are required');
  if (!required(contract.status)) errors.push('status is required');
  return { ok: errors.length === 0, errors };
}
