BEGIN
  DBMS_SCHEDULER.create_program (
    program_name   => 'PROG_KILL_BLOCKING_SESSIONS',
    program_type   => 'PLSQL_BLOCK',
    program_action => q'[
      BEGIN
        FOR r IN (
          SELECT sid, serial#
          FROM v$session
          WHERE blocking_session IS NOT NULL
        ) LOOP
          EXECUTE IMMEDIATE
            'ALTER SYSTEM KILL SESSION ''' || r.sid || ',' || r.serial# || ''' IMMEDIATE';
        END LOOP;
      END;
    ]',
    enabled => TRUE
  );
END;
/

