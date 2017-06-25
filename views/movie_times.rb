
require 'rounding'

class MovieTimes

  def load_movie_times

    file = File.read('../movie_challenge/movie_list.json')

    file_hash = JSON.parse(file)

    file_hash.each_with_index do |movie, index|
      puts ''

      initial_time = 675
      extra_stuff = 35

      time = movie["time"].split(/\D+/)
      runtime = time[1].to_i * 60 + time[2].to_i

      times = []
      weekend_times = []

      until initial_time + runtime > 1380

        if initial_time % 10 == 0
          times << initial_time
        elsif initial_time % 10 > 5
          initial_time = initial_time.round_to(10)
          times << initial_time
        else
          initial_time = initial_time.round_to(5)
          times << initial_time
        end

        initial_time += runtime + extra_stuff
      end

      initial_time = 645

      until initial_time + runtime > 1440

        if initial_time % 10 == 0
          weekend_times << initial_time
        elsif initial_time % 10 > 5
          initial_time = initial_time.round_to(10)
          weekend_times << initial_time
        else
          initial_time = initial_time.round_to(5)
          weekend_times << initial_time
        end

        initial_time += runtime + extra_stuff
      end





      puts "#{movie["title"]} - Theater #{index + 1}"
      puts "#{movie["time"]}"

      puts "----------------------------------"
      puts "Showtimes:"
      times.each do |time|
        hours = time/60 % 12
        minutes = time % 60
        string = ''

        if time > 720
          string = "PM"
        else
          string = "AM"
        end

        if minutes.to_i < 10
          minutes = "0#{minutes}"
        end
          puts "#{hours}:#{minutes} #{string}"
      end


      puts ''
      puts "--"
      puts ''
      puts "Weekend Showtimes:"

      weekend_times.each do |time|
        hours = time/60 % 12
        minutes = time % 60

        string = ''

        if time > 720
          string = "PM"
        else
          string = "AM"
        end

        if minutes.to_i < 10
          minutes = "0#{minutes}"
        end
          puts "#{hours}:#{minutes} #{string}"
      end

      puts ''
      puts ''
    end
  end
end