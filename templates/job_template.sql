-- templates/job_template.sql

BEGIN
  DBMS_SCHEDULER.create_job (
    job_name        => '<JOB_NAME>',
    job_type        => '<PLSQL_BLOCK | EXECUTABLE>',
    job_action      => '<SCRIPT OR BLOCK>',
    start_date      => SYSTIMESTAMP,
    repeat_interval => '<SCHEDULE>',
    enabled         => FALSE,
    auto_drop       => FALSE,
    comments        => '<PURPOSE>'
  );
END;
/

