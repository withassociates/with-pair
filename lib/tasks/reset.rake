desc "Reset app to a reasonable starting state"
task :reset => ["people:reset", "sessions:reset"]
