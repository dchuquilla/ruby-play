class RateLimiter
  def initialize(requests_amount, time)
    @requests_amount = requests_amount
    @time = time
    @requests = []
  end

  def allow_request?(request)
    current_time = Time.now.to_i
    @requests = @requests.select { |r| r > current_time - @time }
    if @requests.count < @requests_amount
      @requests << current_time
      puts "Request allowed for #{request}"
      return true
    else
      puts "Request denied for #{request}"
      return
    end
  end
end

rate_limiter = RateLimiter.new(5, 1)

rate_limiter.allow_request?("User1")
rate_limiter.allow_request?("User1")
rate_limiter.allow_request?("User2")
rate_limiter.allow_request?("User1")
rate_limiter.allow_request?("User1")
rate_limiter.allow_request?("User1")
rate_limiter.allow_request?("User1")
rate_limiter.allow_request?("User1")
rate_limiter.allow_request?("User1")
rate_limiter.allow_request?("User1")
rate_limiter.allow_request?("User1")
