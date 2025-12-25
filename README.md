# 📚 DBMS_SCHEDULER Automation

## 🎯 Purpose

This repository demonstrates **enterprise-level job scheduling and automation** using Oracle’s **DBMS_SCHEDULER**. It:

* Automates pipelines (metrics, performance checks)
* Schedules Indexing and Partitioning workflows
* Ensures continuous monitoring and incident management
* Enables repeatable, auditable DBA operations

It integrates all other repos in the series, completing the **end-to-end operational workflow**.

---

## 🔗 Position in the DBA Series

```
Performance Monitoring Pipeline
        ↓
Alerting Engine
        ↓
Incident Detection & RCA
        ↓
Indexing Strategy
        ↓
Partitioning Strategy
        ↓
DBMS_SCHEDULER Automation  ← this repository
```

* This repo acts as **the orchestrator**, ensuring all scripts, pipelines, and reviews run **automatically**.

---

## 📁 Repository Structure

```
dbms_scheduler_automation/
│
├── README.md
├── create_jobs.sql             -- Core DBMS_SCHEDULER job creation scripts
├── manage_jobs.sql             -- Enable/disable/alter scheduled jobs
├── monitor_jobs.sql            -- Job status, last run, failures
├── run_manual_jobs.sql         -- Execute jobs on-demand for testing
├── incident_triggers.sql       -- Trigger scripts based on alert conditions
├── logs/
│   └── scheduler_job_logs_YYYYMMDD.log
├── examples/
│   ├── schedule_performance_pipeline.sql
│   ├── schedule_index_review.sql
│   ├── schedule_partition_review.sql
│   └── schedule_alert_runner.sql
└── templates/
    └── job_template.sql        -- Standardized job creation template
```

---

## 🔍 Workflow Overview

1. **Job Creation** (`create_jobs.sql` / `templates/job_template.sql`)

   * Define standardized jobs for monitoring, indexing, and partitioning
   * Ensure repeatable configuration with logging

2. **Job Management** (`manage_jobs.sql`)

   * Enable, disable, or modify jobs as needed
   * Handle dynamic changes in schedules or priorities

3. **Monitoring & Logging** (`monitor_jobs.sql`)

   * Track last run, duration, success/failure status
   * Log output to `logs/` for audit and RCA

4. **Manual Execution** (`run_manual_jobs.sql`)

   * On-demand execution for testing or urgent remediation

5. **Incident Triggers** (`incident_triggers.sql`)

   * Conditional job execution based on alerts (e.g., CPU > 90%, blocked sessions)
   * Orchestrates Indexing or Partitioning remediation workflows automatically

6. **Examples** (`examples/`)

   * Ready-made scripts to schedule:

     * Performance Monitoring Pipeline
     * Indexing Strategy review
     * Partitioning Strategy review
     * Alerting Engine execution

---

## 🛠️ Technologies & Concepts Used

* **Oracle DBMS_SCHEDULER**: Jobs, schedules, chains, windows
* **PL/SQL**: Dynamic SQL for job creation & logging
* **Automation & Auditing**: Logging tables, job monitoring, conditional execution
* **Integration**: Orchestrates all other repos in the series

---

## 🎯 Portfolio Highlights

* Demonstrates **operational automation mastery**
* Links alerts → incidents → remediation → validation
* Ensures **continuous, repeatable DBA operations**
* Provides **audit trail for governance and RCA**
* Supports **full portfolio orchestration**, turning scripts into an enterprise-ready system

---

## 📌 Future Enhancements

* **Chain jobs** to execute multi-step remediation automatically
* **Conditional execution** based on performance metrics
* **Notification integration** (email/Slack) for job success/failure
* **Versioned job templates** for production vs development environments

