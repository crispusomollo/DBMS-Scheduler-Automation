-- run_manual_jobs.sql

BEGIN
  DBMS_SCHEDULER.run_job(
    job_name            => 'JOB_HEALTH_CHECK',
    use_current_session => FALSE
  );
END;
/

