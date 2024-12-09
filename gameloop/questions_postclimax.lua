function iquestion()
    q5={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    str=string, -- the strings. remember: this is the table of strings you passed to this function when you called on _update()
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    x=8, -- x coordinate
    y=10, -- y coordginate
    w=119, -- text box width
    h=73, -- text box height
    -- hint="don't forget that \npip learned \nsomething from \nthe rumors!",
    hint="the cheetah \nexclaimed something \nbetween level 2 and 3!",
    answer="remember: it is a sign \nthat percy and \nthe cheetah are \nworking together to \nstop the brothers",
    question="question 5: what is the \n significance of the \n boulder in the story?",
    qa={'it symbolizes the \nstrength of the brothers.','it is an obstacle to help \nthe brothers get up \nthe mountain.','it is a sign that percy \nand the cheetah are \nworking together to \nstop the brothers.',"it marks the end \nof the brother's journey."},
    rowsa= {3,2,3,4,2},
    qn = 5
    }
    q6={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    str=string, -- the strings. remember: this is the table of strings you passed to this function when you called on _update()
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    x=8, -- x coordinate
    y=10, -- y coordginate
    w=119, -- text box width
    h=73, -- text box height
    hint='percy said: "you two \nwere always so close, \nalways working \ntogether, and i \nwas on the outside."',
    answer="remember: he felt \nleft out and wanted \nto prove he was \njust as capable as \npip and pete.",
    question="question 6: why did percy \n team up with the cheetah?",
    qa={'he wanted to be the \nstrongest of the \nthree brothers.','he felt left out and \nwanted to prove he was \njust as capable \nas pip and pete.',"he thought the \ncheetah was his friend",'he wanted to escape \nfrom the mountain.'},
    rowsa= {3,3,4,2,2},
    qn=6
    }
    q7={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    x=8, -- x coordinate
    y=10, -- y coordginate
    w=119, -- text box width
    h=73, -- text box height
    hint='after percy said, \n"i am really sorry \nfor what i did,"\npete and pip responded \nby talking about \nhow they wanted \nto be a team \nand move forward.',
    answer="remember: when someone \nsays they're sorry ",
    question = "question 7: how do pip and \n pete react after percy \n explains why he worked \n with the cheetah?",
    qa={'they apologize to percy \nfor making him feel left \nout and promise to \nwork together.', 'they get angry and \nleave percy behind.', 'they challenge the \ncheetah to a fight.', "they ask the cheetah \nto join them."},
    rowsa= {4,4,2,2,2},
    qn = 7
    }
    q8={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    x=8, -- x coordinate
    y=14, -- y coordginate
    w=119, -- text box width
    h=73, -- text box height
    hint="don't forget that \nthe three brothers \ntalk and resolve \ntheir problems!",
    answer="remember: the brothers' \nbond is too strong \nfor him to manipulate.",    
    question = "question 8: what does \nthe cheetah realize \nat the end of the climax?",
    qa={'he can easily break the \nbond between the brothers.', 'percy was lying to \nhim the whole time.', "the brothers don't \nneed him to succeed.", "the brothers' bond \nis too strong for \nhim to manipulate."},
    rowsa= {3,2,2,2,3},
    qn = 8
    }
    q9={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    x=8, -- x coordinate
    y=14, -- y coordginate
    w=119, -- text box width
    h=73, -- text box height
    hint="who are the characters \nin this story?",
    answer="remember: they are \ntrying to escape \nthe cheetah",    
    question = "question 9: what is the \n main conflict that pip and \n pete face in the story?",
    qa={'they are trying to \nfind food for \ntheir family.', 'they are trying \nto escape the cheetah.', "they are trying \nto fix their house.", "they are looking \nfor a new home."},
    rowsa= {3,3,2,2,2},
    qn = 9
    }
    q10={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    x=8, -- x coordinate
    y=10, -- y coordginate
    w=119, -- text box width
    h=73, -- text box height
    hint="the falling action \nis the story that \nhappens after \nthe climax!",
    answer="remember: percy \nexplains that he \njoined the cheetah \nbecause he felt left \nout and wanted \nto prove himself.",    
    question = "question 10: what causes the \nfalling action in the story?",
    qa={'percy explains that he \njoined the cheetah \nbecause he felt left \nout and wanted \nto prove himself.', 'pip and pete leave \nthe mountain \nand never return.', "The cheetah defeats \nthe brothers in a race.", "percy tells the brothers \nthat he never wanted to \nbe a part of their team."},
    rowsa= {2,4,3,2,3},
    qn = 10
    }

    answers = {"a. ","b. ","c. ","d. "}
    answersel=1
    qamaster = {2,1,0,3,1,0}
    question="q5"
    viewhint1checker=false 
    correct=false
    answernumber=0
    viewhint=false
    currentQ=5
    questionAns=2
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
            if(answersel == questionAns)then
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
            if finalquestion==true then
                complete=true
            end
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
            if finalquestion==true then
                complete=true
            end
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