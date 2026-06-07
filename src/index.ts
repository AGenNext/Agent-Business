export interface BusinessEntity {
  id: string;
  tenant: string;
  type: 'organization' | 'customer' | 'partner' | 'vendor' | 'business_unit';
  name: string;
  owner: string;
}

export interface BusinessContract {
  id: string;
  tenant: string;
  parties: string[];
  obligations: string[];
  status: 'draft' | 'active' | 'suspended' | 'terminated' | 'expired';
}

export interface BusinessAction {
  id: string;
  tenant: string;
  actor: string;
  owner: string;
  traceId: string;
  timestamp: string;
}

export function validateBusinessAction(action: BusinessAction): boolean {
  return Boolean(
    action.tenant &&
    action.actor &&
    action.owner &&
    action.traceId &&
    action.timestamp
  );
}
