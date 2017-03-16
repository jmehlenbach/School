#The idea behind this program is to automate the structure of habits and goals
#With the given time in the day, rather than having to decide when things will happen. This will
#Automatically polulate what should happen for the given day. 
#Add to do lists of things that I need to do. 
#Extended functionality: I didnt schedule this, can you add this in. Reschedule times. 

#The Key FUNCTIONS

#1 The program will allow input of TASKS
#2 The program will arrange the TASKS bases on their YES, NO, or LATER status
#3 The program will provide graphical feedback and and easily readable format. 

# The daily and nightly routine goes like this
# 1. What did I do today that I could improve on?
# 2. What did I accomplish today that I can be proud of?
# 3. 

readingGoal = 1;
relaxingGoal = 5;
writingGoal = 150; #per day
firstPriorityTasks = ["Get my Notice of Assessment done"]


activities = ["Witcher 3", "Programming", "Reading", "Find Music", ]

print("How many hours extra time do you have");
name = input();

print("Now, we will check if there is anything left for you to do today, is this still something that you have to do?", firstPriorityTasks)
confirmation = raw_input("YES,NO,OR MAYBE?")
if confirmation == "YES":
	if len(firstPriorityTasks)>1:
		firstPriorityTasks[0] = firstPriorityTasks[1];
	else	
		firstPriorityTasks[0]="Nothing Here";
		
print(firstPriorityTasks[0])
print("Monday")
print("Tuesday")
print("Wednesday")
print("Thursday")
print("Friday")
print("Saturday")
