function iquestion()
    q5={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    str=string, -- the strings. remember: this is the table of strings you passed to this function when you called on _update()
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    x=8, -- x coordinate
    y=14, -- y coordginate
    w=119, -- text box width
    h=73, -- text box height
    -- hint="don't forget that \npip learned \nsomething from \nthe rumors!",
    hint="pip ran to\npete because \nmiguel told him \nsomething.",
    answer="remember: pip ran to\npete because pip\nwanted to warn pete \nabout the \napproaching cheetah",
    question="question 1: what is the \n main reason pip runs to\n talk to pete?",
    qa={'to tell pete a secret','to warn pete about\nthe approaching cheetah','to ask pete for some food','to plan a party for percy'},
    rowsa= {3,1,2,1,1},
    qn = 5
    }
    q6={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    str=string, -- the strings. remember: this is the table of strings you passed to this function when you called on _update()
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    x=8, -- x coordinate
    y=14, -- y coordginate
    w=119, -- text box width
    h=73, -- text box height
    hint='after the first \nknock,pete said "bro! \nopen the door! \nwe have something \nimportant to tell you!',
    answer="percy didn't answer \nwith the first knock",
    question="question 2: why do pip and \n pete knock on percy's door\n harder the second time?",
    qa={'they forgot to knock the \nfirst time','they want to see if \nanyone else is home',"percy didn't answer \nwith the first knock",'they are playing\na game with percy'},
    rowsa= {3,2,2,2,2},
    qn=6
    }
    q7={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    x=8, -- x coordinate
    y=14, -- y coordginate
    w=119, -- text box width
    h=73, -- text box height
    hint="pip ran to\npete because \nmiguel told him \nsomething.",
    answer="remember: pip ran to\npete because pip\nwanted to warn pete \nabout the \napproaching cheetah",    
    question = "question 3: what can the \n reader infer from pete's \n statement, \"he never \n leaves his doorunlocked\"?",
    qa={'percy likes to keep his\nhouse neat', 'percy is usually very \ncareful about \nlocking his door', 'percy often forgets \nto close his door', 'percy does not\n like visitors'},
    rowsa= {4,2,3,2,2},
    qn = 7
    }
    q8={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    x=8, -- x coordinate
    y=14, -- y coordginate
    w=119, -- text box width
    h=73, -- text box height
    hint="pip ran to\npete because \nmiguel told him \nsomething.",
    answer="remember: pip ran to\npete because pip\nwanted to warn pete \nabout the \napproaching cheetah",
    question = "question 4: based on the \n events in the prologue,\n what is most likely\n to happen next?",
    qa={'the brothers will return \nhome and forget about \nthe cheetah', 'percy will greet them \nat the door with a gift', 'the brothers will leave\nthe village immediately.', "the cheetah will arrive\nbefore they leave"},
    rowsa= {4,3,2,2,2},
    qn = 8
    }

    answers = {"a. ","b. ","c. ","d. "}
    answersel=1
    qamaster = {2,3,2,3}
    question="q5"
    viewhint1checker=false 
    correct=false
    answernumber=0
    viewhint=false
    currentQ=5
    questionAns=1
end

function resetquestion()
    question="qx"
    correct=false
    answered=false
    answernumber=0
    viewhint=false
    viewhint1checker=false
end
function resetfirsthint()
    viewhint=false
    answernumber=1
end

function uquestion()
    if answered != true then
        if btnp(⬇️) then
            if answersel<#answers then
                answersel+=1
            else
                answersel=1
            end
        elseif btnp(⬆️) then
            if answersel>1 then
                answersel-=1
            else
                answersel=#answers
            end
        end
        if(btnp(5))then
            if(answersel == qamaster[questionAns])then
                correct=true
                answered=true
                answernumber+=1
            else
                answered=true
                correct=false
                answernumber+=1
            end
        end
    end
end

function checkquestion(q)
    if answered then
        if correct then
            correctlogic(q)
        elseif correct != true then
            incorrectlogic(q)
        end
    end
end


function correctlogic(q)
    dcorrect(q)
        currentQ = q.qn+1
        if(btnp(4)) then
            resetquestion()
    end
end

function incorrectlogic(q)
    if(answernumber==1)then
        dincorrect1(q)
        if (btnp(4)) then
            viewhint=true
            answernumber+=1
        elseif btnp(5) and viewhint==true then
            dhint(q)
            viewhintfalselogic(q)        
        end
    end
    if(answernumber>=2 and viewhint1checker)then
        dincorrect2(q)
        if btnp(4) then
            currentQ = q.qn + 1
            resetquestion()
        -- elseif 
        end
        
    end
end

