# Agent-Business

**Agent-Business** defines the canonical business-domain layer for AGenNext.

It models how an organization, business unit, customer, partner, vendor, product, service, contract, offer, process, policy, and metric are represented inside the Agent Fabric.

Agent-Business is not an ERP, CRM, accounting system, or marketplace. It is the shared business ontology and contract layer that lets agents operate with business context without inventing local meanings.

## Purpose

Agent-Business provides canonical contracts for:

- business identity
- organization structure
- customer and account context
- products and services
- offers and commercial terms
- contracts and obligations
- business capabilities
- business processes
- operating policies
- KPIs and metrics
- ownership and responsibility
- handoff between commerce, pay, CRM, support, finance, and operations agents

## Core Rule

Every business action must be linked to:

- a business owner
- a tenant
- an accountable actor
- a business object
- a policy context
- a trace id
- an intended outcome

## Boundary

| Repository | Responsibility |
| --- | --- |
| Agent-Business | Business ontology, contracts, capabilities, processes, policies, metrics |
| Agent-Commerce | Catalog, offer, cart, order, checkout, fulfillment commerce flows |
| Agent-Pay | Payment intent, proof, acknowledgement, settlement, disputes |
| Agent-Currency | Value units, metering, pricing, accounting value events |
| Agent-Identity | Person, organization, agent, DID/VC identity verification |
| Agent-Policy | Rules, permissions, approvals, constraints |
| Agent-Traces | Execution timeline and audit events |

## Canonical Entities

| Entity | Purpose |
| --- | --- |
| `BusinessEntity` | Organization, business unit, vendor, partner, or customer organization |
| `BusinessAccount` | Account/customer relationship container |
| `BusinessCapability` | Durable capability such as sales, support, procurement, billing |
| `BusinessProcess` | Repeatable process with inputs, outputs, controls, and owners |
| `BusinessPolicyRef` | Link to a policy governing a business action |
| `BusinessOffer` | Business-level offer before commerce checkout/payment specifics |
| `BusinessContract` | Agreement, obligation, entitlement, and responsibility wrapper |
| `BusinessMetric` | KPI or operational measurement |
| `BusinessAction` | Governed business operation requested or performed by a human or agent |

## Commands

```bash
npm install
npm run typecheck
npm run build
npm run conformance
```

## Status

Conformance scaffold is present. Runtime integrations belong in downstream repositories.

## License

UNLICENSED until the foundation license is finalized.
