BEGIN
  DBMS_SCHEDULER.create_program (
    program_name   => 'PROG_VALIDATE_CPU',
    program_type   => 'PLSQL_BLOCK',
    program_action => q'[
      DECLARE
        v_cpu NUMBER;
      BEGIN
        SELECT value INTO v_cpu
        FROM v$sysmetric
        WHERE metric_name = 'Host CPU Utilization (%)'
        AND rownum = 1;

        INSERT INTO scheduler_job_logs
        VALUES (SYSDATE, 'VALIDATE', 'CPU=' || v_cpu);
      END;
    ]',
    enabled => TRUE
  );
END;
/

