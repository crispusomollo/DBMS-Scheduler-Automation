BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => 'JOB_PARTITION_REVIEW',
    job_type        => 'PLSQL_BLOCK',
    job_action      => q'[
      BEGIN
        EXECUTE IMMEDIATE '@oracle_partitioning_strategy/schedule_partition_review.sql';
      END;
    ]',
    repeat_interval => 'FREQ=MONTHLY;BYMONTHDAY=1;BYHOUR=2',
    enabled         => TRUE
  );
END;
/

