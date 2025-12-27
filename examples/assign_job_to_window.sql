BEGIN
  DBMS_SCHEDULER.set_attribute (
    name      => 'JOB_INDEX_REVIEW',
    attribute => 'schedule_name',
    value     => 'MAINTENANCE_WINDOW_NIGHT'
  );
END;
/

