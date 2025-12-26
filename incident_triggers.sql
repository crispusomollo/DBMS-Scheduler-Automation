-- incident_triggers.sql
-- Trigger remediation based on alert conditions

DECLARE
  v_cpu_pct NUMBER;
BEGIN
  SELECT value
  INTO   v_cpu_pct
  FROM   v$sysmetric
  WHERE  metric_name = 'Host CPU Utilization (%)'
  AND    rownum = 1;

  IF v_cpu_pct > 90 THEN
    DBMS_SCHEDULER.run_job('JOB_INDEX_REVIEW', FALSE);
  END IF;
END;
/

