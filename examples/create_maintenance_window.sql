BEGIN
  DBMS_SCHEDULER.create_window (
    window_name     => 'MAINTENANCE_WINDOW_NIGHT',
    resource_plan   => 'DEFAULT_MAINTENANCE_PLAN',
    start_date      => SYSTIMESTAMP,
    repeat_interval => 'FREQ=DAILY;BYHOUR=1',
    duration        => INTERVAL '3' HOUR,
    comments        => 'Night maintenance window'
  );
END;
/

