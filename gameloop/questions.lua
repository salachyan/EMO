
function iquestion()
    q1={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
    str=string, -- the strings. remember: this is the table of strings you passed to this function when you called on _update()
    voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
    i=1, -- index used to tell what string from tb.str to read.
    cur=0, -- buffer used to progressively show characters on the text box.
    char=0, -- current character to be drawn on the text box.
    x=8, -- x coordinate
    y=14, -- y coordginate
    w=119, -- text box width
    h=73, -- text box height
    col1=7, -- background color
    col2=0, -- border color
    col3=0, -- text color
    hint="don't forget that pip \nlearned something from the rumors!",
    }
    answers = {"a. ","b. ","c. ","d. "}
    answersel=1
    q1ca=2
    qtoggle=true
end

function uquestion()
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
        if(answersel == q1ca)then
            correct=true
            answered=true
        else
            answered=true
            correct=false
        end
    end
end

function checkquestion(q)
    if answered then
        if correct then
            dcorrect(q)
            if(btnp(4)) then
                question = false
            end
        else
            dincorrect(q)
            if (btnp(4)) then
                question = false
            end
        end
    end
end




-- rectfill(tb.x, tb.y, tb.x + tb.w, tb.y + tb.h, tb.col1)
function dcorrect(q)
    rectfill(q.x+20,q.y+12,q.w-20, q.h-32,15)
    rect(q.x+20,q.y+12,q.w-20, q.h-32,0)
    print("correct!",q.x+40,q.y+18,8)
end

function dincorrect(q)
    rectfill(q.x+12,q.y+12,q.w-12, q.h-16,15)
    rect(q.x+12,q.y+12,q.w-12, q.h-16,0)
    print("that was incorrect.\nyou can answer it \none more time! ^-^\nlets look at a hint.",q.x+15,q.y+18,8)
end

function dhint(q)
    rectfill(q.x+12,q.y+12,q.w-12, q.h-16,15)
    rect(q.x+20,q.y+12,q.w-20, q.h-32,0)
    print(q.hint,q.x+40,q.y+18,8)
end

function dquestion(q)
    rectfill(q.x-2,q.y-2,q.w+2,q.h+4,7)
    rect(q.x-2,q.y-2,q.w+2,q.h+4,0)
    if answersel<3 then
    rectfill(q.x + 1,q.y +15+ 8*answersel,16,q.y+21+8*answersel,2)
    else
        rectfill(q.x + 1,q.y +15+7+ 8*answersel,16,q.y+21+7+8*answersel,2)
    end
    print('what is the main reason pip \nruns to talk to pete?',q.x+1,q.y+1,0)
    -- print('runs to talk to pete?',q.x+1,q.y+8,0)
    question1={'to tell pete a secret','to warn pete about\nthe approaching cheetah','to ask pete for some food','to plan a party for percy'}
    for i = 1, 2 do
        print(answers[i],q.x + 2,q.y+16+8*i,3)
        print(question1[i],q.x +12,q.y+16+8*i,0)
    end
    for i = 3, 4 do
        print(answers[i],q.x + 2,q.y+16+7+8*i,3)
        print(question1[i],q.x +12,q.y+16+7+8*i,0)
    end
end

