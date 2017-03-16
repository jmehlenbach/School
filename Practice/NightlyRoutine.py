# The daily and nightly routine goes like this: Add as many questions as though important.
# 1. What did I do today that I could improve on?
# 2. What did I accomplish today that I can be proud of?
# 3. One are the most important things that I need to be prepared for tomorrow?
# 4. Is there anything you need to change, complete, or address?
import random;
import sys;


masterQuestionList = [" What did I do today that I could improve on?"
						,"What did I accomplish today that I can be proud of?"
						,"One are the most important things that I need to be prepared for tomorrow?"
						,"Is there anything you need to change, complete, or address?"]
randomlyAddedQuestions =[]

consoleDialogue = ["Hey man, good day or bad day, lets start here."
					"Evening, hope the day was good."
					
					]						
					
print("Evening Josh, hope the day was good, lets start with a question.")
print "................................................................"
print " "
print random.choice(masterQuestionList)
answer1 = raw_input()
print (answer1)

print random.choice(masterQuestionList)
answer2 = raw_input()
print (answer2);


