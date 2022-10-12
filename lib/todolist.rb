def todo_checker(input)
    if input == ""
        fail "INVALID INPUT"
    elsif input.include?("#TODO")
        true
    else
        false
    end
end