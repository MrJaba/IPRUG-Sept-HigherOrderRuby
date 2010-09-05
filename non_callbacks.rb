class DirectoryWalker
  def initialize(target)
    raise "Not A Directory" unless File.directory?(target)
    @target_dir = target
  end
  
  def perform
    walk(@target_dir, "/")
  end
  
  def walk(dir, parent)
    current_dir = File.join(parent, dir)
    Dir.entries(current_dir).each do |file|
      next if file =~ /^\.|\.\.$/
      current = File.join(current_dir, file)
      if File.directory?(current) 
        puts current_dir
        walk(file, current_dir)
      else
        puts current_dir
      end
    end    
  end
  
end

DirectoryWalker.new("/tmp").perform
