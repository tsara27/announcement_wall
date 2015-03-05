class Announcement
  def add(announcement, posted_by, expire)
    timestamp = Time.now.to_i
    $redis.hmset("announcement:#{timestamp}", "announcement", announcement, "posted_by", posted_by)
    $redis.expire("announcement:#{timestamp}", expire)
  end

  def fetch_all
    arr = []
    announcements = $redis.keys("announcement:*")
    announcements.each { |announcement| arr << $redis.hgetall(announcement) }
    return arr
  end
end
