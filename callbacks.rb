class DirectoryWalker
  def initialize(target, callbacks)
    raise "Not A Directory" unless File.directory?(target)
    @target_dir = target
    @callbacks = callbacks
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
        @callbacks[:directory].call(current)
        walk(file, current_dir)
      else
        @callbacks[:file].call(current)
      end
    end    
  end
  
end 


callbacks = {
  :directory => lambda{|dir| puts dir },
  :file => lambda{|file| puts file }
}
DirectoryWalker.new("/tmp", callbacks).perform
