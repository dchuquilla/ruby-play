class JobManagger
  def printJob(text, time)
    counter = 0
    while counter <= 10
      p "pint #{text} #{counter}"
      sleep(time)
      counter += 1
    end
  end
end

job = JobManagger.new

# should be block so use {}
j1 = Thread.new { job.printJob('lorem', 1) }
j2 = Thread.new { job.printJob('ipsum', 0.5) }

j1.join
j2.join
