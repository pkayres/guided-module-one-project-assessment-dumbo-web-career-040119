require_relative '../config/environment'

  $VERBOSE = nil
  

cli = CommandLineInterface.new
cli.run
