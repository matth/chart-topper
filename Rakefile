namespace :test do
  
  base = File.dirname(__FILE__)
  
  task :all => [:cucumber, :spec]
  
  task :spec do
    sh "spec #{base}/test"
  end
  
  task :cucumber do
    sh "cucumber #{base}/features"
  end  
  
end

task :gem do
  sh 'gem build chart-topper.gemspec'
end