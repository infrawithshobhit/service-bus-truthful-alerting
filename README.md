# Service Bus Truthful Alerting

Most Azure Service Bus alerts are wrong.

They alert on **queue length**, not **system health** — which causes false alarms during traffic spikes and hides real failures during slow drains.

This repository shows how to build **truth-based Service Bus alerts** using:
- Azure Service Bus Diagnostic Logs
- Azure Log Analytics (KQL)
- Backlog vs Drain-Rate detection

The goal is simple:

> Alert only when the system is actually falling behind — not when it is just busy.

---

## ❌ The Problem

Azure Monitor’s default Service Bus alerts are based on:
- `ActiveMessages`
- `DeadLetterMessages`

These are **static counts**.  
They do NOT tell you:
- Are consumers alive?
- Is backlog shrinking?
- Are messages failing?
- Is the system recovering?

A queue can be large and healthy.  
A queue can be small and broken.

Queue size ≠ Queue health.

---

## ✅ The Solution

Service Bus emits **operational telemetry** (send, receive, complete, deadletter, locks, errors) — but Azure discards it unless you explicitly send it to Log Analytics.

Once enabled, you can compute:
- Incoming vs Processed rate
- Backlog growth
- Drain-rate
- DLQ activity
- Oldest message age

This lets you build **truth-based alerts** instead of noise.

---

## 🏗 Architecture

Service Bus  
→ Diagnostic Settings  
→ Log Analytics  
→ KQL  
→ Azure Monitor Alerts  

---

## 🧪 What this repo gives you

- Terraform to enable Service Bus telemetry
- KQL to calculate backlog & drain
- Alert logic to detect real failures

This pattern works for:
- Azure Functions
- Event-driven platforms
- Data pipelines
- Integration systems

---

## 👨‍💻 Author

Shobhit Verma  
Lead SRE & Observability Engineer  
