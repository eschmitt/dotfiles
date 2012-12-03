require 'open3'

system 'clear'
puts 'Watching files... using a watchr for Titanium'
puts ''
puts 'Now go write some tests!'

# --------------------------------------------------
# Growl Notification
# --------------------------------------------------
def notify(title, info, image)
  growlnotify = `which growlnotify`.chomp
  options = "-w -n Watchr --image '#{File.expand_path(image)}' -m '#{info}' '#{title}'"
  system %(#{growlnotify} #{options} &)
end

# --------------------------------------------------
# Test Reporting
# --------------------------------------------------
def report(err, result)
  path = "~/.watchr/images"
  title = ''
  info = ''
  image = ''
  if err
    title = "ERROR"
    info = "Could not run the tests!"
    image = "#{path}/warning.png"
  else
    tests = /[0-9]+ tests?/.match(result).to_s;
    assertions = /[0-9]+ assertions?/.match(result).to_s;
    failures = /[0-9]+ failures?/.match(result).to_s;
    info = "#{tests}, #{assertions}, #{failures}"
    no_failures = /0 failures/.match(failures)
    image = no_failures ? "#{path}/passed.png" : "#{path}/failed.png"
    title = no_failures ? "Success" : "Failure"
  end
  notify title, info, image rescue nil
end

# --------------------------------------------------
# Notify Start
# --------------------------------------------------
def notify_that_specs_are_running
  title = 'Running Specs'
  info = ''
  image = '~/.watchr/images/message.png'
  notify title, info, image rescue nil
end

# --------------------------------------------------
# Helpers
# --------------------------------------------------
def run(cmd)
  notify_that_specs_are_running
  system 'clear'
  puts cmd
  Open3.popen3(cmd) do |stdin, stdout, stderr|
    err = stderr.read
    if err != ''
      puts err
      report err, nil
    else
      out = stdout.read
      puts out
      report nil, out
    end
  end
end

def run_all_specs
  run "jasmine-node . --coffee specs"
end

def run_spec_file(file)
  run "jasmine-node . --coffee #{file}"
end

def find_related_spec_files(path)
  Dir['specs/**/*.coffee'].select do |file|
    file =~ /#{File.basename(path).split(".").first}_spec.coffee/
  end
end

# --------------------------------------------------
# Rules
# --------------------------------------------------
watch('specs/.*/.*_spec\.coffee') do |m| 
  run_spec_file(m[0])
end

watch('models/(.*)\.js') do |m|
  find_related_spec_files(m[0]).map do |tf| 
    run_spec_file(tf)
  end
end

watch('windows/(.*)\.js') do |m|
  find_related_spec_files(m[0]).map do |tf| 
    run_spec_file(tf)
  end
end

watch('views/(.*)\.js') do |m|
  find_related_spec_files(m[0]).map do |tf| 
    run_spec_file(tf)
  end
end

watch('controllers/(.*)\.js') do |m|
  find_related_spec_files(m[0]).map do |tf| 
    run_spec_file(tf)
  end
end

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
Signal.trap('QUIT') { run_all_specs } # Ctrl-\
Signal.trap('INT' ) { abort("\n")   } # Ctrl-C
