BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => 'JOB_PERF_PIPELINE',
    job_type        => 'EXECUTABLE',
    job_action      => '/opt/oracle/performance_monitoring_pipeline/pipeline.sh',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=DAILY;BYHOUR=1',
    enabled         => TRUE,
    comments        => 'Daily performance monitoring pipeline'
  );
END;
/

