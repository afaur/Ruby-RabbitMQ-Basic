require 'bunny'
require 'yaml'

# Set our output file
output_file = "output/payload.json"

# Load our connection settings
settings = YAML.load_file(
  'config/settings.yml'
)['settings'][0]

# Get the queue name
queue = settings[:queue]

# Remove queue from settings hash
settings = settings.except!(:queue)

# Create a connection with settings
conn = Bunny.new(settings)

# Start our connection to RabbitMQ
conn.start

# Create a channel
ch = conn.create_channel

# Attach to queue
ch.queue(
  queue, durable: true
).subscribe(manual_ack: true) { |_, _, payload|
  File.write(output_file, payload)
  puts "File written to #{output_file}."
}

# Keep ruby process alive while waiting on docs
while true
  begin
    sleep 1
  rescue
    conn.stop
  end
end

