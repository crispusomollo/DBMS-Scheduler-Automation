-- manage_jobs.sql

-- Disable a job
BEGIN
  DBMS_SCHEDULER.disable('JOB_HEALTH_CHECK');
END;
/

-- Enable a job
BEGIN
  DBMS_SCHEDULER.enable('JOB_HEALTH_CHECK');
END;
/

-- Change schedule
BEGIN
  DBMS_SCHEDULER.set_attribute(
    name      => 'JOB_HEALTH_CHECK',
    attribute => 'repeat_interval',
    value     => 'FREQ=MINUTELY;INTERVAL=30'
  );
END;
/

