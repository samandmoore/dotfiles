function pg_kill_db --argument-names db --description 'Kill all connections to a given PostgreSQL database'
    psql -d $db -c "select pg_terminate_backend(pg_stat_activity.pid) from pg_stat_activity where pg_stat_activity.datname = '$db' and pid <> pg_backend_pid();"
end
