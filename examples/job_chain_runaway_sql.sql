-- ==========================================
-- JOB CHAIN: RUNAWAY SQL REMEDIATION
-- ==========================================

BEGIN
  -- Create chain
  DBMS_SCHEDULER.create_chain(
    chain_name => 'CHAIN_RUNAWAY_SQL_REMEDIATION',
    rule_set_name => NULL,
    evaluation_interval => NULL,
    comments => 'Multi-step remediation for runaway SQL'
  );

  -- Step 1: Capture evidence
  DBMS_SCHEDULER.define_chain_step(
    chain_name => 'CHAIN_RUNAWAY_SQL_REMEDIATION',
    step_name  => 'CAPTURE_EVIDENCE',
    program_name => 'PROG_CAPTURE_PERF_SNAPSHOT'
  );

  -- Step 2: Kill blocking sessions
  DBMS_SCHEDULER.define_chain_step(
    chain_name => 'CHAIN_RUNAWAY_SQL_REMEDIATION',
    step_name  => 'KILL_BLOCKERS',
    program_name => 'PROG_KILL_BLOCKING_SESSIONS'
  );

  -- Step 3: Run index review
  DBMS_SCHEDULER.define_chain_step(
    chain_name => 'CHAIN_RUNAWAY_SQL_REMEDIATION',
    step_name  => 'RUN_INDEX_REVIEW',
    program_name => 'JOB_INDEX_REVIEW'
  );

  -- Step 4: Validate improvement
  DBMS_SCHEDULER.define_chain_step(
    chain_name => 'CHAIN_RUNAWAY_SQL_REMEDIATION',
    step_name  => 'VALIDATE',
    program_name => 'PROG_VALIDATE_CPU'
  );

  -- Rules
  DBMS_SCHEDULER.define_chain_rule(
    chain_name => 'CHAIN_RUNAWAY_SQL_REMEDIATION',
    condition  => 'TRUE',
    action     => 'START CAPTURE_EVIDENCE'
  );

  DBMS_SCHEDULER.define_chain_rule(
    chain_name => 'CHAIN_RUNAWAY_SQL_REMEDIATION',
    condition  => 'CAPTURE_EVIDENCE COMPLETED',
    action     => 'START KILL_BLOCKERS'
  );

  DBMS_SCHEDULER.define_chain_rule(
    chain_name => 'CHAIN_RUNAWAY_SQL_REMEDIATION',
    condition  => 'KILL_BLOCKERS COMPLETED',
    action     => 'START RUN_INDEX_REVIEW'
  );

  DBMS_SCHEDULER.define_chain_rule(
    chain_name => 'CHAIN_RUNAWAY_SQL_REMEDIATION',
    condition  => 'RUN_INDEX_REVIEW COMPLETED',
    action     => 'START VALIDATE'
  );

  DBMS_SCHEDULER.enable('CHAIN_RUNAWAY_SQL_REMEDIATION');
END;
/

