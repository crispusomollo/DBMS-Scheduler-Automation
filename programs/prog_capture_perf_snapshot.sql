BEGIN
  DBMS_SCHEDULER.create_program (
    program_name   => 'PROG_CAPTURE_PERF_SNAPSHOT',
    program_type   => 'PLSQL_BLOCK',
    program_action => q'[
      BEGIN
        INSERT INTO scheduler_job_logs
        VALUES (SYSDATE, 'CAPTURE', 'Captured performance snapshot');
      END;
    ]',
    enabled => TRUE
  );
END;
/

