BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => 'JOB_INDEX_REVIEW',
    job_type        => 'PLSQL_BLOCK',
    job_action      => q'[
      BEGIN
        EXECUTE IMMEDIATE '@oracle_indexing_strategy/index_review.sql';
      END;
    ]',
    repeat_interval => 'FREQ=WEEKLY;BYDAY=SUN;BYHOUR=3',
    enabled         => TRUE
  );
END;
/

