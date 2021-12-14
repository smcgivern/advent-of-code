'template rawrules' =: ({. , <@}.) cutLF fread '14.dat'
rules =: |: {{ (}: ; (0 2 1)&{) a. i. (' -> ' ; '') stringreplace y }}"1 > rawrules

replace =: {{
'a b' =. x
b {~ a i. y
}}

step =: {{ (,/@:(}:"1)@}: , {:) (x&replace"1) 2 ]\ y }}
frequency =: ~. ,. #/.~

smoutput ({: - {.) /:~ {:"1 frequency rules&step^:10 a. i. template NB. part 1
