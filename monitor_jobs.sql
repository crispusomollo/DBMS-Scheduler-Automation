-- monitor_jobs.sql

SELECT
  job_name,
  enabled,
  state,
  last_start_date,
  last_run_duration,
  failure_count
FROM dba_scheduler_jobs
WHERE job_name LIKE 'JOB_%'
ORDER BY job_name;

-- Recent failures
SELECT
  job_name,
  status,
  error#,
  actual_start_date,
  run_duration,
  additional_info
FROM dba_scheduler_job_run_details
WHERE status != 'SUCCEEDED'
ORDER BY actual_start_date DESC;

