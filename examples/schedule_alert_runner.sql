BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => 'JOB_ALERT_RUNNER',
    job_type        => 'EXECUTABLE',
    job_action      => '/usr/bin/python3 /opt/alerting_engine/alert_runner.py',
    repeat_interval => 'FREQ=MINUTELY;INTERVAL=15',
    enabled         => TRUE
  );
END;
/

