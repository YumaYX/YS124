require 'logger'

logger = Logger.new(STDOUT)

puts "Level WARN"
logger.level = Logger::WARN # <= change level

logger.warn("Nothing to do!") # output
logger.info("Program started") # none
logger.debug("Created logger") # none
