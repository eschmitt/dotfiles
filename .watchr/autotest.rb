watch('specs/(.*)\.coffee') do |md|
  system('jasmine-node . --coffee')
end

watch('functional.js') do |md|
  system('jasmine-node . --coffee')
end
