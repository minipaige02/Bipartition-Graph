
def possible_bipartition(dislikes)
  return true if dislikes.length < 2

  stack = []
  visited = {}

  dislikes.each_index do |i|
    if !visited[i]
      stack << i
      visited[i] = "blue"
    end

    while !stack.empty?
      curr_dog = stack.pop
      disliked_dogs = dislikes[curr_dog]

      disliked_dogs.each do |dog|
        if !visited[dog]
          stack << dog
          visited[dog] = change_color(visited[curr_dog])
        elsif visited[dog] == visited[curr_dog]
          return false
        end
      end
    end
  
  end

  return true
end

def change_color(color)
  if color == "blue"
    return "green"
  else
    return "blue"
  end
end