function viewhintfalselogic(q)
    if viewhint then
        if btnp(5) then
            viewhint=false
            answered=false
            viewhint1checker=true
        end
    end
end

function dcorrect(q)
    if correct and answered then
        rectfill(q.x+20,q.y+12,q.w-20, q.y+28,15)
        rect(q.x+20,q.y+12,q.w-20, q.y+28,0)
        print("correct!",q.x+40,q.y+18,8)
    end
end

function dincorrect1(q)
    if answered and (correct != true) then
        local text = "that was incorrect.\nyou can answer it \none more time! ^-^\nlets look at a hint."
        local lines = split(text, "\n")
        local line_count = #lines
        local rect_height = line_count * 8 + 4 -- 8 pixels per line + 4 for padding

        rectfill(q.x+8, q.y+12, q.w-8, q.y+12 + rect_height, 15)
        rect(q.x+8, q.y+12, q.w-8, q.y+12 + rect_height, 0)

        local y_offset = q.y + 16 -- Starting Y position for text
        for line in all(lines) do
            print(line, q.x+13, y_offset, 8)
            y_offset += 8 -- Move down for the next line
        end
    end
end

function dincorrect2(q)
    if answered and (correct != true) then
        local text = "that was incorrect."
        local answer_lines = split(q.answer, "\n")
        local total_lines = #split(text, "\n") + #answer_lines
        local rect_height = total_lines * 8 + 4 -- 8 pixels per line + 4 for padding

        rectfill(q.x+8, q.y+12, q.w-8, q.y+12 + rect_height, 15)
        rect(q.x+8, q.y+12, q.w-8, q.y+12 + rect_height, 0)

        local y_offset = q.y + 16 -- Starting Y position for text
        for line in all(split(text, "\n")) do
            print(line, q.x+15, y_offset, 8)
            y_offset += 8 -- Move down for the next line
        end

        for line in all(answer_lines) do
            print(line, q.x+13, y_offset, 8)
            y_offset += 8 -- Move down for the next line
        end
    end
end



function dhint(q)
    if viewhint == true then
        local hint_lines = split(q.hint, "\n")
        local line_count = #hint_lines
        local rect_height = line_count * 8 + 4 -- 8 pixels per line + 4 for padding

        rectfill(q.x+8, q.y+12, q.w-8, q.y+12 + rect_height, 15)
        rect(q.x+8, q.y+12, q.w-8, q.y+12 + rect_height, 0)

        local y_offset = q.y + 16 -- Starting Y position for text
        for line in all(hint_lines) do
            print(line, q.x+13, y_offset, 8)
            y_offset += 8 -- Move down for the next line
        end
    end
end



function dquestion(q)   
    -- Calculate the height of the question text based on the first value in `q.rowsa`
    local question_rows = q.rowsa[1]
    local question_height = question_rows * 8 -- 8 pixels per row for the question text

    -- Calculate the total height for the answer rows
    local total_answer_rows = 0
    for i = 2, #q.rowsa do -- Start from the second value in `q.rowsa`
        total_answer_rows += q.rowsa[i]
    end
    local answers_height = total_answer_rows * 8 -- 8 pixels per row for the answers

    -- Update the question box's height dynamically
    q.h = question_height + answers_height -- Add padding (16 pixels) to the height

    -- Draw the question box
    rectfill(q.x - 2, q.y - 2, q.w + 2, q.y + q.h + 2, 7)
    rect(q.x - 2, q.y - 2, q.w + 2, q.y + q.h + 2, 0)

    -- Print the question text
    local question_y = q.y + 4 -- Offset for the question text
    print(q.question, q.x + 1, question_y, 0)

    -- Highlight the currently selected answer
    local y_offset = question_y + question_height-- Starting Y-offset after the question
    local cumulative_rows = 0
    for i = 1, #answers do
        cumulative_rows += q.rowsa[i + 1] -- Offset by 1 because the first value is for the question
        local answer_y_start = y_offset + (cumulative_rows - q.rowsa[i + 1]) * 8 - 1
        local answer_y_end = answer_y_start + 7

        if answersel == i then
            rectfill(q.x + 1, answer_y_start, q.x + 8, answer_y_end, 2)
        end
    end

    -- Print the answer choices
    cumulative_rows = 0
    for i = 1, #answers do
        cumulative_rows += q.rowsa[i + 1] -- Offset by 1 for the question
        local answer_y = y_offset + (cumulative_rows - q.rowsa[i + 1]) * 8
        print(answers[i], q.x + 2, answer_y, 0) -- Print answer prefix (e.g., "a. ")
        print(q.qa[i], q.x + 12, answer_y, 0) -- Print the answer text
    end
end