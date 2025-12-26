-- create_jobs.sql
-- Central job creation entry point

BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => 'JOB_HEALTH_CHECK',
    job_type        => 'PLSQL_BLOCK',
    job_action      => q'[
      BEGIN
        DBMS_OUTPUT.PUT_LINE('Health check executed');
      END;
    ]',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=HOURLY',
    enabled         => FALSE,
    comments        => 'Base health-check job template'
  );
END;
/

