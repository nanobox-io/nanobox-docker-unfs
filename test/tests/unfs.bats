# source docker helpers
. util/docker.sh

@test "Start Container" {
  start_container "unfs-test"
}

@test "Verify unfs installed" {
  # ensure unfs executable exists
  run docker exec "unfs-test" bash -c "[ -f /data/sbin/unfsd ]"

  [ "$status" -eq 0 ]
}

@test "Stop Container" {
  stop_container "unfs-test"
}
