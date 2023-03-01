# Task00
x=1.25
profit1=1.25*20/100
print("Profit per bag:",profit1)
profit2=500*profit1
print("Profit of 500 bags:",profit2)
# Task01
population=198568
men=4512
women=35678
child=population-(men+women)
print("Total no of childs: ",child)
# Task02
boxes=2425
pencils=24
totalpencil=boxes*pencils
print("Total Pencils are:",totalpencil)
# Task03
coatRs=2265
sareeRs=2150
pay=5000
rturn=5000-(2265+2150)
print("Return is:",rturn)
# Task04
tv21cost=95844
tv1cost=tv21cost/21
print("Cost of each TV:",tv1cost)
# Task05
bulbs=24532
annual=bulbs*12
print("Annual product is:",annual)
# Task06
suger_bags=145968
wheat_bags=236488
total_bags=450000
Rice_bags=total_bags-(suger_bags + wheat_bags)
print("Total Rice bags are:",Rice_bags)
# Task07 
toys=483684
first_week=146345
second_week=138152
third_week=toys-(first_week+second_week)
print("third week toys production is:",third_week)
# Task08
sofaset=9338
totalsofaset=124
totalcost=sofaset*totalsofaset
print("Total cost of 124 sofa sets:",totalcost)
# Task09
rooms=86
students=4386
equalnoofstudent=students/rooms
print("equal no of students in each room:",equalnoofstudent)
# Task10
students=1575
bus_capacity=75
no_of_buses=students/bus_capacity
print("No of buses required:",no_of_buses)
# Task11
radio=1475
cost_of_15=radio*15
print("Cost of 15 radios is :",cost_of_15)
# Task12 
Ron_vote=52496
jhon_vote=44929
Mike_vote=44929
total_no_of_people=Ron_vote+jhon_vote+Mike_vote
print("Total no of people are:",total_no_of_people)
# Task13
toys=96
price=12960
remaining_amount=1015
price_of_each_toy=price/toys
print("Price of each toy:",price_of_each_toy)
total_amount=price+ remaining_amount
print("Total amount she had:",total_amount)
# Task14
flying_cost=5000
people=29
charge_per_people=200
profit=(people*charge_per_people)-5000
print("Profit made by the Company:",profit)
# Task15 
total=0
for i in range (18,534):
    if i%7==0:
        total=total+i
        if i==532:
            print(i,end="=")
        else:
            print(i,end="+")
print(total)
    
# Task16
tweets = [
"Wow, what a great day today!! #sunshine",
"I feel sad about the things going on around us. #covid19",
"I'm really excited to learn Python with @JovianML #zerotopandas",
"This is a really nice song. #linkinpark",
"The python programming language is useful for data science",
"Why do bad things happen to me?",
"Apple announces the release of the new iPhone 12. Fans are excited.",
"Spent my day with family!! #happy",
"Check out my blog post on common string operations in Python. #zerotopandas",
"Freecodecamp has great coding tutorials. #skillup"
]
#Q no: 01
no_of_tweets=len(tweets)
print("The Total no of tweets are: ",no_of_tweets)
#Q no: 02
happylist=["wow","excited","nice","#happy","great"]
count_happy=0
for item1 in tweets:
    for word in item1.split():
        for happeness in happylist:
            if word==happeness:
                count_happy=count_happy+1
print("the No of happy tweets are:",count_happy)
#Q no: 03
happy_fraction=count_happy/no_of_tweets
print("Happy's fractional part of total tweets:", happy_fraction)
#Q no: 04
unhappylist=["sad","bad"]
count_unhappy=0
for item1 in tweets:
    for word in item1.split():
        for sadness in unhappylist:
            if word==sadness:
                count_unhappy=count_unhappy+1
print("the No of unhappy tweets are:",count_unhappy)
#Q no: 05
unhappy_fraction=count_unhappy/no_of_tweets
print("Unhappy's fractional part of total tweets:", unhappy_fraction)
#Q no: 06

sentiment_score=happy_fraction-unhappy_fraction
print("Sentiment Score: ",sentiment_score)
#sentiment score is positive. it means that the sentiment of given dataset of the tweets is happy.
#Q no: 07
count_neutral=no_of_tweets-(count_happy+count_unhappy)
print("the No of Neutral tweets are:",count_neutral)
#Q on: 08

neutral_fraction=count_neutral/no_of_tweets
print("Neutral's fractional part of total tweets:", neutral_fraction)